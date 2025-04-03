const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.createModule(.{
        .root_source_file = b.path("src/ClockNode.zig"),
        .target = target,
        .optimize = optimize,
    });

    const ClockHelper = b.addModule("ClockHelper", .{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const generic_example = b.addExecutable(.{
        .name = "generic_example",
        .root_source_file = b.path("examples/generic_example.zig"),
        .target = target,
        .optimize = optimize,
    });

    generic_example.root_module.addImport("ClockHelper", ClockHelper);

    const generic_artifact = b.addInstallArtifact(generic_example, .{});

    const example_step = b.step("example", "Build clock tree examples");
    example_step.dependOn(&generic_artifact.step);
}
