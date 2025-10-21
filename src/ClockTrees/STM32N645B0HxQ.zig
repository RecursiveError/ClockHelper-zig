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
            .RCC_HSI_DIV4 => 4,
            .RCC_HSI_DIV1 => 1,
            .RCC_HSI_DIV8 => 8,
            .RCC_HSI_DIV2 => 2,
        };
    }
};
pub const HSIDiv4Conf = enum {
    @"4",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"4" => 4,
        };
    }
};
pub const HSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const HSE_DivConf = enum {
    @"1",
    @"2",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"2" => 2,
            .@"1" => 1,
        };
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
pub const LSE_VALUEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const MSIClockRangeConf = enum {
    RCC_MSI_FREQ_16MHZ,
    RCC_MSI_FREQ_4MHZ,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MSI_FREQ_16MHZ => 16,
            .RCC_MSI_FREQ_4MHZ => 4,
        };
    }
};
pub const IC1CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC1DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC2CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC2DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC3CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC3DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC4CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC4DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC5CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC5DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC6CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC6DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC7CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC7DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC8CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC8DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC9CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC9DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC10CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC10DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC11CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC11DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC12CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC12DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC13CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC13DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC14CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC14DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC15CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC15DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC16CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC16DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC17CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC17DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC18CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC18DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC19CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC19DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const IC20CLKSourceConf = enum {
    RCC_ICCLKSOURCE_PLL1,
    RCC_ICCLKSOURCE_PLL2,
    RCC_ICCLKSOURCE_PLL3,
    RCC_ICCLKSOURCE_PLL4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const IC20DivConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const RCC_MCO1SourceConf = enum {
    RCC_MCO1SOURCE_HSI,
    RCC_MCO1SOURCE_LSE,
    RCC_MCO1SOURCE_MSI,
    RCC_MCO1SOURCE_LSI,
    RCC_MCO1SOURCE_HSE,
    RCC_MCO1SOURCE_IC5,
    RCC_MCO1SOURCE_IC10,
    RCC_MCO1SOURCE_SYSA,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCODiv1Conf = enum {
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
            .RCC_MCODIV_10 => 10,
            .RCC_MCODIV_11 => 11,
            .RCC_MCODIV_5 => 5,
            .RCC_MCODIV_9 => 9,
            .RCC_MCODIV_13 => 13,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_6 => 6,
            .RCC_MCODIV_14 => 14,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_7 => 7,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_15 => 15,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_12 => 12,
            .RCC_MCODIV_3 => 3,
        };
    }
};
pub const RCC_MCO2SourceConf = enum {
    RCC_MCO2SOURCE_HSI,
    RCC_MCO2SOURCE_LSE,
    RCC_MCO2SOURCE_MSI,
    RCC_MCO2SOURCE_LSI,
    RCC_MCO2SOURCE_HSE,
    RCC_MCO2SOURCE_IC15,
    RCC_MCO2SOURCE_IC20,
    RCC_MCO2SOURCE_SYSB,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const RCC_MCODiv2Conf = enum {
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
            .RCC_MCODIV_10 => 10,
            .RCC_MCODIV_11 => 11,
            .RCC_MCODIV_5 => 5,
            .RCC_MCODIV_9 => 9,
            .RCC_MCODIV_13 => 13,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_6 => 6,
            .RCC_MCODIV_14 => 14,
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_7 => 7,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_15 => 15,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_12 => 12,
            .RCC_MCODIV_3 => 3,
        };
    }
};
pub const CKPERSourceSelectionConf = enum {
    RCC_CLKPCLKSOURCE_HSI,
    RCC_CLKPCLKSOURCE_MSI,
    RCC_CLKPCLKSOURCE_HSE,
    RCC_CLKPCLKSOURCE_IC5,
    RCC_CLKPCLKSOURCE_IC10,
    RCC_CLKPCLKSOURCE_IC15,
    RCC_CLKPCLKSOURCE_IC19,
    RCC_CLKPCLKSOURCE_IC20,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCCLockSelectionConf = enum {
    RCC_ADCCLKSOURCE_HCLK,
    RCC_ADCCLKSOURCE_CLKP,
    RCC_ADCCLKSOURCE_IC7,
    RCC_ADCCLKSOURCE_IC8,
    RCC_ADCCLKSOURCE_MSI,
    RCC_ADCCLKSOURCE_HSI,
    RCC_ADCCLKSOURCE_PIN,
    RCC_ADCCLKSOURCE_TIMG,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ADCDIVConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const ADF1ClockSelectionConf = enum {
    RCC_ADF1CLKSOURCE_HCLK,
    RCC_ADF1CLKSOURCE_CLKP,
    RCC_ADF1CLKSOURCE_IC7,
    RCC_ADF1CLKSOURCE_IC8,
    RCC_ADF1CLKSOURCE_MSI,
    RCC_ADF1CLKSOURCE_HSI,
    RCC_ADF1CLKSOURCE_PIN,
    RCC_ADF1CLKSOURCE_TIMG,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const MDF1ClockSelectionConf = enum {
    RCC_MDF1CLKSOURCE_HCLK,
    RCC_MDF1CLKSOURCE_CLKP,
    RCC_MDF1CLKSOURCE_IC7,
    RCC_MDF1CLKSOURCE_IC8,
    RCC_MDF1CLKSOURCE_MSI,
    RCC_MDF1CLKSOURCE_HSI,
    RCC_MDF1CLKSOURCE_PIN,
    RCC_MDF1CLKSOURCE_TIMG,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const PSSIClockSelectionConf = enum {
    RCC_PSSICLKSOURCE_HCLK,
    RCC_PSSICLKSOURCE_CLKP,
    RCC_PSSICLKSOURCE_IC20,
    RCC_PSSICLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FDCANClockSelectionConf = enum {
    RCC_FDCANCLKSOURCE_PCLK1,
    RCC_FDCANCLKSOURCE_CLKP,
    RCC_FDCANCLKSOURCE_IC19,
    RCC_FDCANCLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C1CLockSelectionConf = enum {
    RCC_I2C1CLKSOURCE_PCLK1,
    RCC_I2C1CLKSOURCE_CLKP,
    RCC_I2C1CLKSOURCE_IC10,
    RCC_I2C1CLKSOURCE_IC15,
    RCC_I2C1CLKSOURCE_MSI,
    RCC_I2C1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C2CLockSelectionConf = enum {
    RCC_I2C2CLKSOURCE_PCLK1,
    RCC_I2C2CLKSOURCE_CLKP,
    RCC_I2C2CLKSOURCE_IC10,
    RCC_I2C2CLKSOURCE_IC15,
    RCC_I2C2CLKSOURCE_MSI,
    RCC_I2C2CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C3CLockSelectionConf = enum {
    RCC_I2C3CLKSOURCE_PCLK1,
    RCC_I2C3CLKSOURCE_CLKP,
    RCC_I2C3CLKSOURCE_IC10,
    RCC_I2C3CLKSOURCE_IC15,
    RCC_I2C3CLKSOURCE_MSI,
    RCC_I2C3CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I2C4CLockSelectionConf = enum {
    RCC_I2C4CLKSOURCE_PCLK1,
    RCC_I2C4CLKSOURCE_CLKP,
    RCC_I2C4CLKSOURCE_IC10,
    RCC_I2C4CLKSOURCE_IC15,
    RCC_I2C4CLKSOURCE_MSI,
    RCC_I2C4CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I3C1CLockSelectionConf = enum {
    RCC_I3C1CLKSOURCE_PCLK1,
    RCC_I3C1CLKSOURCE_CLKP,
    RCC_I3C1CLKSOURCE_IC10,
    RCC_I3C1CLKSOURCE_IC15,
    RCC_I3C1CLKSOURCE_MSI,
    RCC_I3C1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const I3C2CLockSelectionConf = enum {
    RCC_I3C2CLKSOURCE_PCLK1,
    RCC_I3C2CLKSOURCE_CLKP,
    RCC_I3C2CLKSOURCE_IC10,
    RCC_I3C2CLKSOURCE_IC15,
    RCC_I3C2CLKSOURCE_MSI,
    RCC_I3C2CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM1CLockSelectionConf = enum {
    RCC_LPTIM1CLKSOURCE_PCLK1,
    RCC_LPTIM1CLKSOURCE_CLKP,
    RCC_LPTIM1CLKSOURCE_IC15,
    RCC_LPTIM1CLKSOURCE_LSE,
    RCC_LPTIM1CLKSOURCE_LSI,
    RCC_LPTIM1CLKSOURCE_TIMG,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM3CLockSelectionConf = enum {
    RCC_LPTIM3CLKSOURCE_PCLK4,
    RCC_LPTIM3CLKSOURCE_CLKP,
    RCC_LPTIM3CLKSOURCE_IC15,
    RCC_LPTIM3CLKSOURCE_LSE,
    RCC_LPTIM3CLKSOURCE_LSI,
    RCC_LPTIM3CLKSOURCE_TIMG,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM2CLockSelectionConf = enum {
    RCC_LPTIM2CLKSOURCE_PCLK4,
    RCC_LPTIM2CLKSOURCE_CLKP,
    RCC_LPTIM2CLKSOURCE_IC15,
    RCC_LPTIM2CLKSOURCE_LSE,
    RCC_LPTIM2CLKSOURCE_LSI,
    RCC_LPTIM2CLKSOURCE_TIMG,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM4CLockSelectionConf = enum {
    RCC_LPTIM4CLKSOURCE_PCLK4,
    RCC_LPTIM4CLKSOURCE_CLKP,
    RCC_LPTIM4CLKSOURCE_IC15,
    RCC_LPTIM4CLKSOURCE_LSE,
    RCC_LPTIM4CLKSOURCE_LSI,
    RCC_LPTIM4CLKSOURCE_TIMG,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPTIM5CLockSelectionConf = enum {
    RCC_LPTIM5CLKSOURCE_PCLK4,
    RCC_LPTIM5CLKSOURCE_CLKP,
    RCC_LPTIM5CLKSOURCE_IC15,
    RCC_LPTIM5CLKSOURCE_LSE,
    RCC_LPTIM5CLKSOURCE_LSI,
    RCC_LPTIM5CLKSOURCE_TIMG,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LTDCClockSelectionConf = enum {
    RCC_LTDCCLKSOURCE_PCLK5,
    RCC_LTDCCLKSOURCE_CLKP,
    RCC_LTDCCLKSOURCE_IC16,
    RCC_LTDCCLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const DCMIPPClockSelectionConf = enum {
    RCC_DCMIPPCLKSOURCE_PCLK5,
    RCC_DCMIPPCLKSOURCE_CLKP,
    RCC_DCMIPPCLKSOURCE_IC17,
    RCC_DCMIPPCLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const FMCClockSelectionConf = enum {
    RCC_FMCCLKSOURCE_HCLK,
    RCC_FMCCLKSOURCE_CLKP,
    RCC_FMCCLKSOURCE_IC3,
    RCC_FMCCLKSOURCE_IC4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI1ClockSelectionConf = enum {
    RCC_SAI1CLKSOURCE_PCLK2,
    RCC_SAI1CLKSOURCE_CLKP,
    RCC_SAI1CLKSOURCE_IC7,
    RCC_SAI1CLKSOURCE_IC8,
    RCC_SAI1CLKSOURCE_MSI,
    RCC_SAI1CLKSOURCE_HSI,
    RCC_SAI1CLKSOURCE_PIN,
    RCC_SAI1CLKSOURCE_SPDIFRX1,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SAI2ClockSelectionConf = enum {
    RCC_SAI2CLKSOURCE_PCLK2,
    RCC_SAI2CLKSOURCE_CLKP,
    RCC_SAI2CLKSOURCE_IC7,
    RCC_SAI2CLKSOURCE_IC8,
    RCC_SAI2CLKSOURCE_MSI,
    RCC_SAI2CLKSOURCE_HSI,
    RCC_SAI2CLKSOURCE_PIN,
    RCC_SAI2CLKSOURCE_SPDIFRX1,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART1ClockSelectionConf = enum {
    RCC_USART1CLKSOURCE_PCLK2,
    RCC_USART1CLKSOURCE_CLKP,
    RCC_USART1CLKSOURCE_IC9,
    RCC_USART1CLKSOURCE_IC14,
    RCC_USART1CLKSOURCE_LSE,
    RCC_USART1CLKSOURCE_MSI,
    RCC_USART1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART2ClockSelectionConf = enum {
    RCC_USART2CLKSOURCE_PCLK1,
    RCC_USART2CLKSOURCE_CLKP,
    RCC_USART2CLKSOURCE_IC9,
    RCC_USART2CLKSOURCE_IC14,
    RCC_USART2CLKSOURCE_LSE,
    RCC_USART2CLKSOURCE_MSI,
    RCC_USART2CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART3ClockSelectionConf = enum {
    RCC_USART3CLKSOURCE_PCLK1,
    RCC_USART3CLKSOURCE_CLKP,
    RCC_USART3CLKSOURCE_IC9,
    RCC_USART3CLKSOURCE_IC14,
    RCC_USART3CLKSOURCE_LSE,
    RCC_USART3CLKSOURCE_MSI,
    RCC_USART3CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART4ClockSelectionConf = enum {
    RCC_UART4CLKSOURCE_PCLK1,
    RCC_UART4CLKSOURCE_CLKP,
    RCC_UART4CLKSOURCE_IC9,
    RCC_UART4CLKSOURCE_IC14,
    RCC_UART4CLKSOURCE_LSE,
    RCC_UART4CLKSOURCE_MSI,
    RCC_UART4CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART5ClockSelectionConf = enum {
    RCC_UART5CLKSOURCE_PCLK1,
    RCC_UART5CLKSOURCE_CLKP,
    RCC_UART5CLKSOURCE_IC9,
    RCC_UART5CLKSOURCE_IC14,
    RCC_UART5CLKSOURCE_LSE,
    RCC_UART5CLKSOURCE_MSI,
    RCC_UART5CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART6ClockSelectionConf = enum {
    RCC_USART6CLKSOURCE_PCLK2,
    RCC_USART6CLKSOURCE_CLKP,
    RCC_USART6CLKSOURCE_IC9,
    RCC_USART6CLKSOURCE_IC14,
    RCC_USART6CLKSOURCE_LSE,
    RCC_USART6CLKSOURCE_MSI,
    RCC_USART6CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART7ClockSelectionConf = enum {
    RCC_UART7CLKSOURCE_PCLK1,
    RCC_UART7CLKSOURCE_CLKP,
    RCC_UART7CLKSOURCE_IC9,
    RCC_UART7CLKSOURCE_IC14,
    RCC_UART7CLKSOURCE_LSE,
    RCC_UART7CLKSOURCE_MSI,
    RCC_UART7CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART8ClockSelectionConf = enum {
    RCC_UART8CLKSOURCE_PCLK1,
    RCC_UART8CLKSOURCE_CLKP,
    RCC_UART8CLKSOURCE_IC9,
    RCC_UART8CLKSOURCE_IC14,
    RCC_UART8CLKSOURCE_LSE,
    RCC_UART8CLKSOURCE_MSI,
    RCC_UART8CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const UART9ClockSelectionConf = enum {
    RCC_UART9CLKSOURCE_PCLK2,
    RCC_UART9CLKSOURCE_CLKP,
    RCC_UART9CLKSOURCE_IC9,
    RCC_UART9CLKSOURCE_IC14,
    RCC_UART9CLKSOURCE_LSE,
    RCC_UART9CLKSOURCE_MSI,
    RCC_UART9CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const LPUART1ClockSelectionConf = enum {
    RCC_LPUART1CLKSOURCE_PCLK4,
    RCC_LPUART1CLKSOURCE_CLKP,
    RCC_LPUART1CLKSOURCE_IC9,
    RCC_LPUART1CLKSOURCE_IC14,
    RCC_LPUART1CLKSOURCE_LSE,
    RCC_LPUART1CLKSOURCE_MSI,
    RCC_LPUART1CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const USART10ClockSelectionConf = enum {
    RCC_USART10CLKSOURCE_PCLK2,
    RCC_USART10CLKSOURCE_CLKP,
    RCC_USART10CLKSOURCE_IC9,
    RCC_USART10CLKSOURCE_IC14,
    RCC_USART10CLKSOURCE_LSE,
    RCC_USART10CLKSOURCE_MSI,
    RCC_USART10CLKSOURCE_HSI,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI1ClockSelectionConf = enum {
    RCC_SPI1CLKSOURCE_PCLK2,
    RCC_SPI1CLKSOURCE_CLKP,
    RCC_SPI1CLKSOURCE_IC8,
    RCC_SPI1CLKSOURCE_IC9,
    RCC_SPI1CLKSOURCE_MSI,
    RCC_SPI1CLKSOURCE_HSI,
    RCC_SPI1CLKSOURCE_PIN,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI2ClockSelectionConf = enum {
    RCC_SPI2CLKSOURCE_PCLK1,
    RCC_SPI2CLKSOURCE_CLKP,
    RCC_SPI2CLKSOURCE_IC8,
    RCC_SPI2CLKSOURCE_IC9,
    RCC_SPI2CLKSOURCE_MSI,
    RCC_SPI2CLKSOURCE_HSI,
    RCC_SPI2CLKSOURCE_PIN,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI3ClockSelectionConf = enum {
    RCC_SPI3CLKSOURCE_PCLK1,
    RCC_SPI3CLKSOURCE_CLKP,
    RCC_SPI3CLKSOURCE_IC8,
    RCC_SPI3CLKSOURCE_IC9,
    RCC_SPI3CLKSOURCE_MSI,
    RCC_SPI3CLKSOURCE_HSI,
    RCC_SPI3CLKSOURCE_PIN,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI4ClockSelectionConf = enum {
    RCC_SPI4CLKSOURCE_PCLK2,
    RCC_SPI4CLKSOURCE_CLKP,
    RCC_SPI4CLKSOURCE_IC9,
    RCC_SPI4CLKSOURCE_IC14,
    RCC_SPI4CLKSOURCE_MSI,
    RCC_SPI4CLKSOURCE_HSI,
    RCC_SPI4CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI5ClockSelectionConf = enum {
    RCC_SPI5CLKSOURCE_PCLK2,
    RCC_SPI5CLKSOURCE_CLKP,
    RCC_SPI5CLKSOURCE_IC9,
    RCC_SPI5CLKSOURCE_IC14,
    RCC_SPI5CLKSOURCE_MSI,
    RCC_SPI5CLKSOURCE_HSI,
    RCC_SPI5CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPI6ClockSelectionConf = enum {
    RCC_SPI6CLKSOURCE_PCLK4,
    RCC_SPI6CLKSOURCE_CLKP,
    RCC_SPI6CLKSOURCE_IC8,
    RCC_SPI6CLKSOURCE_IC9,
    RCC_SPI6CLKSOURCE_MSI,
    RCC_SPI6CLKSOURCE_HSI,
    RCC_SPI6CLKSOURCE_PIN,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XSPI1ClockSelectionConf = enum {
    RCC_XSPI1CLKSOURCE_HCLK,
    RCC_XSPI1CLKSOURCE_CLKP,
    RCC_XSPI1CLKSOURCE_IC3,
    RCC_XSPI1CLKSOURCE_IC4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XSPI2ClockSelectionConf = enum {
    RCC_XSPI2CLKSOURCE_HCLK,
    RCC_XSPI2CLKSOURCE_CLKP,
    RCC_XSPI2CLKSOURCE_IC3,
    RCC_XSPI2CLKSOURCE_IC4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OTGHS1ClockSelectionConf = enum {
    RCC_USBPHY1REFCLKSOURCE_OTGPHY1,
    RCC_USBPHY1REFCLKSOURCE_HSE_DIRECT,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OTGHS2ClockSelectionConf = enum {
    RCC_USBPHY2REFCLKSOURCE_OTGPHY2,
    RCC_USBPHY2REFCLKSOURCE_HSE_DIRECT,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const XSPI3ClockSelectionConf = enum {
    RCC_XSPI3CLKSOURCE_HCLK,
    RCC_XSPI3CLKSOURCE_CLKP,
    RCC_XSPI3CLKSOURCE_IC3,
    RCC_XSPI3CLKSOURCE_IC4,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OTGPHY1ClockSelectionConf = enum {
    RCC_USBOTGHS1CLKSOURCE_HSE_DIRECT,
    RCC_USBOTGHS1CLKSOURCE_CLKP,
    RCC_USBOTGHS1CLKSOURCE_IC15,
    RCC_USBOTGHS1CLKSOURCE_HSE_DIV2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const OTGPHY2ClockSelectionConf = enum {
    RCC_USBOTGHS2CLKSOURCE_HSE_DIRECT,
    RCC_USBOTGHS2CLKSOURCE_CLKP,
    RCC_USBOTGHS2CLKSOURCE_IC15,
    RCC_USBOTGHS2CLKSOURCE_HSE_DIV2,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SDMMC1ClockSelectionConf = enum {
    RCC_SDMMC1CLKSOURCE_HCLK,
    RCC_SDMMC1CLKSOURCE_CLKP,
    RCC_SDMMC1CLKSOURCE_IC4,
    RCC_SDMMC1CLKSOURCE_IC5,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SDMMC2ClockSelectionConf = enum {
    RCC_SDMMC2CLKSOURCE_HCLK,
    RCC_SDMMC2CLKSOURCE_CLKP,
    RCC_SDMMC2CLKSOURCE_IC4,
    RCC_SDMMC2CLKSOURCE_IC5,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const ETH1ClockSelectionConf = enum {
    RCC_ETH1CLKSOURCE_HCLK,
    RCC_ETH1CLKSOURCE_CLKP,
    RCC_ETH1CLKSOURCE_IC12,
    RCC_ETH1CLKSOURCE_HSE,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SPDIFRX1ClockSelectionConf = enum {
    RCC_SPDIFRX1CLKSOURCE_PCLK1,
    RCC_SPDIFRX1CLKSOURCE_CLKP,
    RCC_SPDIFRX1CLKSOURCE_IC7,
    RCC_SPDIFRX1CLKSOURCE_IC8,
    RCC_SPDIFRX1CLKSOURCE_MSI,
    RCC_SPDIFRX1CLKSOURCE_HSI,
    RCC_SPDIFRX1CLKSOURCE_PIN,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSBCLKSourceConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_MSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_IC2_IC6_IC11,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSCCLKSourceVirtualConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_MSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_IC2_IC6_IC11,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const SYSDCLKSourceVirtualConf = enum {
    RCC_SYSCLKSOURCE_HSI,
    RCC_SYSCLKSOURCE_MSI,
    RCC_SYSCLKSOURCE_HSE,
    RCC_SYSCLKSOURCE_IC2_IC6_IC11,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const CPUCLKSourceConf = enum {
    RCC_CPUCLKSOURCE_HSI,
    RCC_CPUCLKSOURCE_MSI,
    RCC_CPUCLKSOURCE_HSE,
    RCC_CPUCLKSOURCE_IC1,

    pub fn get(self: @This()) usize {
        return @intFromEnum(self);
    }
};
pub const TPIUPrescalerConf = enum {
    @"8",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"8" => 8,
        };
    }
};
pub const Cortex_DivConf = enum {
    @"8",
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .@"8" => 8,
        };
    }
};
pub const HPRE_DivConf = enum {
    RCC_HCLK_DIV1,
    RCC_HCLK_DIV2,
    RCC_HCLK_DIV4,
    RCC_HCLK_DIV8,
    RCC_HCLK_DIV16,
    RCC_HCLK_DIV32,
    RCC_HCLK_DIV64,
    RCC_HCLK_DIV128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HCLK_DIV128 => 128,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV64 => 64,
            .RCC_HCLK_DIV16 => 16,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV32 => 32,
            .RCC_HCLK_DIV1 => 1,
        };
    }
};
pub const APB4DIVConf = enum {
    RCC_APB4_DIV1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB4_DIV1 => 1,
        };
    }
};
pub const APB5DIVConf = enum {
    RCC_APB5_DIV1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB5_DIV1 => 1,
        };
    }
};
pub const TIMGDIVConf = enum {
    RCC_TIMPRES_DIV1,
    RCC_TIMPRES_DIV2,
    RCC_TIMPRES_DIV4,
    RCC_TIMPRES_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_TIMPRES_DIV1 => 1,
            .RCC_TIMPRES_DIV2 => 2,
            .RCC_TIMPRES_DIV8 => 8,
            .RCC_TIMPRES_DIV4 => 4,
        };
    }
};
pub const APB1DIVConf = enum {
    RCC_APB1_DIV1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB1_DIV1 => 1,
        };
    }
};
pub const APB2DIVConf = enum {
    RCC_APB2_DIV1,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_APB2_DIV1 => 1,
        };
    }
};
pub const PLL1SourceConf = enum {
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_MSI,
    RCC_PLLSOURCE_HSE,
    RCC_PLLSOURCE_PIN,

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
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_MSI,
    RCC_PLLSOURCE_HSE,
    RCC_PLLSOURCE_PIN,

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
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_MSI,
    RCC_PLLSOURCE_HSE,
    RCC_PLLSOURCE_PIN,

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
    RCC_PLLSOURCE_HSI,
    RCC_PLLSOURCE_MSI,
    RCC_PLLSOURCE_HSE,
    RCC_PLLSOURCE_PIN,

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
pub const PLL1FRACVConf = enum(u32) {
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
pub const RCC_RTC_Clock_Source_FROM_HSEConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const RTCClockSelectionConf = enum {
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
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }
};
pub const MSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
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
    HSIDiv: ?HSIDivConf = null,
    HSIDiv4: ?HSIDiv4Conf = null,
    HSEOSC: ?HSE_VALUEConf = null,
    HSEOSCDIV: ?HSE_DivConf = null,
    HSEDIV: ?HSE_Div2Conf = null,
    LSEOSC: ?LSE_VALUEConf = null,
    MSIRC: ?MSIClockRangeConf = null,
    IC1: ?IC1CLKSourceConf = null,
    IC1Div: ?IC1DivConf = null,
    IC2: ?IC2CLKSourceConf = null,
    IC2Div: ?IC2DivConf = null,
    IC3: ?IC3CLKSourceConf = null,
    IC3Div: ?IC3DivConf = null,
    IC4: ?IC4CLKSourceConf = null,
    IC4Div: ?IC4DivConf = null,
    IC5: ?IC5CLKSourceConf = null,
    IC5Div: ?IC5DivConf = null,
    IC6: ?IC6CLKSourceConf = null,
    IC6Div: ?IC6DivConf = null,
    IC7: ?IC7CLKSourceConf = null,
    IC7Div: ?IC7DivConf = null,
    IC8: ?IC8CLKSourceConf = null,
    IC8Div: ?IC8DivConf = null,
    IC9: ?IC9CLKSourceConf = null,
    IC9Div: ?IC9DivConf = null,
    IC10: ?IC10CLKSourceConf = null,
    IC10Div: ?IC10DivConf = null,
    IC11: ?IC11CLKSourceConf = null,
    IC11Div: ?IC11DivConf = null,
    IC12: ?IC12CLKSourceConf = null,
    IC12Div: ?IC12DivConf = null,
    IC13: ?IC13CLKSourceConf = null,
    IC13Div: ?IC13DivConf = null,
    IC14: ?IC14CLKSourceConf = null,
    IC14Div: ?IC14DivConf = null,
    IC15: ?IC15CLKSourceConf = null,
    IC15Div: ?IC15DivConf = null,
    IC16: ?IC16CLKSourceConf = null,
    IC16Div: ?IC16DivConf = null,
    IC17: ?IC17CLKSourceConf = null,
    IC17Div: ?IC17DivConf = null,
    IC18: ?IC18CLKSourceConf = null,
    IC18Div: ?IC18DivConf = null,
    IC19: ?IC19CLKSourceConf = null,
    IC19Div: ?IC19DivConf = null,
    IC20: ?IC20CLKSourceConf = null,
    IC20Div: ?IC20DivConf = null,
    MCOMult: ?RCC_MCO1SourceConf = null,
    MCODiv: ?RCC_MCODiv1Conf = null,
    MCO2Mult: ?RCC_MCO2SourceConf = null,
    MCO2Div: ?RCC_MCODiv2Conf = null,
    CKPERSource: ?CKPERSourceSelectionConf = null,
    ADCMult: ?ADCCLockSelectionConf = null,
    ADCDIV: ?ADCDIVConf = null,
    ADFMult: ?ADF1ClockSelectionConf = null,
    MDF1Mult: ?MDF1ClockSelectionConf = null,
    PSSIMult: ?PSSIClockSelectionConf = null,
    FDCANMult: ?FDCANClockSelectionConf = null,
    I2C1Mult: ?I2C1CLockSelectionConf = null,
    I2C2Mult: ?I2C2CLockSelectionConf = null,
    I2C3Mult: ?I2C3CLockSelectionConf = null,
    I2C4Mult: ?I2C4CLockSelectionConf = null,
    I3C1Mult: ?I3C1CLockSelectionConf = null,
    I3C2Mult: ?I3C2CLockSelectionConf = null,
    LPTIM1Mult: ?LPTIM1CLockSelectionConf = null,
    LPTIM3Mult: ?LPTIM3CLockSelectionConf = null,
    LPTIM2Mult: ?LPTIM2CLockSelectionConf = null,
    LPTIM4Mult: ?LPTIM4CLockSelectionConf = null,
    LPTIM5Mult: ?LPTIM5CLockSelectionConf = null,
    LTDCMult: ?LTDCClockSelectionConf = null,
    DCMIPPMult: ?DCMIPPClockSelectionConf = null,
    FMCMult: ?FMCClockSelectionConf = null,
    SAI1Mult: ?SAI1ClockSelectionConf = null,
    SAI2Mult: ?SAI2ClockSelectionConf = null,
    USART1Mult: ?USART1ClockSelectionConf = null,
    USART2Mult: ?USART2ClockSelectionConf = null,
    USART3Mult: ?USART3ClockSelectionConf = null,
    UART4Mult: ?UART4ClockSelectionConf = null,
    UART5Mult: ?UART5ClockSelectionConf = null,
    USART6Mult: ?USART6ClockSelectionConf = null,
    UART7Mult: ?UART7ClockSelectionConf = null,
    UART8Mult: ?UART8ClockSelectionConf = null,
    UART9Mult: ?UART9ClockSelectionConf = null,
    LPUART1Mult: ?LPUART1ClockSelectionConf = null,
    USART10Mult: ?USART10ClockSelectionConf = null,
    SPI1Mult: ?SPI1ClockSelectionConf = null,
    SPI2Mult: ?SPI2ClockSelectionConf = null,
    SPI3Mult: ?SPI3ClockSelectionConf = null,
    SPI4Mult: ?SPI4ClockSelectionConf = null,
    SPI5Mult: ?SPI5ClockSelectionConf = null,
    SPI6Mult: ?SPI6ClockSelectionConf = null,
    XSPI1Mult: ?XSPI1ClockSelectionConf = null,
    XSPI2Mult: ?XSPI2ClockSelectionConf = null,
    OTGHS1Mult: ?OTGHS1ClockSelectionConf = null,
    OTGHS2Mult: ?OTGHS2ClockSelectionConf = null,
    XSPI3Mult: ?XSPI3ClockSelectionConf = null,
    OTGPHY1Mult: ?OTGPHY1ClockSelectionConf = null,
    OTGPHY2Mult: ?OTGPHY2ClockSelectionConf = null,
    SDMMC1Mult: ?SDMMC1ClockSelectionConf = null,
    SDMMC2Mult: ?SDMMC2ClockSelectionConf = null,
    ETH1Mult: ?ETH1ClockSelectionConf = null,
    SPDIFRX1Mult: ?SPDIFRX1ClockSelectionConf = null,
    SYSBClkSource: ?SYSBCLKSourceConf = null,
    SYSCClkSource: ?SYSCCLKSourceVirtualConf = null,
    SYSDClkSource: ?SYSDCLKSourceVirtualConf = null,
    SYSAClkSource: ?CPUCLKSourceConf = null,
    TPIUPrescaler: ?TPIUPrescalerConf = null,
    CortexPrescaler: ?Cortex_DivConf = null,
    HPREDiv: ?HPRE_DivConf = null,
    APB4DIV: ?APB4DIVConf = null,
    APB5DIV: ?APB5DIVConf = null,
    TIMGDIV: ?TIMGDIVConf = null,
    APB1DIV: ?APB1DIVConf = null,
    APB2DIV: ?APB2DIVConf = null,
    PLL1Source: ?PLL1SourceConf = null,
    FREFDIV1: ?FREFDIV1Conf = null,
    PLL2Source: ?PLL2SourceConf = null,
    FREFDIV2: ?FREFDIV2Conf = null,
    PLL3Source: ?PLL3SourceConf = null,
    FREFDIV3: ?FREFDIV3Conf = null,
    PLL4Source: ?PLL4SourceConf = null,
    FREFDIV4: ?FREFDIV4Conf = null,
    FBDIV1: ?FBDIV1Conf = null,
    PLL1FRACV: ?PLL1FRACVConf = null,
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
    HSERTCDevisor: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClkSource: ?RTCClockSelectionConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_G1_PRescaler_Selection: ?RCC_TIM_G1_PRescaler_SelectionConf = null,
    RCC_TIM_G2_PRescaler_Selection: ?RCC_TIM_G2_PRescaler_SelectionConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
};

pub const ConfigWithRef = struct {
    HSIDiv: ?HSIDivConf = null,
    HSIDiv4: ?HSIDiv4Conf = null,
    HSE_VALUE: ?HSE_VALUEConf = null,
    HSE_Div: ?HSE_DivConf = null,
    HSE_Div2: ?HSE_Div2Conf = null,
    LSE_VALUE: ?LSE_VALUEConf = null,
    MSIClockRange: ?MSIClockRangeConf = null,
    IC1CLKSource: ?IC1CLKSourceConf = null,
    IC1Div: ?IC1DivConf = null,
    IC2CLKSource: ?IC2CLKSourceConf = null,
    IC2Div: ?IC2DivConf = null,
    IC3CLKSource: ?IC3CLKSourceConf = null,
    IC3Div: ?IC3DivConf = null,
    IC4CLKSource: ?IC4CLKSourceConf = null,
    IC4Div: ?IC4DivConf = null,
    IC5CLKSource: ?IC5CLKSourceConf = null,
    IC5Div: ?IC5DivConf = null,
    IC6CLKSource: ?IC6CLKSourceConf = null,
    IC6Div: ?IC6DivConf = null,
    IC7CLKSource: ?IC7CLKSourceConf = null,
    IC7Div: ?IC7DivConf = null,
    IC8CLKSource: ?IC8CLKSourceConf = null,
    IC8Div: ?IC8DivConf = null,
    IC9CLKSource: ?IC9CLKSourceConf = null,
    IC9Div: ?IC9DivConf = null,
    IC10CLKSource: ?IC10CLKSourceConf = null,
    IC10Div: ?IC10DivConf = null,
    IC11CLKSource: ?IC11CLKSourceConf = null,
    IC11Div: ?IC11DivConf = null,
    IC12CLKSource: ?IC12CLKSourceConf = null,
    IC12Div: ?IC12DivConf = null,
    IC13CLKSource: ?IC13CLKSourceConf = null,
    IC13Div: ?IC13DivConf = null,
    IC14CLKSource: ?IC14CLKSourceConf = null,
    IC14Div: ?IC14DivConf = null,
    IC15CLKSource: ?IC15CLKSourceConf = null,
    IC15Div: ?IC15DivConf = null,
    IC16CLKSource: ?IC16CLKSourceConf = null,
    IC16Div: ?IC16DivConf = null,
    IC17CLKSource: ?IC17CLKSourceConf = null,
    IC17Div: ?IC17DivConf = null,
    IC18CLKSource: ?IC18CLKSourceConf = null,
    IC18Div: ?IC18DivConf = null,
    IC19CLKSource: ?IC19CLKSourceConf = null,
    IC19Div: ?IC19DivConf = null,
    IC20CLKSource: ?IC20CLKSourceConf = null,
    IC20Div: ?IC20DivConf = null,
    RCC_MCO1Source: ?RCC_MCO1SourceConf = null,
    RCC_MCODiv1: ?RCC_MCODiv1Conf = null,
    RCC_MCO2Source: ?RCC_MCO2SourceConf = null,
    RCC_MCODiv2: ?RCC_MCODiv2Conf = null,
    CKPERSourceSelection: ?CKPERSourceSelectionConf = null,
    ADCCLockSelection: ?ADCCLockSelectionConf = null,
    ADCDIV: ?ADCDIVConf = null,
    ADF1ClockSelection: ?ADF1ClockSelectionConf = null,
    MDF1ClockSelection: ?MDF1ClockSelectionConf = null,
    PSSIClockSelection: ?PSSIClockSelectionConf = null,
    FDCANClockSelection: ?FDCANClockSelectionConf = null,
    I2C1CLockSelection: ?I2C1CLockSelectionConf = null,
    I2C2CLockSelection: ?I2C2CLockSelectionConf = null,
    I2C3CLockSelection: ?I2C3CLockSelectionConf = null,
    I2C4CLockSelection: ?I2C4CLockSelectionConf = null,
    I3C1CLockSelection: ?I3C1CLockSelectionConf = null,
    I3C2CLockSelection: ?I3C2CLockSelectionConf = null,
    LPTIM1CLockSelection: ?LPTIM1CLockSelectionConf = null,
    LPTIM3CLockSelection: ?LPTIM3CLockSelectionConf = null,
    LPTIM2CLockSelection: ?LPTIM2CLockSelectionConf = null,
    LPTIM4CLockSelection: ?LPTIM4CLockSelectionConf = null,
    LPTIM5CLockSelection: ?LPTIM5CLockSelectionConf = null,
    LTDCClockSelection: ?LTDCClockSelectionConf = null,
    DCMIPPClockSelection: ?DCMIPPClockSelectionConf = null,
    FMCClockSelection: ?FMCClockSelectionConf = null,
    SAI1ClockSelection: ?SAI1ClockSelectionConf = null,
    SAI2ClockSelection: ?SAI2ClockSelectionConf = null,
    USART1ClockSelection: ?USART1ClockSelectionConf = null,
    USART2ClockSelection: ?USART2ClockSelectionConf = null,
    USART3ClockSelection: ?USART3ClockSelectionConf = null,
    UART4ClockSelection: ?UART4ClockSelectionConf = null,
    UART5ClockSelection: ?UART5ClockSelectionConf = null,
    USART6ClockSelection: ?USART6ClockSelectionConf = null,
    UART7ClockSelection: ?UART7ClockSelectionConf = null,
    UART8ClockSelection: ?UART8ClockSelectionConf = null,
    UART9ClockSelection: ?UART9ClockSelectionConf = null,
    LPUART1ClockSelection: ?LPUART1ClockSelectionConf = null,
    USART10ClockSelection: ?USART10ClockSelectionConf = null,
    SPI1ClockSelection: ?SPI1ClockSelectionConf = null,
    SPI2ClockSelection: ?SPI2ClockSelectionConf = null,
    SPI3ClockSelection: ?SPI3ClockSelectionConf = null,
    SPI4ClockSelection: ?SPI4ClockSelectionConf = null,
    SPI5ClockSelection: ?SPI5ClockSelectionConf = null,
    SPI6ClockSelection: ?SPI6ClockSelectionConf = null,
    XSPI1ClockSelection: ?XSPI1ClockSelectionConf = null,
    XSPI2ClockSelection: ?XSPI2ClockSelectionConf = null,
    OTGHS1ClockSelection: ?OTGHS1ClockSelectionConf = null,
    OTGHS2ClockSelection: ?OTGHS2ClockSelectionConf = null,
    XSPI3ClockSelection: ?XSPI3ClockSelectionConf = null,
    OTGPHY1ClockSelection: ?OTGPHY1ClockSelectionConf = null,
    OTGPHY2ClockSelection: ?OTGPHY2ClockSelectionConf = null,
    SDMMC1ClockSelection: ?SDMMC1ClockSelectionConf = null,
    SDMMC2ClockSelection: ?SDMMC2ClockSelectionConf = null,
    ETH1ClockSelection: ?ETH1ClockSelectionConf = null,
    SPDIFRX1ClockSelection: ?SPDIFRX1ClockSelectionConf = null,
    SYSBCLKSource: ?SYSBCLKSourceConf = null,
    SYSCCLKSourceVirtual: ?SYSCCLKSourceVirtualConf = null,
    SYSDCLKSourceVirtual: ?SYSDCLKSourceVirtualConf = null,
    CPUCLKSource: ?CPUCLKSourceConf = null,
    TPIUPrescaler: ?TPIUPrescalerConf = null,
    Cortex_Div: ?Cortex_DivConf = null,
    HPRE_Div: ?HPRE_DivConf = null,
    APB4DIV: ?APB4DIVConf = null,
    APB5DIV: ?APB5DIVConf = null,
    TIMGDIV: ?TIMGDIVConf = null,
    APB1DIV: ?APB1DIVConf = null,
    APB2DIV: ?APB2DIVConf = null,
    PLL1Source: ?PLL1SourceConf = null,
    FREFDIV1: ?FREFDIV1Conf = null,
    PLL2Source: ?PLL2SourceConf = null,
    FREFDIV2: ?FREFDIV2Conf = null,
    PLL3Source: ?PLL3SourceConf = null,
    FREFDIV3: ?FREFDIV3Conf = null,
    PLL4Source: ?PLL4SourceConf = null,
    FREFDIV4: ?FREFDIV4Conf = null,
    FBDIV1: ?FBDIV1Conf = null,
    PLL1FRACV: ?PLL1FRACVConf = null,
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
    RCC_RTC_Clock_Source_FROM_HSE: ?RCC_RTC_Clock_Source_FROM_HSEConf = null,
    RTCClockSelection: ?RTCClockSelectionConf = null,
    HSE_Timout: ?HSE_TimoutConf = null,
    LSE_Timout: ?LSE_TimoutConf = null,
    RCC_TIM_G1_PRescaler_Selection: ?RCC_TIM_G1_PRescaler_SelectionConf = null,
    RCC_TIM_G2_PRescaler_Selection: ?RCC_TIM_G2_PRescaler_SelectionConf = null,
    HSICalibrationValue: ?HSICalibrationValueConf = null,
    MSICalibrationValue: ?MSICalibrationValueConf = null,
    LSE_Drive_Capability: ?LSE_Drive_CapabilityConf = null,
    pub fn into_config(self: *const ConfigWithRef) Config {
        return .{
            .HSIDiv = self.HSIDiv,
            .HSIDiv4 = self.HSIDiv4,
            .HSEOSC = self.HSE_VALUE,
            .HSEOSCDIV = self.HSE_Div,
            .HSEDIV = self.HSE_Div2,
            .LSEOSC = self.LSE_VALUE,
            .MSIRC = self.MSIClockRange,
            .IC1 = self.IC1CLKSource,
            .IC1Div = self.IC1Div,
            .IC2 = self.IC2CLKSource,
            .IC2Div = self.IC2Div,
            .IC3 = self.IC3CLKSource,
            .IC3Div = self.IC3Div,
            .IC4 = self.IC4CLKSource,
            .IC4Div = self.IC4Div,
            .IC5 = self.IC5CLKSource,
            .IC5Div = self.IC5Div,
            .IC6 = self.IC6CLKSource,
            .IC6Div = self.IC6Div,
            .IC7 = self.IC7CLKSource,
            .IC7Div = self.IC7Div,
            .IC8 = self.IC8CLKSource,
            .IC8Div = self.IC8Div,
            .IC9 = self.IC9CLKSource,
            .IC9Div = self.IC9Div,
            .IC10 = self.IC10CLKSource,
            .IC10Div = self.IC10Div,
            .IC11 = self.IC11CLKSource,
            .IC11Div = self.IC11Div,
            .IC12 = self.IC12CLKSource,
            .IC12Div = self.IC12Div,
            .IC13 = self.IC13CLKSource,
            .IC13Div = self.IC13Div,
            .IC14 = self.IC14CLKSource,
            .IC14Div = self.IC14Div,
            .IC15 = self.IC15CLKSource,
            .IC15Div = self.IC15Div,
            .IC16 = self.IC16CLKSource,
            .IC16Div = self.IC16Div,
            .IC17 = self.IC17CLKSource,
            .IC17Div = self.IC17Div,
            .IC18 = self.IC18CLKSource,
            .IC18Div = self.IC18Div,
            .IC19 = self.IC19CLKSource,
            .IC19Div = self.IC19Div,
            .IC20 = self.IC20CLKSource,
            .IC20Div = self.IC20Div,
            .MCOMult = self.RCC_MCO1Source,
            .MCODiv = self.RCC_MCODiv1,
            .MCO2Mult = self.RCC_MCO2Source,
            .MCO2Div = self.RCC_MCODiv2,
            .CKPERSource = self.CKPERSourceSelection,
            .ADCMult = self.ADCCLockSelection,
            .ADCDIV = self.ADCDIV,
            .ADFMult = self.ADF1ClockSelection,
            .MDF1Mult = self.MDF1ClockSelection,
            .PSSIMult = self.PSSIClockSelection,
            .FDCANMult = self.FDCANClockSelection,
            .I2C1Mult = self.I2C1CLockSelection,
            .I2C2Mult = self.I2C2CLockSelection,
            .I2C3Mult = self.I2C3CLockSelection,
            .I2C4Mult = self.I2C4CLockSelection,
            .I3C1Mult = self.I3C1CLockSelection,
            .I3C2Mult = self.I3C2CLockSelection,
            .LPTIM1Mult = self.LPTIM1CLockSelection,
            .LPTIM3Mult = self.LPTIM3CLockSelection,
            .LPTIM2Mult = self.LPTIM2CLockSelection,
            .LPTIM4Mult = self.LPTIM4CLockSelection,
            .LPTIM5Mult = self.LPTIM5CLockSelection,
            .LTDCMult = self.LTDCClockSelection,
            .DCMIPPMult = self.DCMIPPClockSelection,
            .FMCMult = self.FMCClockSelection,
            .SAI1Mult = self.SAI1ClockSelection,
            .SAI2Mult = self.SAI2ClockSelection,
            .USART1Mult = self.USART1ClockSelection,
            .USART2Mult = self.USART2ClockSelection,
            .USART3Mult = self.USART3ClockSelection,
            .UART4Mult = self.UART4ClockSelection,
            .UART5Mult = self.UART5ClockSelection,
            .USART6Mult = self.USART6ClockSelection,
            .UART7Mult = self.UART7ClockSelection,
            .UART8Mult = self.UART8ClockSelection,
            .UART9Mult = self.UART9ClockSelection,
            .LPUART1Mult = self.LPUART1ClockSelection,
            .USART10Mult = self.USART10ClockSelection,
            .SPI1Mult = self.SPI1ClockSelection,
            .SPI2Mult = self.SPI2ClockSelection,
            .SPI3Mult = self.SPI3ClockSelection,
            .SPI4Mult = self.SPI4ClockSelection,
            .SPI5Mult = self.SPI5ClockSelection,
            .SPI6Mult = self.SPI6ClockSelection,
            .XSPI1Mult = self.XSPI1ClockSelection,
            .XSPI2Mult = self.XSPI2ClockSelection,
            .OTGHS1Mult = self.OTGHS1ClockSelection,
            .OTGHS2Mult = self.OTGHS2ClockSelection,
            .XSPI3Mult = self.XSPI3ClockSelection,
            .OTGPHY1Mult = self.OTGPHY1ClockSelection,
            .OTGPHY2Mult = self.OTGPHY2ClockSelection,
            .SDMMC1Mult = self.SDMMC1ClockSelection,
            .SDMMC2Mult = self.SDMMC2ClockSelection,
            .ETH1Mult = self.ETH1ClockSelection,
            .SPDIFRX1Mult = self.SPDIFRX1ClockSelection,
            .SYSBClkSource = self.SYSBCLKSource,
            .SYSCClkSource = self.SYSCCLKSourceVirtual,
            .SYSDClkSource = self.SYSDCLKSourceVirtual,
            .SYSAClkSource = self.CPUCLKSource,
            .TPIUPrescaler = self.TPIUPrescaler,
            .CortexPrescaler = self.Cortex_Div,
            .HPREDiv = self.HPRE_Div,
            .APB4DIV = self.APB4DIV,
            .APB5DIV = self.APB5DIV,
            .TIMGDIV = self.TIMGDIV,
            .APB1DIV = self.APB1DIV,
            .APB2DIV = self.APB2DIV,
            .PLL1Source = self.PLL1Source,
            .FREFDIV1 = self.FREFDIV1,
            .PLL2Source = self.PLL2Source,
            .FREFDIV2 = self.FREFDIV2,
            .PLL3Source = self.PLL3Source,
            .FREFDIV3 = self.FREFDIV3,
            .PLL4Source = self.PLL4Source,
            .FREFDIV4 = self.FREFDIV4,
            .FBDIV1 = self.FBDIV1,
            .PLL1FRACV = self.PLL1FRACV,
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
            .HSERTCDevisor = self.RCC_RTC_Clock_Source_FROM_HSE,
            .RTCClkSource = self.RTCClockSelection,
            .HSE_Timout = self.HSE_Timout,
            .LSE_Timout = self.LSE_Timout,
            .RCC_TIM_G1_PRescaler_Selection = self.RCC_TIM_G1_PRescaler_Selection,
            .RCC_TIM_G2_PRescaler_Selection = self.RCC_TIM_G2_PRescaler_Selection,
            .HSICalibrationValue = self.HSICalibrationValue,
            .MSICalibrationValue = self.MSICalibrationValue,
            .LSE_Drive_Capability = self.LSE_Drive_Capability,
        };
    }
};

pub const ClockTree = struct {
    const Self = @This();

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
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    RCC_TIM_G1_PRescaler_Selection: ClockNodeTypes,
    RCC_TIM_G2_PRescaler_Selection: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init(comptime config: Config) Self {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .nodetype = HSIRCval,
        };
        const HSIDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSIDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HSIDiv: ClockNode = .{
            .name = "HSIDiv",
            .nodetype = HSIDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSIDivOutputval = ClockNodeTypes{ .output = null };
        const HSIDivOutput: ClockNode = .{
            .name = "HSIDivOutput",
            .nodetype = HSIDivOutputval,
            .parents = &[_]*const ClockNode{&HSIDiv},
        };
        const HSIDiv4val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSIDiv4) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        } };
        const HSIDiv4: ClockNode = .{
            .name = "HSIDiv4",
            .nodetype = HSIDiv4val,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const UCPDOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 25000000), .min = 0 },
        };
        const UCPDOutput: ClockNode = .{
            .name = "UCPDOutput",
            .nodetype = UCPDOutputval,
            .parents = &[_]*const ClockNode{&HSIDiv4},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 48000000,
                .limit = .{ .max = @min(1_000_000_000, 48000000), .min = 8000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .nodetype = HSEOSCval,
        };
        const HSEOSCDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEOSCDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HSEOSCDIV: ClockNode = .{
            .name = "HSEOSCDIV",
            .nodetype = HSEOSCDIVval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const HSEDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const HSEDIV: ClockNode = .{
            .name = "HSEDIV",
            .nodetype = HSEDIVval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 0 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .nodetype = LSEOSCval,
        };
        const MSIRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIRC) |val| {
                    break :inner val.get();
                } else {
                    break :inner 16;
                }
            },
        } };
        const MSIRC: ClockNode = .{
            .name = "MSIRC",
            .nodetype = MSIRCval,
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .nodetype = I2S_CKINval,
        };
        const PLL1Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL1Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL1Source: ClockNode = .{
            .name = "PLL1Source",
            .nodetype = PLL1Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const FREFDIV1val = ClockNodeTypes{
            .div = .{
                .value = if (config.FREFDIV1) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const FREFDIV1: ClockNode = .{
            .name = "FREFDIV1",
            .nodetype = FREFDIV1val,
            .parents = &[_]*const ClockNode{&PLL1Source},
        };
        const FBDIV1val = ClockNodeTypes{
            .mul = .{
                .value = if (config.FBDIV1) |val| val.get() else 25,
                .limit = .{ .max = @min(1_000_000_000, 2500), .min = 10 },
            },
        };
        const FBDIV1: ClockNode = .{
            .name = "FBDIV1",
            .nodetype = FBDIV1val,
            .parents = &[_]*const ClockNode{&FREFDIV1},
        };
        const POSTDIV1_1val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV1_1) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        const POSTDIV1_1: ClockNode = .{
            .name = "POSTDIV1_1",
            .nodetype = POSTDIV1_1val,
            .parents = &[_]*const ClockNode{&FBDIV1},
        };
        const POSTDIV2_1val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV2_1) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        const POSTDIV2_1: ClockNode = .{
            .name = "POSTDIV2_1",
            .nodetype = POSTDIV2_1val,
            .parents = &[_]*const ClockNode{&POSTDIV1_1},
        };
        const FOUTPOSTDIV1val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 3200000000), .min = 16000000 },
        };
        const FOUTPOSTDIV1: ClockNode = .{
            .name = "FOUTPOSTDIV1",
            .nodetype = FOUTPOSTDIV1val,
            .parents = &[_]*const ClockNode{&POSTDIV2_1},
        };
        const PLL2Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL2Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL2Source: ClockNode = .{
            .name = "PLL2Source",
            .nodetype = PLL2Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const FREFDIV2val = ClockNodeTypes{
            .div = .{
                .value = if (config.FREFDIV2) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const FREFDIV2: ClockNode = .{
            .name = "FREFDIV2",
            .nodetype = FREFDIV2val,
            .parents = &[_]*const ClockNode{&PLL2Source},
        };
        const PLL2FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL2FRACV) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 16777215), .min = 0 },
            },
        };
        const PLL2FRACV: ClockNode = .{
            .name = "PLL2FRACV",
            .nodetype = PLL2FRACVval,
        };
        const FBDIV2val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV2) |val| val.get() else 25,
                .limit = .{ .max = @min(1_000_000_000, 500), .min = 20 },
            },
        };
        const FBDIV2: ClockNode = .{
            .name = "FBDIV2",
            .nodetype = FBDIV2val,
            .parents = &[_]*const ClockNode{ &FREFDIV2, &PLL2FRACV },
        };
        const POSTDIV1_2val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV1_2) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        const POSTDIV1_2: ClockNode = .{
            .name = "POSTDIV1_2",
            .nodetype = POSTDIV1_2val,
            .parents = &[_]*const ClockNode{&FBDIV2},
        };
        const POSTDIV2_2val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV2_2) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        const POSTDIV2_2: ClockNode = .{
            .name = "POSTDIV2_2",
            .nodetype = POSTDIV2_2val,
            .parents = &[_]*const ClockNode{&POSTDIV1_2},
        };
        const FOUTPOSTDIV2val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 3200000000), .min = 16000000 },
        };
        const FOUTPOSTDIV2: ClockNode = .{
            .name = "FOUTPOSTDIV2",
            .nodetype = FOUTPOSTDIV2val,
            .parents = &[_]*const ClockNode{&POSTDIV2_2},
        };
        const PLL3Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL3Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL3Source: ClockNode = .{
            .name = "PLL3Source",
            .nodetype = PLL3Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const FREFDIV3val = ClockNodeTypes{
            .div = .{
                .value = if (config.FREFDIV3) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const FREFDIV3: ClockNode = .{
            .name = "FREFDIV3",
            .nodetype = FREFDIV3val,
            .parents = &[_]*const ClockNode{&PLL3Source},
        };
        const PLL3FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL3FRACV) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 16777215), .min = 0 },
            },
        };
        const PLL3FRACV: ClockNode = .{
            .name = "PLL3FRACV",
            .nodetype = PLL3FRACVval,
        };
        const FBDIV3val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV3) |val| val.get() else 25,
                .limit = .{ .max = @min(1_000_000_000, 500), .min = 20 },
            },
        };
        const FBDIV3: ClockNode = .{
            .name = "FBDIV3",
            .nodetype = FBDIV3val,
            .parents = &[_]*const ClockNode{ &FREFDIV3, &PLL3FRACV },
        };
        const POSTDIV1_3val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV1_3) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        const POSTDIV1_3: ClockNode = .{
            .name = "POSTDIV1_3",
            .nodetype = POSTDIV1_3val,
            .parents = &[_]*const ClockNode{&FBDIV3},
        };
        const POSTDIV2_3val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV2_3) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        const POSTDIV2_3: ClockNode = .{
            .name = "POSTDIV2_3",
            .nodetype = POSTDIV2_3val,
            .parents = &[_]*const ClockNode{&POSTDIV1_3},
        };
        const FOUTPOSTDIV3val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 3200000000), .min = 16000000 },
        };
        const FOUTPOSTDIV3: ClockNode = .{
            .name = "FOUTPOSTDIV3",
            .nodetype = FOUTPOSTDIV3val,
            .parents = &[_]*const ClockNode{&POSTDIV2_3},
        };
        const PLL4Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL4Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PLL4Source: ClockNode = .{
            .name = "PLL4Source",
            .nodetype = PLL4Sourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &I2S_CKIN,
            },
        };
        const FREFDIV4val = ClockNodeTypes{
            .div = .{
                .value = if (config.FREFDIV4) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        const FREFDIV4: ClockNode = .{
            .name = "FREFDIV4",
            .nodetype = FREFDIV4val,
            .parents = &[_]*const ClockNode{&PLL4Source},
        };
        const PLL4FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL4FRACV) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 16777215), .min = 0 },
            },
        };
        const PLL4FRACV: ClockNode = .{
            .name = "PLL4FRACV",
            .nodetype = PLL4FRACVval,
        };
        const FBDIV4val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV4) |val| val.get() else 25,
                .limit = .{ .max = @min(1_000_000_000, 500), .min = 20 },
            },
        };
        const FBDIV4: ClockNode = .{
            .name = "FBDIV4",
            .nodetype = FBDIV4val,
            .parents = &[_]*const ClockNode{ &FREFDIV4, &PLL4FRACV },
        };
        const POSTDIV1_4val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV1_4) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        const POSTDIV1_4: ClockNode = .{
            .name = "POSTDIV1_4",
            .nodetype = POSTDIV1_4val,
            .parents = &[_]*const ClockNode{&FBDIV4},
        };
        const POSTDIV2_4val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV2_4) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        const POSTDIV2_4: ClockNode = .{
            .name = "POSTDIV2_4",
            .nodetype = POSTDIV2_4val,
            .parents = &[_]*const ClockNode{&POSTDIV1_4},
        };
        const FOUTPOSTDIV4val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 3200000000), .min = 16000000 },
        };
        const FOUTPOSTDIV4: ClockNode = .{
            .name = "FOUTPOSTDIV4",
            .nodetype = FOUTPOSTDIV4val,
            .parents = &[_]*const ClockNode{&POSTDIV2_4},
        };
        const IC1val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const IC1: ClockNode = .{
            .name = "IC1",
            .nodetype = IC1val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC1Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC1Div) |val| val.get() else 3,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC1Div: ClockNode = .{
            .name = "IC1Div",
            .nodetype = IC1Divval,
            .parents = &[_]*const ClockNode{&IC1},
        };
        const IC1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC1Output: ClockNode = .{
            .name = "IC1Output",
            .nodetype = IC1Outputval,
            .parents = &[_]*const ClockNode{&IC1Div},
        };
        const IC2val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC2) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const IC2: ClockNode = .{
            .name = "IC2",
            .nodetype = IC2val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC2Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC2Div) |val| val.get() else 4,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC2Div: ClockNode = .{
            .name = "IC2Div",
            .nodetype = IC2Divval,
            .parents = &[_]*const ClockNode{&IC2},
        };
        const IC2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC2Output: ClockNode = .{
            .name = "IC2Output",
            .nodetype = IC2Outputval,
            .parents = &[_]*const ClockNode{&IC2Div},
        };
        const IC3val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC3) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const IC3: ClockNode = .{
            .name = "IC3",
            .nodetype = IC3val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC3Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC3Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC3Div: ClockNode = .{
            .name = "IC3Div",
            .nodetype = IC3Divval,
            .parents = &[_]*const ClockNode{&IC3},
        };
        const IC3Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC3Output: ClockNode = .{
            .name = "IC3Output",
            .nodetype = IC3Outputval,
            .parents = &[_]*const ClockNode{&IC3Div},
        };
        const IC4val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC4) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const IC4: ClockNode = .{
            .name = "IC4",
            .nodetype = IC4val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC4Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC4Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC4Div: ClockNode = .{
            .name = "IC4Div",
            .nodetype = IC4Divval,
            .parents = &[_]*const ClockNode{&IC4},
        };
        const IC4Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC4Output: ClockNode = .{
            .name = "IC4Output",
            .nodetype = IC4Outputval,
            .parents = &[_]*const ClockNode{&IC4Div},
        };
        const IC5val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC5) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const IC5: ClockNode = .{
            .name = "IC5",
            .nodetype = IC5val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC5Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC5Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC5Div: ClockNode = .{
            .name = "IC5Div",
            .nodetype = IC5Divval,
            .parents = &[_]*const ClockNode{&IC5},
        };
        const IC5Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC5Output: ClockNode = .{
            .name = "IC5Output",
            .nodetype = IC5Outputval,
            .parents = &[_]*const ClockNode{&IC5Div},
        };
        const IC6val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC6) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const IC6: ClockNode = .{
            .name = "IC6",
            .nodetype = IC6val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC6Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC6Div) |val| val.get() else 4,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC6Div: ClockNode = .{
            .name = "IC6Div",
            .nodetype = IC6Divval,
            .parents = &[_]*const ClockNode{&IC6},
        };
        const IC6Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC6Output: ClockNode = .{
            .name = "IC6Output",
            .nodetype = IC6Outputval,
            .parents = &[_]*const ClockNode{&IC6Div},
        };
        const IC7val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC7) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const IC7: ClockNode = .{
            .name = "IC7",
            .nodetype = IC7val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC7Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC7Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC7Div: ClockNode = .{
            .name = "IC7Div",
            .nodetype = IC7Divval,
            .parents = &[_]*const ClockNode{&IC7},
        };
        const IC7Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC7Output: ClockNode = .{
            .name = "IC7Output",
            .nodetype = IC7Outputval,
            .parents = &[_]*const ClockNode{&IC7Div},
        };
        const IC8val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC8) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const IC8: ClockNode = .{
            .name = "IC8",
            .nodetype = IC8val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC8Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC8Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC8Div: ClockNode = .{
            .name = "IC8Div",
            .nodetype = IC8Divval,
            .parents = &[_]*const ClockNode{&IC8},
        };
        const IC8Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC8Output: ClockNode = .{
            .name = "IC8Output",
            .nodetype = IC8Outputval,
            .parents = &[_]*const ClockNode{&IC8Div},
        };
        const IC9val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC9) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const IC9: ClockNode = .{
            .name = "IC9",
            .nodetype = IC9val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC9Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC9Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC9Div: ClockNode = .{
            .name = "IC9Div",
            .nodetype = IC9Divval,
            .parents = &[_]*const ClockNode{&IC9},
        };
        const IC9Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC9Output: ClockNode = .{
            .name = "IC9Output",
            .nodetype = IC9Outputval,
            .parents = &[_]*const ClockNode{&IC9Div},
        };
        const IC10val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC10) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        const IC10: ClockNode = .{
            .name = "IC10",
            .nodetype = IC10val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC10Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC10Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC10Div: ClockNode = .{
            .name = "IC10Div",
            .nodetype = IC10Divval,
            .parents = &[_]*const ClockNode{&IC10},
        };
        const IC10Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC10Output: ClockNode = .{
            .name = "IC10Output",
            .nodetype = IC10Outputval,
            .parents = &[_]*const ClockNode{&IC10Div},
        };
        const IC11val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC11) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const IC11: ClockNode = .{
            .name = "IC11",
            .nodetype = IC11val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC11Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC11Div) |val| val.get() else 4,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC11Div: ClockNode = .{
            .name = "IC11Div",
            .nodetype = IC11Divval,
            .parents = &[_]*const ClockNode{&IC11},
        };
        const IC11Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC11Output: ClockNode = .{
            .name = "IC11Output",
            .nodetype = IC11Outputval,
            .parents = &[_]*const ClockNode{&IC11Div},
        };
        const IC12val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC12) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const IC12: ClockNode = .{
            .name = "IC12",
            .nodetype = IC12val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC12Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC12Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC12Div: ClockNode = .{
            .name = "IC12Div",
            .nodetype = IC12Divval,
            .parents = &[_]*const ClockNode{&IC12},
        };
        const IC12Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC12Output: ClockNode = .{
            .name = "IC12Output",
            .nodetype = IC12Outputval,
            .parents = &[_]*const ClockNode{&IC12Div},
        };
        const IC13val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC13) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const IC13: ClockNode = .{
            .name = "IC13",
            .nodetype = IC13val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC13Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC13Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC13Div: ClockNode = .{
            .name = "IC13Div",
            .nodetype = IC13Divval,
            .parents = &[_]*const ClockNode{&IC13},
        };
        const IC13Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC13Output: ClockNode = .{
            .name = "IC13Output",
            .nodetype = IC13Outputval,
            .parents = &[_]*const ClockNode{&IC13Div},
        };
        const IC14val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC14) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const IC14: ClockNode = .{
            .name = "IC14",
            .nodetype = IC14val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC14Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC14Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC14Div: ClockNode = .{
            .name = "IC14Div",
            .nodetype = IC14Divval,
            .parents = &[_]*const ClockNode{&IC14},
        };
        const IC14Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC14Output: ClockNode = .{
            .name = "IC14Output",
            .nodetype = IC14Outputval,
            .parents = &[_]*const ClockNode{&IC14Div},
        };
        const IC15val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC15) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const IC15: ClockNode = .{
            .name = "IC15",
            .nodetype = IC15val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC15Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC15Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC15Div: ClockNode = .{
            .name = "IC15Div",
            .nodetype = IC15Divval,
            .parents = &[_]*const ClockNode{&IC15},
        };
        const IC15Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC15Output: ClockNode = .{
            .name = "IC15Output",
            .nodetype = IC15Outputval,
            .parents = &[_]*const ClockNode{&IC15Div},
        };
        const IC16val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC16) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const IC16: ClockNode = .{
            .name = "IC16",
            .nodetype = IC16val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC16Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC16Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC16Div: ClockNode = .{
            .name = "IC16Div",
            .nodetype = IC16Divval,
            .parents = &[_]*const ClockNode{&IC16},
        };
        const IC16Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC16Output: ClockNode = .{
            .name = "IC16Output",
            .nodetype = IC16Outputval,
            .parents = &[_]*const ClockNode{&IC16Div},
        };
        const IC17val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC17) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const IC17: ClockNode = .{
            .name = "IC17",
            .nodetype = IC17val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC17Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC17Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC17Div: ClockNode = .{
            .name = "IC17Div",
            .nodetype = IC17Divval,
            .parents = &[_]*const ClockNode{&IC17},
        };
        const IC17Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC17Output: ClockNode = .{
            .name = "IC17Output",
            .nodetype = IC17Outputval,
            .parents = &[_]*const ClockNode{&IC17Div},
        };
        const IC18val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC18) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const IC18: ClockNode = .{
            .name = "IC18",
            .nodetype = IC18val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC18Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC18Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC18Div: ClockNode = .{
            .name = "IC18Div",
            .nodetype = IC18Divval,
            .parents = &[_]*const ClockNode{&IC18},
        };
        const IC18Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC18Output: ClockNode = .{
            .name = "IC18Output",
            .nodetype = IC18Outputval,
            .parents = &[_]*const ClockNode{&IC18Div},
        };
        const IC19val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC19) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const IC19: ClockNode = .{
            .name = "IC19",
            .nodetype = IC19val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC19Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC19Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC19Div: ClockNode = .{
            .name = "IC19Div",
            .nodetype = IC19Divval,
            .parents = &[_]*const ClockNode{&IC19},
        };
        const IC19Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC19Output: ClockNode = .{
            .name = "IC19Output",
            .nodetype = IC19Outputval,
            .parents = &[_]*const ClockNode{&IC19Div},
        };
        const IC20val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC20) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const IC20: ClockNode = .{
            .name = "IC20",
            .nodetype = IC20val,

            .parents = &[_]*const ClockNode{
                &FOUTPOSTDIV1,
                &FOUTPOSTDIV2,
                &FOUTPOSTDIV3,
                &FOUTPOSTDIV4,
            },
        };
        const IC20Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC20Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const IC20Div: ClockNode = .{
            .name = "IC20Div",
            .nodetype = IC20Divval,
            .parents = &[_]*const ClockNode{&IC20},
        };
        const IC20Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        const IC20Output: ClockNode = .{
            .name = "IC20Output",
            .nodetype = IC20Outputval,
            .parents = &[_]*const ClockNode{&IC20Div},
        };
        const SYSAClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SYSAClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SYSAClkSource: ClockNode = .{
            .name = "SYSAClkSource",
            .nodetype = SYSAClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC1Output,
            },
        };
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .nodetype = MCOMultval,

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
        const MCODivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCODiv: ClockNode = .{
            .name = "MCODiv",
            .nodetype = MCODivval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOPinval = ClockNodeTypes{ .output = null };
        const MCOPin: ClockNode = .{
            .name = "MCOPin",
            .nodetype = MCOPinval,
            .parents = &[_]*const ClockNode{&MCODiv},
        };
        const SYSBClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SYSBClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SYSBClkSource: ClockNode = .{
            .name = "SYSBClkSource",
            .nodetype = SYSBClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC2Output,
            },
        };
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const MCO2Mult: ClockNode = .{
            .name = "MCO2Mult",
            .nodetype = MCO2Multval,

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
        const MCO2Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO2Div) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const MCO2Div: ClockNode = .{
            .name = "MCO2Div",
            .nodetype = MCO2Divval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .nodetype = MCO2Pinval,
            .parents = &[_]*const ClockNode{&MCO2Div},
        };
        const CKPERSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.CKPERSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const CKPERSource: ClockNode = .{
            .name = "CKPERSource",
            .nodetype = CKPERSourceval,

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
        const CKPERoutputval = ClockNodeTypes{ .output = null };
        const CKPERoutput: ClockNode = .{
            .name = "CKPERoutput",
            .nodetype = CKPERoutputval,
            .parents = &[_]*const ClockNode{&CKPERSource},
        };
        const SYSBCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 800000000), .min = 0 },
        };
        const SYSBCLKOutput: ClockNode = .{
            .name = "SYSBCLKOutput",
            .nodetype = SYSBCLKOutputval,
            .parents = &[_]*const ClockNode{&SYSBClkSource},
        };
        const HPREDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HPREDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        const HPREDiv: ClockNode = .{
            .name = "HPREDiv",
            .nodetype = HPREDivval,
            .parents = &[_]*const ClockNode{&SYSBCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const TIMGDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TIMGDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const TIMGDIV: ClockNode = .{
            .name = "TIMGDIV",
            .nodetype = TIMGDIVval,
            .parents = &[_]*const ClockNode{&SYSBCLKOutput},
        };
        const TIMGOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        const TIMGOutput: ClockNode = .{
            .name = "TIMGOutput",
            .nodetype = TIMGOutputval,
            .parents = &[_]*const ClockNode{&TIMGDIV},
        };
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ADCMult: ClockNode = .{
            .name = "ADCMult",
            .nodetype = ADCMultval,

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
        const ADCDIVval = ClockNodeTypes{
            .div = .{
                .value = if (config.ADCDIV) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        const ADCDIV: ClockNode = .{
            .name = "ADCDIV",
            .nodetype = ADCDIVval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 133000000), .min = 0 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .nodetype = ADCoutputval,
            .parents = &[_]*const ClockNode{&ADCDIV},
        };
        const ADFMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADFMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ADFMult: ClockNode = .{
            .name = "ADFMult",
            .nodetype = ADFMultval,

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
        const ADFoutputval = ClockNodeTypes{ .output = null };
        const ADFoutput: ClockNode = .{
            .name = "ADFoutput",
            .nodetype = ADFoutputval,
            .parents = &[_]*const ClockNode{&ADFMult},
        };
        const MDF1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MDF1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const MDF1Mult: ClockNode = .{
            .name = "MDF1Mult",
            .nodetype = MDF1Multval,

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
        const MDFoutputval = ClockNodeTypes{ .output = null };
        const MDFoutput: ClockNode = .{
            .name = "MDFoutput",
            .nodetype = MDFoutputval,
            .parents = &[_]*const ClockNode{&MDF1Mult},
        };
        const PSSIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.PSSIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const PSSIMult: ClockNode = .{
            .name = "PSSIMult",
            .nodetype = PSSIMultval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC20Output,
                &HSIDivOutput,
            },
        };
        const PSSIoutputval = ClockNodeTypes{ .output = null };
        const PSSIoutput: ClockNode = .{
            .name = "PSSIoutput",
            .nodetype = PSSIoutputval,
            .parents = &[_]*const ClockNode{&PSSIMult},
        };
        const APB1DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB1DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB1DIV: ClockNode = .{
            .name = "APB1DIV",
            .nodetype = APB1DIVval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&APB1DIV},
        };
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const FDCANMult: ClockNode = .{
            .name = "FDCANMult",
            .nodetype = FDCANMultval,

            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC19Output,
                &HSEOSC,
            },
        };
        const FDCANoutputval = ClockNodeTypes{ .output = null };
        const FDCANoutput: ClockNode = .{
            .name = "FDCANoutput",
            .nodetype = FDCANoutputval,
            .parents = &[_]*const ClockNode{&FDCANMult},
        };
        const I2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",
            .nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I2C1outputval = ClockNodeTypes{ .output = null };
        const I2C1output: ClockNode = .{
            .name = "I2C1output",
            .nodetype = I2C1outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I2C2outputval = ClockNodeTypes{ .output = null };
        const I2C2output: ClockNode = .{
            .name = "I2C2output",
            .nodetype = I2C2outputval,
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const I2C3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",
            .nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I2C3outputval = ClockNodeTypes{ .output = null };
        const I2C3output: ClockNode = .{
            .name = "I2C3output",
            .nodetype = I2C3outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2C4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I2C4Mult: ClockNode = .{
            .name = "I2C4Mult",
            .nodetype = I2C4Multval,

            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I2C4outputval = ClockNodeTypes{ .output = null };
        const I2C4output: ClockNode = .{
            .name = "I2C4output",
            .nodetype = I2C4outputval,
            .parents = &[_]*const ClockNode{&I2C4Mult},
        };
        const I3C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I3C1Mult: ClockNode = .{
            .name = "I3C1Mult",
            .nodetype = I3C1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I3C1outputval = ClockNodeTypes{ .output = null };
        const I3C1output: ClockNode = .{
            .name = "I3C1output",
            .nodetype = I3C1outputval,
            .parents = &[_]*const ClockNode{&I3C1Mult},
        };
        const I3C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const I3C2Mult: ClockNode = .{
            .name = "I3C2Mult",
            .nodetype = I3C2Multval,

            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC10Output,
                &IC15Output,
                &MSIRC,
                &HSIDivOutput,
            },
        };
        const I3C2outputval = ClockNodeTypes{ .output = null };
        const I3C2output: ClockNode = .{
            .name = "I3C2output",
            .nodetype = I3C2outputval,
            .parents = &[_]*const ClockNode{&I3C2Mult},
        };
        const LPTIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM1Mult: ClockNode = .{
            .name = "LPTIM1Mult",
            .nodetype = LPTIM1Multval,

            .parents = &[_]*const ClockNode{
                &APB1Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .nodetype = LPTIM1outputval,
            .parents = &[_]*const ClockNode{&LPTIM1Mult},
        };
        const APB4DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB4DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB4DIV: ClockNode = .{
            .name = "APB4DIV",
            .nodetype = APB4DIVval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB4Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        const APB4Output: ClockNode = .{
            .name = "APB4Output",
            .nodetype = APB4Outputval,
            .parents = &[_]*const ClockNode{&APB4DIV},
        };
        const LPTIM3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM3Mult: ClockNode = .{
            .name = "LPTIM3Mult",
            .nodetype = LPTIM3Multval,

            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM3outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .nodetype = LPTIM3outputval,
            .parents = &[_]*const ClockNode{&LPTIM3Mult},
        };
        const LPTIM2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM2Mult: ClockNode = .{
            .name = "LPTIM2Mult",
            .nodetype = LPTIM2Multval,

            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .nodetype = LPTIM2outputval,
            .parents = &[_]*const ClockNode{&LPTIM2Mult},
        };
        const LPTIM4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM4Mult: ClockNode = .{
            .name = "LPTIM4Mult",
            .nodetype = LPTIM4Multval,

            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM4outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const LPTIM4output: ClockNode = .{
            .name = "LPTIM4output",
            .nodetype = LPTIM4outputval,
            .parents = &[_]*const ClockNode{&LPTIM4Mult},
        };
        const LPTIM5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPTIM5Mult: ClockNode = .{
            .name = "LPTIM5Mult",
            .nodetype = LPTIM5Multval,

            .parents = &[_]*const ClockNode{
                &APB4Output,
                &CKPERoutput,
                &IC15Output,
                &LSEOSC,
                &LSIRC,
                &TIMGOutput,
            },
        };
        const LPTIM5outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const LPTIM5output: ClockNode = .{
            .name = "LPTIM5output",
            .nodetype = LPTIM5outputval,
            .parents = &[_]*const ClockNode{&LPTIM5Mult},
        };
        const APB5DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB5DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB5DIV: ClockNode = .{
            .name = "APB5DIV",
            .nodetype = APB5DIVval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB5Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        const APB5Output: ClockNode = .{
            .name = "APB5Output",
            .nodetype = APB5Outputval,
            .parents = &[_]*const ClockNode{&APB5DIV},
        };
        const LTDCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LTDCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LTDCMult: ClockNode = .{
            .name = "LTDCMult",
            .nodetype = LTDCMultval,

            .parents = &[_]*const ClockNode{
                &APB5Output,
                &CKPERoutput,
                &IC16Output,
                &HSIDivOutput,
            },
        };
        const LTDCoutputval = ClockNodeTypes{ .output = null };
        const LTDCoutput: ClockNode = .{
            .name = "LTDCoutput",
            .nodetype = LTDCoutputval,
            .parents = &[_]*const ClockNode{&LTDCMult},
        };
        const DCMIPPMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DCMIPPMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const DCMIPPMult: ClockNode = .{
            .name = "DCMIPPMult",
            .nodetype = DCMIPPMultval,

            .parents = &[_]*const ClockNode{
                &APB5Output,
                &CKPERoutput,
                &IC17Output,
                &HSIDivOutput,
            },
        };
        const DCMIPPoutputval = ClockNodeTypes{ .output = null };
        const DCMIPPoutput: ClockNode = .{
            .name = "DCMIPPoutput",
            .nodetype = DCMIPPoutputval,
            .parents = &[_]*const ClockNode{&DCMIPPMult},
        };
        const FMCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FMCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const FMCMult: ClockNode = .{
            .name = "FMCMult",
            .nodetype = FMCMultval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC3Output,
                &IC4Output,
            },
        };
        const FMCoutputval = ClockNodeTypes{ .output = null };
        const FMCoutput: ClockNode = .{
            .name = "FMCoutput",
            .nodetype = FMCoutputval,
            .parents = &[_]*const ClockNode{&FMCMult},
        };
        const APB2DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB2DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const APB2DIV: ClockNode = .{
            .name = "APB2DIV",
            .nodetype = APB2DIVval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2DIV},
        };
        const SPDIFRX1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPDIFRX1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPDIFRX1Mult: ClockNode = .{
            .name = "SPDIFRX1Mult",
            .nodetype = SPDIFRX1Multval,

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
        const SAI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI1Mult: ClockNode = .{
            .name = "SAI1Mult",
            .nodetype = SAI1Multval,

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
        const SAI1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .nodetype = SAI1outputval,
            .parents = &[_]*const ClockNode{&SAI1Mult},
        };
        const SAI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SAI2Mult: ClockNode = .{
            .name = "SAI2Mult",
            .nodetype = SAI2Multval,

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
        const SAI2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .nodetype = SAI2outputval,
            .parents = &[_]*const ClockNode{&SAI2Mult},
        };
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .nodetype = USART1Multval,

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
        const USART1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .nodetype = USART1outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .nodetype = USART2Multval,

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
        const USART2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .nodetype = USART2outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",
            .nodetype = USART3Multval,

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
        const USART3outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .nodetype = USART3outputval,
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const UART4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",
            .nodetype = UART4Multval,

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
        const UART4outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .nodetype = UART4outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",
            .nodetype = UART5Multval,

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
        const UART5outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .nodetype = UART5outputval,
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const USART6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART6Mult: ClockNode = .{
            .name = "USART6Mult",
            .nodetype = USART6Multval,

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
        const USART6outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .nodetype = USART6outputval,
            .parents = &[_]*const ClockNode{&USART6Mult},
        };
        const UART7Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART7Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART7Mult: ClockNode = .{
            .name = "UART7Mult",
            .nodetype = UART7Multval,

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
        const UART7outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const UART7output: ClockNode = .{
            .name = "UART7output",
            .nodetype = UART7outputval,
            .parents = &[_]*const ClockNode{&UART7Mult},
        };
        const UART8Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART8Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART8Mult: ClockNode = .{
            .name = "UART8Mult",
            .nodetype = UART8Multval,

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
        const UART8outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const UART8output: ClockNode = .{
            .name = "UART8output",
            .nodetype = UART8outputval,
            .parents = &[_]*const ClockNode{&UART8Mult},
        };
        const UART9Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART9Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const UART9Mult: ClockNode = .{
            .name = "UART9Mult",
            .nodetype = UART9Multval,

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
        const UART9outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const UART9output: ClockNode = .{
            .name = "UART9output",
            .nodetype = UART9outputval,
            .parents = &[_]*const ClockNode{&UART9Mult},
        };
        const LPUART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const LPUART1Mult: ClockNode = .{
            .name = "LPUART1Mult",
            .nodetype = LPUART1Multval,

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
        const LPUART1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .nodetype = LPUART1outputval,
            .parents = &[_]*const ClockNode{&LPUART1Mult},
        };
        const USART10Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART10Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const USART10Mult: ClockNode = .{
            .name = "USART10Mult",
            .nodetype = USART10Multval,

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
        const USART10outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        const USART10output: ClockNode = .{
            .name = "USART10output",
            .nodetype = USART10outputval,
            .parents = &[_]*const ClockNode{&USART10Mult},
        };
        const SPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI1Mult: ClockNode = .{
            .name = "SPI1Mult",
            .nodetype = SPI1Multval,

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
        const SPI1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .nodetype = SPI1outputval,
            .parents = &[_]*const ClockNode{&SPI1Mult},
        };
        const SPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI2Mult: ClockNode = .{
            .name = "SPI2Mult",
            .nodetype = SPI2Multval,

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
        const SPI2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const SPI2output: ClockNode = .{
            .name = "SPI2output",
            .nodetype = SPI2outputval,
            .parents = &[_]*const ClockNode{&SPI2Mult},
        };
        const SPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI3Mult: ClockNode = .{
            .name = "SPI3Mult",
            .nodetype = SPI3Multval,

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
        const SPI3outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .nodetype = SPI3outputval,
            .parents = &[_]*const ClockNode{&SPI3Mult},
        };
        const SPI4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI4Mult: ClockNode = .{
            .name = "SPI4Mult",
            .nodetype = SPI4Multval,

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
        const SPI4outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 133000000), .min = 0 },
        };
        const SPI4output: ClockNode = .{
            .name = "SPI4output",
            .nodetype = SPI4outputval,
            .parents = &[_]*const ClockNode{&SPI4Mult},
        };
        const SPI5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI5Mult: ClockNode = .{
            .name = "SPI5Mult",
            .nodetype = SPI5Multval,

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
        const SPI5outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 133000000), .min = 0 },
        };
        const SPI5output: ClockNode = .{
            .name = "SPI5output",
            .nodetype = SPI5outputval,
            .parents = &[_]*const ClockNode{&SPI5Mult},
        };
        const SPI6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SPI6Mult: ClockNode = .{
            .name = "SPI6Mult",
            .nodetype = SPI6Multval,

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
        const SPI6outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const SPI6output: ClockNode = .{
            .name = "SPI6output",
            .nodetype = SPI6outputval,
            .parents = &[_]*const ClockNode{&SPI6Mult},
        };
        const XSPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const XSPI1Mult: ClockNode = .{
            .name = "XSPI1Mult",
            .nodetype = XSPI1Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC3Output,
                &IC4Output,
            },
        };
        const XSPI1outputval = ClockNodeTypes{ .output = null };
        const XSPI1output: ClockNode = .{
            .name = "XSPI1output",
            .nodetype = XSPI1outputval,
            .parents = &[_]*const ClockNode{&XSPI1Mult},
        };
        const XSPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const XSPI2Mult: ClockNode = .{
            .name = "XSPI2Mult",
            .nodetype = XSPI2Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC3Output,
                &IC4Output,
            },
        };
        const XSPI2outputval = ClockNodeTypes{ .output = null };
        const XSPI2output: ClockNode = .{
            .name = "XSPI2output",
            .nodetype = XSPI2outputval,
            .parents = &[_]*const ClockNode{&XSPI2Mult},
        };
        const OTGPHY1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.OTGPHY1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const OTGPHY1Mult: ClockNode = .{
            .name = "OTGPHY1Mult",
            .nodetype = OTGPHY1Multval,

            .parents = &[_]*const ClockNode{
                &HSEOSCDIV,
                &CKPERoutput,
                &IC15Output,
                &HSEDIV,
            },
        };
        const OTGPHY1outputval = ClockNodeTypes{ .output = null };
        const OTGPHY1output: ClockNode = .{
            .name = "OTGPHY1output",
            .nodetype = OTGPHY1outputval,
            .parents = &[_]*const ClockNode{&OTGPHY1Mult},
        };
        const OTGHS1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.OTGHS1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const OTGHS1Mult: ClockNode = .{
            .name = "OTGHS1Mult",
            .nodetype = OTGHS1Multval,

            .parents = &[_]*const ClockNode{
                &OTGPHY1output,
                &HSEOSCDIV,
            },
        };
        const OTGHS1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 60000000), .min = 0 },
        };
        const OTGHS1output: ClockNode = .{
            .name = "OTGHS1output",
            .nodetype = OTGHS1outputval,
            .parents = &[_]*const ClockNode{&OTGHS1Mult},
        };
        const OTGPHY2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.OTGPHY2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        const OTGPHY2Mult: ClockNode = .{
            .name = "OTGPHY2Mult",
            .nodetype = OTGPHY2Multval,

            .parents = &[_]*const ClockNode{
                &HSEOSCDIV,
                &CKPERoutput,
                &IC15Output,
                &HSEDIV,
            },
        };
        const OTGPHY2outputval = ClockNodeTypes{ .output = null };
        const OTGPHY2output: ClockNode = .{
            .name = "OTGPHY2output",
            .nodetype = OTGPHY2outputval,
            .parents = &[_]*const ClockNode{&OTGPHY2Mult},
        };
        const OTGHS2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.OTGHS2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const OTGHS2Mult: ClockNode = .{
            .name = "OTGHS2Mult",
            .nodetype = OTGHS2Multval,

            .parents = &[_]*const ClockNode{
                &OTGPHY2output,
                &HSEOSCDIV,
            },
        };
        const OTGHS2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 60000000), .min = 0 },
        };
        const OTGHS2output: ClockNode = .{
            .name = "OTGHS2output",
            .nodetype = OTGHS2outputval,
            .parents = &[_]*const ClockNode{&OTGHS2Mult},
        };
        const XSPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const XSPI3Mult: ClockNode = .{
            .name = "XSPI3Mult",
            .nodetype = XSPI3Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC3Output,
                &IC4Output,
            },
        };
        const XSPI3outputval = ClockNodeTypes{ .output = null };
        const XSPI3output: ClockNode = .{
            .name = "XSPI3output",
            .nodetype = XSPI3outputval,
            .parents = &[_]*const ClockNode{&XSPI3Mult},
        };
        const SDMMC1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMC1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SDMMC1Mult: ClockNode = .{
            .name = "SDMMC1Mult",
            .nodetype = SDMMC1Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC4Output,
                &IC5Output,
            },
        };
        const SDMMC1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 208000000), .min = 0 },
        };
        const SDMMC1output: ClockNode = .{
            .name = "SDMMC1output",
            .nodetype = SDMMC1outputval,
            .parents = &[_]*const ClockNode{&SDMMC1Mult},
        };
        const SDMMC2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMC2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SDMMC2Mult: ClockNode = .{
            .name = "SDMMC2Mult",
            .nodetype = SDMMC2Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC4Output,
                &IC5Output,
            },
        };
        const SDMMC2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 208000000), .min = 0 },
        };
        const SDMMC2output: ClockNode = .{
            .name = "SDMMC2output",
            .nodetype = SDMMC2outputval,
            .parents = &[_]*const ClockNode{&SDMMC2Mult},
        };
        const ETH1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.ETH1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const ETH1Mult: ClockNode = .{
            .name = "ETH1Mult",
            .nodetype = ETH1Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC12Output,
                &HSEOSC,
            },
        };
        const ETH1outputval = ClockNodeTypes{ .output = null };
        const ETH1output: ClockNode = .{
            .name = "ETH1output",
            .nodetype = ETH1outputval,
            .parents = &[_]*const ClockNode{&ETH1Mult},
        };
        const SPDIFRX1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        const SPDIFRX1output: ClockNode = .{
            .name = "SPDIFRX1output",
            .nodetype = SPDIFRX1outputval,
            .parents = &[_]*const ClockNode{&SPDIFRX1Mult},
        };
        const SYSCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SYSCClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SYSCClkSource: ClockNode = .{
            .name = "SYSCClkSource",
            .nodetype = SYSCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC6Output,
            },
        };
        const SYSDClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SYSDClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        const SYSDClkSource: ClockNode = .{
            .name = "SYSDClkSource",
            .nodetype = SYSDClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC11Output,
            },
        };
        const SYSCCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1000000000), .min = 0 },
        };
        const SYSCCLKOutput: ClockNode = .{
            .name = "SYSCCLKOutput",
            .nodetype = SYSCCLKOutputval,
            .parents = &[_]*const ClockNode{&SYSCClkSource},
        };
        const SYSDCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 800000000), .min = 0 },
        };
        const SYSDCLKOutput: ClockNode = .{
            .name = "SYSDCLKOutput",
            .nodetype = SYSDCLKOutputval,
            .parents = &[_]*const ClockNode{&SYSDClkSource},
        };
        const TPIUPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TPIUPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 8;
                }
            },
        } };
        const TPIUPrescaler: ClockNode = .{
            .name = "TPIUPrescaler",
            .nodetype = TPIUPrescalerval,
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const TPIUOutputval = ClockNodeTypes{ .output = null };
        const TPIUOutput: ClockNode = .{
            .name = "TPIUOutput",
            .nodetype = TPIUOutputval,
            .parents = &[_]*const ClockNode{&TPIUPrescaler},
        };
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 8;
                }
            },
        } };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const CpuClockOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 800000000), .min = 0 },
        };
        const CpuClockOutput: ClockNode = .{
            .name = "CpuClockOutput",
            .nodetype = CpuClockOutputval,
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const AXIClockOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 800000000), .min = 0 },
        };
        const AXIClockOutput: ClockNode = .{
            .name = "AXIClockOutput",
            .nodetype = AXIClockOutputval,
            .parents = &[_]*const ClockNode{&SYSBClkSource},
        };
        const PLL1FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL1FRACV) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 16777215), .min = 0 },
            },
        };
        const PLL1FRACV: ClockNode = .{
            .name = "PLL1FRACV",
            .nodetype = PLL1FRACVval,
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{
                .value = if (config.HSERTCDevisor) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 2 },
            },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",
            .nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 4000000), .min = 0 },
        };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        const RCC_TIM_G1_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_G1_PRescaler_Selection) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const RCC_TIM_G2_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_G2_PRescaler_Selection) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 127), .min = 0 },
            },
        };
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.MSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 31), .min = 0 },
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
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .RCC_TIM_G1_PRescaler_Selection = RCC_TIM_G1_PRescaler_Selectionval,
            .RCC_TIM_G2_PRescaler_Selection = RCC_TIM_G2_PRescaler_Selectionval,
            .HSICalibrationValue = HSICalibrationValueval,
            .MSICalibrationValue = MSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }
    pub fn init_runtime_tree(self: *Self, alloc: std.mem.Allocator) !void {
        self.HSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSIDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.HSIDivOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDiv,
        });
        self.HSIDiv4.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
        });
        self.UCPDOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDiv4,
        });
        self.HSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.HSEOSCDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.HSEDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.LSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.LSEOSC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.MSIRC.parents = try alloc.dupe(*const ClockNode, &.{});
        self.I2S_CKIN.parents = try alloc.dupe(*const ClockNode, &.{});
        self.IC1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC1Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC1,
        });
        self.IC1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC1Div,
        });
        self.IC2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC2Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC2,
        });
        self.IC2Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC2Div,
        });
        self.IC3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC3Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC3,
        });
        self.IC3Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC3Div,
        });
        self.IC4.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC4Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC4,
        });
        self.IC4Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC4Div,
        });
        self.IC5.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC5Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC5,
        });
        self.IC5Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC5Div,
        });
        self.IC6.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC6Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC6,
        });
        self.IC6Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC6Div,
        });
        self.IC7.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC7Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC7,
        });
        self.IC7Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC7Div,
        });
        self.IC8.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC8Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC8,
        });
        self.IC8Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC8Div,
        });
        self.IC9.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC9Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC9,
        });
        self.IC9Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC9Div,
        });
        self.IC10.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC10Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC10,
        });
        self.IC10Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC10Div,
        });
        self.IC11.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC11Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC11,
        });
        self.IC11Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC11Div,
        });
        self.IC12.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC12Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC12,
        });
        self.IC12Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC12Div,
        });
        self.IC13.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC13Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC13,
        });
        self.IC13Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC13Div,
        });
        self.IC14.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC14Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC14,
        });
        self.IC14Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC14Div,
        });
        self.IC15.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC15Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC15,
        });
        self.IC15Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC15Div,
        });
        self.IC16.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC16Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC16,
        });
        self.IC16Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC16Div,
        });
        self.IC17.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC17Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC17,
        });
        self.IC17Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC17Div,
        });
        self.IC18.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC18Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC18,
        });
        self.IC18Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC18Div,
        });
        self.IC19.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC19Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC19,
        });
        self.IC19Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC19Div,
        });
        self.IC20.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FOUTPOSTDIV1,
            &self.FOUTPOSTDIV2,
            &self.FOUTPOSTDIV3,
            &self.FOUTPOSTDIV4,
        });
        self.IC20Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC20,
        });
        self.IC20Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.IC20Div,
        });
        self.MCOMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDivOutput,
            &self.LSEOSC,
            &self.MSIRC,
            &self.LSIRC,
            &self.HSEOSC,
            &self.IC5Output,
            &self.IC10Output,
            &self.SYSAClkSource,
        });
        self.MCODiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCOMult,
        });
        self.MCOPin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCODiv,
        });
        self.MCO2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIDivOutput,
            &self.LSEOSC,
            &self.MSIRC,
            &self.LSIRC,
            &self.HSEOSC,
            &self.IC5Output,
            &self.IC10Output,
            &self.SYSBClkSource,
        });
        self.MCO2Div.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Mult,
        });
        self.MCO2Pin.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MCO2Div,
        });
        self.CKPERSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.IC5Output,
            &self.IC10Output,
            &self.IC15Output,
            &self.IC19Output,
            &self.IC20Output,
        });
        self.CKPERoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CKPERSource,
        });
        self.ADCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC7Output,
            &self.IC8Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
            &self.TIMGOutput,
        });
        self.ADCDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADCMult,
        });
        self.ADCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADCDIV,
        });
        self.ADFMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC7Output,
            &self.IC8Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
            &self.TIMGOutput,
        });
        self.ADFoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ADFMult,
        });
        self.MDF1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC7Output,
            &self.IC8Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
            &self.TIMGOutput,
        });
        self.MDFoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.MDF1Mult,
        });
        self.PSSIMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC20Output,
            &self.HSIDivOutput,
        });
        self.PSSIoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PSSIMult,
        });
        self.FDCANMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC19Output,
            &self.HSEOSC,
        });
        self.FDCANoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FDCANMult,
        });
        self.I2C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC10Output,
            &self.IC15Output,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.I2C1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C1Mult,
        });
        self.I2C2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC10Output,
            &self.IC15Output,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.I2C2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C2Mult,
        });
        self.I2C3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC10Output,
            &self.IC15Output,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.I2C3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C3Mult,
        });
        self.I2C4Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC10Output,
            &self.IC15Output,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.I2C4output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I2C4Mult,
        });
        self.I3C1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC10Output,
            &self.IC15Output,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.I3C1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I3C1Mult,
        });
        self.I3C2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC10Output,
            &self.IC15Output,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.I3C2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.I3C2Mult,
        });
        self.LPTIM1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC15Output,
            &self.LSEOSC,
            &self.LSIRC,
            &self.TIMGOutput,
        });
        self.LPTIM1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM1Mult,
        });
        self.LPTIM3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB4Output,
            &self.CKPERoutput,
            &self.IC15Output,
            &self.LSEOSC,
            &self.LSIRC,
            &self.TIMGOutput,
        });
        self.LPTIM3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM3Mult,
        });
        self.LPTIM2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB4Output,
            &self.CKPERoutput,
            &self.IC15Output,
            &self.LSEOSC,
            &self.LSIRC,
            &self.TIMGOutput,
        });
        self.LPTIM2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM2Mult,
        });
        self.LPTIM4Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB4Output,
            &self.CKPERoutput,
            &self.IC15Output,
            &self.LSEOSC,
            &self.LSIRC,
            &self.TIMGOutput,
        });
        self.LPTIM4output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM4Mult,
        });
        self.LPTIM5Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB4Output,
            &self.CKPERoutput,
            &self.IC15Output,
            &self.LSEOSC,
            &self.LSIRC,
            &self.TIMGOutput,
        });
        self.LPTIM5output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPTIM5Mult,
        });
        self.LTDCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB5Output,
            &self.CKPERoutput,
            &self.IC16Output,
            &self.HSIDivOutput,
        });
        self.LTDCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LTDCMult,
        });
        self.DCMIPPMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB5Output,
            &self.CKPERoutput,
            &self.IC17Output,
            &self.HSIDivOutput,
        });
        self.DCMIPPoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.DCMIPPMult,
        });
        self.FMCMult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC3Output,
            &self.IC4Output,
        });
        self.FMCoutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FMCMult,
        });
        self.SAI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC7Output,
            &self.IC8Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
            &self.SPDIFRX1Mult,
        });
        self.SAI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAI1Mult,
        });
        self.SAI2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC7Output,
            &self.IC8Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
            &self.SPDIFRX1Mult,
        });
        self.SAI2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SAI2Mult,
        });
        self.USART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.USART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART1Mult,
        });
        self.USART2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.USART2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART2Mult,
        });
        self.USART3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.USART3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART3Mult,
        });
        self.UART4Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.UART4output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART4Mult,
        });
        self.UART5Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.UART5output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART5Mult,
        });
        self.USART6Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.USART6output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART6Mult,
        });
        self.UART7Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.UART7output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART7Mult,
        });
        self.UART8Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.UART8output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART8Mult,
        });
        self.UART9Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.UART9output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.UART9Mult,
        });
        self.LPUART1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB4Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.LPUART1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LPUART1Mult,
        });
        self.USART10Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.LSEOSC,
            &self.MSIRC,
            &self.HSIDivOutput,
        });
        self.USART10output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.USART10Mult,
        });
        self.SPI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC8Output,
            &self.IC9Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
        });
        self.SPI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI1Mult,
        });
        self.SPI2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC8Output,
            &self.IC9Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
        });
        self.SPI2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI2Mult,
        });
        self.SPI3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC8Output,
            &self.IC9Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
        });
        self.SPI3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI3Mult,
        });
        self.SPI4Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.HSEOSC,
        });
        self.SPI4output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI4Mult,
        });
        self.SPI5Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2Output,
            &self.CKPERoutput,
            &self.IC9Output,
            &self.IC14Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.HSEOSC,
        });
        self.SPI5output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI5Mult,
        });
        self.SPI6Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB4Output,
            &self.CKPERoutput,
            &self.IC8Output,
            &self.IC9Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
        });
        self.SPI6output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPI6Mult,
        });
        self.XSPI1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC3Output,
            &self.IC4Output,
        });
        self.XSPI1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.XSPI1Mult,
        });
        self.XSPI2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC3Output,
            &self.IC4Output,
        });
        self.XSPI2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.XSPI2Mult,
        });
        self.OTGHS1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.OTGPHY1output,
            &self.HSEOSCDIV,
        });
        self.OTGHS1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.OTGHS1Mult,
        });
        self.OTGHS2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.OTGPHY2output,
            &self.HSEOSCDIV,
        });
        self.OTGHS2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.OTGHS2Mult,
        });
        self.XSPI3Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC3Output,
            &self.IC4Output,
        });
        self.XSPI3output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.XSPI3Mult,
        });
        self.OTGPHY1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSCDIV,
            &self.CKPERoutput,
            &self.IC15Output,
            &self.HSEDIV,
        });
        self.OTGPHY1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.OTGPHY1Mult,
        });
        self.OTGPHY2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSCDIV,
            &self.CKPERoutput,
            &self.IC15Output,
            &self.HSEDIV,
        });
        self.OTGPHY2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.OTGPHY2Mult,
        });
        self.SDMMC1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC4Output,
            &self.IC5Output,
        });
        self.SDMMC1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SDMMC1Mult,
        });
        self.SDMMC2Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC4Output,
            &self.IC5Output,
        });
        self.SDMMC2output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SDMMC2Mult,
        });
        self.ETH1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.AHBOutput,
            &self.CKPERoutput,
            &self.IC12Output,
            &self.HSEOSC,
        });
        self.ETH1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.ETH1Mult,
        });
        self.SPDIFRX1Mult.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1Output,
            &self.CKPERoutput,
            &self.IC7Output,
            &self.IC8Output,
            &self.MSIRC,
            &self.HSIDivOutput,
            &self.I2S_CKIN,
        });
        self.SPDIFRX1output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SPDIFRX1Mult,
        });
        self.SYSBClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.IC2Output,
        });
        self.SYSCClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.IC6Output,
        });
        self.SYSDClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.IC11Output,
        });
        self.SYSBCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSBClkSource,
        });
        self.SYSCCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSCClkSource,
        });
        self.SYSDCLKOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSDClkSource,
        });
        self.SYSAClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.IC1Output,
        });
        self.TPIUPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSAClkSource,
        });
        self.TPIUOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TPIUPrescaler,
        });
        self.CortexPrescaler.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSAClkSource,
        });
        self.CortexSysOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.CortexPrescaler,
        });
        self.CpuClockOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSAClkSource,
        });
        self.AXIClockOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSBClkSource,
        });
        self.HPREDiv.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSBCLKOutput,
        });
        self.APB4DIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HPREDiv,
        });
        self.APB4Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB4DIV,
        });
        self.APB5DIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HPREDiv,
        });
        self.APB5Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB5DIV,
            &self.LTDCMult,
            &self.DCMIPPMult,
        });
        self.TIMGDIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.SYSBCLKOutput,
        });
        self.TIMGOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.TIMGDIV,
        });
        self.APB1DIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HPREDiv,
        });
        self.AHBOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HPREDiv,
        });
        self.APB1Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB1DIV,
        });
        self.APB2DIV.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HPREDiv,
        });
        self.APB2Output.parents = try alloc.dupe(*const ClockNode, &.{
            &self.APB2DIV,
        });
        self.PLL1Source.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.I2S_CKIN,
        });
        self.FREFDIV1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL1Source,
        });
        self.PLL2Source.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.I2S_CKIN,
        });
        self.FREFDIV2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL2Source,
        });
        self.PLL3Source.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.I2S_CKIN,
        });
        self.FREFDIV3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL3Source,
        });
        self.PLL4Source.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSIRC,
            &self.MSIRC,
            &self.HSEOSC,
            &self.I2S_CKIN,
        });
        self.FREFDIV4.parents = try alloc.dupe(*const ClockNode, &.{
            &self.PLL4Source,
        });
        self.FBDIV1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FREFDIV1,
            &self.PLL1FRACV,
        });
        self.PLL1FRACV.parents = try alloc.dupe(*const ClockNode, &.{});
        self.POSTDIV1_1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FBDIV1,
        });
        self.POSTDIV2_1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.POSTDIV1_1,
        });
        self.FOUTPOSTDIV1.parents = try alloc.dupe(*const ClockNode, &.{
            &self.POSTDIV2_1,
        });
        self.FBDIV2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FREFDIV2,
            &self.PLL2FRACV,
        });
        self.PLL2FRACV.parents = try alloc.dupe(*const ClockNode, &.{});
        self.POSTDIV1_2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FBDIV2,
        });
        self.POSTDIV2_2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.POSTDIV1_2,
        });
        self.FOUTPOSTDIV2.parents = try alloc.dupe(*const ClockNode, &.{
            &self.POSTDIV2_2,
        });
        self.FBDIV3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FREFDIV3,
            &self.PLL3FRACV,
        });
        self.PLL3FRACV.parents = try alloc.dupe(*const ClockNode, &.{});
        self.POSTDIV1_3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FBDIV3,
        });
        self.POSTDIV2_3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.POSTDIV1_3,
        });
        self.FOUTPOSTDIV3.parents = try alloc.dupe(*const ClockNode, &.{
            &self.POSTDIV2_3,
        });
        self.FBDIV4.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FREFDIV4,
            &self.PLL4FRACV,
        });
        self.PLL4FRACV.parents = try alloc.dupe(*const ClockNode, &.{});
        self.POSTDIV1_4.parents = try alloc.dupe(*const ClockNode, &.{
            &self.FBDIV4,
        });
        self.POSTDIV2_4.parents = try alloc.dupe(*const ClockNode, &.{
            &self.POSTDIV1_4,
        });
        self.FOUTPOSTDIV4.parents = try alloc.dupe(*const ClockNode, &.{
            &self.POSTDIV2_4,
        });
        self.HSERTCDevisor.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSEOSC,
        });
        self.RTCClkSource.parents = try alloc.dupe(*const ClockNode, &.{
            &self.HSERTCDevisor,
            &self.LSEOSC,
            &self.LSIRC,
        });
        self.RTCOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.RTCClkSource,
        });
        self.IWDGOutput.parents = try alloc.dupe(*const ClockNode, &.{
            &self.LSIRC,
        });
    }
    pub fn deinit_runtime_tree(self: *Self, alloc: std.mem.Allocator) void {
        alloc.free(self.HSIRC.parents.?);
        alloc.free(self.HSIDiv.parents.?);
        alloc.free(self.HSIDivOutput.parents.?);
        alloc.free(self.HSIDiv4.parents.?);
        alloc.free(self.UCPDOutput.parents.?);
        alloc.free(self.HSEOSC.parents.?);
        alloc.free(self.HSEOSCDIV.parents.?);
        alloc.free(self.HSEDIV.parents.?);
        alloc.free(self.LSIRC.parents.?);
        alloc.free(self.LSEOSC.parents.?);
        alloc.free(self.MSIRC.parents.?);
        alloc.free(self.I2S_CKIN.parents.?);
        alloc.free(self.IC1.parents.?);
        alloc.free(self.IC1Div.parents.?);
        alloc.free(self.IC1Output.parents.?);
        alloc.free(self.IC2.parents.?);
        alloc.free(self.IC2Div.parents.?);
        alloc.free(self.IC2Output.parents.?);
        alloc.free(self.IC3.parents.?);
        alloc.free(self.IC3Div.parents.?);
        alloc.free(self.IC3Output.parents.?);
        alloc.free(self.IC4.parents.?);
        alloc.free(self.IC4Div.parents.?);
        alloc.free(self.IC4Output.parents.?);
        alloc.free(self.IC5.parents.?);
        alloc.free(self.IC5Div.parents.?);
        alloc.free(self.IC5Output.parents.?);
        alloc.free(self.IC6.parents.?);
        alloc.free(self.IC6Div.parents.?);
        alloc.free(self.IC6Output.parents.?);
        alloc.free(self.IC7.parents.?);
        alloc.free(self.IC7Div.parents.?);
        alloc.free(self.IC7Output.parents.?);
        alloc.free(self.IC8.parents.?);
        alloc.free(self.IC8Div.parents.?);
        alloc.free(self.IC8Output.parents.?);
        alloc.free(self.IC9.parents.?);
        alloc.free(self.IC9Div.parents.?);
        alloc.free(self.IC9Output.parents.?);
        alloc.free(self.IC10.parents.?);
        alloc.free(self.IC10Div.parents.?);
        alloc.free(self.IC10Output.parents.?);
        alloc.free(self.IC11.parents.?);
        alloc.free(self.IC11Div.parents.?);
        alloc.free(self.IC11Output.parents.?);
        alloc.free(self.IC12.parents.?);
        alloc.free(self.IC12Div.parents.?);
        alloc.free(self.IC12Output.parents.?);
        alloc.free(self.IC13.parents.?);
        alloc.free(self.IC13Div.parents.?);
        alloc.free(self.IC13Output.parents.?);
        alloc.free(self.IC14.parents.?);
        alloc.free(self.IC14Div.parents.?);
        alloc.free(self.IC14Output.parents.?);
        alloc.free(self.IC15.parents.?);
        alloc.free(self.IC15Div.parents.?);
        alloc.free(self.IC15Output.parents.?);
        alloc.free(self.IC16.parents.?);
        alloc.free(self.IC16Div.parents.?);
        alloc.free(self.IC16Output.parents.?);
        alloc.free(self.IC17.parents.?);
        alloc.free(self.IC17Div.parents.?);
        alloc.free(self.IC17Output.parents.?);
        alloc.free(self.IC18.parents.?);
        alloc.free(self.IC18Div.parents.?);
        alloc.free(self.IC18Output.parents.?);
        alloc.free(self.IC19.parents.?);
        alloc.free(self.IC19Div.parents.?);
        alloc.free(self.IC19Output.parents.?);
        alloc.free(self.IC20.parents.?);
        alloc.free(self.IC20Div.parents.?);
        alloc.free(self.IC20Output.parents.?);
        alloc.free(self.MCOMult.parents.?);
        alloc.free(self.MCODiv.parents.?);
        alloc.free(self.MCOPin.parents.?);
        alloc.free(self.MCO2Mult.parents.?);
        alloc.free(self.MCO2Div.parents.?);
        alloc.free(self.MCO2Pin.parents.?);
        alloc.free(self.CKPERSource.parents.?);
        alloc.free(self.CKPERoutput.parents.?);
        alloc.free(self.ADCMult.parents.?);
        alloc.free(self.ADCDIV.parents.?);
        alloc.free(self.ADCoutput.parents.?);
        alloc.free(self.ADFMult.parents.?);
        alloc.free(self.ADFoutput.parents.?);
        alloc.free(self.MDF1Mult.parents.?);
        alloc.free(self.MDFoutput.parents.?);
        alloc.free(self.PSSIMult.parents.?);
        alloc.free(self.PSSIoutput.parents.?);
        alloc.free(self.FDCANMult.parents.?);
        alloc.free(self.FDCANoutput.parents.?);
        alloc.free(self.I2C1Mult.parents.?);
        alloc.free(self.I2C1output.parents.?);
        alloc.free(self.I2C2Mult.parents.?);
        alloc.free(self.I2C2output.parents.?);
        alloc.free(self.I2C3Mult.parents.?);
        alloc.free(self.I2C3output.parents.?);
        alloc.free(self.I2C4Mult.parents.?);
        alloc.free(self.I2C4output.parents.?);
        alloc.free(self.I3C1Mult.parents.?);
        alloc.free(self.I3C1output.parents.?);
        alloc.free(self.I3C2Mult.parents.?);
        alloc.free(self.I3C2output.parents.?);
        alloc.free(self.LPTIM1Mult.parents.?);
        alloc.free(self.LPTIM1output.parents.?);
        alloc.free(self.LPTIM3Mult.parents.?);
        alloc.free(self.LPTIM3output.parents.?);
        alloc.free(self.LPTIM2Mult.parents.?);
        alloc.free(self.LPTIM2output.parents.?);
        alloc.free(self.LPTIM4Mult.parents.?);
        alloc.free(self.LPTIM4output.parents.?);
        alloc.free(self.LPTIM5Mult.parents.?);
        alloc.free(self.LPTIM5output.parents.?);
        alloc.free(self.LTDCMult.parents.?);
        alloc.free(self.LTDCoutput.parents.?);
        alloc.free(self.DCMIPPMult.parents.?);
        alloc.free(self.DCMIPPoutput.parents.?);
        alloc.free(self.FMCMult.parents.?);
        alloc.free(self.FMCoutput.parents.?);
        alloc.free(self.SAI1Mult.parents.?);
        alloc.free(self.SAI1output.parents.?);
        alloc.free(self.SAI2Mult.parents.?);
        alloc.free(self.SAI2output.parents.?);
        alloc.free(self.USART1Mult.parents.?);
        alloc.free(self.USART1output.parents.?);
        alloc.free(self.USART2Mult.parents.?);
        alloc.free(self.USART2output.parents.?);
        alloc.free(self.USART3Mult.parents.?);
        alloc.free(self.USART3output.parents.?);
        alloc.free(self.UART4Mult.parents.?);
        alloc.free(self.UART4output.parents.?);
        alloc.free(self.UART5Mult.parents.?);
        alloc.free(self.UART5output.parents.?);
        alloc.free(self.USART6Mult.parents.?);
        alloc.free(self.USART6output.parents.?);
        alloc.free(self.UART7Mult.parents.?);
        alloc.free(self.UART7output.parents.?);
        alloc.free(self.UART8Mult.parents.?);
        alloc.free(self.UART8output.parents.?);
        alloc.free(self.UART9Mult.parents.?);
        alloc.free(self.UART9output.parents.?);
        alloc.free(self.LPUART1Mult.parents.?);
        alloc.free(self.LPUART1output.parents.?);
        alloc.free(self.USART10Mult.parents.?);
        alloc.free(self.USART10output.parents.?);
        alloc.free(self.SPI1Mult.parents.?);
        alloc.free(self.SPI1output.parents.?);
        alloc.free(self.SPI2Mult.parents.?);
        alloc.free(self.SPI2output.parents.?);
        alloc.free(self.SPI3Mult.parents.?);
        alloc.free(self.SPI3output.parents.?);
        alloc.free(self.SPI4Mult.parents.?);
        alloc.free(self.SPI4output.parents.?);
        alloc.free(self.SPI5Mult.parents.?);
        alloc.free(self.SPI5output.parents.?);
        alloc.free(self.SPI6Mult.parents.?);
        alloc.free(self.SPI6output.parents.?);
        alloc.free(self.XSPI1Mult.parents.?);
        alloc.free(self.XSPI1output.parents.?);
        alloc.free(self.XSPI2Mult.parents.?);
        alloc.free(self.XSPI2output.parents.?);
        alloc.free(self.OTGHS1Mult.parents.?);
        alloc.free(self.OTGHS1output.parents.?);
        alloc.free(self.OTGHS2Mult.parents.?);
        alloc.free(self.OTGHS2output.parents.?);
        alloc.free(self.XSPI3Mult.parents.?);
        alloc.free(self.XSPI3output.parents.?);
        alloc.free(self.OTGPHY1Mult.parents.?);
        alloc.free(self.OTGPHY1output.parents.?);
        alloc.free(self.OTGPHY2Mult.parents.?);
        alloc.free(self.OTGPHY2output.parents.?);
        alloc.free(self.SDMMC1Mult.parents.?);
        alloc.free(self.SDMMC1output.parents.?);
        alloc.free(self.SDMMC2Mult.parents.?);
        alloc.free(self.SDMMC2output.parents.?);
        alloc.free(self.ETH1Mult.parents.?);
        alloc.free(self.ETH1output.parents.?);
        alloc.free(self.SPDIFRX1Mult.parents.?);
        alloc.free(self.SPDIFRX1output.parents.?);
        alloc.free(self.SYSBClkSource.parents.?);
        alloc.free(self.SYSCClkSource.parents.?);
        alloc.free(self.SYSDClkSource.parents.?);
        alloc.free(self.SYSBCLKOutput.parents.?);
        alloc.free(self.SYSCCLKOutput.parents.?);
        alloc.free(self.SYSDCLKOutput.parents.?);
        alloc.free(self.SYSAClkSource.parents.?);
        alloc.free(self.TPIUPrescaler.parents.?);
        alloc.free(self.TPIUOutput.parents.?);
        alloc.free(self.CortexPrescaler.parents.?);
        alloc.free(self.CortexSysOutput.parents.?);
        alloc.free(self.CpuClockOutput.parents.?);
        alloc.free(self.AXIClockOutput.parents.?);
        alloc.free(self.HPREDiv.parents.?);
        alloc.free(self.APB4DIV.parents.?);
        alloc.free(self.APB4Output.parents.?);
        alloc.free(self.APB5DIV.parents.?);
        alloc.free(self.APB5Output.parents.?);
        alloc.free(self.TIMGDIV.parents.?);
        alloc.free(self.TIMGOutput.parents.?);
        alloc.free(self.APB1DIV.parents.?);
        alloc.free(self.AHBOutput.parents.?);
        alloc.free(self.APB1Output.parents.?);
        alloc.free(self.APB2DIV.parents.?);
        alloc.free(self.APB2Output.parents.?);
        alloc.free(self.PLL1Source.parents.?);
        alloc.free(self.FREFDIV1.parents.?);
        alloc.free(self.PLL2Source.parents.?);
        alloc.free(self.FREFDIV2.parents.?);
        alloc.free(self.PLL3Source.parents.?);
        alloc.free(self.FREFDIV3.parents.?);
        alloc.free(self.PLL4Source.parents.?);
        alloc.free(self.FREFDIV4.parents.?);
        alloc.free(self.FBDIV1.parents.?);
        alloc.free(self.PLL1FRACV.parents.?);
        alloc.free(self.POSTDIV1_1.parents.?);
        alloc.free(self.POSTDIV2_1.parents.?);
        alloc.free(self.FOUTPOSTDIV1.parents.?);
        alloc.free(self.FBDIV2.parents.?);
        alloc.free(self.PLL2FRACV.parents.?);
        alloc.free(self.POSTDIV1_2.parents.?);
        alloc.free(self.POSTDIV2_2.parents.?);
        alloc.free(self.FOUTPOSTDIV2.parents.?);
        alloc.free(self.FBDIV3.parents.?);
        alloc.free(self.PLL3FRACV.parents.?);
        alloc.free(self.POSTDIV1_3.parents.?);
        alloc.free(self.POSTDIV2_3.parents.?);
        alloc.free(self.FOUTPOSTDIV3.parents.?);
        alloc.free(self.FBDIV4.parents.?);
        alloc.free(self.PLL4FRACV.parents.?);
        alloc.free(self.POSTDIV1_4.parents.?);
        alloc.free(self.POSTDIV2_4.parents.?);
        alloc.free(self.FOUTPOSTDIV4.parents.?);
        alloc.free(self.HSERTCDevisor.parents.?);
        alloc.free(self.RTCClkSource.parents.?);
        alloc.free(self.RTCOutput.parents.?);
        alloc.free(self.IWDGOutput.parents.?);
    }
    pub fn runtime_apply(self: *Self, config: Config) error{InvalidConfig}!void {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        self.HSIRC.nodetype = HSIRCval;
        const HSIDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSIDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.HSIDiv.nodetype = HSIDivval;
        const HSIDivOutputval = ClockNodeTypes{ .output = null };
        self.HSIDivOutput.nodetype = HSIDivOutputval;
        const HSIDiv4val = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSIDiv4) |val| {
                    break :inner val.get();
                } else {
                    break :inner 4;
                }
            },
        } };
        self.HSIDiv4.nodetype = HSIDiv4val;
        const UCPDOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 25000000), .min = 0 },
        };
        self.UCPDOutput.nodetype = UCPDOutputval;
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 48000000,
                .limit = .{ .max = @min(1_000_000_000, 48000000), .min = 8000000 },
            },
        };
        self.HSEOSC.nodetype = HSEOSCval;
        const HSEOSCDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEOSCDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.HSEOSCDIV.nodetype = HSEOSCDIVval;
        const HSEDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HSEDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.HSEDIV.nodetype = HSEDIVval;
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 32000 },
        };
        self.LSIRC.nodetype = LSIRCval;
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSEOSC) |val| val.get() else 32768,
                .limit = .{ .max = @min(1_000_000_000, 1000000), .min = 0 },
            },
        };
        self.LSEOSC.nodetype = LSEOSCval;
        const MSIRCval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.MSIRC) |val| {
                    break :inner val.get();
                } else {
                    break :inner 16;
                }
            },
        } };
        self.MSIRC.nodetype = MSIRCval;
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 12288000 },
        };
        self.I2S_CKIN.nodetype = I2S_CKINval;
        const PLL1Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL1Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PLL1Source.nodetype = PLL1Sourceval;
        const FREFDIV1val = ClockNodeTypes{
            .div = .{
                .value = if (config.FREFDIV1) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.FREFDIV1.nodetype = FREFDIV1val;
        const PLL1FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL1FRACV) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 16777215), .min = 0 },
            },
        };
        self.PLL1FRACV.nodetype = PLL1FRACVval;
        const FBDIV1val = ClockNodeTypes{
            .mul = .{
                .value = if (config.FBDIV1) |val| val.get() else 25,
                .limit = .{ .max = @min(1_000_000_000, 2500), .min = 10 },
            },
        };
        self.FBDIV1.nodetype = FBDIV1val;
        const POSTDIV1_1val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV1_1) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        self.POSTDIV1_1.nodetype = POSTDIV1_1val;
        const POSTDIV2_1val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV2_1) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        self.POSTDIV2_1.nodetype = POSTDIV2_1val;
        const FOUTPOSTDIV1val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 3200000000), .min = 16000000 },
        };
        self.FOUTPOSTDIV1.nodetype = FOUTPOSTDIV1val;
        const PLL2Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL2Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PLL2Source.nodetype = PLL2Sourceval;
        const FREFDIV2val = ClockNodeTypes{
            .div = .{
                .value = if (config.FREFDIV2) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.FREFDIV2.nodetype = FREFDIV2val;
        const PLL2FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL2FRACV) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 16777215), .min = 0 },
            },
        };
        self.PLL2FRACV.nodetype = PLL2FRACVval;
        const FBDIV2val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV2) |val| val.get() else 25,
                .limit = .{ .max = @min(1_000_000_000, 500), .min = 20 },
            },
        };
        self.FBDIV2.nodetype = FBDIV2val;
        const POSTDIV1_2val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV1_2) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        self.POSTDIV1_2.nodetype = POSTDIV1_2val;
        const POSTDIV2_2val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV2_2) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        self.POSTDIV2_2.nodetype = POSTDIV2_2val;
        const FOUTPOSTDIV2val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 3200000000), .min = 16000000 },
        };
        self.FOUTPOSTDIV2.nodetype = FOUTPOSTDIV2val;
        const PLL3Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL3Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PLL3Source.nodetype = PLL3Sourceval;
        const FREFDIV3val = ClockNodeTypes{
            .div = .{
                .value = if (config.FREFDIV3) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.FREFDIV3.nodetype = FREFDIV3val;
        const PLL3FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL3FRACV) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 16777215), .min = 0 },
            },
        };
        self.PLL3FRACV.nodetype = PLL3FRACVval;
        const FBDIV3val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV3) |val| val.get() else 25,
                .limit = .{ .max = @min(1_000_000_000, 500), .min = 20 },
            },
        };
        self.FBDIV3.nodetype = FBDIV3val;
        const POSTDIV1_3val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV1_3) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        self.POSTDIV1_3.nodetype = POSTDIV1_3val;
        const POSTDIV2_3val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV2_3) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        self.POSTDIV2_3.nodetype = POSTDIV2_3val;
        const FOUTPOSTDIV3val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 3200000000), .min = 16000000 },
        };
        self.FOUTPOSTDIV3.nodetype = FOUTPOSTDIV3val;
        const PLL4Sourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.PLL4Source) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PLL4Source.nodetype = PLL4Sourceval;
        const FREFDIV4val = ClockNodeTypes{
            .div = .{
                .value = if (config.FREFDIV4) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 1 },
            },
        };
        self.FREFDIV4.nodetype = FREFDIV4val;
        const PLL4FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL4FRACV) |val| val.get() else 0,
                .limit = .{ .max = @min(1_000_000_000, 16777215), .min = 0 },
            },
        };
        self.PLL4FRACV.nodetype = PLL4FRACVval;
        const FBDIV4val = ClockNodeTypes{
            .mulfrac = .{
                .value = if (config.FBDIV4) |val| val.get() else 25,
                .limit = .{ .max = @min(1_000_000_000, 500), .min = 20 },
            },
        };
        self.FBDIV4.nodetype = FBDIV4val;
        const POSTDIV1_4val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV1_4) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        self.POSTDIV1_4.nodetype = POSTDIV1_4val;
        const POSTDIV2_4val = ClockNodeTypes{
            .div = .{
                .value = if (config.POSTDIV2_4) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 7), .min = 1 },
            },
        };
        self.POSTDIV2_4.nodetype = POSTDIV2_4val;
        const FOUTPOSTDIV4val = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 3200000000), .min = 16000000 },
        };
        self.FOUTPOSTDIV4.nodetype = FOUTPOSTDIV4val;
        const IC1val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC1) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.IC1.nodetype = IC1val;
        const IC1Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC1Div) |val| val.get() else 3,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC1Div.nodetype = IC1Divval;
        const IC1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC1Output.nodetype = IC1Outputval;
        const IC2val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC2) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.IC2.nodetype = IC2val;
        const IC2Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC2Div) |val| val.get() else 4,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC2Div.nodetype = IC2Divval;
        const IC2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC2Output.nodetype = IC2Outputval;
        const IC3val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC3) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.IC3.nodetype = IC3val;
        const IC3Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC3Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC3Div.nodetype = IC3Divval;
        const IC3Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC3Output.nodetype = IC3Outputval;
        const IC4val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC4) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.IC4.nodetype = IC4val;
        const IC4Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC4Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC4Div.nodetype = IC4Divval;
        const IC4Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC4Output.nodetype = IC4Outputval;
        const IC5val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC5) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.IC5.nodetype = IC5val;
        const IC5Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC5Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC5Div.nodetype = IC5Divval;
        const IC5Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC5Output.nodetype = IC5Outputval;
        const IC6val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC6) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.IC6.nodetype = IC6val;
        const IC6Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC6Div) |val| val.get() else 4,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC6Div.nodetype = IC6Divval;
        const IC6Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC6Output.nodetype = IC6Outputval;
        const IC7val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC7) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.IC7.nodetype = IC7val;
        const IC7Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC7Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC7Div.nodetype = IC7Divval;
        const IC7Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC7Output.nodetype = IC7Outputval;
        const IC8val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC8) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.IC8.nodetype = IC8val;
        const IC8Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC8Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC8Div.nodetype = IC8Divval;
        const IC8Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC8Output.nodetype = IC8Outputval;
        const IC9val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC9) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.IC9.nodetype = IC9val;
        const IC9Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC9Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC9Div.nodetype = IC9Divval;
        const IC9Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC9Output.nodetype = IC9Outputval;
        const IC10val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC10) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        };
        self.IC10.nodetype = IC10val;
        const IC10Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC10Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC10Div.nodetype = IC10Divval;
        const IC10Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC10Output.nodetype = IC10Outputval;
        const IC11val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC11) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.IC11.nodetype = IC11val;
        const IC11Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC11Div) |val| val.get() else 4,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC11Div.nodetype = IC11Divval;
        const IC11Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC11Output.nodetype = IC11Outputval;
        const IC12val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC12) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.IC12.nodetype = IC12val;
        const IC12Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC12Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC12Div.nodetype = IC12Divval;
        const IC12Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC12Output.nodetype = IC12Outputval;
        const IC13val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC13) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.IC13.nodetype = IC13val;
        const IC13Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC13Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC13Div.nodetype = IC13Divval;
        const IC13Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC13Output.nodetype = IC13Outputval;
        const IC14val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC14) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.IC14.nodetype = IC14val;
        const IC14Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC14Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC14Div.nodetype = IC14Divval;
        const IC14Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC14Output.nodetype = IC14Outputval;
        const IC15val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC15) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.IC15.nodetype = IC15val;
        const IC15Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC15Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC15Div.nodetype = IC15Divval;
        const IC15Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC15Output.nodetype = IC15Outputval;
        const IC16val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC16) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.IC16.nodetype = IC16val;
        const IC16Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC16Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC16Div.nodetype = IC16Divval;
        const IC16Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC16Output.nodetype = IC16Outputval;
        const IC17val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC17) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.IC17.nodetype = IC17val;
        const IC17Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC17Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC17Div.nodetype = IC17Divval;
        const IC17Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC17Output.nodetype = IC17Outputval;
        const IC18val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC18) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.IC18.nodetype = IC18val;
        const IC18Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC18Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC18Div.nodetype = IC18Divval;
        const IC18Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC18Output.nodetype = IC18Outputval;
        const IC19val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC19) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.IC19.nodetype = IC19val;
        const IC19Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC19Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC19Div.nodetype = IC19Divval;
        const IC19Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC19Output.nodetype = IC19Outputval;
        const IC20val = ClockNodeTypes{
            .multi = inner: {
                if (config.IC20) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.IC20.nodetype = IC20val;
        const IC20Divval = ClockNodeTypes{
            .div = .{
                .value = if (config.IC20Div) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.IC20Div.nodetype = IC20Divval;
        const IC20Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1600000000), .min = 0 },
        };
        self.IC20Output.nodetype = IC20Outputval;
        const SYSAClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SYSAClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SYSAClkSource.nodetype = SYSAClkSourceval;
        const MCOMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCOMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.MCOMult.nodetype = MCOMultval;
        const MCODivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCODiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCODiv.nodetype = MCODivval;
        const MCOPinval = ClockNodeTypes{ .output = null };
        self.MCOPin.nodetype = MCOPinval;
        const SYSBClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SYSBClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SYSBClkSource.nodetype = SYSBClkSourceval;
        const MCO2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MCO2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.MCO2Mult.nodetype = MCO2Multval;
        const MCO2Divval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.MCO2Div) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.MCO2Div.nodetype = MCO2Divval;
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        self.MCO2Pin.nodetype = MCO2Pinval;
        const CKPERSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.CKPERSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.CKPERSource.nodetype = CKPERSourceval;
        const CKPERoutputval = ClockNodeTypes{ .output = null };
        self.CKPERoutput.nodetype = CKPERoutputval;
        const SYSBCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 800000000), .min = 0 },
        };
        self.SYSBCLKOutput.nodetype = SYSBCLKOutputval;
        const HPREDivval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.HPREDiv) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        } };
        self.HPREDiv.nodetype = HPREDivval;
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        self.AHBOutput.nodetype = AHBOutputval;
        const TIMGDIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TIMGDIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.TIMGDIV.nodetype = TIMGDIVval;
        const TIMGOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        self.TIMGOutput.nodetype = TIMGOutputval;
        const ADCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ADCMult.nodetype = ADCMultval;
        const ADCDIVval = ClockNodeTypes{
            .div = .{
                .value = if (config.ADCDIV) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 256), .min = 1 },
            },
        };
        self.ADCDIV.nodetype = ADCDIVval;
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 133000000), .min = 0 },
        };
        self.ADCoutput.nodetype = ADCoutputval;
        const ADFMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.ADFMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ADFMult.nodetype = ADFMultval;
        const ADFoutputval = ClockNodeTypes{ .output = null };
        self.ADFoutput.nodetype = ADFoutputval;
        const MDF1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.MDF1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.MDF1Mult.nodetype = MDF1Multval;
        const MDFoutputval = ClockNodeTypes{ .output = null };
        self.MDFoutput.nodetype = MDFoutputval;
        const PSSIMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.PSSIMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.PSSIMult.nodetype = PSSIMultval;
        const PSSIoutputval = ClockNodeTypes{ .output = null };
        self.PSSIoutput.nodetype = PSSIoutputval;
        const APB1DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB1DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB1DIV.nodetype = APB1DIVval;
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        self.APB1Output.nodetype = APB1Outputval;
        const FDCANMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FDCANMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.FDCANMult.nodetype = FDCANMultval;
        const FDCANoutputval = ClockNodeTypes{ .output = null };
        self.FDCANoutput.nodetype = FDCANoutputval;
        const I2C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C1Mult.nodetype = I2C1Multval;
        const I2C1outputval = ClockNodeTypes{ .output = null };
        self.I2C1output.nodetype = I2C1outputval;
        const I2C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C2Mult.nodetype = I2C2Multval;
        const I2C2outputval = ClockNodeTypes{ .output = null };
        self.I2C2output.nodetype = I2C2outputval;
        const I2C3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C3Mult.nodetype = I2C3Multval;
        const I2C3outputval = ClockNodeTypes{ .output = null };
        self.I2C3output.nodetype = I2C3outputval;
        const I2C4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I2C4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I2C4Mult.nodetype = I2C4Multval;
        const I2C4outputval = ClockNodeTypes{ .output = null };
        self.I2C4output.nodetype = I2C4outputval;
        const I3C1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I3C1Mult.nodetype = I3C1Multval;
        const I3C1outputval = ClockNodeTypes{ .output = null };
        self.I3C1output.nodetype = I3C1outputval;
        const I3C2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.I3C2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.I3C2Mult.nodetype = I3C2Multval;
        const I3C2outputval = ClockNodeTypes{ .output = null };
        self.I3C2output.nodetype = I3C2outputval;
        const LPTIM1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM1Mult.nodetype = LPTIM1Multval;
        const LPTIM1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.LPTIM1output.nodetype = LPTIM1outputval;
        const APB4DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB4DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB4DIV.nodetype = APB4DIVval;
        const APB4Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        self.APB4Output.nodetype = APB4Outputval;
        const LPTIM3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM3Mult.nodetype = LPTIM3Multval;
        const LPTIM3outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.LPTIM3output.nodetype = LPTIM3outputval;
        const LPTIM2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM2Mult.nodetype = LPTIM2Multval;
        const LPTIM2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.LPTIM2output.nodetype = LPTIM2outputval;
        const LPTIM4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM4Mult.nodetype = LPTIM4Multval;
        const LPTIM4outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.LPTIM4output.nodetype = LPTIM4outputval;
        const LPTIM5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPTIM5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPTIM5Mult.nodetype = LPTIM5Multval;
        const LPTIM5outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.LPTIM5output.nodetype = LPTIM5outputval;
        const APB5DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB5DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB5DIV.nodetype = APB5DIVval;
        const DCMIPPMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.DCMIPPMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.DCMIPPMult.nodetype = DCMIPPMultval;
        const APB5Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        self.APB5Output.nodetype = APB5Outputval;
        const LTDCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.LTDCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LTDCMult.nodetype = LTDCMultval;
        const LTDCoutputval = ClockNodeTypes{ .output = null };
        self.LTDCoutput.nodetype = LTDCoutputval;
        const DCMIPPoutputval = ClockNodeTypes{ .output = null };
        self.DCMIPPoutput.nodetype = DCMIPPoutputval;
        const FMCMultval = ClockNodeTypes{
            .multi = inner: {
                if (config.FMCMult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.FMCMult.nodetype = FMCMultval;
        const FMCoutputval = ClockNodeTypes{ .output = null };
        self.FMCoutput.nodetype = FMCoutputval;
        const APB2DIVval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.APB2DIV) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.APB2DIV.nodetype = APB2DIVval;
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 400000000), .min = 0 },
        };
        self.APB2Output.nodetype = APB2Outputval;
        const SPDIFRX1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPDIFRX1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPDIFRX1Mult.nodetype = SPDIFRX1Multval;
        const SAI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SAI1Mult.nodetype = SAI1Multval;
        const SAI1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.SAI1output.nodetype = SAI1outputval;
        const SAI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SAI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SAI2Mult.nodetype = SAI2Multval;
        const SAI2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.SAI2output.nodetype = SAI2outputval;
        const USART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART1Mult.nodetype = USART1Multval;
        const USART1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.USART1output.nodetype = USART1outputval;
        const USART2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART2Mult.nodetype = USART2Multval;
        const USART2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.USART2output.nodetype = USART2outputval;
        const USART3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART3Mult.nodetype = USART3Multval;
        const USART3outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.USART3output.nodetype = USART3outputval;
        const UART4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.UART4Mult.nodetype = UART4Multval;
        const UART4outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.UART4output.nodetype = UART4outputval;
        const UART5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.UART5Mult.nodetype = UART5Multval;
        const UART5outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.UART5output.nodetype = UART5outputval;
        const USART6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART6Mult.nodetype = USART6Multval;
        const USART6outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.USART6output.nodetype = USART6outputval;
        const UART7Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART7Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.UART7Mult.nodetype = UART7Multval;
        const UART7outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.UART7output.nodetype = UART7outputval;
        const UART8Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART8Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.UART8Mult.nodetype = UART8Multval;
        const UART8outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.UART8output.nodetype = UART8outputval;
        const UART9Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.UART9Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.UART9Mult.nodetype = UART9Multval;
        const UART9outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.UART9output.nodetype = UART9outputval;
        const LPUART1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.LPUART1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.LPUART1Mult.nodetype = LPUART1Multval;
        const LPUART1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.LPUART1output.nodetype = LPUART1outputval;
        const USART10Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.USART10Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.USART10Mult.nodetype = USART10Multval;
        const USART10outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 100000000), .min = 0 },
        };
        self.USART10output.nodetype = USART10outputval;
        const SPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI1Mult.nodetype = SPI1Multval;
        const SPI1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.SPI1output.nodetype = SPI1outputval;
        const SPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI2Mult.nodetype = SPI2Multval;
        const SPI2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.SPI2output.nodetype = SPI2outputval;
        const SPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI3Mult.nodetype = SPI3Multval;
        const SPI3outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.SPI3output.nodetype = SPI3outputval;
        const SPI4Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI4Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI4Mult.nodetype = SPI4Multval;
        const SPI4outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 133000000), .min = 0 },
        };
        self.SPI4output.nodetype = SPI4outputval;
        const SPI5Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI5Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI5Mult.nodetype = SPI5Multval;
        const SPI5outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 133000000), .min = 0 },
        };
        self.SPI5output.nodetype = SPI5outputval;
        const SPI6Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SPI6Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SPI6Mult.nodetype = SPI6Multval;
        const SPI6outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.SPI6output.nodetype = SPI6outputval;
        const XSPI1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.XSPI1Mult.nodetype = XSPI1Multval;
        const XSPI1outputval = ClockNodeTypes{ .output = null };
        self.XSPI1output.nodetype = XSPI1outputval;
        const XSPI2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.XSPI2Mult.nodetype = XSPI2Multval;
        const XSPI2outputval = ClockNodeTypes{ .output = null };
        self.XSPI2output.nodetype = XSPI2outputval;
        const OTGPHY1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.OTGPHY1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.OTGPHY1Mult.nodetype = OTGPHY1Multval;
        const OTGPHY1outputval = ClockNodeTypes{ .output = null };
        self.OTGPHY1output.nodetype = OTGPHY1outputval;
        const OTGHS1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.OTGHS1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.OTGHS1Mult.nodetype = OTGHS1Multval;
        const OTGHS1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 60000000), .min = 0 },
        };
        self.OTGHS1output.nodetype = OTGHS1outputval;
        const OTGPHY2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.OTGPHY2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 3;
                }
            },
        };
        self.OTGPHY2Mult.nodetype = OTGPHY2Multval;
        const OTGPHY2outputval = ClockNodeTypes{ .output = null };
        self.OTGPHY2output.nodetype = OTGPHY2outputval;
        const OTGHS2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.OTGHS2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.OTGHS2Mult.nodetype = OTGHS2Multval;
        const OTGHS2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 60000000), .min = 0 },
        };
        self.OTGHS2output.nodetype = OTGHS2outputval;
        const XSPI3Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.XSPI3Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.XSPI3Mult.nodetype = XSPI3Multval;
        const XSPI3outputval = ClockNodeTypes{ .output = null };
        self.XSPI3output.nodetype = XSPI3outputval;
        const SDMMC1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMC1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SDMMC1Mult.nodetype = SDMMC1Multval;
        const SDMMC1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 208000000), .min = 0 },
        };
        self.SDMMC1output.nodetype = SDMMC1outputval;
        const SDMMC2Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.SDMMC2Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SDMMC2Mult.nodetype = SDMMC2Multval;
        const SDMMC2outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 208000000), .min = 0 },
        };
        self.SDMMC2output.nodetype = SDMMC2outputval;
        const ETH1Multval = ClockNodeTypes{
            .multi = inner: {
                if (config.ETH1Mult) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.ETH1Mult.nodetype = ETH1Multval;
        const ETH1outputval = ClockNodeTypes{ .output = null };
        self.ETH1output.nodetype = ETH1outputval;
        const SPDIFRX1outputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 200000000), .min = 0 },
        };
        self.SPDIFRX1output.nodetype = SPDIFRX1outputval;
        const SYSCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SYSCClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SYSCClkSource.nodetype = SYSCClkSourceval;
        const SYSDClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.SYSDClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 0;
                }
            },
        };
        self.SYSDClkSource.nodetype = SYSDClkSourceval;
        const SYSCCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 1000000000), .min = 0 },
        };
        self.SYSCCLKOutput.nodetype = SYSCCLKOutputval;
        const SYSDCLKOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 800000000), .min = 0 },
        };
        self.SYSDCLKOutput.nodetype = SYSDCLKOutputval;
        const TPIUPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.TPIUPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 8;
                }
            },
        } };
        self.TPIUPrescaler.nodetype = TPIUPrescalerval;
        const TPIUOutputval = ClockNodeTypes{ .output = null };
        self.TPIUOutput.nodetype = TPIUOutputval;
        const CortexPrescalerval = ClockNodeTypes{ .div = .{
            .value = inner: {
                if (config.CortexPrescaler) |val| {
                    break :inner val.get();
                } else {
                    break :inner 8;
                }
            },
        } };
        self.CortexPrescaler.nodetype = CortexPrescalerval;
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        self.CortexSysOutput.nodetype = CortexSysOutputval;
        const CpuClockOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 800000000), .min = 0 },
        };
        self.CpuClockOutput.nodetype = CpuClockOutputval;
        const AXIClockOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 800000000), .min = 0 },
        };
        self.AXIClockOutput.nodetype = AXIClockOutputval;
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{
                .value = if (config.HSERTCDevisor) |val| val.get() else 1,
                .limit = .{ .max = @min(1_000_000_000, 63), .min = 2 },
            },
        };
        self.HSERTCDevisor.nodetype = HSERTCDevisorval;
        const RTCClkSourceval = ClockNodeTypes{
            .multi = inner: {
                if (config.RTCClkSource) |val| {
                    break :inner val.get();
                } else {
                    break :inner 2;
                }
            },
        };
        self.RTCClkSource.nodetype = RTCClkSourceval;
        const RTCOutputval = ClockNodeTypes{
            .output = .{ .max = @min(1_000_000_000, 4000000), .min = 0 },
        };
        self.RTCOutput.nodetype = RTCOutputval;
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        self.IWDGOutput.nodetype = IWDGOutputval;
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSE_Timout) |val| val.get() else 100,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        self.HSE_Timout = HSE_Timoutval;
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = if (config.LSE_Timout) |val| val.get() else 5000,
                .limit = .{ .max = @min(1_000_000_000, 4294967295), .min = 1 },
            },
        };
        self.LSE_Timout = LSE_Timoutval;
        const RCC_TIM_G1_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_G1_PRescaler_Selection) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.RCC_TIM_G1_PRescaler_Selection = RCC_TIM_G1_PRescaler_Selectionval;
        const RCC_TIM_G2_PRescaler_Selectionval = ClockNodeTypes{ .source = .{
            .value = inner: {
                if (config.RCC_TIM_G2_PRescaler_Selection) |val| {
                    break :inner val.get();
                } else {
                    break :inner 1;
                }
            },
        } };
        self.RCC_TIM_G2_PRescaler_Selection = RCC_TIM_G2_PRescaler_Selectionval;
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 127), .min = 0 },
            },
        };
        self.HSICalibrationValue = HSICalibrationValueval;
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.MSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = @min(1_000_000_000, 31), .min = 0 },
            },
        };
        self.MSICalibrationValue = MSICalibrationValueval;
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
                    return error.InvalidConfig;
                } else {
                    break :inner 0;
                }
            },
        } };
        self.LSE_Drive_Capability = LSE_Drive_Capabilityval;
    }
};
