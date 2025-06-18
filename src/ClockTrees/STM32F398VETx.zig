const std = @import("std");
const clock = @import("../ClockNode.zig");
const ClockNode = clock.ClockNode;
const ClockNodeTypes = clock.ClockNodesTypes;
const ClockState = clock.ClockState;
const ClockError = clock.ClockError;

pub const LSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 1000000;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const HSEOSCConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 32000000;
    }

    pub fn min() f32 {
        return 4000000;
    }
};
pub const PRESCALERUSBConf = enum {
    RCC_USBCLKSOURCE_PLL,
    RCC_USBCLKSOURCE_PLL_DIV1_5,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_USBCLKSOURCE_PLL => 1,
            .RCC_USBCLKSOURCE_PLL_DIV1_5 => 1.5,
        };
    }
};
pub const SysClkSourceConf = enum {
    HSIRC,
    HSEOSC,
    PLLMUL,
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const MCOMultDivisorConf = enum {
    RCC_MCO1SOURCE_PLLCLK,
    RCC_MCO1SOURCE_PLLCLK_DIV2,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCO1SOURCE_PLLCLK => 1,
            .RCC_MCO1SOURCE_PLLCLK_DIV2 => 2,
        };
    }
};
pub const MCOMultConf = enum {
    HSIRC,
    LSEOSC,
    HSEOSC,
    MCOMultDivisor,
    LSIRC,
    SysCLKOutput,
};
pub const MCODivisorConf = enum {
    RCC_MCODIV_1,
    RCC_MCODIV_2,
    RCC_MCODIV_4,
    RCC_MCODIV_8,
    RCC_MCODIV_16,
    RCC_MCODIV_32,
    RCC_MCODIV_64,
    RCC_MCODIV_128,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_MCODIV_1 => 1,
            .RCC_MCODIV_2 => 2,
            .RCC_MCODIV_4 => 4,
            .RCC_MCODIV_8 => 8,
            .RCC_MCODIV_16 => 16,
            .RCC_MCODIV_32 => 32,
            .RCC_MCODIV_64 => 64,
            .RCC_MCODIV_128 => 128,
        };
    }
};
pub const AHBPrescalerConf = enum {
    RCC_SYSCLK_DIV1,
    RCC_SYSCLK_DIV2,
    RCC_SYSCLK_DIV4,
    RCC_SYSCLK_DIV8,
    RCC_SYSCLK_DIV16,
    RCC_SYSCLK_DIV64,
    RCC_SYSCLK_DIV128,
    RCC_SYSCLK_DIV256,
    RCC_SYSCLK_DIV512,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_SYSCLK_DIV1 => 1,
            .RCC_SYSCLK_DIV2 => 2,
            .RCC_SYSCLK_DIV4 => 4,
            .RCC_SYSCLK_DIV8 => 8,
            .RCC_SYSCLK_DIV16 => 16,
            .RCC_SYSCLK_DIV64 => 64,
            .RCC_SYSCLK_DIV128 => 128,
            .RCC_SYSCLK_DIV256 => 256,
            .RCC_SYSCLK_DIV512 => 512,
        };
    }
};
pub const CortexPrescalerConf = enum {
    SYSTICK_CLKSOURCE_HCLK,
    SYSTICK_CLKSOURCE_HCLK_DIV8,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .SYSTICK_CLKSOURCE_HCLK => 1,
            .SYSTICK_CLKSOURCE_HCLK_DIV8 => 8,
        };
    }
};
pub const ADC12PRESConf = enum {
    RCC_ADC12PLLCLK_DIV1,
    RCC_ADC12PLLCLK_DIV2,
    RCC_ADC12PLLCLK_DIV4,
    RCC_ADC12PLLCLK_DIV6,
    RCC_ADC12PLLCLK_DIV8,
    RCC_ADC12PLLCLK_DIV10,
    RCC_ADC12PLLCLK_DIV12,
    RCC_ADC12PLLCLK_DIV16,
    RCC_ADC12PLLCLK_DIV32,
    RCC_ADC12PLLCLK_DIV64,
    RCC_ADC12PLLCLK_DIV128,
    RCC_ADC12PLLCLK_DIV256,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_ADC12PLLCLK_DIV1 => 1,
            .RCC_ADC12PLLCLK_DIV2 => 2,
            .RCC_ADC12PLLCLK_DIV4 => 4,
            .RCC_ADC12PLLCLK_DIV6 => 6,
            .RCC_ADC12PLLCLK_DIV8 => 8,
            .RCC_ADC12PLLCLK_DIV10 => 10,
            .RCC_ADC12PLLCLK_DIV12 => 12,
            .RCC_ADC12PLLCLK_DIV16 => 16,
            .RCC_ADC12PLLCLK_DIV32 => 32,
            .RCC_ADC12PLLCLK_DIV64 => 64,
            .RCC_ADC12PLLCLK_DIV128 => 128,
            .RCC_ADC12PLLCLK_DIV256 => 256,
        };
    }
};
pub const ADC34PRESConf = enum {
    RCC_ADC34PLLCLK_DIV1,
    RCC_ADC34PLLCLK_DIV2,
    RCC_ADC34PLLCLK_DIV4,
    RCC_ADC34PLLCLK_DIV6,
    RCC_ADC34PLLCLK_DIV8,
    RCC_ADC34PLLCLK_DIV10,
    RCC_ADC34PLLCLK_DIV12,
    RCC_ADC34PLLCLK_DIV16,
    RCC_ADC34PLLCLK_DIV32,
    RCC_ADC34PLLCLK_DIV64,
    RCC_ADC34PLLCLK_DIV128,
    RCC_ADC34PLLCLK_DIV256,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_ADC34PLLCLK_DIV1 => 1,
            .RCC_ADC34PLLCLK_DIV2 => 2,
            .RCC_ADC34PLLCLK_DIV4 => 4,
            .RCC_ADC34PLLCLK_DIV6 => 6,
            .RCC_ADC34PLLCLK_DIV8 => 8,
            .RCC_ADC34PLLCLK_DIV10 => 10,
            .RCC_ADC34PLLCLK_DIV12 => 12,
            .RCC_ADC34PLLCLK_DIV16 => 16,
            .RCC_ADC34PLLCLK_DIV32 => 32,
            .RCC_ADC34PLLCLK_DIV64 => 64,
            .RCC_ADC34PLLCLK_DIV128 => 128,
            .RCC_ADC34PLLCLK_DIV256 => 256,
        };
    }
};
pub const APB1PrescalerConf = enum {
    RCC_HCLK_DIV1,
    RCC_HCLK_DIV2,
    RCC_HCLK_DIV4,
    RCC_HCLK_DIV8,
    RCC_HCLK_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HCLK_DIV1 => 1,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV16 => 16,
        };
    }
};
pub const APB2PrescalerConf = enum {
    RCC_HCLK_DIV1,
    RCC_HCLK_DIV2,
    RCC_HCLK_DIV4,
    RCC_HCLK_DIV8,
    RCC_HCLK_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_HCLK_DIV1 => 1,
            .RCC_HCLK_DIV2 => 2,
            .RCC_HCLK_DIV4 => 4,
            .RCC_HCLK_DIV8 => 8,
            .RCC_HCLK_DIV16 => 16,
        };
    }
};
pub const TIMMUX2Conf = enum {
    TIMMUL,
    TimPrescOut1,
};
pub const TIMMUX3Conf = enum {
    TIMMUL,
    TimPrescOut1,
};
pub const TIMMUX1Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const TIMMUX8Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const TIMMUX15Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const TIMMUX16Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const TIMMUX17Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const TIMMUX20Conf = enum {
    TIMMUL,
    TimPrescOut2,
};
pub const I2C1MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2C2MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2C3MultConf = enum {
    HSIRC,
    SysCLKOutput,
};
pub const I2SSrcConf = enum {
    I2S_CKIN,
    SysCLKOutput,
};
pub const USART1MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB2Prescaler,
};
pub const USART2MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const USART3MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const UART4MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const UART5MultConf = enum {
    SysCLKOutput,
    HSIRC,
    LSEOSC,
    APB1Prescaler,
};
pub const PLLSourceConf = enum {
    HSIRC,
    HSEOSC,
};
pub const PLLDivConf = enum {
    RCC_PREDIV_DIV1,
    RCC_PREDIV_DIV2,
    RCC_PREDIV_DIV3,
    RCC_PREDIV_DIV4,
    RCC_PREDIV_DIV5,
    RCC_PREDIV_DIV6,
    RCC_PREDIV_DIV7,
    RCC_PREDIV_DIV8,
    RCC_PREDIV_DIV9,
    RCC_PREDIV_DIV10,
    RCC_PREDIV_DIV11,
    RCC_PREDIV_DIV12,
    RCC_PREDIV_DIV13,
    RCC_PREDIV_DIV14,
    RCC_PREDIV_DIV15,
    RCC_PREDIV_DIV16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PREDIV_DIV1 => 1,
            .RCC_PREDIV_DIV2 => 2,
            .RCC_PREDIV_DIV3 => 3,
            .RCC_PREDIV_DIV4 => 4,
            .RCC_PREDIV_DIV5 => 5,
            .RCC_PREDIV_DIV6 => 6,
            .RCC_PREDIV_DIV7 => 7,
            .RCC_PREDIV_DIV8 => 8,
            .RCC_PREDIV_DIV9 => 9,
            .RCC_PREDIV_DIV10 => 10,
            .RCC_PREDIV_DIV11 => 11,
            .RCC_PREDIV_DIV12 => 12,
            .RCC_PREDIV_DIV13 => 13,
            .RCC_PREDIV_DIV14 => 14,
            .RCC_PREDIV_DIV15 => 15,
            .RCC_PREDIV_DIV16 => 16,
        };
    }
};
pub const PLLMULConf = enum {
    RCC_PLL_MUL2,
    RCC_PLL_MUL3,
    RCC_PLL_MUL4,
    RCC_PLL_MUL5,
    RCC_PLL_MUL6,
    RCC_PLL_MUL7,
    RCC_PLL_MUL8,
    RCC_PLL_MUL9,
    RCC_PLL_MUL10,
    RCC_PLL_MUL11,
    RCC_PLL_MUL12,
    RCC_PLL_MUL13,
    RCC_PLL_MUL14,
    RCC_PLL_MUL15,
    RCC_PLL_MUL16,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .RCC_PLL_MUL2 => 2,
            .RCC_PLL_MUL3 => 3,
            .RCC_PLL_MUL4 => 4,
            .RCC_PLL_MUL5 => 5,
            .RCC_PLL_MUL6 => 6,
            .RCC_PLL_MUL7 => 7,
            .RCC_PLL_MUL8 => 8,
            .RCC_PLL_MUL9 => 9,
            .RCC_PLL_MUL10 => 10,
            .RCC_PLL_MUL11 => 11,
            .RCC_PLL_MUL12 => 12,
            .RCC_PLL_MUL13 => 13,
            .RCC_PLL_MUL14 => 14,
            .RCC_PLL_MUL15 => 15,
            .RCC_PLL_MUL16 => 16,
        };
    }
};
pub const HSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 4294967295;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const LSE_TimoutConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 4294967295;
    }

    pub fn min() f32 {
        return 1;
    }
};
pub const HSICalibrationValueConf = enum(u32) {
    _,
    pub fn get(num: @This()) f32 {
        const val: u32 = @intFromEnum(num);
        return @as(f32, @floatFromInt(val));
    }

    pub fn max() f32 {
        return 31;
    }

    pub fn min() f32 {
        return 0;
    }
};
pub const LSE_Drive_CapabilityConf = enum {
    null,
    pub fn get(self: @This()) f32 {
        return switch (self) {
            .null => 0,
        };
    }
};
pub const Config = struct {
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    HSEOSC: HSEOSCConf = @enumFromInt(8000000),
    PRESCALERUSB: PRESCALERUSBConf = .RCC_USBCLKSOURCE_PLL,
    SysClkSource: SysClkSourceConf = .HSIRC,
    RTCClkSource: RTCClkSourceConf = .LSIRC,
    MCOMultDivisor: MCOMultDivisorConf = .RCC_MCO1SOURCE_PLLCLK,
    MCOMult: MCOMultConf = .SysCLKOutput,
    MCODivisor: MCODivisorConf = .RCC_MCODIV_1,
    AHBPrescaler: AHBPrescalerConf = .RCC_SYSCLK_DIV1,
    CortexPrescaler: CortexPrescalerConf = .SYSTICK_CLKSOURCE_HCLK,
    ADC12PRES: ADC12PRESConf = .RCC_ADC12PLLCLK_DIV1,
    ADC34PRES: ADC34PRESConf = .RCC_ADC34PLLCLK_DIV1,
    APB1Prescaler: APB1PrescalerConf = .RCC_HCLK_DIV1,
    APB2Prescaler: APB2PrescalerConf = .RCC_HCLK_DIV1,
    TIMMUX2: TIMMUX2Conf = .TimPrescOut1,
    TIMMUX3: TIMMUX3Conf = .TimPrescOut1,
    TIMMUX1: TIMMUX1Conf = .TimPrescOut2,
    TIMMUX8: TIMMUX8Conf = .TimPrescOut2,
    TIMMUX15: TIMMUX15Conf = .TimPrescOut2,
    TIMMUX16: TIMMUX16Conf = .TimPrescOut2,
    TIMMUX17: TIMMUX17Conf = .TimPrescOut2,
    TIMMUX20: TIMMUX20Conf = .TimPrescOut2,
    I2C1Mult: I2C1MultConf = .HSIRC,
    I2C2Mult: I2C2MultConf = .HSIRC,
    I2C3Mult: I2C3MultConf = .HSIRC,
    I2SSrc: I2SSrcConf = .SysCLKOutput,
    USART1Mult: USART1MultConf = .APB2Prescaler,
    USART2Mult: USART2MultConf = .APB1Prescaler,
    USART3Mult: USART3MultConf = .APB1Prescaler,
    UART4Mult: UART4MultConf = .APB1Prescaler,
    UART5Mult: UART5MultConf = .APB1Prescaler,
    PLLSource: PLLSourceConf = .HSIRC,
    PLLDiv: PLLDivConf = .RCC_PREDIV_DIV1,
    PLLMUL: PLLMULConf = .RCC_PLL_MUL2,
    HSE_Timout: HSE_TimoutConf = @enumFromInt(100),
    LSE_Timout: LSE_TimoutConf = @enumFromInt(5000),
    HSICalibrationValue: HSICalibrationValueConf = @enumFromInt(16),
    LSE_Drive_Capability: LSE_Drive_CapabilityConf = .null,
};

