const std = @import("std");
const microzig = @import("microzig/build-internals");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "gen_code",
        .root_module = exe_mod,
    });

    b.installArtifact(exe);
}
