const std = @import("std");
const MicroZig = @import("microzig/build");

pub fn build(b: *std.Build) void {
    _ = b.step("test", "Run platform agnostic unit tests");
}

fn root() []const u8 {
    return comptime (std.fs.path.dirname(@src().file) orelse ".");
}

const build_root = root();

const listOfChips = [_][]const u8{
    "ATSAMD21E15A.atdf",
    "ATSAMD21E15B.atdf",
    "ATSAMD21E15BU.atdf",
    "ATSAMD21E15CU.atdf",
    "ATSAMD21E15L.atdf",
    "ATSAMD21E16A.atdf",
    "ATSAMD21E16B.atdf",
    "ATSAMD21E16BU.atdf",
    "ATSAMD21E16CU.atdf",
    "ATSAMD21E16L.atdf",
    "ATSAMD21E17A.atdf",
    "ATSAMD21E17D.atdf",
    "ATSAMD21E17DU.atdf",
    "ATSAMD21E17L.atdf",
    "ATSAMD21E18A.atdf",
    "ATSAMD21G15A.atdf",
    "ATSAMD21G15B.atdf",
    "ATSAMD21G15L.atdf",
    "ATSAMD21G16A.atdf",
    "ATSAMD21G16B.atdf",
    "ATSAMD21G16L.atdf",
    "ATSAMD21G17A.atdf",
    "ATSAMD21G17AU.atdf",
    "ATSAMD21G17D.atdf",
    "ATSAMD21G17L.atdf",
    "ATSAMD21G18A.atdf",
    "ATSAMD21G18AU.atdf",
    "ATSAMD21J15A.atdf",
    "ATSAMD21J15B.atdf",
    "ATSAMD21J16A.atdf",
    "ATSAMD21J16B.atdf",
    "ATSAMD21J17A.atdf",
    "ATSAMD21J17D.atdf",
    "ATSAMD21J18A.atdf",
    "ATSAMD51G18A.atdf",
    "ATSAMD51G19A.atdf",
    "ATSAMD51J18A.atdf",
    "ATSAMD51J19A.atdf",
    "ATSAMD51J20A.atdf",
    "ATSAMD51N19A.atdf",
    "ATSAMD51N20A.atdf",
    "ATSAMD51P19A.atdf",
    "ATSAMD51P20A.atdf",
};

const samd51_18_base = MicroZig.Chip{
    .name = "",
    .cpu = MicroZig.cpus.cortex_m4,
    .register_definition = .{ .atdf = .{ .path = "" } },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 256 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 128 * 1024 }, // Embedded SRAM
        .{ .kind = .ram, .offset = 0x47000000, .length = 8 * 1024 }, // Backup SRAM
    },
};

const samd51_19_base = MicroZig.Chip{
    .name = "",
    .cpu = MicroZig.cpus.cortex_m4,
    .register_definition = .{ .atdf = .{ .path = "" } },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 512 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 192 * 1024 }, // Embedded SRAM
        .{ .kind = .ram, .offset = 0x47000000, .length = 8 * 1024 }, // Backup SRAM
    },
};

const samd51_20_base = MicroZig.Chip{
    .name = "",
    .cpu = MicroZig.cpus.cortex_m4,
    .register_definition = .{ .atdf = .{ .path = "" } },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 1024 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 256 * 1024 }, // Embedded SRAM
        .{ .kind = .ram, .offset = 0x47000000, .length = 8 * 1024 }, // Backup SRAM
    },
};

