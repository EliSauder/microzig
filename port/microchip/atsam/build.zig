const std = @import("std");
// const microzig = @import("microzig/build-internals");
// .@"microzig/build-internals" = .{ .path = "../../../build-internals" },

pub fn build(b: *std.Build) void {
    const build_internals_dep = b.dependency("microzig/build-internals", .{});
    const bi_mod = build_internals_dep.module("build-internals");
    const regzdep = b.dependency("regz", .{}).module("regz");
    const uf2dep = b.dependency("uf2", .{}).module("uf2");
    bi_mod.addImport("regz", regzdep);
    bi_mod.addImport("uf2", uf2dep);

    const gen_code = b.addExecutable(.{
        .name = "gen_code",
        .root_source_file = b.path("gen/get_chips.zig"),
        .target = b.graph.host,
    });
    gen_code.root_module.addImport("microzig/build-internals", build_internals_dep.module("build-internals"));
    b.installArtifact(gen_code);

    const gen_code_step = b.addRunArtifact(gen_code);
    gen_code_step.addDirectoryArg(b.path("src/chips/"));
    const gen_code_output = gen_code_step.addOutputFileArg("gen.zig");

    const mod = b.addModule("atsam", .{
        .root_source_file = gen_code_output,
    });
}
