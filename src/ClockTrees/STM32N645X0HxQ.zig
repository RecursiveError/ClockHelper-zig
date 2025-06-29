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
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    RCC_TIM_G1_PRescaler_Selection: ClockNodeTypes,
    RCC_TIM_G2_PRescaler_Selection: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    MSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 64000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
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
            .Nodetype = HSIDivval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const HSIDivOutputval = ClockNodeTypes{ .output = null };
        const HSIDivOutput: ClockNode = .{
            .name = "HSIDivOutput",
            .Nodetype = HSIDivOutputval,
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
            .Nodetype = HSIDiv4val,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const UCPDOutputval = ClockNodeTypes{
            .output = .{ .max = 25000000, .min = 0 },
        };
        const UCPDOutput: ClockNode = .{
            .name = "UCPDOutput",
            .Nodetype = UCPDOutputval,
            .parents = &[_]*const ClockNode{&HSIDiv4},
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = if (config.HSEOSC) |val| val.get() else 48000000,
                .limit = .{ .max = 48000000, .min = 8000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
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
            .Nodetype = HSEOSCDIVval,
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
            .Nodetype = HSEDIVval,
            .parents = &[_]*const ClockNode{&HSEOSC},
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
                    break :inner val.get();
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
            .Nodetype = PLL1Sourceval,

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
                .limit = .{ .max = 2500, .min = 10 },
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
            .Nodetype = PLL2Sourceval,

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
                .value = if (config.FBDIV2) |val| val.get() else 25,
                .limit = .{ .max = 500, .min = 20 },
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
            .Nodetype = PLL3Sourceval,

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
                .value = if (config.FBDIV3) |val| val.get() else 25,
                .limit = .{ .max = 500, .min = 20 },
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
            .Nodetype = PLL4Sourceval,

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
                .value = if (config.FBDIV4) |val| val.get() else 25,
                .limit = .{ .max = 500, .min = 20 },
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
            .Nodetype = IC1val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC1Div: ClockNode = .{
            .name = "IC1Div",
            .Nodetype = IC1Divval,
            .parents = &[_]*const ClockNode{&IC1},
        };
        const IC1Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC1Output: ClockNode = .{
            .name = "IC1Output",
            .Nodetype = IC1Outputval,
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
            .Nodetype = IC2val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC2Div: ClockNode = .{
            .name = "IC2Div",
            .Nodetype = IC2Divval,
            .parents = &[_]*const ClockNode{&IC2},
        };
        const IC2Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC2Output: ClockNode = .{
            .name = "IC2Output",
            .Nodetype = IC2Outputval,
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
            .Nodetype = IC3val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC3Div: ClockNode = .{
            .name = "IC3Div",
            .Nodetype = IC3Divval,
            .parents = &[_]*const ClockNode{&IC3},
        };
        const IC3Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC3Output: ClockNode = .{
            .name = "IC3Output",
            .Nodetype = IC3Outputval,
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
            .Nodetype = IC4val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC4Div: ClockNode = .{
            .name = "IC4Div",
            .Nodetype = IC4Divval,
            .parents = &[_]*const ClockNode{&IC4},
        };
        const IC4Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC4Output: ClockNode = .{
            .name = "IC4Output",
            .Nodetype = IC4Outputval,
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
            .Nodetype = IC5val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC5Div: ClockNode = .{
            .name = "IC5Div",
            .Nodetype = IC5Divval,
            .parents = &[_]*const ClockNode{&IC5},
        };
        const IC5Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC5Output: ClockNode = .{
            .name = "IC5Output",
            .Nodetype = IC5Outputval,
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
            .Nodetype = IC6val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC6Div: ClockNode = .{
            .name = "IC6Div",
            .Nodetype = IC6Divval,
            .parents = &[_]*const ClockNode{&IC6},
        };
        const IC6Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC6Output: ClockNode = .{
            .name = "IC6Output",
            .Nodetype = IC6Outputval,
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
            .Nodetype = IC7val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC7Div: ClockNode = .{
            .name = "IC7Div",
            .Nodetype = IC7Divval,
            .parents = &[_]*const ClockNode{&IC7},
        };
        const IC7Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC7Output: ClockNode = .{
            .name = "IC7Output",
            .Nodetype = IC7Outputval,
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
            .Nodetype = IC8val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC8Div: ClockNode = .{
            .name = "IC8Div",
            .Nodetype = IC8Divval,
            .parents = &[_]*const ClockNode{&IC8},
        };
        const IC8Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC8Output: ClockNode = .{
            .name = "IC8Output",
            .Nodetype = IC8Outputval,
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
            .Nodetype = IC9val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC9Div: ClockNode = .{
            .name = "IC9Div",
            .Nodetype = IC9Divval,
            .parents = &[_]*const ClockNode{&IC9},
        };
        const IC9Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC9Output: ClockNode = .{
            .name = "IC9Output",
            .Nodetype = IC9Outputval,
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
            .Nodetype = IC10val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC10Div: ClockNode = .{
            .name = "IC10Div",
            .Nodetype = IC10Divval,
            .parents = &[_]*const ClockNode{&IC10},
        };
        const IC10Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC10Output: ClockNode = .{
            .name = "IC10Output",
            .Nodetype = IC10Outputval,
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
            .Nodetype = IC11val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC11Div: ClockNode = .{
            .name = "IC11Div",
            .Nodetype = IC11Divval,
            .parents = &[_]*const ClockNode{&IC11},
        };
        const IC11Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC11Output: ClockNode = .{
            .name = "IC11Output",
            .Nodetype = IC11Outputval,
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
            .Nodetype = IC12val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC12Div: ClockNode = .{
            .name = "IC12Div",
            .Nodetype = IC12Divval,
            .parents = &[_]*const ClockNode{&IC12},
        };
        const IC12Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC12Output: ClockNode = .{
            .name = "IC12Output",
            .Nodetype = IC12Outputval,
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
            .Nodetype = IC13val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC13Div: ClockNode = .{
            .name = "IC13Div",
            .Nodetype = IC13Divval,
            .parents = &[_]*const ClockNode{&IC13},
        };
        const IC13Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC13Output: ClockNode = .{
            .name = "IC13Output",
            .Nodetype = IC13Outputval,
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
            .Nodetype = IC14val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC14Div: ClockNode = .{
            .name = "IC14Div",
            .Nodetype = IC14Divval,
            .parents = &[_]*const ClockNode{&IC14},
        };
        const IC14Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC14Output: ClockNode = .{
            .name = "IC14Output",
            .Nodetype = IC14Outputval,
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
            .Nodetype = IC15val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC15Div: ClockNode = .{
            .name = "IC15Div",
            .Nodetype = IC15Divval,
            .parents = &[_]*const ClockNode{&IC15},
        };
        const IC15Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC15Output: ClockNode = .{
            .name = "IC15Output",
            .Nodetype = IC15Outputval,
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
            .Nodetype = IC16val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC16Div: ClockNode = .{
            .name = "IC16Div",
            .Nodetype = IC16Divval,
            .parents = &[_]*const ClockNode{&IC16},
        };
        const IC16Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC16Output: ClockNode = .{
            .name = "IC16Output",
            .Nodetype = IC16Outputval,
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
            .Nodetype = IC17val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC17Div: ClockNode = .{
            .name = "IC17Div",
            .Nodetype = IC17Divval,
            .parents = &[_]*const ClockNode{&IC17},
        };
        const IC17Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC17Output: ClockNode = .{
            .name = "IC17Output",
            .Nodetype = IC17Outputval,
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
            .Nodetype = IC18val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC18Div: ClockNode = .{
            .name = "IC18Div",
            .Nodetype = IC18Divval,
            .parents = &[_]*const ClockNode{&IC18},
        };
        const IC18Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC18Output: ClockNode = .{
            .name = "IC18Output",
            .Nodetype = IC18Outputval,
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
            .Nodetype = IC19val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC19Div: ClockNode = .{
            .name = "IC19Div",
            .Nodetype = IC19Divval,
            .parents = &[_]*const ClockNode{&IC19},
        };
        const IC19Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC19Output: ClockNode = .{
            .name = "IC19Output",
            .Nodetype = IC19Outputval,
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
            .Nodetype = IC20val,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const IC20Div: ClockNode = .{
            .name = "IC20Div",
            .Nodetype = IC20Divval,
            .parents = &[_]*const ClockNode{&IC20},
        };
        const IC20Outputval = ClockNodeTypes{
            .output = .{ .max = 1600000000, .min = 0 },
        };
        const IC20Output: ClockNode = .{
            .name = "IC20Output",
            .Nodetype = IC20Outputval,
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
            .Nodetype = SYSAClkSourceval,

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
            .Nodetype = MCOMultval,

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
            .Nodetype = MCODivval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOPinval = ClockNodeTypes{ .output = null };
        const MCOPin: ClockNode = .{
            .name = "MCOPin",
            .Nodetype = MCOPinval,
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
            .Nodetype = SYSBClkSourceval,

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
            .Nodetype = MCO2Multval,

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
            .Nodetype = MCO2Divval,
            .parents = &[_]*const ClockNode{&MCO2Mult},
        };
        const MCO2Pinval = ClockNodeTypes{ .output = null };
        const MCO2Pin: ClockNode = .{
            .name = "MCO2Pin",
            .Nodetype = MCO2Pinval,
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
            .Nodetype = CKPERSourceval,

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
            .Nodetype = CKPERoutputval,
            .parents = &[_]*const ClockNode{&CKPERSource},
        };
        const SYSBCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 800000000, .min = 0 },
        };
        const SYSBCLKOutput: ClockNode = .{
            .name = "SYSBCLKOutput",
            .Nodetype = SYSBCLKOutputval,
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
            .Nodetype = HPREDivval,
            .parents = &[_]*const ClockNode{&SYSBCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
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
            .Nodetype = TIMGDIVval,
            .parents = &[_]*const ClockNode{&SYSBCLKOutput},
        };
        const TIMGOutputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const TIMGOutput: ClockNode = .{
            .name = "TIMGOutput",
            .Nodetype = TIMGOutputval,
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
            .Nodetype = ADCMultval,

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
                .limit = .{ .max = 256, .min = 1 },
            },
        };
        const ADCDIV: ClockNode = .{
            .name = "ADCDIV",
            .Nodetype = ADCDIVval,
            .parents = &[_]*const ClockNode{&ADCMult},
        };
        const ADCoutputval = ClockNodeTypes{
            .output = .{ .max = 133000000, .min = 0 },
        };
        const ADCoutput: ClockNode = .{
            .name = "ADCoutput",
            .Nodetype = ADCoutputval,
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
            .Nodetype = ADFMultval,

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
            .Nodetype = ADFoutputval,
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
            .Nodetype = MDF1Multval,

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
            .Nodetype = MDFoutputval,
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
            .Nodetype = PSSIMultval,

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
            .Nodetype = PSSIoutputval,
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
            .Nodetype = APB1DIVval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
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
            .Nodetype = FDCANMultval,

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
            .Nodetype = FDCANoutputval,
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
            .Nodetype = I2C1Multval,

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
            .Nodetype = I2C1outputval,
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
            .Nodetype = I2C2Multval,

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
            .Nodetype = I2C2outputval,
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
            .Nodetype = I2C3Multval,

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
            .Nodetype = I2C3outputval,
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
            .Nodetype = I2C4Multval,

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
            .Nodetype = I2C4outputval,
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
            .Nodetype = I3C1Multval,

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
            .Nodetype = I3C1outputval,
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
            .Nodetype = I3C2Multval,

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
            .Nodetype = I3C2outputval,
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
            .Nodetype = LPTIM1Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const LPTIM1output: ClockNode = .{
            .name = "LPTIM1output",
            .Nodetype = LPTIM1outputval,
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
            .Nodetype = APB4DIVval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB4Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const APB4Output: ClockNode = .{
            .name = "APB4Output",
            .Nodetype = APB4Outputval,
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
            .Nodetype = LPTIM3Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const LPTIM3output: ClockNode = .{
            .name = "LPTIM3output",
            .Nodetype = LPTIM3outputval,
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
            .Nodetype = LPTIM2Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const LPTIM2output: ClockNode = .{
            .name = "LPTIM2output",
            .Nodetype = LPTIM2outputval,
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
            .Nodetype = LPTIM4Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const LPTIM4output: ClockNode = .{
            .name = "LPTIM4output",
            .Nodetype = LPTIM4outputval,
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
            .Nodetype = LPTIM5Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const LPTIM5output: ClockNode = .{
            .name = "LPTIM5output",
            .Nodetype = LPTIM5outputval,
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
            .Nodetype = APB5DIVval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB5Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const APB5Output: ClockNode = .{
            .name = "APB5Output",
            .Nodetype = APB5Outputval,
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
            .Nodetype = LTDCMultval,

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
            .Nodetype = LTDCoutputval,
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
            .Nodetype = DCMIPPMultval,

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
            .Nodetype = DCMIPPoutputval,
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
            .Nodetype = FMCMultval,

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
            .Nodetype = FMCoutputval,
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
            .Nodetype = APB2DIVval,
            .parents = &[_]*const ClockNode{&HPREDiv},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 400000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
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
            .Nodetype = SPDIFRX1Multval,

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
            .Nodetype = SAI1Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SAI1output: ClockNode = .{
            .name = "SAI1output",
            .Nodetype = SAI1outputval,
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
            .Nodetype = SAI2Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SAI2output: ClockNode = .{
            .name = "SAI2output",
            .Nodetype = SAI2outputval,
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
            .Nodetype = USART1Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const USART1output: ClockNode = .{
            .name = "USART1output",
            .Nodetype = USART1outputval,
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
            .Nodetype = USART2Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const USART2output: ClockNode = .{
            .name = "USART2output",
            .Nodetype = USART2outputval,
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
            .Nodetype = USART3Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const USART3output: ClockNode = .{
            .name = "USART3output",
            .Nodetype = USART3outputval,
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
            .Nodetype = UART4Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const UART4output: ClockNode = .{
            .name = "UART4output",
            .Nodetype = UART4outputval,
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
            .Nodetype = UART5Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const UART5output: ClockNode = .{
            .name = "UART5output",
            .Nodetype = UART5outputval,
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
            .Nodetype = USART6Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const USART6output: ClockNode = .{
            .name = "USART6output",
            .Nodetype = USART6outputval,
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
            .Nodetype = UART7Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const UART7output: ClockNode = .{
            .name = "UART7output",
            .Nodetype = UART7outputval,
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
            .Nodetype = UART8Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const UART8output: ClockNode = .{
            .name = "UART8output",
            .Nodetype = UART8outputval,
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
            .Nodetype = UART9Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const UART9output: ClockNode = .{
            .name = "UART9output",
            .Nodetype = UART9outputval,
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
            .Nodetype = LPUART1Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const LPUART1output: ClockNode = .{
            .name = "LPUART1output",
            .Nodetype = LPUART1outputval,
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
            .Nodetype = USART10Multval,

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
            .output = .{ .max = 100000000, .min = 0 },
        };
        const USART10output: ClockNode = .{
            .name = "USART10output",
            .Nodetype = USART10outputval,
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
            .Nodetype = SPI1Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPI1output: ClockNode = .{
            .name = "SPI1output",
            .Nodetype = SPI1outputval,
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
            .Nodetype = SPI2Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPI2output: ClockNode = .{
            .name = "SPI2output",
            .Nodetype = SPI2outputval,
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
            .Nodetype = SPI3Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPI3output: ClockNode = .{
            .name = "SPI3output",
            .Nodetype = SPI3outputval,
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
            .Nodetype = SPI4Multval,

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
            .output = .{ .max = 133000000, .min = 0 },
        };
        const SPI4output: ClockNode = .{
            .name = "SPI4output",
            .Nodetype = SPI4outputval,
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
            .Nodetype = SPI5Multval,

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
            .output = .{ .max = 133000000, .min = 0 },
        };
        const SPI5output: ClockNode = .{
            .name = "SPI5output",
            .Nodetype = SPI5outputval,
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
            .Nodetype = SPI6Multval,

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
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPI6output: ClockNode = .{
            .name = "SPI6output",
            .Nodetype = SPI6outputval,
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
            .Nodetype = XSPI1Multval,

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
            .Nodetype = XSPI1outputval,
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
            .Nodetype = XSPI2Multval,

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
            .Nodetype = XSPI2outputval,
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
            .Nodetype = OTGPHY1Multval,

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
            .Nodetype = OTGPHY1outputval,
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
            .Nodetype = OTGHS1Multval,

            .parents = &[_]*const ClockNode{
                &OTGPHY1output,
                &HSEOSCDIV,
            },
        };
        const OTGHS1outputval = ClockNodeTypes{
            .output = .{ .max = 60000000, .min = 0 },
        };
        const OTGHS1output: ClockNode = .{
            .name = "OTGHS1output",
            .Nodetype = OTGHS1outputval,
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
            .Nodetype = OTGPHY2Multval,

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
            .Nodetype = OTGPHY2outputval,
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
            .Nodetype = OTGHS2Multval,

            .parents = &[_]*const ClockNode{
                &OTGPHY2output,
                &HSEOSCDIV,
            },
        };
        const OTGHS2outputval = ClockNodeTypes{
            .output = .{ .max = 60000000, .min = 0 },
        };
        const OTGHS2output: ClockNode = .{
            .name = "OTGHS2output",
            .Nodetype = OTGHS2outputval,
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
            .Nodetype = XSPI3Multval,

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
            .Nodetype = XSPI3outputval,
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
            .Nodetype = SDMMC1Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC4Output,
                &IC5Output,
            },
        };
        const SDMMC1outputval = ClockNodeTypes{
            .output = .{ .max = 208000000, .min = 0 },
        };
        const SDMMC1output: ClockNode = .{
            .name = "SDMMC1output",
            .Nodetype = SDMMC1outputval,
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
            .Nodetype = SDMMC2Multval,

            .parents = &[_]*const ClockNode{
                &AHBOutput,
                &CKPERoutput,
                &IC4Output,
                &IC5Output,
            },
        };
        const SDMMC2outputval = ClockNodeTypes{
            .output = .{ .max = 208000000, .min = 0 },
        };
        const SDMMC2output: ClockNode = .{
            .name = "SDMMC2output",
            .Nodetype = SDMMC2outputval,
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
            .Nodetype = ETH1Multval,

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
            .Nodetype = ETH1outputval,
            .parents = &[_]*const ClockNode{&ETH1Mult},
        };
        const SPDIFRX1outputval = ClockNodeTypes{
            .output = .{ .max = 200000000, .min = 0 },
        };
        const SPDIFRX1output: ClockNode = .{
            .name = "SPDIFRX1output",
            .Nodetype = SPDIFRX1outputval,
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
            .Nodetype = SYSCClkSourceval,

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
            .Nodetype = SYSDClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &MSIRC,
                &HSEOSC,
                &IC11Output,
            },
        };
        const SYSCCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 1000000000, .min = 0 },
        };
        const SYSCCLKOutput: ClockNode = .{
            .name = "SYSCCLKOutput",
            .Nodetype = SYSCCLKOutputval,
            .parents = &[_]*const ClockNode{&SYSCClkSource},
        };
        const SYSDCLKOutputval = ClockNodeTypes{
            .output = .{ .max = 800000000, .min = 0 },
        };
        const SYSDCLKOutput: ClockNode = .{
            .name = "SYSDCLKOutput",
            .Nodetype = SYSDCLKOutputval,
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
            .Nodetype = TPIUPrescalerval,
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const TPIUOutputval = ClockNodeTypes{ .output = null };
        const TPIUOutput: ClockNode = .{
            .name = "TPIUOutput",
            .Nodetype = TPIUOutputval,
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
            .Nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const CpuClockOutputval = ClockNodeTypes{
            .output = .{ .max = 800000000, .min = 0 },
        };
        const CpuClockOutput: ClockNode = .{
            .name = "CpuClockOutput",
            .Nodetype = CpuClockOutputval,
            .parents = &[_]*const ClockNode{&SYSAClkSource},
        };
        const AXIClockOutputval = ClockNodeTypes{
            .output = .{ .max = 800000000, .min = 0 },
        };
        const AXIClockOutput: ClockNode = .{
            .name = "AXIClockOutput",
            .Nodetype = AXIClockOutputval,
            .parents = &[_]*const ClockNode{&SYSBClkSource},
        };
        const PLL1FRACVval = ClockNodeTypes{
            .source = .{
                .value = if (config.PLL1FRACV) |val| val.get() else 0,
                .limit = .{ .max = 16777215, .min = 0 },
            },
        };
        const PLL1FRACV: ClockNode = .{
            .name = "PLL1FRACV",
            .Nodetype = PLL1FRACVval,
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{
                .value = if (config.HSERTCDevisor) |val| val.get() else 1,
                .limit = .{ .max = 63, .min = 2 },
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
                    break :inner val.get();
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
                .limit = .{ .max = 127, .min = 0 },
            },
        };
        const MSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = if (config.MSICalibrationValue) |val| val.get() else 16,
                .limit = .{ .max = 31, .min = 0 },
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
