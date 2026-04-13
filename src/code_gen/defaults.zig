const std = @import("std");

pub const DefaultToTrue = std.StaticStringMap(void).initComptime(.{
    .{ "CodegenConfigPeriph", {} },
    .{ "TIM1", {} },
    .{ "TIM15", {} },
});

pub const DefaultToFalse = std.StaticStringMap(void).initComptime(.{
    .{ "notUsed", {} },
    .{ "false", {} },
});
