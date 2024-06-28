const std = @import("std");
const MicroZig = @import("microzig/build");

pub fn build(b: *std.Build) void {
    _ = b.step("test", "Run platform agnostic unit tests");
}

fn root() []const u8 {
    return comptime (std.fs.path.dirname(@src().file) orelse ".");
}

const build_root = root();

const samd21_15_base = MicroZig.Chip{
    .cpu = MicroZig.cpus.cortex.cortex_m0plus,
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 32 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 4 * 1024 }, // Embedded SRAM
    },
};
const samd21_16_base = MicroZig.Chip{
    .cpu = MicroZig.cpus.cortex.cortex_m0plus,
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 64 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 8 * 1024 }, // Embedded SRAM
    },
};
const samd21_17_base = MicroZig.Chip{
    .cpu = MicroZig.cpus.cortex.cortex_m0plus,
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 128 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 16 * 1024 }, // Embedded SRAM
    },
};
const samd21_18_base = MicroZig.Chip{
    .cpu = MicroZig.cpus.cortex.cortex_m0plus,
    .memory_regions = &.{
        .{ .kind = .flash, .offset = 0x00000000, .length = 256 * 1024 }, // Embedded Flash
        .{ .kind = .ram, .offset = 0x20000000, .length = 32 * 1024 }, // Embedded SRAM
    },
};

fn updateStruct(base: MicroZig.Chip, per_chip_value: MicroZig.Chip) MicroZig.Chip {
    per_chip_value.cpu = base.cpu;
    per_chip_value.memory_regions = base.memory_regions;
    return per_chip_value;
}

fn getChips() []MicroZig.Target {
    var chip_list = std.ArrayList(MicroZig.Target).init(std.heap.c_allocator);
    defer chip_list.deinit();

    var dir = try std.fs.openDirAbsolute(build_root ++ "/src/chips/", .{ .iterate = true });
    var it = dir.iterate();

    while (try it.next()) |file| {
        if (file.kind != .File) {
            continue;
        }
        if (!std.mem.startsWith(u8, file.name, "ATSAMD21")) {
            continue;
        }
        if (!std.mem.endsWith(u8, file.name, ".svd")) {
            continue;
        }

        // Gets out the 15, 16, 17, or 18 that is in the chip name
        const chip_subtype = try std.fmt.parseUnsigned(u32, file.name[9..11], 10);
        const base_entry = switch (chip_subtype) {
            15 => samd21_15_base,
            16 => samd21_16_base,
            17 => samd21_17_base,
            18 => samd21_18_base,
            else => null,
        };
        if (base_entry == null) {
            continue;
        }

        _ = try chip_list.addOne(.{ .preferred_format = .elf, .chip = updateStruct(base_entry, .{
            .name = file.name[0..(file.name.len - 4)].*,
            .url = "https://www.microchip.com/en-us/product/" ++ file.name[0..11],
            .register_definition = .{ .svd = .{ .path = build_root ++ "/src/chips/" ++ file.name } },
        }) });
    }

    return try chip_list.toOwnedSlice();
}

pub const chips = struct {
    pub const atsamd51j19 = MicroZig.Target{
        .preferred_format = .elf,
        .chip = .{
            .name = "ATSAMD51J19A",
            .url = "https://www.microchip.com/en-us/product/ATSAMD51J19A",
            .cpu = MicroZig.cpus.cortex_m4,
            .register_definition = .{
                .atdf = .{ .path = build_root ++ "/src/chips/ATSAMD51J19A.atdf" },
            },
            .memory_regions = &.{
                .{ .kind = .flash, .offset = 0x00000000, .length = 512 * 1024 }, // Embedded Flash
                .{ .kind = .ram, .offset = 0x20000000, .length = 192 * 1024 }, // Embedded SRAM
                .{ .kind = .ram, .offset = 0x47000000, .length = 8 * 1024 }, // Backup SRAM
                .{ .kind = .flash, .offset = 0x00804000, .length = 512 }, // NVM User Row
            },
        },
    };
};

pub const boards = struct {
    // empty right now
};
