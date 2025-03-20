const std = @import("std");
const microzig = @import("microzig/build-internals");

const samd5__18_base = microzig.Chip{
    .name = "",
    .url = "",
    .cpu = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m4 },
        .cpu_features_add = std.Target.arm.featuresSet(&.{.vfp4d16sp}),
        .os_tag = .freestanding,
        .abi = .eabihf,
    },
    .register_definition = .{
        .atdf = "",
    },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 256 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 128 * 1024 }, // Embedded SRAM
        .{
            .kind = .private{
                .name = "Backup SRAM",
                .executable = false,
                .readable = true,
                .writeable = true,
            },
            .offset = 0x47000000,
            .length = 8 * 1024,
        },
        .{
            .kind = .private{
                .name = "NVM User Row",
                .executable = false,
                .readable = true,
                .writeable = false,
            },
            .offset = 0x00804000,
            .length = 512,
        },
    },
};

const samd5__19_base = microzig.Chip{
    .name = "",
    .url = "",
    .cpu = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m4 },
        .cpu_features_add = std.Target.arm.featuresSet(&.{.vfp4d16sp}),
        .os_tag = .freestanding,
        .abi = .eabihf,
    },
    .register_definition = .{
        .atdf = "",
    },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 512 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 256 * 1024 }, // Embedded SRAM
        .{
            .kind = .private{
                .name = "Backup SRAM",
                .executable = false,
                .readable = true,
                .writeable = true,
            },
            .offset = 0x47000000,
            .length = 8 * 1024,
        },
        .{
            .kind = .private{
                .name = "NVM User Row",
                .executable = false,
                .readable = true,
                .writeable = false,
            },
            .offset = 0x00804000,
            .length = 512,
        },
    },
};

const samd5__20_base = microzig.Chip{
    .name = "",
    .url = "",
    .cpu = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m4 },
        .cpu_features_add = std.Target.arm.featuresSet(&.{.vfp4d16sp}),
        .os_tag = .freestanding,
        .abi = .eabihf,
    },
    .register_definition = .{
        .atdf = "",
    },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 1024 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 512 * 1024 }, // Embedded SRAM
        .{
            .kind = .private{
                .name = "Backup SRAM",
                .executable = false,
                .readable = true,
                .writeable = true,
            },
            .offset = 0x47000000,
            .length = 8 * 1024,
        },
        .{
            .kind = .private{
                .name = "NVM User Row",
                .executable = false,
                .readable = true,
                .writeable = false,
            },
            .offset = 0x00804000,
            .length = 512,
        },
    },
};

const samd21_15_base = microzig.Chip{
    .name = "",
    .url = "",
    .cpu = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0plus },
        .os_tag = .freestanding,
        .abi = .eabi,
    },
    .register_definition = .{
        .atdf = "",
    },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 32 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 4 * 1024 }, // Embedded SRAM
    },
};

const samd21_16_base = microzig.Chip{
    .name = "",
    .url = "",
    .cpu = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0plus },
        .os_tag = .freestanding,
        .abi = .eabi,
    },
    .register_definition = .{
        .atdf = "",
    },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 64 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 8 * 1024 }, // Embedded SRAM
    },
};

const samd21_17_base = microzig.Chip{
    .name = "",
    .url = "",
    .cpu = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0plus },
        .os_tag = .freestanding,
        .abi = .eabi,
    },
    .register_definition = .{
        .atdf = "",
    },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 128 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 16 * 1024 }, // Embedded SRAM
    },
};

const samd21_18_base = microzig.Chip{
    .name = "",
    .url = "",
    .cpu = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0plus },
        .os_tag = .freestanding,
        .abi = .eabi,
    },
    .register_definition = .{
        .atdf = "",
    },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 256 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 32 * 1024 }, // Embedded SRAM
    },
};

pub fn main() !void {
    var arena_state = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena_state.deinit();
    const arena = arena_state.allocator();

    const args = try std.process.argsAlloc(arena);

    if (args.len != 3) {
        std.zig.fatal("wrong number of arguments", .{});
    }

    const input_folder = args[1];
    const chip_names = getChipNames(arena, input_folder);
    const chips = getTargets(chip_names);

    const output_file_path = args[2];

    var output_file = std.fs.cwd().createFile(output_file_path, .{}) catch |err| {
        std.zig.fatal("unable to open '{s}': {s}", .{ output_file_path, @errorName(err) });
    };
    defer output_file.close();

    generateFile(output_file, chips);

    return std.process.cleanExit();
}

fn generateFile(writer: anytype, chips: []const microzig.Target) !void {
    writeFileHeader(writer);
    writeLabels(writer, chips);
    writeInitFunction(writer, chips);
    writeBuildFunction(writer);
}