pub const ClockTree = struct {
    const this = @This();

    HSIRC: ClockNode,
    FLITFCLKoutput: ClockNode,
    LSIRC: ClockNode,
    LSEOSC: ClockNode,
    HSEOSC: ClockNode,
    PRESCALERUSB: ClockNode,
    USBoutput: ClockNode,
    SysClkSource: ClockNode,
    SysCLKOutput: ClockNode,
    HSERTCDevisor: ClockNode,
    RTCClkSource: ClockNode,
    RTCOutput: ClockNode,
    IWDGOutput: ClockNode,
    MCOMultDivisor: ClockNode,
    MCOMult: ClockNode,
    MCODivisor: ClockNode,
    MCOoutput: ClockNode,
    AHBPrescaler: ClockNode,
    AHBOutput: ClockNode,
    HCLKOutput: ClockNode,
    FCLKCortexOutput: ClockNode,
    CortexPrescaler: ClockNode,
    CortexSysOutput: ClockNode,
    ADC12PRES: ClockNode,
    ADC12output: ClockNode,
    ADC34PRES: ClockNode,
    ADC34output: ClockNode,
    APB1Prescaler: ClockNode,
    APB1Output: ClockNode,
    TimPrescalerAPB1: ClockNode,
    TimPrescOut1: ClockNode,
    APB2Prescaler: ClockNode,
    APB2Output: ClockNode,
    TimPrescalerAPB2: ClockNode,
    TimPrescOut2: ClockNode,
    TIMMUL: ClockNode,
    TIMMUX2: ClockNode,
    TIM2out: ClockNode,
    TIMMUX3: ClockNode,
    TIM3out: ClockNode,
    TIMMUX1: ClockNode,
    TIM1out: ClockNode,
    TIMMUX8: ClockNode,
    TIM8out: ClockNode,
    TIMMUX15: ClockNode,
    TIM15out: ClockNode,
    TIMMUX16: ClockNode,
    TIM16out: ClockNode,
    TIMMUX17: ClockNode,
    TIM17out: ClockNode,
    TIMMUX20: ClockNode,
    TIM20out: ClockNode,
    I2C1Mult: ClockNode,
    I2C1Output: ClockNode,
    I2C2Mult: ClockNode,
    I2C2Output: ClockNode,
    I2C3Mult: ClockNode,
    I2C3Output: ClockNode,
    I2S_CKIN: ClockNode,
    I2SSrc: ClockNode,
    I2SClocksOutput: ClockNode,
    USART1Mult: ClockNode,
    USART1Output: ClockNode,
    USART2Mult: ClockNode,
    USART2Output: ClockNode,
    USART3Mult: ClockNode,
    USART3Output: ClockNode,
    UART4Mult: ClockNode,
    UART4Output: ClockNode,
    UART5Mult: ClockNode,
    UART5Output: ClockNode,
    PLLSource: ClockNode,
    PLLDiv: ClockNode,
    VCO2output: ClockNode,
    PLLMUL: ClockNode,
    HSE_Timout: ClockNodeTypes,
    LSE_Timout: ClockNodeTypes,
    HSICalibrationValue: ClockNodeTypes,
    LSE_Drive_Capability: ClockNodeTypes,

    pub fn init_comptime(comptime config: Config) this {
        const HSIRCval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        const HSIRC: ClockNode = .{
            .name = "HSIRC",
            .Nodetype = HSIRCval,
        };
        const FLITFCLKoutputval = ClockNodeTypes{ .output = null };
        const FLITFCLKoutput: ClockNode = .{
            .name = "FLITFCLKoutput",
            .Nodetype = FLITFCLKoutputval,
            .parents = &[_]*const ClockNode{&HSIRC},
        };
        const LSIRCval = ClockNodeTypes{
            .source = .{ .value = 40000 },
        };
        const LSIRC: ClockNode = .{
            .name = "LSIRC",
            .Nodetype = LSIRCval,
        };
        const LSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.LSEOSC.get(),
                .limit = .{ .max = 1000000, .min = 0 },
            },
        };
        const LSEOSC: ClockNode = .{
            .name = "LSEOSC",
            .Nodetype = LSEOSCval,
        };
        const HSEOSCval = ClockNodeTypes{
            .source = .{
                .value = config.HSEOSC.get(),
                .limit = .{ .max = 32000000, .min = 4000000 },
            },
        };
        const HSEOSC: ClockNode = .{
            .name = "HSEOSC",
            .Nodetype = HSEOSCval,
        };
        const PLLSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.PLLSource) };
        const PLLSource: ClockNode = .{
            .name = "PLLSource",
            .Nodetype = PLLSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
            },
        };
        const PLLDivval = ClockNodeTypes{ .div = .{ .value = config.PLLDiv.get() } };
        const PLLDiv: ClockNode = .{
            .name = "PLLDiv",
            .Nodetype = PLLDivval,
            .parents = &[_]*const ClockNode{&PLLSource},
        };
        const VCO2outputval = ClockNodeTypes{ .output = null };
        const VCO2output: ClockNode = .{
            .name = "VCO2output",
            .Nodetype = VCO2outputval,
            .parents = &[_]*const ClockNode{&PLLDiv},
        };
        const PLLMULval = ClockNodeTypes{ .mul = .{ .value = config.PLLMUL.get() } };
        const PLLMUL: ClockNode = .{
            .name = "PLLMUL",
            .Nodetype = PLLMULval,
            .parents = &[_]*const ClockNode{&VCO2output},
        };
        const PRESCALERUSBval = ClockNodeTypes{ .div = .{ .value = config.PRESCALERUSB.get() } };
        const PRESCALERUSB: ClockNode = .{
            .name = "PRESCALERUSB",
            .Nodetype = PRESCALERUSBval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const USBoutputval = ClockNodeTypes{
            .output = .{ .max = 48120000, .min = 47880000 },
        };
        const USBoutput: ClockNode = .{
            .name = "USBoutput",
            .Nodetype = USBoutputval,
            .parents = &[_]*const ClockNode{&PRESCALERUSB},
        };
        const SysClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.SysClkSource) };
        const SysClkSource: ClockNode = .{
            .name = "SysClkSource",
            .Nodetype = SysClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &HSEOSC,
                &PLLMUL,
            },
        };
        const SysCLKOutputval = ClockNodeTypes{ .output = null };
        const SysCLKOutput: ClockNode = .{
            .name = "SysCLKOutput",
            .Nodetype = SysCLKOutputval,
            .parents = &[_]*const ClockNode{&SysClkSource},
        };
        const HSERTCDevisorval = ClockNodeTypes{
            .div = .{ .value = 32 },
        };
        const HSERTCDevisor: ClockNode = .{
            .name = "HSERTCDevisor",
            .Nodetype = HSERTCDevisorval,
            .parents = &[_]*const ClockNode{&HSEOSC},
        };
        const RTCClkSourceval = ClockNodeTypes{ .multi = @intFromEnum(config.RTCClkSource) };
        const RTCClkSource: ClockNode = .{
            .name = "RTCClkSource",
            .Nodetype = RTCClkSourceval,

            .parents = &[_]*const ClockNode{
                &HSERTCDevisor,
                &LSEOSC,
                &LSIRC,
            },
        };
        const RTCOutputval = ClockNodeTypes{ .output = null };
        const RTCOutput: ClockNode = .{
            .name = "RTCOutput",
            .Nodetype = RTCOutputval,
            .parents = &[_]*const ClockNode{&RTCClkSource},
        };
        const IWDGOutputval = ClockNodeTypes{ .output = null };
        const IWDGOutput: ClockNode = .{
            .name = "IWDGOutput",
            .Nodetype = IWDGOutputval,
            .parents = &[_]*const ClockNode{&LSIRC},
        };
        const MCOMultDivisorval = ClockNodeTypes{ .div = .{ .value = config.MCOMultDivisor.get() } };
        const MCOMultDivisor: ClockNode = .{
            .name = "MCOMultDivisor",
            .Nodetype = MCOMultDivisorval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const MCOMultval = ClockNodeTypes{ .multi = @intFromEnum(config.MCOMult) };
        const MCOMult: ClockNode = .{
            .name = "MCOMult",
            .Nodetype = MCOMultval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &LSEOSC,
                &HSEOSC,
                &MCOMultDivisor,
                &LSIRC,
                &SysCLKOutput,
            },
        };
        const MCODivisorval = ClockNodeTypes{ .div = .{ .value = config.MCODivisor.get() } };
        const MCODivisor: ClockNode = .{
            .name = "MCODivisor",
            .Nodetype = MCODivisorval,
            .parents = &[_]*const ClockNode{&MCOMult},
        };
        const MCOoutputval = ClockNodeTypes{ .output = null };
        const MCOoutput: ClockNode = .{
            .name = "MCOoutput",
            .Nodetype = MCOoutputval,
            .parents = &[_]*const ClockNode{&MCODivisor},
        };
        const AHBPrescalerval = ClockNodeTypes{ .div = .{ .value = config.AHBPrescaler.get() } };
        const AHBPrescaler: ClockNode = .{
            .name = "AHBPrescaler",
            .Nodetype = AHBPrescalerval,
            .parents = &[_]*const ClockNode{&SysCLKOutput},
        };
        const AHBOutputval = ClockNodeTypes{
            .output = .{ .max = 72000000, .min = 0 },
        };
        const AHBOutput: ClockNode = .{
            .name = "AHBOutput",
            .Nodetype = AHBOutputval,
            .parents = &[_]*const ClockNode{&AHBPrescaler},
        };
        const HCLKOutputval = ClockNodeTypes{ .output = null };
        const HCLKOutput: ClockNode = .{
            .name = "HCLKOutput",
            .Nodetype = HCLKOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const FCLKCortexOutputval = ClockNodeTypes{ .output = null };
        const FCLKCortexOutput: ClockNode = .{
            .name = "FCLKCortexOutput",
            .Nodetype = FCLKCortexOutputval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexPrescalerval = ClockNodeTypes{ .div = .{ .value = config.CortexPrescaler.get() } };
        const CortexPrescaler: ClockNode = .{
            .name = "CortexPrescaler",
            .Nodetype = CortexPrescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const CortexSysOutputval = ClockNodeTypes{ .output = null };
        const CortexSysOutput: ClockNode = .{
            .name = "CortexSysOutput",
            .Nodetype = CortexSysOutputval,
            .parents = &[_]*const ClockNode{&CortexPrescaler},
        };
        const ADC12PRESval = ClockNodeTypes{ .div = .{ .value = config.ADC12PRES.get() } };
        const ADC12PRES: ClockNode = .{
            .name = "ADC12PRES",
            .Nodetype = ADC12PRESval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const ADC12outputval = ClockNodeTypes{ .output = null };
        const ADC12output: ClockNode = .{
            .name = "ADC12output",
            .Nodetype = ADC12outputval,
            .parents = &[_]*const ClockNode{&ADC12PRES},
        };
        const ADC34PRESval = ClockNodeTypes{ .div = .{ .value = config.ADC34PRES.get() } };
        const ADC34PRES: ClockNode = .{
            .name = "ADC34PRES",
            .Nodetype = ADC34PRESval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const ADC34outputval = ClockNodeTypes{ .output = null };
        const ADC34output: ClockNode = .{
            .name = "ADC34output",
            .Nodetype = ADC34outputval,
            .parents = &[_]*const ClockNode{&ADC34PRES},
        };
        const APB1Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB1Prescaler.get() } };
        const APB1Prescaler: ClockNode = .{
            .name = "APB1Prescaler",
            .Nodetype = APB1Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB1Outputval = ClockNodeTypes{
            .output = .{ .max = 36000000, .min = 0 },
        };
        const APB1Output: ClockNode = .{
            .name = "APB1Output",
            .Nodetype = APB1Outputval,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescalerAPB1val = blk: {
            if (APB1Prescalerval.num_val() == 1) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const TimPrescalerAPB1: ClockNode = .{
            .name = "TimPrescalerAPB1",
            .Nodetype = TimPrescalerAPB1val,
            .parents = &[_]*const ClockNode{&APB1Prescaler},
        };
        const TimPrescOut1val = ClockNodeTypes{ .output = null };
        const TimPrescOut1: ClockNode = .{
            .name = "TimPrescOut1",
            .Nodetype = TimPrescOut1val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB1},
        };
        const APB2Prescalerval = ClockNodeTypes{ .div = .{ .value = config.APB2Prescaler.get() } };
        const APB2Prescaler: ClockNode = .{
            .name = "APB2Prescaler",
            .Nodetype = APB2Prescalerval,
            .parents = &[_]*const ClockNode{&AHBOutput},
        };
        const APB2Outputval = ClockNodeTypes{
            .output = .{ .max = 72000000, .min = 0 },
        };
        const APB2Output: ClockNode = .{
            .name = "APB2Output",
            .Nodetype = APB2Outputval,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescalerAPB2val = blk: {
            if (APB2Prescalerval.num_val() == 1) {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 1 },
                };
            } else {
                break :blk ClockNodeTypes{
                    .mul = .{ .value = 2 },
                };
            }
        };
        const TimPrescalerAPB2: ClockNode = .{
            .name = "TimPrescalerAPB2",
            .Nodetype = TimPrescalerAPB2val,
            .parents = &[_]*const ClockNode{&APB2Prescaler},
        };
        const TimPrescOut2val = ClockNodeTypes{ .output = null };
        const TimPrescOut2: ClockNode = .{
            .name = "TimPrescOut2",
            .Nodetype = TimPrescOut2val,
            .parents = &[_]*const ClockNode{&TimPrescalerAPB2},
        };
        const TIMMULval = ClockNodeTypes{
            .mul = .{ .value = 2 },
        };
        const TIMMUL: ClockNode = .{
            .name = "TIMMUL",
            .Nodetype = TIMMULval,
            .parents = &[_]*const ClockNode{&PLLMUL},
        };
        const TIMMUX2val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX2) };
        const TIMMUX2: ClockNode = .{
            .name = "TIMMUX2",
            .Nodetype = TIMMUX2val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut1,
            },
        };
        const TIM2outval = ClockNodeTypes{ .output = null };
        const TIM2out: ClockNode = .{
            .name = "TIM2out",
            .Nodetype = TIM2outval,
            .parents = &[_]*const ClockNode{&TIMMUX2},
        };
        const TIMMUX3val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX3) };
        const TIMMUX3: ClockNode = .{
            .name = "TIMMUX3",
            .Nodetype = TIMMUX3val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut1,
            },
        };
        const TIM3outval = ClockNodeTypes{ .output = null };
        const TIM3out: ClockNode = .{
            .name = "TIM3out",
            .Nodetype = TIM3outval,
            .parents = &[_]*const ClockNode{&TIMMUX3},
        };
        const TIMMUX1val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX1) };
        const TIMMUX1: ClockNode = .{
            .name = "TIMMUX1",
            .Nodetype = TIMMUX1val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM1outval = ClockNodeTypes{ .output = null };
        const TIM1out: ClockNode = .{
            .name = "TIM1out",
            .Nodetype = TIM1outval,
            .parents = &[_]*const ClockNode{&TIMMUX1},
        };
        const TIMMUX8val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX8) };
        const TIMMUX8: ClockNode = .{
            .name = "TIMMUX8",
            .Nodetype = TIMMUX8val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM8outval = ClockNodeTypes{ .output = null };
        const TIM8out: ClockNode = .{
            .name = "TIM8out",
            .Nodetype = TIM8outval,
            .parents = &[_]*const ClockNode{&TIMMUX8},
        };
        const TIMMUX15val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX15) };
        const TIMMUX15: ClockNode = .{
            .name = "TIMMUX15",
            .Nodetype = TIMMUX15val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM15outval = ClockNodeTypes{ .output = null };
        const TIM15out: ClockNode = .{
            .name = "TIM15out",
            .Nodetype = TIM15outval,
            .parents = &[_]*const ClockNode{&TIMMUX15},
        };
        const TIMMUX16val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX16) };
        const TIMMUX16: ClockNode = .{
            .name = "TIMMUX16",
            .Nodetype = TIMMUX16val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM16outval = ClockNodeTypes{ .output = null };
        const TIM16out: ClockNode = .{
            .name = "TIM16out",
            .Nodetype = TIM16outval,
            .parents = &[_]*const ClockNode{&TIMMUX16},
        };
        const TIMMUX17val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX17) };
        const TIMMUX17: ClockNode = .{
            .name = "TIMMUX17",
            .Nodetype = TIMMUX17val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM17outval = ClockNodeTypes{ .output = null };
        const TIM17out: ClockNode = .{
            .name = "TIM17out",
            .Nodetype = TIM17outval,
            .parents = &[_]*const ClockNode{&TIMMUX17},
        };
        const TIMMUX20val = ClockNodeTypes{ .multi = @intFromEnum(config.TIMMUX20) };
        const TIMMUX20: ClockNode = .{
            .name = "TIMMUX20",
            .Nodetype = TIMMUX20val,

            .parents = &[_]*const ClockNode{
                &TIMMUL,
                &TimPrescOut2,
            },
        };
        const TIM20outval = ClockNodeTypes{ .output = null };
        const TIM20out: ClockNode = .{
            .name = "TIM20out",
            .Nodetype = TIM20outval,
            .parents = &[_]*const ClockNode{&TIMMUX20},
        };
        const I2C1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C1Mult) };
        const I2C1Mult: ClockNode = .{
            .name = "I2C1Mult",
            .Nodetype = I2C1Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C1Outputval = ClockNodeTypes{ .output = null };
        const I2C1Output: ClockNode = .{
            .name = "I2C1Output",
            .Nodetype = I2C1Outputval,
            .parents = &[_]*const ClockNode{&I2C1Mult},
        };
        const I2C2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C2Mult) };
        const I2C2Mult: ClockNode = .{
            .name = "I2C2Mult",
            .Nodetype = I2C2Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C2Outputval = ClockNodeTypes{ .output = null };
        const I2C2Output: ClockNode = .{
            .name = "I2C2Output",
            .Nodetype = I2C2Outputval,
            .parents = &[_]*const ClockNode{&I2C2Mult},
        };
        const I2C3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.I2C3Mult) };
        const I2C3Mult: ClockNode = .{
            .name = "I2C3Mult",
            .Nodetype = I2C3Multval,

            .parents = &[_]*const ClockNode{
                &HSIRC,
                &SysCLKOutput,
            },
        };
        const I2C3Outputval = ClockNodeTypes{ .output = null };
        const I2C3Output: ClockNode = .{
            .name = "I2C3Output",
            .Nodetype = I2C3Outputval,
            .parents = &[_]*const ClockNode{&I2C3Mult},
        };
        const I2S_CKINval = ClockNodeTypes{
            .source = .{ .value = 8000000 },
        };
        const I2S_CKIN: ClockNode = .{
            .name = "I2S_CKIN",
            .Nodetype = I2S_CKINval,
        };
        const I2SSrcval = ClockNodeTypes{ .multi = @intFromEnum(config.I2SSrc) };
        const I2SSrc: ClockNode = .{
            .name = "I2SSrc",
            .Nodetype = I2SSrcval,

            .parents = &[_]*const ClockNode{
                &I2S_CKIN,
                &SysCLKOutput,
            },
        };
        const I2SClocksOutputval = ClockNodeTypes{ .output = null };
        const I2SClocksOutput: ClockNode = .{
            .name = "I2SClocksOutput",
            .Nodetype = I2SClocksOutputval,
            .parents = &[_]*const ClockNode{&I2SSrc},
        };
        const USART1Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART1Mult) };
        const USART1Mult: ClockNode = .{
            .name = "USART1Mult",
            .Nodetype = USART1Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB2Prescaler,
            },
        };
        const USART1Outputval = ClockNodeTypes{ .output = null };
        const USART1Output: ClockNode = .{
            .name = "USART1Output",
            .Nodetype = USART1Outputval,
            .parents = &[_]*const ClockNode{&USART1Mult},
        };
        const USART2Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART2Mult) };
        const USART2Mult: ClockNode = .{
            .name = "USART2Mult",
            .Nodetype = USART2Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART2Outputval = ClockNodeTypes{ .output = null };
        const USART2Output: ClockNode = .{
            .name = "USART2Output",
            .Nodetype = USART2Outputval,
            .parents = &[_]*const ClockNode{&USART2Mult},
        };
        const USART3Multval = ClockNodeTypes{ .multi = @intFromEnum(config.USART3Mult) };
        const USART3Mult: ClockNode = .{
            .name = "USART3Mult",
            .Nodetype = USART3Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const USART3Outputval = ClockNodeTypes{ .output = null };
        const USART3Output: ClockNode = .{
            .name = "USART3Output",
            .Nodetype = USART3Outputval,
            .parents = &[_]*const ClockNode{&USART3Mult},
        };
        const UART4Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART4Mult) };
        const UART4Mult: ClockNode = .{
            .name = "UART4Mult",
            .Nodetype = UART4Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const UART4Outputval = ClockNodeTypes{ .output = null };
        const UART4Output: ClockNode = .{
            .name = "UART4Output",
            .Nodetype = UART4Outputval,
            .parents = &[_]*const ClockNode{&UART4Mult},
        };
        const UART5Multval = ClockNodeTypes{ .multi = @intFromEnum(config.UART5Mult) };
        const UART5Mult: ClockNode = .{
            .name = "UART5Mult",
            .Nodetype = UART5Multval,

            .parents = &[_]*const ClockNode{
                &SysCLKOutput,
                &HSIRC,
                &LSEOSC,
                &APB1Prescaler,
            },
        };
        const UART5Outputval = ClockNodeTypes{ .output = null };
        const UART5Output: ClockNode = .{
            .name = "UART5Output",
            .Nodetype = UART5Outputval,
            .parents = &[_]*const ClockNode{&UART5Mult},
        };
        const HSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = config.HSE_Timout.get(),
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const LSE_Timoutval = ClockNodeTypes{
            .source = .{
                .value = config.LSE_Timout.get(),
                .limit = .{ .max = 4294967295, .min = 1 },
            },
        };
        const HSICalibrationValueval = ClockNodeTypes{
            .source = .{
                .value = config.HSICalibrationValue.get(),
                .limit = .{ .max = 31, .min = 0 },
            },
        };
        const LSE_Drive_Capabilityval = ClockNodeTypes{
            .source = .{ .value = config.LSE_Drive_Capability.get() },
        };
        return .{
            .HSIRC = HSIRC,
            .FLITFCLKoutput = FLITFCLKoutput,
            .LSIRC = LSIRC,
            .LSEOSC = LSEOSC,
            .HSEOSC = HSEOSC,
            .PRESCALERUSB = PRESCALERUSB,
            .USBoutput = USBoutput,
            .SysClkSource = SysClkSource,
            .SysCLKOutput = SysCLKOutput,
            .HSERTCDevisor = HSERTCDevisor,
            .RTCClkSource = RTCClkSource,
            .RTCOutput = RTCOutput,
            .IWDGOutput = IWDGOutput,
            .MCOMultDivisor = MCOMultDivisor,
            .MCOMult = MCOMult,
            .MCODivisor = MCODivisor,
            .MCOoutput = MCOoutput,
            .AHBPrescaler = AHBPrescaler,
            .AHBOutput = AHBOutput,
            .HCLKOutput = HCLKOutput,
            .FCLKCortexOutput = FCLKCortexOutput,
            .CortexPrescaler = CortexPrescaler,
            .CortexSysOutput = CortexSysOutput,
            .ADC12PRES = ADC12PRES,
            .ADC12output = ADC12output,
            .ADC34PRES = ADC34PRES,
            .ADC34output = ADC34output,
            .APB1Prescaler = APB1Prescaler,
            .APB1Output = APB1Output,
            .TimPrescalerAPB1 = TimPrescalerAPB1,
            .TimPrescOut1 = TimPrescOut1,
            .APB2Prescaler = APB2Prescaler,
            .APB2Output = APB2Output,
            .TimPrescalerAPB2 = TimPrescalerAPB2,
            .TimPrescOut2 = TimPrescOut2,
            .TIMMUL = TIMMUL,
            .TIMMUX2 = TIMMUX2,
            .TIM2out = TIM2out,
            .TIMMUX3 = TIMMUX3,
            .TIM3out = TIM3out,
            .TIMMUX1 = TIMMUX1,
            .TIM1out = TIM1out,
            .TIMMUX8 = TIMMUX8,
            .TIM8out = TIM8out,
            .TIMMUX15 = TIMMUX15,
            .TIM15out = TIM15out,
            .TIMMUX16 = TIMMUX16,
            .TIM16out = TIM16out,
            .TIMMUX17 = TIMMUX17,
            .TIM17out = TIM17out,
            .TIMMUX20 = TIMMUX20,
            .TIM20out = TIM20out,
            .I2C1Mult = I2C1Mult,
            .I2C1Output = I2C1Output,
            .I2C2Mult = I2C2Mult,
            .I2C2Output = I2C2Output,
            .I2C3Mult = I2C3Mult,
            .I2C3Output = I2C3Output,
            .I2S_CKIN = I2S_CKIN,
            .I2SSrc = I2SSrc,
            .I2SClocksOutput = I2SClocksOutput,
            .USART1Mult = USART1Mult,
            .USART1Output = USART1Output,
            .USART2Mult = USART2Mult,
            .USART2Output = USART2Output,
            .USART3Mult = USART3Mult,
            .USART3Output = USART3Output,
            .UART4Mult = UART4Mult,
            .UART4Output = UART4Output,
            .UART5Mult = UART5Mult,
            .UART5Output = UART5Output,
            .PLLSource = PLLSource,
            .PLLDiv = PLLDiv,
            .VCO2output = VCO2output,
            .PLLMUL = PLLMUL,
            .HSE_Timout = HSE_Timoutval,
            .LSE_Timout = LSE_Timoutval,
            .HSICalibrationValue = HSICalibrationValueval,
            .LSE_Drive_Capability = LSE_Drive_Capabilityval,
        };
    }

    pub fn validate(comptime self: *const this) void {
        _ = self.USBoutput.get_comptime();
        _ = self.AHBOutput.get_comptime();
        _ = self.HCLKOutput.get_comptime();
        _ = self.FCLKCortexOutput.get_comptime();
        _ = self.CortexSysOutput.get_comptime();
        _ = self.ADC12output.get_comptime();
        _ = self.ADC34output.get_comptime();
        _ = self.APB1Output.get_comptime();
        _ = self.TimPrescOut1.get_comptime();
        _ = self.APB2Output.get_comptime();
        _ = self.TimPrescOut2.get_comptime();
        _ = self.TIM2out.get_comptime();
        _ = self.TIM3out.get_comptime();
        _ = self.TIM1out.get_comptime();
        _ = self.TIM8out.get_comptime();
        _ = self.TIM15out.get_comptime();
        _ = self.TIM16out.get_comptime();
        _ = self.TIM17out.get_comptime();
        _ = self.TIM20out.get_comptime();
        _ = self.I2C1Output.get_comptime();
        _ = self.I2C2Output.get_comptime();
        _ = self.I2C3Output.get_comptime();
        _ = self.I2SClocksOutput.get_comptime();
        _ = self.USART1Output.get_comptime();
        _ = self.USART2Output.get_comptime();
        _ = self.USART3Output.get_comptime();
        _ = self.UART4Output.get_comptime();
        _ = self.UART5Output.get_comptime();
    }
};
