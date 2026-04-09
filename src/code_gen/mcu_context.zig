const std = @import("std");
const data_types = @import("data_types");
const MCUInfo = data_types.cubeMX_data.MCU_Info;
const logger = std.log.scoped(.mcu_context);

pub const MCUContext = struct {
    Arena: std.heap.ArenaAllocator,
    mcus: []const MCUInfo,
    mcu_map: std.StringHashMap(*const MCUInfo),

    pub fn init(mcu_file_dir: *std.fs.Dir, alloc: std.mem.Allocator) !MCUContext {
        var arena = std.heap.ArenaAllocator.init(alloc);
        errdefer arena.deinit();

        const mcu_list = try get_mcu_list(mcu_file_dir, arena.allocator());
        var mcu_map = std.StringHashMap(*const MCUInfo).init(arena.allocator());
        for (mcu_list) |*mcu| {
            const name = mcu.name;
            try mcu_map.put(name, mcu);
            const alias_op = std.mem.indexOf(u8, name, "(") orelse continue;
            const alias_cl = std.mem.indexOf(u8, name, ")") orelse continue;
            if ((alias_op > alias_cl) and (alias_cl > name.len)) continue;

            const prefix = name[0..alias_op];
            const postfix = name[(alias_cl + 1)..];
            var alias_iter = std.mem.splitAny(u8, name[(alias_op + 1)..alias_cl], "-_,");

            while (alias_iter.next()) |alias| {
                const new_alias_name = try std.fmt.allocPrint(arena.allocator(), "{s}{s}{s}", .{
                    prefix,
                    alias,
                    postfix,
                });
                try mcu_map.put(new_alias_name, mcu);
                logger.debug("map {s} to name: {s}{s}{s}", .{
                    name,
                    prefix,
                    alias,
                    postfix,
                });
            }
        }

        return MCUContext{
            .Arena = arena,
            .mcus = mcu_list,
            .mcu_map = mcu_map,
        };
    }

    fn get_mcu_list(mcu_file_dir: *std.fs.Dir, alloc: std.mem.Allocator) ![]const MCUInfo {
        var list = try std.ArrayList(MCUInfo).initCapacity(alloc, 1000);
        errdefer list.deinit(alloc);

        var dir_iter = mcu_file_dir.iterate();

        while (try dir_iter.next()) |entry| {
            if (entry.kind != .file) continue;
            const file = mcu_file_dir.readFileAlloc(alloc, entry.name, (1024 * 1024)) catch |err| {
                logger.warn("fail to read {s} - error {any}", .{ entry.name, err });
                continue;
            };
            defer alloc.free(file);
            const mcu_data: std.json.Parsed(MCUInfo) = std.json.parseFromSlice(MCUInfo, alloc, file, .{ .allocate = .alloc_always }) catch |err| {
                logger.warn("fail to parser {s} - error {any}", .{ entry.name, err });
                continue;
            };
            try list.append(alloc, mcu_data.value);
        }
        return try list.toOwnedSlice(alloc);
    }

    pub fn deinit(self: *const MCUContext) void {
        self.Arena.deinit();
    }
};
