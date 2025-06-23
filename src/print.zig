const std = @import("std");

pub fn print_clock_configs(comptime clock: anytype) *const [10000:0]u8 {
    comptime {
        var comp_buffer: [10000:0]u8 = undefined;
        var index = 0;
        const info = @typeInfo(@TypeOf(clock));
        switch (info) {
            .@"struct" => |data| {
                for (data.fields) |conf| {
                    const value = @field(clock, conf.name) orelse continue;
                    switch (@typeInfo(@TypeOf(value))) {
                        .@"enum" => |e| {
                            if (e.is_exhaustive) {
                                const slice = std.fmt.bufPrint(comp_buffer[index..], "{s}: {s}\n", .{ conf.name, @tagName(value) }) catch unreachable;
                                index += slice.len;
                                continue;
                            }
                            const slice = std.fmt.bufPrint(comp_buffer[index..], "{s}: {d}\n", .{ conf.name, @intFromEnum(value) }) catch unreachable;
                            index += slice.len;
                        },
                        else => continue,
                    }
                }
            },
            else => {},
        }
        const final = comp_buffer;
        return &final;
    }
}
