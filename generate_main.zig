const std = @import("std");

pub fn main() !void {
    var arena_state = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena_state.deinit();
    const arena = arena_state.allocator();

    const cwd = std.fs.cwd();
    cwd.deleteFile("src/main.zig") catch {};
    var main_file = try cwd.createFile("src/main.zig", .{});

    var tree_dir = try cwd.openDir("src/ClockTrees", .{ .iterate = true });
    var iter = tree_dir.iterate();
    while (true) {
        const file = try iter.next();
        if (file) |entry| {
            switch (entry.kind) {
                .file => {
                    const name = entry.name;
                    if (std.mem.indexOf(u8, name, ".zig")) |_| {
                        const short_name = name[0..(name.len - 4)];
                        try main_file.writer().print("pub const @\"{s}\" = @import(\"ClockTrees/{s}\");\n\n", .{ short_name, name });
                    }
                },
                else => {},
            }
            continue;
        }
        break;
    }

    main_file.close();
    var ch = std.process.Child.init(&[_][]const u8{ "zig", "fmt", "src/main.zig" }, arena);
    _ = try ch.spawnAndWait();
}
