const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{ .preferred_optimize_mode = .ReleaseSafe });

    //imports
    const yaml = b.dependency("zig_yaml", .{
        .target = target,
        .optimize = optimize,
    });

    yaml.builder.debug_log_scopes = &.{"info"};

    //local data-type module
    const data_types = b.createModule(.{
        .root_source_file = b.path("src/data_types/lib.zig"),
        .target = target,
        .optimize = optimize,
    });

    //main module
    const ClockHelper = b.addModule("ClockHelper", .{
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
    });

    //examples
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
    const run_example = b.addRunArtifact(generic_example);
    const example_step = b.step("example", "Build clock tree examples");
    example_step.dependOn(&run_example.step);

    //code generation tool
    const generate_source = b.addExecutable(.{
        .name = "generate_source",
        .root_module = b.addModule(
            "generate_source",
            .{
                .target = target,
                .optimize = optimize,
                .root_source_file = b.path("src/code_gen/main.zig"),
            },
        ),
    });

    generate_source.root_module.addImport("data_types", data_types);
    const run_code_gen = b.addRunArtifact(generate_source);
    const code_gen_step = b.step("code_gen", "Generate clock tree source code");
    code_gen_step.dependOn(&run_code_gen.step);

    const run_mplx_fix = b.addSystemCommand(&.{
        "python3",
        "src/embassy-patchs/multiplexor_fix.py",
    });
    const run_match_patch = b.addSystemCommand(&.{
        "python3",
        "src/embassy-patchs/cubemx_to_embassy.py",
    });

    run_match_patch.step.dependOn(&run_mplx_fix.step);

    const patch_step = b.step("patch", "Run patch scripts to fix CubeMX data");
    patch_step.dependOn(&run_match_patch.step);
}
