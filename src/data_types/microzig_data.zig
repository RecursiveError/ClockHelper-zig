const std = @import("std");

pub const ChipFile = struct {
    name: []const u8,
    family: []const u8,
    line: []const u8,
    die: []const u8,
    device_id: u16,
    packages: []const Package,
    memory: []const Memory,
    docs: []const Doc,
    cores: []const Core,

    pub const Package = struct {
        name: []const u8,
        package: []const u8,
        pins: []const Pin,

        pub const Pin = struct {
            position: []const u8,
            signals: []const []const u8,
        };
    };

    pub const Memory = struct {
        name: []const u8,
        kind: Kind,
        address: u32,
        size: u32,
        settings: ?Settings = null,
        access: ?Access = null,

        pub const Kind = enum {
            flash,
            ram,
        };

        pub const Settings = struct {
            erase_size: u32,
            write_size: u32,
            erase_value: u8,
        };

        pub const Access = struct {
            read: bool,
            write: bool,
            execute: bool,
        };
    };

    pub const Doc = struct {
        type: []const u8,
        title: []const u8,
        name: []const u8,
        url: []const u8,
    };

    pub const Core = struct {
        name: []const u8,
        peripherals: []const Peripheral,
        nvic_priority_bits: ?u8 = null,
        interrupts: []const Interrupt,
        dma_channels: []const DMA_Channel,

        pub const Peripheral = struct {
            name: []const u8,
            address: u32,
            registers: ?Registers = null,
            rcc: ?Rcc = null,
            pins: ?[]const Pin = null,
            interrupts: ?[]const Peripheral.Interrupt = null,
            dma_channels: ?[]const Peripheral.DMA_Channel = null,

            pub const Registers = struct {
                kind: []const u8,
                version: []const u8,
                block: []const u8,
            };

            pub const Rcc = struct {
                bus_clock: []const u8,
                kernel_clock: std.json.Value,
                enable: Field,
                reset: ?Field = null,
                stop_mode: StopMode = .Stop1,

                pub const Field = struct {
                    register: []const u8,
                    field: []const u8,
                };

                pub const StopMode = enum {
                    // this is the default if its null
                    Stop1,
                    Stop2,
                    Standby,
                };
            };

            pub const Pin = struct {
                pin: []const u8,
                signal: []const u8,
                af: ?u8 = null,
            };

            pub const Interrupt = struct {
                signal: []const u8,
                interrupt: []const u8,
            };

            pub const DMA_Channel = struct {
                signal: []const u8,
                dma: ?[]const u8 = null,
                channel: ?[]const u8 = null,
                dmamux: ?[]const u8 = null,
                request: ?u8 = null,
            };
        };

        pub const Interrupt = struct {
            name: []const u8,
            number: u8,
        };

        pub const DMA_Channel = struct {
            name: []const u8,
            dma: []const u8,
            channel: u8,
            dmamux: ?[]const u8 = null,
            dmamux_channel: ?u8 = null,
            supports_2d: ?bool = null,
        };
    };
};
