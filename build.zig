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
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
    });

    const ClockParser = b.addExecutable(.{
        .name = "clock_helper",
        .root_module = b.addModule(
            "clock_helper",
            .{
                .target = target,
                .optimize = optimize,
                .root_source_file = b.path("src/ClockParser.zig"),
            },
        ),
    });

    const clap = b.dependency("clap", .{});
    ClockParser.root_module.addImport("clap", clap.module("clap"));

    const helper_artifact = b.addInstallArtifact(ClockParser, .{});

    const utility_step = b.step("clock_helper", "Build clock helper utility");
    utility_step.dependOn(&helper_artifact.step);

    const generic_example = b.addExecutable(.{
        .name = "generic_example",
        .root_module = b.addModule(
            "generic_example",
            .{
                .target = target,
                .optimize = optimize,
                .root_source_file = b.path("examples/generic_example.zig"),
            },
        ),
    });
    generic_example.root_module.addImport("ClockHelper", ClockHelper);

    const generic_artifact = b.addInstallArtifact(generic_example, .{});

    const example_step = b.step("example", "Build clock tree examples");
    example_step.dependOn(&generic_artifact.step);
}
