const std = @import("std");
const data_types = @import("data_types");
const MCUInfo = data_types.microzig_data.ChipFile;
const logger = std.log.scoped(.mcu_context);

embassy_targets: std.StringArrayHashMap([]const u8),
arena: std.heap.ArenaAllocator,

pub fn init(patch: []const u8, alloc: std.mem.Allocator) !@This() {
    var arena = std.heap.ArenaAllocator.init(alloc);
    errdefer arena.deinit();

    var embassy_targets = std.StringArrayHashMap([]const u8).init(arena.allocator());
    errdefer embassy_targets.deinit();

    var files_dir = try std.fs.cwd().openDir(patch, .{ .iterate = true });
    defer files_dir.close();

    var file_iter = files_dir.iterate();
    while (try file_iter.next()) |entry| {
        if (entry.kind != .file) continue;
        if (!std.mem.endsWith(u8, entry.name, ".json")) continue;

        const file = try files_dir.readFileAlloc(arena.allocator(), entry.name, (1024 * 1024));
        defer arena.allocator().free(file);

        const json: std.json.Parsed(MCUInfo) = try std.json.parseFromSlice(MCUInfo, arena.allocator(), file, .{});
        defer json.deinit();
        const mcu_info = json.value;

        const name = try arena.allocator().dupe(u8, mcu_info.name);
        // Currently there is no mechanism to verify a target's package in microzig, so only the first one is used
        const formal_name = try arena.allocator().dupe(u8, mcu_info.packages[0].name);
        try embassy_targets.put(name, formal_name);
        logger.debug("add target {s}-{s}", .{ name, formal_name });
    }
    return .{
        .arena = arena,
        .embassy_targets = embassy_targets,
    };
}

pub fn deinit(self: *const @This()) void {
    self.arena.deinit();
}