const samd21_15_base = MicroZig.Chip{
    .name = "",
    .cpu = MicroZig.cpus.cortex_m0plus,
    .register_definition = .{ .atdf = .{ .path = "" } },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 32 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 4 * 1024 }, // Embedded SRAM
    },
};
const samd21_16_base = MicroZig.Chip{
    .name = "",
    .cpu = MicroZig.cpus.cortex_m0plus,
    .register_definition = .{ .atdf = .{ .path = "" } },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 64 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 8 * 1024 }, // Embedded SRAM
    },
};
const samd21_17_base = MicroZig.Chip{
    .name = "",
    .cpu = MicroZig.cpus.cortex_m0plus,
    .register_definition = .{ .atdf = .{ .path = "" } },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 128 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 16 * 1024 }, // Embedded SRAM
    },
};
const samd21_18_base = MicroZig.Chip{
    .name = "",
    .cpu = MicroZig.cpus.cortex_m0plus,
    .register_definition = .{ .atdf = .{ .path = "" } },
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 256 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 32 * 1024 }, // Embedded SRAM
    },
};

fn updateStruct(base: MicroZig.Chip, per_chip_value: MicroZig.Chip) MicroZig.Chip {
    return MicroZig.Chip{
        .name = per_chip_value.name,
        .url = per_chip_value.url,
        .cpu = base.cpu,
        .memory_regions = base.memory_regions,
        .register_definition = per_chip_value.register_definition,
    };
}

fn getChipNames() []const []const u8 {
    return listOfChips[0..];
}

// fn getChipNames() [][]const u8 {
//     var chip_list = std.ArrayList([]const u8).init(std.heap.c_allocator);
//     defer chip_list.deinit();
//
//     var dir = try std.fs.openDirAbsolute(build_root ++ "/src/chips/", .{ .iterate = true });
//     var it = dir.iterate();
//     while (try it.next()) |file| {
//            if (file.kind != .File) {
//                continue;
//            }
//         try chip_list.append(file.name);
//     }
//
//     return chip_list.toOwnedSlice();
// }

fn getTargets() []MicroZig.Target {
    const chip_names = getChipNames();
    var chip_list: [chip_names.len]MicroZig.Target = undefined;

    var counter = 0;
    for (chip_names) |file| {
        @setEvalBranchQuota(100_000);
        if (!std.mem.startsWith(u8, file, "ATSAMD")) {
            continue;
        }
        if (!std.mem.endsWith(u8, file, ".atdf")) {
            continue;
        }

        // Gets out the 15, 16, 17, or 18 that is in the chip name
        const chip_subtype = try std.fmt.parseUnsigned(u32, file[9..11], 10);
        var base_entry: ?MicroZig.Chip = null;
        if (std.mem.eql(u8, file[6..8], "21")) {
            base_entry = switch (chip_subtype) {
                15 => samd21_15_base,
                16 => samd21_16_base,
                17 => samd21_17_base,
                18 => samd21_18_base,
                else => null,
            };
        } else if (std.mem.eql(u8, file[6..8], "51")) {
            base_entry = switch (chip_subtype) {
                18 => samd51_18_base,
                19 => samd51_19_base,
                20 => samd51_20_base,
                else => null,
            };
        }
        if (base_entry == null) {
            continue;
        }

        chip_list[counter] = .{ 
            .preferred_format = .elf, 
            .chip = updateStruct(base_entry.?, .{ 
                    .cpu = MicroZig.cpus.cortex_m4, 
                    .name = file[0..(file.len - 4)], 
                    .url = "https://www.microchip.com/en-us/product/" ++ file[0..11], 
                    .register_definition = .{ .atdf = .{ .path = build_root ++ "/src/chips/" ++ file } }, 
                    .memory_regions = &.{.{ .kind = .flash, .offset = 0, .length = 0 }} 
            }) 
        };
        counter += 1;
    }

    return chip_list[0..counter];
}

