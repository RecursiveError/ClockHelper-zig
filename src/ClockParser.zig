const std = @import("std");
const clap = @import("clap");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}).init;
    defer _ = gpa.deinit();
    const alloc = gpa.allocator();
    const params = comptime clap.parseParamsComptime(
        \\-h, --help             Display this help and exit.
        \\-i, --ioc <str>        ioc file path.
        \\-o, --out <str>        output file path.
        \\
    );

    var diag = clap.Diagnostic{};
    var res = clap.parse(clap.Help, &params, clap.parsers.default, .{
        .diagnostic = &diag,
        .allocator = alloc,
    }) catch |err| {
        diag.report(std.io.getStdErr().writer(), err) catch {};
        return;
    };
    defer res.deinit();

    if (res.args.help != 0) {
        _ = try std.io.getStdOut().write(
            \\clock_helper utility.
            \\transforms .ioc files into clock settings.
            \\
            \\usage: clock_helper -i <ioc file path> -o <output path>
            \\
        );
    } else {
        const ioc_file_name = res.args.ioc orelse {
            _ = try std.io.getStdErr().write("missing argument -i(--ioc)\n");
            return;
        };

        const out_file_name = res.args.out orelse {
            _ = try std.io.getStdErr().write("missing argument -o(--out)\n");
            return;
        };

        try parser_ioc(ioc_file_name, out_file_name, alloc);
    }
}

fn parser_ioc(ioc_path: []const u8, out_path: []const u8, alloc: std.mem.Allocator) !void {
    //check if the files are valid
    const ioc = get_ioc_file(ioc_path) catch |err| {
        try std.io.getStdErr().writer().print("fail to open IOC file: {s}, error: {s}\n", .{ ioc_path, @errorName(err) });
        return;
    };
    defer ioc.close();

    const out = get_out_file(out_path) catch |err| {
        try std.io.getStdErr().writer().print("fail to open OUT file: {s}, error: {s}\n", .{ out_path, @errorName(err) });
        return;
    };
    defer out.close();

    var arena = std.heap.ArenaAllocator.init(alloc);
    defer arena.deinit();
    const allocator = arena.allocator();
    var ioc_map = std.hash_map.StringHashMap([]const u8).init(allocator);
    defer ioc_map.deinit();

    var line_buf: [2048]u8 = undefined;
    while (true) {
        const line = ioc.reader().readUntilDelimiter(&line_buf, '\n') catch |err| {
            switch (err) {
                error.EndOfStream => break,
                else => {
                    try std.io.getStdErr().writer().print("fail to read IOC file: {s}\n", .{@errorName(err)});
                    return;
                },
            }
        };

        get_ioc_element(line, &ioc_map, allocator) catch |err| {
            try std.io.getStdErr().writer().print("unexpected error: {s}\n", .{@errorName(err)});
            return;
        };
    }

    const mcu_name = ioc_map.get("Name") orelse {
        try std.io.getStdErr().writer().print("ioc file does not have field Mcu.Name\n", .{});
        return;
    };

    try out.writer().print(
        \\const ClockHelper = @import("ClockHelper");
        \\
        \\pub const Mcu = ClockHelper.@"{s}";
        \\pub const RefConfig = Mcu.ConfigWithRef{{
        \\
    , .{mcu_name});

    var map_iter = ioc_map.iterator();
    while (true) {
        const entry = map_iter.next() orelse break;
        if (std.mem.eql(u8, entry.key_ptr.*, "Name")) continue;
        const number: ?usize = std.fmt.parseInt(usize, entry.value_ptr.*, 10) catch null;
        if (number) |num| {
            try out.writer().print(
                \\ .{s} = @intFromEnum({d}),
            , .{ entry.key_ptr.*, num });
        } else {
            try out.writer().print(
                \\ .{s} = .{s},
            , .{ entry.key_ptr.*, entry.value_ptr.* });
        }
    }

    _ = try out.write(
        \\};
        \\
        \\pub const Config = RefConfig.into_config();
        \\pub const Tree = Mcu.ClockTree.init_comptime(Config);
        \\
    );

    var ch = std.process.Child.init(&[_][]const u8{ "zig", "fmt", out_path }, allocator);
    _ = try ch.spawnAndWait();
}

fn get_ioc_file(path: []const u8) !std.fs.File {
    if (std.fs.path.isAbsolute(path)) {
        return try std.fs.openFileAbsolute(path, .{});
    }
    return try std.fs.cwd().openFile(path, .{});
}

fn get_out_file(path: []const u8) !std.fs.File {
    if (std.fs.path.isAbsolute(path)) {
        return try std.fs.createFileAbsolute(path, .{});
    }
    return try std.fs.cwd().createFile(path, .{});
}

fn get_ioc_element(line: []const u8, map: *std.hash_map.StringHashMap([]const u8), alloc: std.mem.Allocator) !void {
    var tokens = std.mem.splitAny(u8, line, ".=");

    const c_type = tokens.next() orelse return;
    const c_name = tokens.next() orelse return;
    const c_val = tokens.next() orelse return;
    if (std.mem.eql(u8, c_type, "RCC")) {
        if (check_valid_rcc(c_name)) {
            const name = try alloc.alloc(u8, c_name.len);
            const value = try alloc.alloc(u8, c_val.len);

            std.mem.copyForwards(u8, name, c_name);
            std.mem.copyForwards(u8, value, c_val);
            try map.put(name, value);
        }
    } else if (std.mem.eql(u8, c_type, "Mcu")) {
        if (check_valid_mcu(c_name)) {
            const name = try alloc.alloc(u8, c_name.len);
            const value = try alloc.alloc(u8, c_val.len);

            std.mem.copyForwards(u8, name, c_name);
            std.mem.copyForwards(u8, value, c_val);
            try map.put(name, value);
        }
    }
}

fn check_valid_rcc(name: []const u8) bool {
    const is_output = std.mem.indexOf(u8, name, "Freq");
    if (is_output) |_| return false;
    if (std.mem.eql(u8, name, "FamilyName")) return false;
    return !std.mem.eql(u8, name, "IPParameters");
}

fn check_valid_mcu(name: []const u8) bool {
    return std.mem.eql(u8, name, "Name");
}