fn writeFileHeader(writer: anytype) !void {
    try writer.writeAll(
        \\const std = @import("std");
        \\const microzig = @import("microzig/build-internals");
        \\
        \\const Self = @This();
        \\
    );
}

fn writeLabels(writer: anytype, chips: []const microzig.Target) !void {
    try writer.writeAll("chips: struct {\n");
    for (chips) |chip| {
        writeChipLabel(writer, chip);
    }
    try writer.writeAll("},\n");

    try writer.writeAll("boards: struct {},\n");
}

fn writeChipLabel(writer: anytype, chip: microzig.Target) !void {
    try writer.writeAll("    ");
    var buf: [20]u8 = undefined;
    _ = std.ascii.lowerString(&buf, chip.chip.name);
    try writer.writeAll(buf);
    try writer.writeAll(": *const microzig.Target,\n");
}

fn writeInitFunction(writer: anytype, chips: []const microzig.Target) !void {
    try writer.writeAll(
        \\pub fn init(dep: *std.Build.Dependency) Self {
        \\    const b = dep.builder;
        \\
    );

    for (chips) |chip| {
        writeChipTarget(writer, chip);
    }
    try writer.writeAll(
        \\return .{
        \\    .chips = .{
    );
    for (chips) |chip| {
        writeChipReturn(writer, chip);
    }
    try writer.writeAll(
        \\    },
        \\    .boards = .{},
        \\};
        \\
    );
}

fn writeChipTarget(writer: anytype, chip: microzig.Target) !void {
    var buf: [20]u8 = undefined;
    _ = std.ascii.lowerString(&buf, chip.chip.name);

    writer.print(
        \\const chip_{}: microzig.Target = .{{
        \\    .dep = dep,
        \\    .preferred_binary_format = .{},
        \\    .chip = .{{
        \\        .name = "{}",
        \\        .url = "{}",
        \\        .cpu = .{{
        \\            .cpu_arch = .{},
        \\            .cpu_model = .{{ .explicit = &std.Target.arm.cpu.{} }},
        \\            .cpu_features_add = {},
        \\            .os_tag = .{},
        \\            .abi = .{},
        \\        }},
        \\        .register_definition = .{{
        \\            .atdf = "{}",
        \\        }},
        \\        .memory_regions = &.{{
        \\          {}
        \\        }},
        \\    },
        \\};
    , .{
        buf,
        std.enums.tagName(@TypeOf(chip.preferred_binary_format), chip.preferred_binary_format),
        chip.chip.name,
        chip.chip.url,
        std.enums.tagName(@TypeOf(chip.chip.cpu.cpu_arch), chip.chip.cpu.cpu_arch),
        std.enums.tagName(@TypeOf(std.Target.arm.cpu), chip.chip.cpu.cpu_model.explicit),
        generateChipFeatures(chip),
        std.enums.tagName(@TypeOf(chip.chip.cpu.os_tag), chip.chip.cpu.os_tag),
        std.enums.tagName(@TypeOf(chip.chip.cpu.abi), chip.chip.cpu.abi),
        chip.chip.register_definition.atdf,
        generateMemoryRegion(chip),
    });
}

fn generateMemoryRegion(allocator: std.mem.Allocator, chip: microzig.Target) ![]const u8 {
    var return_str: []u8 = "";

    for (chip.memory_regions) |mem_region| {
        const region_item = generateMemoryRegionItem(allocator, mem_region);
        const old_str = return_str;
        if (return_str.len == 0) {
            return_str = region_item;
            continue;
        }
        return_str = try std.mem.concat(allocator, .{ return_str, region_item });
        allocator.free(region_item);
        allocator.free(old_str);
    }

    return return_str;
}

fn generateMemoryRegionItem(allocator: std.mem.Allocator, region: microzig.MemoryRegion) ![]const u8 {
    return try std.fmt.allocPrint(allocator, ".{{ .kind = .{}, .offset = 0x{x}, .length = 0x{x} }},", .{
        std.enums.tagName(@TypeOf(region.kind), region.kind),
        region.offset,
        region.length,
    });
}

fn generateChipFeatures(allocator: std.mem.Allocator, chip: microzig.Target) []const u8 {
    const feature_set: std.Target.Cpu.Feature.Set = chip.cpu.cpu_features_add;
    const bitset = feature_set.ints;

    var features = std.ArrayList(std.Target.arm.Features).init(allocator);
    defer features.deinit();

    for (bitset, 0..) |binnum, i| {
        if (binnum == 0) {
            continue;
        }
        const base: usize = @bitSizeOf(binnum) * i;
        for (0..@bitSizeOf(binnum)) |j| {
            if (((binnum >> j) & 1) == 0) {
                continue;
            }
            const enum_num: usize = base + j;
            const feature: std.Target.arm.Feature = @enumFromInt(enum_num);
            try features.append(feature);
        }
    }

    var return_str = "std.Target.arm.featureSet(&.{";
    var is_alloc = false;

    for (features) |feature| {
        const old_return_str = return_str;
        const fmtstr = try std.fmt.allocPrint(allocator, ".{},", .{
            std.enums.tagName(@TypeOf(feature), feature),
        });
        return_str = std.mem.concat(return_str, fmtstr);
        allocator.free(fmtstr);
        if (is_alloc) {
            allocator.free(old_return_str);
        }
        is_alloc = true;
    }

    const old_return_str = return_str;
    std.mem.concat(allocator, .{ return_str, "})" });
    allocator.free(old_return_str);

    return return_str;
}

fn writeChipReturn(writer: anytype, chip: microzig.Target) !void {
    writer.writeAll(".");
    var buf: [20]u8 = undefined;
    _ = std.ascii.lowerString(&buf, chip.chip.name);
    writer.writeAll(buf);
    writer.writeAll(" = chip_");
    writer.writeAll(buf);
    writer.writeAll(".derive(.{}),\n");
}

fn writeBuildFunction(writer: anytype) !void {
    try writer.writeAll(
        \\pub fn build(b: *std.Build) void {
        \\    _ = b.step("test"), "Run platform agnostic unit tests");
        \\}
        \\
    );
}

const chip_name = struct {
    name: []const u8,
    path: []const u8,
};

fn getChipNames(allocator: std.mem.Allocator, base_path: []const u8) ![]chip_name {
    var chip_list = std.ArrayList(chip_name).init(allocator);

    var path = std.ArrayList(u8).init(std.heap.c_allocator);
    defer path.deinit();

    try path.appendSlice(base_path);
    try path.appendSlice("/src/chips");

    const path_slice = try path.toOwnedSlice();
    std.heap.c_allocator.free(path_slice);

    var dir = try std.fs.openDirAbsolute(path_slice, .{ .iterate = true });
    var it = dir.iterate();
    while (try it.next()) |file| {
        if (file.kind != .file) {
            continue;
        }
        var file_path = std.ArrayList(u8).init(allocator);

        try file_path.appendSlice(path_slice);
        try file_path.appendSlice(file.name);

        const file_path_slice = try file_path.toOwnedSlice();

        const file_name = try allocator.alloc(u8, file.name.len);
        @memcpy(file_name, file.name);

        try chip_list.append(.{
            .name = file_name,
            .path = file_path_slice,
        });
    }

    return chip_list.toOwnedSlice();
}

fn getTargets(chips: []chip_name) []microzig.Target {
    var chip_list: [chips.len]microzig.Target = undefined;

    var counter = 0;
    for (chips) |file| {
        if (!std.mem.startsWith(u8, file.name, "ATSAMD")) {
            continue;
        }
        if (!std.mem.endsWith(u8, file.name, ".atdf")) {
            continue;
        }

        // Gets out the 15, 16, 17, or 18 that is in the chip name
        const chip_subtype = try std.fmt.parseUnsigned(u32, file.name[9..11], 10);
        var base_entry: ?microzig.Chip = null;
        if (std.mem.eql(u8, file.name[6..8], "21")) {
            base_entry = switch (chip_subtype) {
                15 => samd21_15_base,
                16 => samd21_16_base,
                17 => samd21_17_base,
                18 => samd21_18_base,
                else => null,
            };
        } else if (std.mem.eql(u8, file.name[6..8], "51")) {
            base_entry = switch (chip_subtype) {
                18 => samd5__18_base,
                19 => samd5__19_base,
                20 => samd5__20_base,
                else => null,
            };
        }
        if (base_entry == null) {
            continue;
        }

        chip_list[counter] = .{
            .preferred_format = .elf,
            .chip = updateStruct(base_entry.?, .{
                .cpu = &std.Target.arm.cpu.cortex_m4,
                .name = file.name[0..(file.name.len - 4)],
                .url = "https://www.microchip.com/en-us/product/" ++ file.name[0..11],
                .register_definition = .{
                    .atdf = .{
                        .path = file.path,
                    },
                },
                .memory_regions = &.{.{
                    .kind = .flash,
                    .offset = 0,
                    .length = 0,
                }},
            }),
        };
        counter += 1;
    }

    return chip_list[0..counter];
}

fn updateStruct(base: microzig.Chip, per_chip_value: microzig.Chip) microzig.Chip {
    return microzig.Chip{
        .name = per_chip_value.name,
        .url = per_chip_value.url,
        .cpu = base.cpu,
        .memory_regions = base.memory_regions,
        .register_definition = per_chip_value.register_definition,
    };
}