fn ChipStruct() type {
    const target_list = getTargets();
    var field_list: [target_list.len]std.builtin.Type.StructField = undefined;

    for (target_list, 0..) |target, i| {
        var field_name: [target.chip.name.len:0]u8 = undefined;
        for (target.chip.name, 0..) |char, j| {
            field_name[j] = std.ascii.toLower(char);
        }
        field_list[i] = std.builtin.Type.StructField{
            .alignment = @alignOf(MicroZig.Target),
            .name = field_name[0.. :0],
            .type = MicroZig.Target,
            .default_value = &target,
            .is_comptime = false,
        };
    }

    const return_type = @Type(.{
        .Struct = .{
            .layout = .auto,
            .fields = &field_list,
            .decls = &[_]std.builtin.Type.Declaration{},
            .is_tuple = false,
        },
    });
    return return_type;
}

pub const chips = ChipStruct();

// pub const chips = struct {
//     pub const atsamd51j19 = MicroZig.Target{
//         .preferred_format = .elf,
//         .chip = .{
//             .name = "ATSAMD51J19A",
//             .url = "https://www.microchip.com/en-us/product/ATSAMD51J19A",
//             .cpu = MicroZig.cpus.cortex_m4,
//             .register_definition = .{
//                 .atdf = .{ .path = build_root ++ "/src/chips/ATSAMD51J19A.atdf" },
//             },
//             .memory_regions = &.{
//                 .{ .kind = .flash, .offset = 0x00000000, .length = 512 * 1024 }, // Embedded Flash
//                 .{ .kind = .ram, .offset = 0x20000000, .length = 192 * 1024 }, // Embedded SRAM
//                 .{ .kind = .ram, .offset = 0x47000000, .length = 8 * 1024 }, // Backup SRAM
//                 .{ .kind = .flash, .offset = 0x00804000, .length = 512 }, // NVM User Row
//             },
//         },
//     };
//     pub const atsamd21e15a = MicroZig.Target{
//         .preferred_format = .elf,
//         .chip = updateStruct(samd21_15_base, .{
//             .name = "ATSAMD21E15A",
//             .url = "https://www.microchip.com/en-us/product/ATSAMD21E15",
//             .register_definition = .{
//                 .atdf = .{ .path = build_root ++ "/src/chips/ATSAMD21E15A.atdf" },
//             },
//         }),
//     };
//     pub const atsamd21e15b = MicroZig.Target{
//         .preferred_format = .elf,
//         .chip = updateStruct(samd21_15_base, .{
//             .name = "ATSAMD21E15B",
//             .url = "https://www.microchip.com/en-us/product/ATSAMD21E15",
//             .register_definition = .{
//                 .atdf = .{ .path = build_root ++ "/src/chips/ATSAMD21E15B.atdf" },
//             },
//         }),
//     };
//     pub const atsamd21e15bu = MicroZig.Target{
//         .preferred_format = .elf,
//         .chip = updateStruct(samd21_15_base, .{
//             .name = "ATSAMD21E15BU",
//             .url = "https://www.microchip.com/en-us/product/ATSAMD21E15",
//             .register_definition = .{
//                 .atdf = .{ .path = build_root ++ "/src/chips/ATSAMD21E15BU.atdf" },
//             },
//         }),
//     };
//     pub const atsamd21e15cu = MicroZig.Target{
//         .preferred_format = .elf,
//         .chip = updateStruct(samd21_15_base, .{
//             .name = "ATSAMD21E15CU",
//             .url = "https://www.microchip.com/en-us/product/ATSAMD21E15",
//             .register_definition = .{
//                 .atdf = .{ .path = build_root ++ "/src/chips/ATSAMD21E15CU.atdf" },
//             },
//         }),
//     };
//     pub const katsamd21e15cu = MicroZig.Target{
//         .preferred_format = .elf,
//         .chip = updateStruct(samd21_15_base, .{
//             .name = "ATSAMD21E15CU",
//             .url = "https://www.microchip.com/en-us/product/ATSAMD21E15",
//             .register_definition = .{
//                 .atdf = .{ .path = build_root ++ "/src/chips/ATSAMD21E15CU.atdf" },
//             },
//         }),
//     };
// };

pub const boards = struct {
    // empty right now
};
