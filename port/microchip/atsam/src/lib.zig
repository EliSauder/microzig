const std = @import("std");
const microzig = @import("microzig/build-internals");
const gen = @import("gen");

const Self = @This();

pub fn init(dep: *std.Build.Dependency) Self {
    return gen.init(dep);
}
