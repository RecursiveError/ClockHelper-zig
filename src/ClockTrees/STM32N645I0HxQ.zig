const std = @import("std");

pub const HSIDivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
        };
    }
};
pub const HSIDiv4Conf = enum {
    const this = @This();
    DIV4,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV4 => 4,
        };
    }
};
pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 8000000) {
            @compileError("min value for HSEOSC is 8000000\n");
        } else if (val > 48000000) {
            @compileError("min value for HSEOSC is 48000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 48000000;
    }

    pub fn min() comptime_int {
        return 8000000;
    }
};
pub const HSEOSCDIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
        };
    }
};
pub const HSEDIVConf = enum {
    const this = @This();
    DIV2,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
        };
    }
};
pub const LSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: LSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for LSEOSC is 0\n");
        } else if (val > 1000000) {
            @compileError("min value for LSEOSC is 1000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 1000000;
    }

    pub fn min() comptime_int {
        return 0;
    }
};
pub const MSIRCConf = enum {
    const this = @This();
    CLOCK_16,
    CLOCK_4,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .CLOCK_16 => 16,
            .CLOCK_4 => 4,
        };
    }
};
pub const IC1Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC1DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC1DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC1Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC1Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC2Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC2DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC2DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC2Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC2Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC3Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC3DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC3DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC3Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC3Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC4Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC4DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC4DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC4Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC4Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC5Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC5DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC5DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC5Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC5Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC6Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC6DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC6DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC6Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC6Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC7Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC7DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC7DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC7Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC7Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC8Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC8DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC8DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC8Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC8Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC9Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC9DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC9DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC9Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC9Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC10Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC10DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC10DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC10Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC10Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC11Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC11DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC11DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC11Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC11Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC12Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC12DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC12DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC12Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC12Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC13Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC13DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC13DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC13Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC13Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC14Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC14DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC14DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC14Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC14Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC15Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC15DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC15DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC15Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC15Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC16Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC16DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC16DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC16Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC16Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC17Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC17DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC17DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC17Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC17Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC18Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC18DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC18DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC18Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC18Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC19Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC19DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC19DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC19Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC19Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const IC20Conf = enum {
    FOUTPOSTDIV1,
    FOUTPOSTDIV2,
    FOUTPOSTDIV3,
    FOUTPOSTDIV4,
};
pub const IC20DivConf = enum(comptime_int) {
    _,
    pub fn get(num: IC20DivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for IC20Div is 1\n");
        } else if (val > 256) {
            @compileError("min value for IC20Div is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const MCOMultConf = enum {
    HSIDivOutput,
    LSEOSC,
    MSIRC,
    LSIRC,
    HSEOSC,
    IC5Output,
    IC10Output,
    SYSAClkSource,
};
pub const MCODivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    DIV9,
    DIV10,
    DIV11,
    DIV12,
    DIV13,
    DIV14,
    DIV15,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
            .DIV9 => 9,
            .DIV10 => 10,
            .DIV11 => 11,
            .DIV12 => 12,
            .DIV13 => 13,
            .DIV14 => 14,
            .DIV15 => 15,
            .DIV16 => 16,
        };
    }
};
pub const MCO2MultConf = enum {
    HSIDivOutput,
    LSEOSC,
    MSIRC,
    LSIRC,
    HSEOSC,
    IC5Output,
    IC10Output,
    SYSBClkSource,
};
pub const MCO2DivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV3,
    DIV4,
    DIV5,
    DIV6,
    DIV7,
    DIV8,
    DIV9,
    DIV10,
    DIV11,
    DIV12,
    DIV13,
    DIV14,
    DIV15,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV3 => 3,
            .DIV4 => 4,
            .DIV5 => 5,
            .DIV6 => 6,
            .DIV7 => 7,
            .DIV8 => 8,
            .DIV9 => 9,
            .DIV10 => 10,
            .DIV11 => 11,
            .DIV12 => 12,
            .DIV13 => 13,
            .DIV14 => 14,
            .DIV15 => 15,
            .DIV16 => 16,
        };
    }
};
pub const CKPERSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC5Output,
    IC10Output,
    IC15Output,
    IC19Output,
    IC20Output,
};
pub const ADCMultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    TIMGOutput,
};
pub const ADCDIVConf = enum(comptime_int) {
    _,
    pub fn get(num: ADCDIVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for ADCDIV is 1\n");
        } else if (val > 256) {
            @compileError("min value for ADCDIV is 256\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 256;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const ADFMultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    TIMGOutput,
};
pub const MDF1MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    TIMGOutput,
};
pub const PSSIMultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC20Output,
    HSIDivOutput,
};
pub const FDCANMultConf = enum {
    APB1Output,
    CKPERoutput,
    IC19Output,
    HSEOSC,
};
pub const I2C1MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I2C2MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I2C3MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I2C4MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I3C1MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const I3C2MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC10Output,
    IC15Output,
    MSIRC,
    HSIDivOutput,
};
pub const LPTIM1MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LPTIM3MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LPTIM2MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LPTIM4MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LPTIM5MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC15Output,
    LSEOSC,
    LSIRC,
    TIMGOutput,
};
pub const LTDCMultConf = enum {
    APB5Output,
    CKPERoutput,
    IC16Output,
    HSIDivOutput,
};
pub const DCMIPPMultConf = enum {
    APB5Output,
    CKPERoutput,
    IC17Output,
    HSIDivOutput,
};
pub const FMCMultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC3Output,
    IC4Output,
};
pub const SAI1MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    SPDIFRX1Mult,
};
pub const SAI2MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
    SPDIFRX1Mult,
};
pub const USART1MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const USART2MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const USART3MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART4MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART5MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const USART6MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART7MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART8MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const UART9MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const LPUART1MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const USART10MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    LSEOSC,
    MSIRC,
    HSIDivOutput,
};
pub const SPI1MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC8Output,
    IC9Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const SPI2MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC8Output,
    IC9Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const SPI3MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC8Output,
    IC9Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const SPI4MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    MSIRC,
    HSIDivOutput,
    HSEOSC,
};
pub const SPI5MultConf = enum {
    APB2Output,
    CKPERoutput,
    IC9Output,
    IC14Output,
    MSIRC,
    HSIDivOutput,
    HSEOSC,
};
pub const SPI6MultConf = enum {
    APB4Output,
    CKPERoutput,
    IC8Output,
    IC9Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const XSPI1MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC3Output,
    IC4Output,
};
pub const XSPI2MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC3Output,
    IC4Output,
};
pub const OTGHS1MultConf = enum {
    OTGPHY1output,
    HSEOSCDIV,
};
pub const OTGHS2MultConf = enum {
    OTGPHY2output,
    HSEOSCDIV,
};
pub const XSPI3MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC3Output,
    IC4Output,
};
pub const OTGPHY1MultConf = enum {
    HSEOSCDIV,
    CKPERoutput,
    IC15Output,
    HSEDIV,
};
pub const OTGPHY2MultConf = enum {
    HSEOSCDIV,
    CKPERoutput,
    IC15Output,
    HSEDIV,
};
pub const SDMMC1MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC4Output,
    IC5Output,
};
pub const SDMMC2MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC4Output,
    IC5Output,
};
pub const ETH1MultConf = enum {
    AHBOutput,
    CKPERoutput,
    IC12Output,
    HSEOSC,
};
pub const SPDIFRX1MultConf = enum {
    APB1Output,
    CKPERoutput,
    IC7Output,
    IC8Output,
    MSIRC,
    HSIDivOutput,
    I2S_CKIN,
};
pub const SYSBClkSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC2Output,
};
pub const SYSCClkSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC6Output,
};
pub const SYSDClkSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC11Output,
};
pub const SYSAClkSourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    IC1Output,
};
pub const TPIUPrescalerConf = enum {
    const this = @This();
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV8 => 8,
        };
    }
};
pub const CortexPrescalerConf = enum {
    const this = @This();
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV8 => 8,
        };
    }
};
pub const HPREDivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    DIV32,
    DIV64,
    DIV128,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
            .DIV32 => 32,
            .DIV64 => 64,
            .DIV128 => 128,
        };
    }
};
pub const APB4DIVConf = enum {
    const this = @This();
    DIV1,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
        };
    }
};
pub const APB5DIVConf = enum {
    const this = @This();
    DIV1,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
        };
    }
};
pub const TIMGDIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
        };
    }
};
pub const APB1DIVConf = enum {
    const this = @This();
    DIV1,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
        };
    }
};
pub const APB2DIVConf = enum {
    const this = @This();
    DIV1,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
        };
    }
};
pub const PLL1SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const FREFDIV1Conf = enum(comptime_int) {
    _,
    pub fn get(num: FREFDIV1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for FREFDIV1 is 1\n");
        } else if (val > 63) {
            @compileError("min value for FREFDIV1 is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLL2SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const FREFDIV2Conf = enum(comptime_int) {
    _,
    pub fn get(num: FREFDIV2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for FREFDIV2 is 1\n");
        } else if (val > 63) {
            @compileError("min value for FREFDIV2 is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLL3SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const FREFDIV3Conf = enum(comptime_int) {
    _,
    pub fn get(num: FREFDIV3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for FREFDIV3 is 1\n");
        } else if (val > 63) {
            @compileError("min value for FREFDIV3 is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const PLL4SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
    I2S_CKIN,
};
pub const FREFDIV4Conf = enum(comptime_int) {
    _,
    pub fn get(num: FREFDIV4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for FREFDIV4 is 1\n");
        } else if (val > 63) {
            @compileError("min value for FREFDIV4 is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const FBDIV1Conf = enum(comptime_int) {
    _,
    pub fn get(num: FBDIV1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 10) {
            @compileError("min value for FBDIV1 is 10\n");
        } else if (val > 2500) {
            @compileError("min value for FBDIV1 is 2500\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 2500;
    }

    pub fn min() comptime_int {
        return 10;
    }
};
pub const PLL1FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL1FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL1FRACV is 0\n");
        } else if (val > 16777215) {
            @compileError("min value for PLL1FRACV is 16777215\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16777215;
    }

    pub fn min() comptime_int {
        return 0;
    }
};
pub const POSTDIV1_1Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV1_1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV1_1 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV1_1 is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const POSTDIV2_1Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV2_1Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV2_1 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV2_1 is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const FBDIV2Conf = enum(comptime_int) {
    _,
    pub fn get(num: FBDIV2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 20) {
            @compileError("min value for FBDIV2 is 20\n");
        } else if (val > 500) {
            @compileError("min value for FBDIV2 is 500\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 500;
    }

    pub fn min() comptime_int {
        return 20;
    }
};
pub const PLL2FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL2FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL2FRACV is 0\n");
        } else if (val > 16777215) {
            @compileError("min value for PLL2FRACV is 16777215\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16777215;
    }

    pub fn min() comptime_int {
        return 0;
    }
};
pub const POSTDIV1_2Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV1_2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV1_2 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV1_2 is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const POSTDIV2_2Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV2_2Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV2_2 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV2_2 is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const FBDIV3Conf = enum(comptime_int) {
    _,
    pub fn get(num: FBDIV3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 20) {
            @compileError("min value for FBDIV3 is 20\n");
        } else if (val > 500) {
            @compileError("min value for FBDIV3 is 500\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 500;
    }

    pub fn min() comptime_int {
        return 20;
    }
};
pub const PLL3FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL3FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL3FRACV is 0\n");
        } else if (val > 16777215) {
            @compileError("min value for PLL3FRACV is 16777215\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16777215;
    }

    pub fn min() comptime_int {
        return 0;
    }
};
pub const POSTDIV1_3Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV1_3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV1_3 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV1_3 is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const POSTDIV2_3Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV2_3Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV2_3 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV2_3 is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const FBDIV4Conf = enum(comptime_int) {
    _,
    pub fn get(num: FBDIV4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 20) {
            @compileError("min value for FBDIV4 is 20\n");
        } else if (val > 500) {
            @compileError("min value for FBDIV4 is 500\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 500;
    }

    pub fn min() comptime_int {
        return 20;
    }
};
pub const PLL4FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL4FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL4FRACV is 0\n");
        } else if (val > 16777215) {
            @compileError("min value for PLL4FRACV is 16777215\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 16777215;
    }

    pub fn min() comptime_int {
        return 0;
    }
};
pub const POSTDIV1_4Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV1_4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV1_4 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV1_4 is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const POSTDIV2_4Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV2_4Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV2_4 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV2_4 is 7\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 7;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const HSERTCDevisorConf = enum(comptime_int) {
    _,
    pub fn get(num: HSERTCDevisorConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 2) {
            @compileError("min value for HSERTCDevisor is 2\n");
        } else if (val > 63) {
            @compileError("min value for HSERTCDevisor is 63\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 63;
    }

    pub fn min() comptime_int {
        return 2;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const Config = struct {
    HSIDiv: HSIDivConf = .DIV1,
    HSIDiv4: HSIDiv4Conf = .DIV4,
    HSEOSC: HSEOSCConf = @enumFromInt(48000000),
    HSEOSCDIV: HSEOSCDIVConf = .DIV1,
    HSEDIV: HSEDIVConf = .DIV2,
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIRC: MSIRCConf = .CLOCK_16,
    IC1: IC1Conf = .FOUTPOSTDIV1,
    IC1Div: IC1DivConf = @enumFromInt(3),
    IC2: IC2Conf = .FOUTPOSTDIV1,
    IC2Div: IC2DivConf = @enumFromInt(4),
    IC3: IC3Conf = .FOUTPOSTDIV1,
    IC3Div: IC3DivConf = @enumFromInt(1),
    IC4: IC4Conf = .FOUTPOSTDIV1,
    IC4Div: IC4DivConf = @enumFromInt(1),
    IC5: IC5Conf = .FOUTPOSTDIV1,
    IC5Div: IC5DivConf = @enumFromInt(1),
    IC6: IC6Conf = .FOUTPOSTDIV1,
    IC6Div: IC6DivConf = @enumFromInt(4),
    IC7: IC7Conf = .FOUTPOSTDIV2,
    IC7Div: IC7DivConf = @enumFromInt(1),
    IC8: IC8Conf = .FOUTPOSTDIV2,
    IC8Div: IC8DivConf = @enumFromInt(1),
    IC9: IC9Conf = .FOUTPOSTDIV2,
    IC9Div: IC9DivConf = @enumFromInt(1),
    IC10: IC10Conf = .FOUTPOSTDIV2,
    IC10Div: IC10DivConf = @enumFromInt(1),
    IC11: IC11Conf = .FOUTPOSTDIV1,
    IC11Div: IC11DivConf = @enumFromInt(4),
    IC12: IC12Conf = .FOUTPOSTDIV3,
    IC12Div: IC12DivConf = @enumFromInt(1),
    IC13: IC13Conf = .FOUTPOSTDIV3,
    IC13Div: IC13DivConf = @enumFromInt(1),
    IC14: IC14Conf = .FOUTPOSTDIV3,
    IC14Div: IC14DivConf = @enumFromInt(1),
    IC15: IC15Conf = .FOUTPOSTDIV3,
    IC15Div: IC15DivConf = @enumFromInt(1),
    IC16: IC16Conf = .FOUTPOSTDIV4,
    IC16Div: IC16DivConf = @enumFromInt(1),
    IC17: IC17Conf = .FOUTPOSTDIV4,
    IC17Div: IC17DivConf = @enumFromInt(1),
    IC18: IC18Conf = .FOUTPOSTDIV4,
    IC18Div: IC18DivConf = @enumFromInt(1),
    IC19: IC19Conf = .FOUTPOSTDIV4,
    IC19Div: IC19DivConf = @enumFromInt(1),
    IC20: IC20Conf = .FOUTPOSTDIV4,
    IC20Div: IC20DivConf = @enumFromInt(1),
    MCOMult: MCOMultConf = .HSIDivOutput,
    MCODiv: MCODivConf = .DIV1,
    MCO2Mult: MCO2MultConf = .HSIDivOutput,
    MCO2Div: MCO2DivConf = .DIV1,
    CKPERSource: CKPERSourceConf = .HSIRC,
    ADCMult: ADCMultConf = .AHBOutput,
    ADCDIV: ADCDIVConf = @enumFromInt(1),
    ADFMult: ADFMultConf = .AHBOutput,
    MDF1Mult: MDF1MultConf = .AHBOutput,
    PSSIMult: PSSIMultConf = .AHBOutput,
    FDCANMult: FDCANMultConf = .APB1Output,
    I2C1Mult: I2C1MultConf = .APB1Output,
    I2C2Mult: I2C2MultConf = .APB1Output,
    I2C3Mult: I2C3MultConf = .APB1Output,
    I2C4Mult: I2C4MultConf = .APB1Output,
    I3C1Mult: I3C1MultConf = .APB1Output,
    I3C2Mult: I3C2MultConf = .APB1Output,
    LPTIM1Mult: LPTIM1MultConf = .APB1Output,
    LPTIM3Mult: LPTIM3MultConf = .APB4Output,
    LPTIM2Mult: LPTIM2MultConf = .APB4Output,
    LPTIM4Mult: LPTIM4MultConf = .APB4Output,
    LPTIM5Mult: LPTIM5MultConf = .APB4Output,
    LTDCMult: LTDCMultConf = .APB5Output,
    DCMIPPMult: DCMIPPMultConf = .APB5Output,
    FMCMult: FMCMultConf = .AHBOutput,
    SAI1Mult: SAI1MultConf = .APB2Output,
    SAI2Mult: SAI2MultConf = .APB2Output,
    USART1Mult: USART1MultConf = .APB2Output,
    USART2Mult: USART2MultConf = .APB1Output,
    USART3Mult: USART3MultConf = .APB1Output,
    UART4Mult: UART4MultConf = .APB1Output,
    UART5Mult: UART5MultConf = .APB1Output,
    USART6Mult: USART6MultConf = .APB2Output,
    UART7Mult: UART7MultConf = .APB1Output,
    UART8Mult: UART8MultConf = .APB1Output,
    UART9Mult: UART9MultConf = .APB2Output,
    LPUART1Mult: LPUART1MultConf = .APB4Output,
    USART10Mult: USART10MultConf = .APB2Output,
    SPI1Mult: SPI1MultConf = .APB2Output,
    SPI2Mult: SPI2MultConf = .APB1Output,
    SPI3Mult: SPI3MultConf = .APB1Output,
    SPI4Mult: SPI4MultConf = .APB2Output,
    SPI5Mult: SPI5MultConf = .APB2Output,
    SPI6Mult: SPI6MultConf = .APB4Output,
    XSPI1Mult: XSPI1MultConf = .AHBOutput,
    XSPI2Mult: XSPI2MultConf = .AHBOutput,
    OTGHS1Mult: OTGHS1MultConf = .OTGPHY1output,
    OTGHS2Mult: OTGHS2MultConf = .OTGPHY2output,
    XSPI3Mult: XSPI3MultConf = .AHBOutput,
    OTGPHY1Mult: OTGPHY1MultConf = .HSEDIV,
    OTGPHY2Mult: OTGPHY2MultConf = .HSEDIV,
    SDMMC1Mult: SDMMC1MultConf = .AHBOutput,
    SDMMC2Mult: SDMMC2MultConf = .AHBOutput,
    ETH1Mult: ETH1MultConf = .AHBOutput,
    SPDIFRX1Mult: SPDIFRX1MultConf = .APB1Output,
    SYSBClkSource: SYSBClkSourceConf = .HSIRC,
    SYSCClkSource: SYSCClkSourceConf = .HSIRC,
    SYSDClkSource: SYSDClkSourceConf = .HSIRC,
    SYSAClkSource: SYSAClkSourceConf = .HSIRC,
    TPIUPrescaler: TPIUPrescalerConf = .DIV8,
    CortexPrescaler: CortexPrescalerConf = .DIV8,
    HPREDiv: HPREDivConf = .DIV2,
    APB4DIV: APB4DIVConf = .DIV1,
    APB5DIV: APB5DIVConf = .DIV1,
    TIMGDIV: TIMGDIVConf = .DIV1,
    APB1DIV: APB1DIVConf = .DIV1,
    APB2DIV: APB2DIVConf = .DIV1,
    PLL1Source: PLL1SourceConf = .HSIRC,
    FREFDIV1: FREFDIV1Conf = @enumFromInt(1),
    PLL2Source: PLL2SourceConf = .HSIRC,
    FREFDIV2: FREFDIV2Conf = @enumFromInt(1),
    PLL3Source: PLL3SourceConf = .HSIRC,
    FREFDIV3: FREFDIV3Conf = @enumFromInt(1),
    PLL4Source: PLL4SourceConf = .HSIRC,
    FREFDIV4: FREFDIV4Conf = @enumFromInt(1),
    FBDIV1: FBDIV1Conf = @enumFromInt(25),
    PLL1FRACV: PLL1FRACVConf = @enumFromInt(0),
    POSTDIV1_1: POSTDIV1_1Conf = @enumFromInt(1),
    POSTDIV2_1: POSTDIV2_1Conf = @enumFromInt(1),
    FBDIV2: FBDIV2Conf = @enumFromInt(25),
    PLL2FRACV: PLL2FRACVConf = @enumFromInt(0),
    POSTDIV1_2: POSTDIV1_2Conf = @enumFromInt(1),
    POSTDIV2_2: POSTDIV2_2Conf = @enumFromInt(1),
    FBDIV3: FBDIV3Conf = @enumFromInt(25),
    PLL3FRACV: PLL3FRACVConf = @enumFromInt(0),
    POSTDIV1_3: POSTDIV1_3Conf = @enumFromInt(1),
    POSTDIV2_3: POSTDIV2_3Conf = @enumFromInt(1),
    FBDIV4: FBDIV4Conf = @enumFromInt(25),
    PLL4FRACV: PLL4FRACVConf = @enumFromInt(0),
    POSTDIV1_4: POSTDIV1_4Conf = @enumFromInt(1),
    POSTDIV2_4: POSTDIV2_4Conf = @enumFromInt(1),
    HSERTCDevisor: HSERTCDevisorConf = @enumFromInt(1),
    RTCClkSource: RTCClkSourceConf = .LSIRC,
};

pub fn Clock(comptime conf: Config) type {
    const ClockStruct = struct {
        const this = @This();

        const HSIRCType = struct {
            pub fn get(_: *const HSIRCType) comptime_int {
                return 64000000;
            }
        };
        const HSIDivType = struct {
            value: HSIDivConf,

            pub fn get(self: *const HSIDivType) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSIDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSIRC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const HSIDivOutputType = struct {
            pub fn get(_: *const HSIDivOutputType) comptime_int {
                return HSIDiv.get();
            }
        };
        const HSIDiv4Type = struct {
            value: HSIDiv4Conf,

            pub fn get(self: *const HSIDiv4Type) comptime_int {
                if (!@hasDecl(this, "HSIRC")) {
                    @compileError("No Input HSIRC for HSIDiv4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSIRC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const UCPDOutputType = struct {
            pub fn get(_: *const UCPDOutputType) comptime_int {
                const from_input = HSIDiv4.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from HSIDiv4 on UCPDOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 25000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from HSIDiv4 on UCPDOutput | recive {d} max 25000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HSEOSCType = struct {
            value: HSEOSCConf,
            pub fn get(comptime self: HSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const HSEOSCDIVType = struct {
            value: HSEOSCDIVConf,

            pub fn get(self: *const HSEOSCDIVType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSEOSCDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const HSEDIVType = struct {
            value: HSEDIVConf,

            pub fn get(self: *const HSEDIVType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSEDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const LSIRCType = struct {
            pub fn get(_: *const LSIRCType) comptime_int {
                return 32000;
            }
        };
        const LSEOSCType = struct {
            value: LSEOSCConf,
            pub fn get(comptime self: LSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const MSIRCType = struct {
            value: MSIRCConf,
            pub fn get(comptime self: MSIRCType) comptime_int {
                return self.value.get();
            }
        };
        const I2S_CKINType = struct {
            pub fn get(_: *const I2S_CKINType) comptime_int {
                return 12288000;
            }
        };
        const IC1Type = struct {
            value: IC1Conf,
            pub fn get(comptime self: IC1Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC1DivType = struct {
            value: IC1DivConf,

            pub fn get(self: *const IC1DivType) comptime_int {
                if (!@hasDecl(this, "IC1")) {
                    @compileError("No Input IC1 for IC1Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC1.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC1OutputType = struct {
            pub fn get(_: *const IC1OutputType) comptime_int {
                const from_input = IC1Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC1Div on IC1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC1Div on IC1Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC2Type = struct {
            value: IC2Conf,
            pub fn get(comptime self: IC2Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC2DivType = struct {
            value: IC2DivConf,

            pub fn get(self: *const IC2DivType) comptime_int {
                if (!@hasDecl(this, "IC2")) {
                    @compileError("No Input IC2 for IC2Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC2OutputType = struct {
            pub fn get(_: *const IC2OutputType) comptime_int {
                const from_input = IC2Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC2Div on IC2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC2Div on IC2Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC3Type = struct {
            value: IC3Conf,
            pub fn get(comptime self: IC3Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC3DivType = struct {
            value: IC3DivConf,

            pub fn get(self: *const IC3DivType) comptime_int {
                if (!@hasDecl(this, "IC3")) {
                    @compileError("No Input IC3 for IC3Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC3.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC3OutputType = struct {
            pub fn get(_: *const IC3OutputType) comptime_int {
                const from_input = IC3Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC3Div on IC3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC3Div on IC3Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC4Type = struct {
            value: IC4Conf,
            pub fn get(comptime self: IC4Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC4DivType = struct {
            value: IC4DivConf,

            pub fn get(self: *const IC4DivType) comptime_int {
                if (!@hasDecl(this, "IC4")) {
                    @compileError("No Input IC4 for IC4Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC4.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC4OutputType = struct {
            pub fn get(_: *const IC4OutputType) comptime_int {
                const from_input = IC4Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC4Div on IC4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC4Div on IC4Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC5Type = struct {
            value: IC5Conf,
            pub fn get(comptime self: IC5Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC5DivType = struct {
            value: IC5DivConf,

            pub fn get(self: *const IC5DivType) comptime_int {
                if (!@hasDecl(this, "IC5")) {
                    @compileError("No Input IC5 for IC5Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC5.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC5OutputType = struct {
            pub fn get(_: *const IC5OutputType) comptime_int {
                const from_input = IC5Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC5Div on IC5Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC5Div on IC5Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC6Type = struct {
            value: IC6Conf,
            pub fn get(comptime self: IC6Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC6DivType = struct {
            value: IC6DivConf,

            pub fn get(self: *const IC6DivType) comptime_int {
                if (!@hasDecl(this, "IC6")) {
                    @compileError("No Input IC6 for IC6Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC6.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC6OutputType = struct {
            pub fn get(_: *const IC6OutputType) comptime_int {
                const from_input = IC6Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC6Div on IC6Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC6Div on IC6Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC7Type = struct {
            value: IC7Conf,
            pub fn get(comptime self: IC7Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC7DivType = struct {
            value: IC7DivConf,

            pub fn get(self: *const IC7DivType) comptime_int {
                if (!@hasDecl(this, "IC7")) {
                    @compileError("No Input IC7 for IC7Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC7.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC7OutputType = struct {
            pub fn get(_: *const IC7OutputType) comptime_int {
                const from_input = IC7Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC7Div on IC7Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC7Div on IC7Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC8Type = struct {
            value: IC8Conf,
            pub fn get(comptime self: IC8Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC8DivType = struct {
            value: IC8DivConf,

            pub fn get(self: *const IC8DivType) comptime_int {
                if (!@hasDecl(this, "IC8")) {
                    @compileError("No Input IC8 for IC8Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC8.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC8OutputType = struct {
            pub fn get(_: *const IC8OutputType) comptime_int {
                const from_input = IC8Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC8Div on IC8Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC8Div on IC8Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC9Type = struct {
            value: IC9Conf,
            pub fn get(comptime self: IC9Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC9DivType = struct {
            value: IC9DivConf,

            pub fn get(self: *const IC9DivType) comptime_int {
                if (!@hasDecl(this, "IC9")) {
                    @compileError("No Input IC9 for IC9Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC9.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC9OutputType = struct {
            pub fn get(_: *const IC9OutputType) comptime_int {
                const from_input = IC9Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC9Div on IC9Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC9Div on IC9Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC10Type = struct {
            value: IC10Conf,
            pub fn get(comptime self: IC10Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC10DivType = struct {
            value: IC10DivConf,

            pub fn get(self: *const IC10DivType) comptime_int {
                if (!@hasDecl(this, "IC10")) {
                    @compileError("No Input IC10 for IC10Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC10.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC10OutputType = struct {
            pub fn get(_: *const IC10OutputType) comptime_int {
                const from_input = IC10Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC10Div on IC10Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC10Div on IC10Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC11Type = struct {
            value: IC11Conf,
            pub fn get(comptime self: IC11Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC11DivType = struct {
            value: IC11DivConf,

            pub fn get(self: *const IC11DivType) comptime_int {
                if (!@hasDecl(this, "IC11")) {
                    @compileError("No Input IC11 for IC11Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC11.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC11OutputType = struct {
            pub fn get(_: *const IC11OutputType) comptime_int {
                const from_input = IC11Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC11Div on IC11Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC11Div on IC11Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC12Type = struct {
            value: IC12Conf,
            pub fn get(comptime self: IC12Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC12DivType = struct {
            value: IC12DivConf,

            pub fn get(self: *const IC12DivType) comptime_int {
                if (!@hasDecl(this, "IC12")) {
                    @compileError("No Input IC12 for IC12Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC12.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC12OutputType = struct {
            pub fn get(_: *const IC12OutputType) comptime_int {
                const from_input = IC12Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC12Div on IC12Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC12Div on IC12Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC13Type = struct {
            value: IC13Conf,
            pub fn get(comptime self: IC13Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC13DivType = struct {
            value: IC13DivConf,

            pub fn get(self: *const IC13DivType) comptime_int {
                if (!@hasDecl(this, "IC13")) {
                    @compileError("No Input IC13 for IC13Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC13.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC13OutputType = struct {
            pub fn get(_: *const IC13OutputType) comptime_int {
                const from_input = IC13Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC13Div on IC13Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC13Div on IC13Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC14Type = struct {
            value: IC14Conf,
            pub fn get(comptime self: IC14Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC14DivType = struct {
            value: IC14DivConf,

            pub fn get(self: *const IC14DivType) comptime_int {
                if (!@hasDecl(this, "IC14")) {
                    @compileError("No Input IC14 for IC14Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC14.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC14OutputType = struct {
            pub fn get(_: *const IC14OutputType) comptime_int {
                const from_input = IC14Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC14Div on IC14Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC14Div on IC14Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC15Type = struct {
            value: IC15Conf,
            pub fn get(comptime self: IC15Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC15DivType = struct {
            value: IC15DivConf,

            pub fn get(self: *const IC15DivType) comptime_int {
                if (!@hasDecl(this, "IC15")) {
                    @compileError("No Input IC15 for IC15Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC15.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC15OutputType = struct {
            pub fn get(_: *const IC15OutputType) comptime_int {
                const from_input = IC15Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC15Div on IC15Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC15Div on IC15Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC16Type = struct {
            value: IC16Conf,
            pub fn get(comptime self: IC16Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC16DivType = struct {
            value: IC16DivConf,

            pub fn get(self: *const IC16DivType) comptime_int {
                if (!@hasDecl(this, "IC16")) {
                    @compileError("No Input IC16 for IC16Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC16.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC16OutputType = struct {
            pub fn get(_: *const IC16OutputType) comptime_int {
                const from_input = IC16Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC16Div on IC16Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC16Div on IC16Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC17Type = struct {
            value: IC17Conf,
            pub fn get(comptime self: IC17Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC17DivType = struct {
            value: IC17DivConf,

            pub fn get(self: *const IC17DivType) comptime_int {
                if (!@hasDecl(this, "IC17")) {
                    @compileError("No Input IC17 for IC17Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC17.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC17OutputType = struct {
            pub fn get(_: *const IC17OutputType) comptime_int {
                const from_input = IC17Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC17Div on IC17Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC17Div on IC17Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC18Type = struct {
            value: IC18Conf,
            pub fn get(comptime self: IC18Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC18DivType = struct {
            value: IC18DivConf,

            pub fn get(self: *const IC18DivType) comptime_int {
                if (!@hasDecl(this, "IC18")) {
                    @compileError("No Input IC18 for IC18Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC18.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC18OutputType = struct {
            pub fn get(_: *const IC18OutputType) comptime_int {
                const from_input = IC18Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC18Div on IC18Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC18Div on IC18Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC19Type = struct {
            value: IC19Conf,
            pub fn get(comptime self: IC19Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC19DivType = struct {
            value: IC19DivConf,

            pub fn get(self: *const IC19DivType) comptime_int {
                if (!@hasDecl(this, "IC19")) {
                    @compileError("No Input IC19 for IC19Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC19.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC19OutputType = struct {
            pub fn get(_: *const IC19OutputType) comptime_int {
                const from_input = IC19Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC19Div on IC19Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC19Div on IC19Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IC20Type = struct {
            value: IC20Conf,
            pub fn get(comptime self: IC20Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV1 => FOUTPOSTDIV1.get(),
                    .FOUTPOSTDIV2 => FOUTPOSTDIV2.get(),
                    .FOUTPOSTDIV3 => FOUTPOSTDIV3.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                };
            }
        };
        const IC20DivType = struct {
            value: IC20DivConf,

            pub fn get(self: *const IC20DivType) comptime_int {
                if (!@hasDecl(this, "IC20")) {
                    @compileError("No Input IC20 for IC20Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.IC20.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const IC20OutputType = struct {
            pub fn get(_: *const IC20OutputType) comptime_int {
                const from_input = IC20Div.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from IC20Div on IC20Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from IC20Div on IC20Output | recive {d} max 1600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const MCOMultType = struct {
            value: MCOMultConf,
            pub fn get(comptime self: MCOMultType) comptime_int {
                return switch (self.value) {
                    .HSIDivOutput => HSIDivOutput.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .LSIRC => LSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .IC5Output => IC5Output.get(),
                    .IC10Output => IC10Output.get(),
                    .SYSAClkSource => SYSAClkSource.get(),
                };
            }
        };
        const MCODivType = struct {
            value: MCODivConf,

            pub fn get(self: *const MCODivType) comptime_int {
                if (!@hasDecl(this, "MCOMult")) {
                    @compileError("No Input MCOMult for MCODiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCOMult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCOPinType = struct {
            pub fn get(_: *const MCOPinType) comptime_int {
                return MCODiv.get();
            }
        };
        const MCO2MultType = struct {
            value: MCO2MultConf,
            pub fn get(comptime self: MCO2MultType) comptime_int {
                return switch (self.value) {
                    .HSIDivOutput => HSIDivOutput.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .LSIRC => LSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .IC5Output => IC5Output.get(),
                    .IC10Output => IC10Output.get(),
                    .SYSBClkSource => SYSBClkSource.get(),
                };
            }
        };
        const MCO2DivType = struct {
            value: MCO2DivConf,

            pub fn get(self: *const MCO2DivType) comptime_int {
                if (!@hasDecl(this, "MCO2Mult")) {
                    @compileError("No Input MCO2Mult for MCO2Div\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCO2Mult.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const MCO2PinType = struct {
            pub fn get(_: *const MCO2PinType) comptime_int {
                return MCO2Div.get();
            }
        };
        const CKPERSourceType = struct {
            value: CKPERSourceConf,
            pub fn get(comptime self: CKPERSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .IC5Output => IC5Output.get(),
                    .IC10Output => IC10Output.get(),
                    .IC15Output => IC15Output.get(),
                    .IC19Output => IC19Output.get(),
                    .IC20Output => IC20Output.get(),
                };
            }
        };
        const CKPERoutputType = struct {
            pub fn get(_: *const CKPERoutputType) comptime_int {
                return CKPERSource.get();
            }
        };
        const ADCMultType = struct {
            value: ADCMultConf,
            pub fn get(comptime self: ADCMultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC7Output => IC7Output.get(),
                    .IC8Output => IC8Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .TIMGOutput => TIMGOutput.get(),
                };
            }
        };
        const ADCDIVType = struct {
            value: ADCDIVConf,

            pub fn get(self: *const ADCDIVType) comptime_int {
                if (!@hasDecl(this, "ADCMult")) {
                    @compileError("No Input ADCMult for ADCDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.ADCMult.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const ADCoutputType = struct {
            pub fn get(_: *const ADCoutputType) comptime_int {
                const from_input = ADCDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADCDIV on ADCoutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADCDIV on ADCoutput | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const ADFMultType = struct {
            value: ADFMultConf,
            pub fn get(comptime self: ADFMultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC7Output => IC7Output.get(),
                    .IC8Output => IC8Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .TIMGOutput => TIMGOutput.get(),
                };
            }
        };
        const ADFoutputType = struct {
            pub fn get(_: *const ADFoutputType) comptime_int {
                return ADFMult.get();
            }
        };
        const MDF1MultType = struct {
            value: MDF1MultConf,
            pub fn get(comptime self: MDF1MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC7Output => IC7Output.get(),
                    .IC8Output => IC8Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .TIMGOutput => TIMGOutput.get(),
                };
            }
        };
        const MDFoutputType = struct {
            pub fn get(_: *const MDFoutputType) comptime_int {
                return MDF1Mult.get();
            }
        };
        const PSSIMultType = struct {
            value: PSSIMultConf,
            pub fn get(comptime self: PSSIMultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC20Output => IC20Output.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const PSSIoutputType = struct {
            pub fn get(_: *const PSSIoutputType) comptime_int {
                return PSSIMult.get();
            }
        };
        const FDCANMultType = struct {
            value: FDCANMultConf,
            pub fn get(comptime self: FDCANMultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC19Output => IC19Output.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const FDCANoutputType = struct {
            pub fn get(_: *const FDCANoutputType) comptime_int {
                return FDCANMult.get();
            }
        };
        const I2C1MultType = struct {
            value: I2C1MultConf,
            pub fn get(comptime self: I2C1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC10Output => IC10Output.get(),
                    .IC15Output => IC15Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const I2C1outputType = struct {
            pub fn get(_: *const I2C1outputType) comptime_int {
                return I2C1Mult.get();
            }
        };
        const I2C2MultType = struct {
            value: I2C2MultConf,
            pub fn get(comptime self: I2C2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC10Output => IC10Output.get(),
                    .IC15Output => IC15Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const I2C2outputType = struct {
            pub fn get(_: *const I2C2outputType) comptime_int {
                return I2C2Mult.get();
            }
        };
        const I2C3MultType = struct {
            value: I2C3MultConf,
            pub fn get(comptime self: I2C3MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC10Output => IC10Output.get(),
                    .IC15Output => IC15Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const I2C3outputType = struct {
            pub fn get(_: *const I2C3outputType) comptime_int {
                return I2C3Mult.get();
            }
        };
        const I2C4MultType = struct {
            value: I2C4MultConf,
            pub fn get(comptime self: I2C4MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC10Output => IC10Output.get(),
                    .IC15Output => IC15Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const I2C4outputType = struct {
            pub fn get(_: *const I2C4outputType) comptime_int {
                return I2C4Mult.get();
            }
        };
        const I3C1MultType = struct {
            value: I3C1MultConf,
            pub fn get(comptime self: I3C1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC10Output => IC10Output.get(),
                    .IC15Output => IC15Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const I3C1outputType = struct {
            pub fn get(_: *const I3C1outputType) comptime_int {
                return I3C1Mult.get();
            }
        };
        const I3C2MultType = struct {
            value: I3C2MultConf,
            pub fn get(comptime self: I3C2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC10Output => IC10Output.get(),
                    .IC15Output => IC15Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const I3C2outputType = struct {
            pub fn get(_: *const I3C2outputType) comptime_int {
                return I3C2Mult.get();
            }
        };
        const LPTIM1MultType = struct {
            value: LPTIM1MultConf,
            pub fn get(comptime self: LPTIM1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC15Output => IC15Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .TIMGOutput => TIMGOutput.get(),
                };
            }
        };
        const LPTIM1outputType = struct {
            pub fn get(_: *const LPTIM1outputType) comptime_int {
                const from_input = LPTIM1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM1Mult on LPTIM1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM1Mult on LPTIM1output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM3MultType = struct {
            value: LPTIM3MultConf,
            pub fn get(comptime self: LPTIM3MultType) comptime_int {
                return switch (self.value) {
                    .APB4Output => APB4Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC15Output => IC15Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .TIMGOutput => TIMGOutput.get(),
                };
            }
        };
        const LPTIM3outputType = struct {
            pub fn get(_: *const LPTIM3outputType) comptime_int {
                const from_input = LPTIM3Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM3Mult on LPTIM3output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM3Mult on LPTIM3output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM2MultType = struct {
            value: LPTIM2MultConf,
            pub fn get(comptime self: LPTIM2MultType) comptime_int {
                return switch (self.value) {
                    .APB4Output => APB4Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC15Output => IC15Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .TIMGOutput => TIMGOutput.get(),
                };
            }
        };
        const LPTIM2outputType = struct {
            pub fn get(_: *const LPTIM2outputType) comptime_int {
                const from_input = LPTIM2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM2Mult on LPTIM2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM2Mult on LPTIM2output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM4MultType = struct {
            value: LPTIM4MultConf,
            pub fn get(comptime self: LPTIM4MultType) comptime_int {
                return switch (self.value) {
                    .APB4Output => APB4Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC15Output => IC15Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .TIMGOutput => TIMGOutput.get(),
                };
            }
        };
        const LPTIM4outputType = struct {
            pub fn get(_: *const LPTIM4outputType) comptime_int {
                const from_input = LPTIM4Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM4Mult on LPTIM4output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM4Mult on LPTIM4output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPTIM5MultType = struct {
            value: LPTIM5MultConf,
            pub fn get(comptime self: LPTIM5MultType) comptime_int {
                return switch (self.value) {
                    .APB4Output => APB4Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC15Output => IC15Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                    .TIMGOutput => TIMGOutput.get(),
                };
            }
        };
        const LPTIM5outputType = struct {
            pub fn get(_: *const LPTIM5outputType) comptime_int {
                const from_input = LPTIM5Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPTIM5Mult on LPTIM5output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPTIM5Mult on LPTIM5output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LTDCMultType = struct {
            value: LTDCMultConf,
            pub fn get(comptime self: LTDCMultType) comptime_int {
                return switch (self.value) {
                    .APB5Output => APB5Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC16Output => IC16Output.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const LTDCoutputType = struct {
            pub fn get(_: *const LTDCoutputType) comptime_int {
                return LTDCMult.get();
            }
        };
        const DCMIPPMultType = struct {
            value: DCMIPPMultConf,
            pub fn get(comptime self: DCMIPPMultType) comptime_int {
                return switch (self.value) {
                    .APB5Output => APB5Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC17Output => IC17Output.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const DCMIPPoutputType = struct {
            pub fn get(_: *const DCMIPPoutputType) comptime_int {
                return DCMIPPMult.get();
            }
        };
        const FMCMultType = struct {
            value: FMCMultConf,
            pub fn get(comptime self: FMCMultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC3Output => IC3Output.get(),
                    .IC4Output => IC4Output.get(),
                };
            }
        };
        const FMCoutputType = struct {
            pub fn get(_: *const FMCoutputType) comptime_int {
                return FMCMult.get();
            }
        };
        const SAI1MultType = struct {
            value: SAI1MultConf,
            pub fn get(comptime self: SAI1MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC7Output => IC7Output.get(),
                    .IC8Output => IC8Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .SPDIFRX1Mult => SPDIFRX1Mult.get(),
                };
            }
        };
        const SAI1outputType = struct {
            pub fn get(_: *const SAI1outputType) comptime_int {
                const from_input = SAI1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI1Mult on SAI1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI1Mult on SAI1output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SAI2MultType = struct {
            value: SAI2MultConf,
            pub fn get(comptime self: SAI2MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC7Output => IC7Output.get(),
                    .IC8Output => IC8Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .SPDIFRX1Mult => SPDIFRX1Mult.get(),
                };
            }
        };
        const SAI2outputType = struct {
            pub fn get(_: *const SAI2outputType) comptime_int {
                const from_input = SAI2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SAI2Mult on SAI2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SAI2Mult on SAI2output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART1MultType = struct {
            value: USART1MultConf,
            pub fn get(comptime self: USART1MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const USART1outputType = struct {
            pub fn get(_: *const USART1outputType) comptime_int {
                const from_input = USART1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART1Mult on USART1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART1Mult on USART1output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART2MultType = struct {
            value: USART2MultConf,
            pub fn get(comptime self: USART2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const USART2outputType = struct {
            pub fn get(_: *const USART2outputType) comptime_int {
                const from_input = USART2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART2Mult on USART2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART2Mult on USART2output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART3MultType = struct {
            value: USART3MultConf,
            pub fn get(comptime self: USART3MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const USART3outputType = struct {
            pub fn get(_: *const USART3outputType) comptime_int {
                const from_input = USART3Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART3Mult on USART3output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART3Mult on USART3output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const UART4MultType = struct {
            value: UART4MultConf,
            pub fn get(comptime self: UART4MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const UART4outputType = struct {
            pub fn get(_: *const UART4outputType) comptime_int {
                const from_input = UART4Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from UART4Mult on UART4output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from UART4Mult on UART4output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const UART5MultType = struct {
            value: UART5MultConf,
            pub fn get(comptime self: UART5MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const UART5outputType = struct {
            pub fn get(_: *const UART5outputType) comptime_int {
                const from_input = UART5Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from UART5Mult on UART5output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from UART5Mult on UART5output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART6MultType = struct {
            value: USART6MultConf,
            pub fn get(comptime self: USART6MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const USART6outputType = struct {
            pub fn get(_: *const USART6outputType) comptime_int {
                const from_input = USART6Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART6Mult on USART6output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART6Mult on USART6output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const UART7MultType = struct {
            value: UART7MultConf,
            pub fn get(comptime self: UART7MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const UART7outputType = struct {
            pub fn get(_: *const UART7outputType) comptime_int {
                const from_input = UART7Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from UART7Mult on UART7output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from UART7Mult on UART7output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const UART8MultType = struct {
            value: UART8MultConf,
            pub fn get(comptime self: UART8MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const UART8outputType = struct {
            pub fn get(_: *const UART8outputType) comptime_int {
                const from_input = UART8Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from UART8Mult on UART8output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from UART8Mult on UART8output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const UART9MultType = struct {
            value: UART9MultConf,
            pub fn get(comptime self: UART9MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const UART9outputType = struct {
            pub fn get(_: *const UART9outputType) comptime_int {
                const from_input = UART9Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from UART9Mult on UART9output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from UART9Mult on UART9output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const LPUART1MultType = struct {
            value: LPUART1MultConf,
            pub fn get(comptime self: LPUART1MultType) comptime_int {
                return switch (self.value) {
                    .APB4Output => APB4Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const LPUART1outputType = struct {
            pub fn get(_: *const LPUART1outputType) comptime_int {
                const from_input = LPUART1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from LPUART1Mult on LPUART1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from LPUART1Mult on LPUART1output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USART10MultType = struct {
            value: USART10MultConf,
            pub fn get(comptime self: USART10MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .LSEOSC => LSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                };
            }
        };
        const USART10outputType = struct {
            pub fn get(_: *const USART10outputType) comptime_int {
                const from_input = USART10Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USART10Mult on USART10output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USART10Mult on USART10output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI1MultType = struct {
            value: SPI1MultConf,
            pub fn get(comptime self: SPI1MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC8Output => IC8Output.get(),
                    .IC9Output => IC9Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const SPI1outputType = struct {
            pub fn get(_: *const SPI1outputType) comptime_int {
                const from_input = SPI1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI1Mult on SPI1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI1Mult on SPI1output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI2MultType = struct {
            value: SPI2MultConf,
            pub fn get(comptime self: SPI2MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC8Output => IC8Output.get(),
                    .IC9Output => IC9Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const SPI2outputType = struct {
            pub fn get(_: *const SPI2outputType) comptime_int {
                const from_input = SPI2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI2Mult on SPI2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI2Mult on SPI2output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI3MultType = struct {
            value: SPI3MultConf,
            pub fn get(comptime self: SPI3MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC8Output => IC8Output.get(),
                    .IC9Output => IC9Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const SPI3outputType = struct {
            pub fn get(_: *const SPI3outputType) comptime_int {
                const from_input = SPI3Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI3Mult on SPI3output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI3Mult on SPI3output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI4MultType = struct {
            value: SPI4MultConf,
            pub fn get(comptime self: SPI4MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const SPI4outputType = struct {
            pub fn get(_: *const SPI4outputType) comptime_int {
                const from_input = SPI4Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI4Mult on SPI4output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI4Mult on SPI4output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI5MultType = struct {
            value: SPI5MultConf,
            pub fn get(comptime self: SPI5MultType) comptime_int {
                return switch (self.value) {
                    .APB2Output => APB2Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC9Output => IC9Output.get(),
                    .IC14Output => IC14Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const SPI5outputType = struct {
            pub fn get(_: *const SPI5outputType) comptime_int {
                const from_input = SPI5Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI5Mult on SPI5output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI5Mult on SPI5output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SPI6MultType = struct {
            value: SPI6MultConf,
            pub fn get(comptime self: SPI6MultType) comptime_int {
                return switch (self.value) {
                    .APB4Output => APB4Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC8Output => IC8Output.get(),
                    .IC9Output => IC9Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const SPI6outputType = struct {
            pub fn get(_: *const SPI6outputType) comptime_int {
                const from_input = SPI6Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPI6Mult on SPI6output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPI6Mult on SPI6output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XSPI1MultType = struct {
            value: XSPI1MultConf,
            pub fn get(comptime self: XSPI1MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC3Output => IC3Output.get(),
                    .IC4Output => IC4Output.get(),
                };
            }
        };
        const XSPI1outputType = struct {
            pub fn get(_: *const XSPI1outputType) comptime_int {
                return XSPI1Mult.get();
            }
        };
        const XSPI2MultType = struct {
            value: XSPI2MultConf,
            pub fn get(comptime self: XSPI2MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC3Output => IC3Output.get(),
                    .IC4Output => IC4Output.get(),
                };
            }
        };
        const XSPI2outputType = struct {
            pub fn get(_: *const XSPI2outputType) comptime_int {
                return XSPI2Mult.get();
            }
        };
        const OTGHS1MultType = struct {
            value: OTGHS1MultConf,
            pub fn get(comptime self: OTGHS1MultType) comptime_int {
                return switch (self.value) {
                    .OTGPHY1output => OTGPHY1output.get(),
                    .HSEOSCDIV => HSEOSCDIV.get(),
                };
            }
        };
        const OTGHS1outputType = struct {
            pub fn get(_: *const OTGHS1outputType) comptime_int {
                const from_input = OTGHS1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from OTGHS1Mult on OTGHS1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 60000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from OTGHS1Mult on OTGHS1output | recive {d} max 60000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const OTGHS2MultType = struct {
            value: OTGHS2MultConf,
            pub fn get(comptime self: OTGHS2MultType) comptime_int {
                return switch (self.value) {
                    .OTGPHY2output => OTGPHY2output.get(),
                    .HSEOSCDIV => HSEOSCDIV.get(),
                };
            }
        };
        const OTGHS2outputType = struct {
            pub fn get(_: *const OTGHS2outputType) comptime_int {
                const from_input = OTGHS2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from OTGHS2Mult on OTGHS2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 60000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from OTGHS2Mult on OTGHS2output | recive {d} max 60000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XSPI3MultType = struct {
            value: XSPI3MultConf,
            pub fn get(comptime self: XSPI3MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC3Output => IC3Output.get(),
                    .IC4Output => IC4Output.get(),
                };
            }
        };
        const XSPI3outputType = struct {
            pub fn get(_: *const XSPI3outputType) comptime_int {
                return XSPI3Mult.get();
            }
        };
        const OTGPHY1MultType = struct {
            value: OTGPHY1MultConf,
            pub fn get(comptime self: OTGPHY1MultType) comptime_int {
                return switch (self.value) {
                    .HSEOSCDIV => HSEOSCDIV.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC15Output => IC15Output.get(),
                    .HSEDIV => HSEDIV.get(),
                };
            }
        };
        const OTGPHY1outputType = struct {
            pub fn get(_: *const OTGPHY1outputType) comptime_int {
                return OTGPHY1Mult.get();
            }
        };
        const OTGPHY2MultType = struct {
            value: OTGPHY2MultConf,
            pub fn get(comptime self: OTGPHY2MultType) comptime_int {
                return switch (self.value) {
                    .HSEOSCDIV => HSEOSCDIV.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC15Output => IC15Output.get(),
                    .HSEDIV => HSEDIV.get(),
                };
            }
        };
        const OTGPHY2outputType = struct {
            pub fn get(_: *const OTGPHY2outputType) comptime_int {
                return OTGPHY2Mult.get();
            }
        };
        const SDMMC1MultType = struct {
            value: SDMMC1MultConf,
            pub fn get(comptime self: SDMMC1MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC4Output => IC4Output.get(),
                    .IC5Output => IC5Output.get(),
                };
            }
        };
        const SDMMC1outputType = struct {
            pub fn get(_: *const SDMMC1outputType) comptime_int {
                const from_input = SDMMC1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMC1Mult on SDMMC1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 208000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMC1Mult on SDMMC1output | recive {d} max 208000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SDMMC2MultType = struct {
            value: SDMMC2MultConf,
            pub fn get(comptime self: SDMMC2MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC4Output => IC4Output.get(),
                    .IC5Output => IC5Output.get(),
                };
            }
        };
        const SDMMC2outputType = struct {
            pub fn get(_: *const SDMMC2outputType) comptime_int {
                const from_input = SDMMC2Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SDMMC2Mult on SDMMC2output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 208000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SDMMC2Mult on SDMMC2output | recive {d} max 208000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const ETH1MultType = struct {
            value: ETH1MultConf,
            pub fn get(comptime self: ETH1MultType) comptime_int {
                return switch (self.value) {
                    .AHBOutput => AHBOutput.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC12Output => IC12Output.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const ETH1outputType = struct {
            pub fn get(_: *const ETH1outputType) comptime_int {
                return ETH1Mult.get();
            }
        };
        const SPDIFRX1MultType = struct {
            value: SPDIFRX1MultConf,
            pub fn get(comptime self: SPDIFRX1MultType) comptime_int {
                return switch (self.value) {
                    .APB1Output => APB1Output.get(),
                    .CKPERoutput => CKPERoutput.get(),
                    .IC7Output => IC7Output.get(),
                    .IC8Output => IC8Output.get(),
                    .MSIRC => MSIRC.get(),
                    .HSIDivOutput => HSIDivOutput.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const SPDIFRX1outputType = struct {
            pub fn get(_: *const SPDIFRX1outputType) comptime_int {
                const from_input = SPDIFRX1Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SPDIFRX1Mult on SPDIFRX1output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SPDIFRX1Mult on SPDIFRX1output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SYSBClkSourceType = struct {
            value: SYSBClkSourceConf,
            pub fn get(comptime self: SYSBClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .IC2Output => IC2Output.get(),
                };
            }
        };
        const SYSCClkSourceType = struct {
            value: SYSCClkSourceConf,
            pub fn get(comptime self: SYSCClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .IC6Output => IC6Output.get(),
                };
            }
        };
        const SYSDClkSourceType = struct {
            value: SYSDClkSourceConf,
            pub fn get(comptime self: SYSDClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .IC11Output => IC11Output.get(),
                };
            }
        };
        const SYSBCLKOutputType = struct {
            pub fn get(_: *const SYSBCLKOutputType) comptime_int {
                const from_input = SYSBClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SYSBClkSource on SYSBCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 800000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SYSBClkSource on SYSBCLKOutput | recive {d} max 800000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SYSCCLKOutputType = struct {
            pub fn get(_: *const SYSCCLKOutputType) comptime_int {
                const from_input = SYSCClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SYSCClkSource on SYSCCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 1000000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SYSCClkSource on SYSCCLKOutput | recive {d} max 1000000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SYSDCLKOutputType = struct {
            pub fn get(_: *const SYSDCLKOutputType) comptime_int {
                const from_input = SYSDClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SYSDClkSource on SYSDCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 800000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SYSDClkSource on SYSDCLKOutput | recive {d} max 800000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SYSAClkSourceType = struct {
            value: SYSAClkSourceConf,
            pub fn get(comptime self: SYSAClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .IC1Output => IC1Output.get(),
                };
            }
        };
        const TPIUPrescalerType = struct {
            value: TPIUPrescalerConf,

            pub fn get(self: *const TPIUPrescalerType) comptime_int {
                if (!@hasDecl(this, "SYSAClkSource")) {
                    @compileError("No Input SYSAClkSource for TPIUPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SYSAClkSource.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const TPIUOutputType = struct {
            pub fn get(_: *const TPIUOutputType) comptime_int {
                return TPIUPrescaler.get();
            }
        };
        const CortexPrescalerType = struct {
            value: CortexPrescalerConf,

            pub fn get(self: *const CortexPrescalerType) comptime_int {
                if (!@hasDecl(this, "SYSAClkSource")) {
                    @compileError("No Input SYSAClkSource for CortexPrescaler\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SYSAClkSource.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const CortexSysOutputType = struct {
            pub fn get(_: *const CortexSysOutputType) comptime_int {
                return CortexPrescaler.get();
            }
        };
        const CpuClockOutputType = struct {
            pub fn get(_: *const CpuClockOutputType) comptime_int {
                const from_input = SYSAClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SYSAClkSource on CpuClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 800000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SYSAClkSource on CpuClockOutput | recive {d} max 800000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AXIClockOutputType = struct {
            pub fn get(_: *const AXIClockOutputType) comptime_int {
                const from_input = SYSBClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SYSBClkSource on AXIClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 800000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SYSBClkSource on AXIClockOutput | recive {d} max 800000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HPREDivType = struct {
            value: HPREDivConf,

            pub fn get(self: *const HPREDivType) comptime_int {
                if (!@hasDecl(this, "SYSBCLKOutput")) {
                    @compileError("No Input SYSBCLKOutput for HPREDiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SYSBCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB4DIVType = struct {
            value: APB4DIVConf,

            pub fn get(self: *const APB4DIVType) comptime_int {
                if (!@hasDecl(this, "HPREDiv")) {
                    @compileError("No Input HPREDiv for APB4DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HPREDiv.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB4OutputType = struct {
            pub fn get(_: *const APB4OutputType) comptime_int {
                const from_input = APB4DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB4DIV on APB4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB4DIV on APB4Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB5DIVType = struct {
            value: APB5DIVConf,

            pub fn get(self: *const APB5DIVType) comptime_int {
                if (!@hasDecl(this, "HPREDiv")) {
                    @compileError("No Input HPREDiv for APB5DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HPREDiv.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB5OutputType = struct {
            pub fn get(_: *const APB5OutputType) comptime_int {
                const from_input = APB5DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB5DIV on APB5Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB5DIV on APB5Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const TIMGDIVType = struct {
            value: TIMGDIVConf,

            pub fn get(self: *const TIMGDIVType) comptime_int {
                if (!@hasDecl(this, "SYSBCLKOutput")) {
                    @compileError("No Input SYSBCLKOutput for TIMGDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SYSBCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const TIMGOutputType = struct {
            pub fn get(_: *const TIMGOutputType) comptime_int {
                const from_input = TIMGDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from TIMGDIV on TIMGOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from TIMGDIV on TIMGOutput | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB1DIVType = struct {
            value: APB1DIVConf,

            pub fn get(self: *const APB1DIVType) comptime_int {
                if (!@hasDecl(this, "HPREDiv")) {
                    @compileError("No Input HPREDiv for APB1DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HPREDiv.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = HPREDiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from HPREDiv on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from HPREDiv on AHBOutput | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB1OutputType = struct {
            pub fn get(_: *const APB1OutputType) comptime_int {
                const from_input = APB1DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB1DIV on APB1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1DIV on APB1Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB2DIVType = struct {
            value: APB2DIVConf,

            pub fn get(self: *const APB2DIVType) comptime_int {
                if (!@hasDecl(this, "HPREDiv")) {
                    @compileError("No Input HPREDiv for APB2DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HPREDiv.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB2OutputType = struct {
            pub fn get(_: *const APB2OutputType) comptime_int {
                const from_input = APB2DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB2DIV on APB2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2DIV on APB2Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLL1SourceType = struct {
            value: PLL1SourceConf,
            pub fn get(comptime self: PLL1SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const FREFDIV1Type = struct {
            value: FREFDIV1Conf,

            pub fn get(self: *const FREFDIV1Type) comptime_int {
                if (!@hasDecl(this, "PLL1Source")) {
                    @compileError("No Input PLL1Source for FREFDIV1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL1Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL2SourceType = struct {
            value: PLL2SourceConf,
            pub fn get(comptime self: PLL2SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const FREFDIV2Type = struct {
            value: FREFDIV2Conf,

            pub fn get(self: *const FREFDIV2Type) comptime_int {
                if (!@hasDecl(this, "PLL2Source")) {
                    @compileError("No Input PLL2Source for FREFDIV2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL2Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL3SourceType = struct {
            value: PLL3SourceConf,
            pub fn get(comptime self: PLL3SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const FREFDIV3Type = struct {
            value: FREFDIV3Conf,

            pub fn get(self: *const FREFDIV3Type) comptime_int {
                if (!@hasDecl(this, "PLL3Source")) {
                    @compileError("No Input PLL3Source for FREFDIV3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL3Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const PLL4SourceType = struct {
            value: PLL4SourceConf,
            pub fn get(comptime self: PLL4SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const FREFDIV4Type = struct {
            value: FREFDIV4Conf,

            pub fn get(self: *const FREFDIV4Type) comptime_int {
                if (!@hasDecl(this, "PLL4Source")) {
                    @compileError("No Input PLL4Source for FREFDIV4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL4Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FBDIV1Type = struct {
            value: FBDIV1Conf,

            pub fn get(self: *const FBDIV1Type) comptime_int {
                if (!@hasDecl(this, "FREFDIV1")) {
                    @compileError("No Input FREFDIV1 for FBDIV1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FREFDIV1.get());
                const multi = self.value.get();
                return @intFromFloat(from_input * multi);
            }
        };

        const PLL1FRACVType = struct {
            value: PLL1FRACVConf,
            pub fn get(comptime self: PLL1FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const POSTDIV1_1Type = struct {
            value: POSTDIV1_1Conf,

            pub fn get(self: *const POSTDIV1_1Type) comptime_int {
                if (!@hasDecl(this, "FBDIV1")) {
                    @compileError("No Input FBDIV1 for POSTDIV1_1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FBDIV1.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const POSTDIV2_1Type = struct {
            value: POSTDIV2_1Conf,

            pub fn get(self: *const POSTDIV2_1Type) comptime_int {
                if (!@hasDecl(this, "POSTDIV1_1")) {
                    @compileError("No Input POSTDIV1_1 for POSTDIV2_1\n");
                }
                const from_input: comptime_float = @floatFromInt(this.POSTDIV1_1.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FOUTPOSTDIV1Type = struct {
            pub fn get(_: *const FOUTPOSTDIV1Type) comptime_int {
                const from_input = POSTDIV2_1.get();
                if (from_input < 16000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from POSTDIV2_1 on FOUTPOSTDIV1 | recive {d} min 16000000\n", .{from_input}));
                } else if (from_input > 3200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from POSTDIV2_1 on FOUTPOSTDIV1 | recive {d} max 3200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FBDIV2Type = struct {
            value: FBDIV2Conf,

            pub fn get(self: *const FBDIV2Type) comptime_int {
                if (!@hasDecl(this, "FREFDIV2")) {
                    @compileError("No Input FREFDIV2 for FBDIV2\n");
                } else if (!@hasDecl(this, "PLL2FRACV")) {
                    @compileError("No fractional  value: PLL2FRACV for FBDIV2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FREFDIV2.get());
                const frac: comptime_float = @floatFromInt(this.PLL2FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL2FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL2FRACVType = struct {
            value: PLL2FRACVConf,
            pub fn get(comptime self: PLL2FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const POSTDIV1_2Type = struct {
            value: POSTDIV1_2Conf,

            pub fn get(self: *const POSTDIV1_2Type) comptime_int {
                if (!@hasDecl(this, "FBDIV2")) {
                    @compileError("No Input FBDIV2 for POSTDIV1_2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FBDIV2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const POSTDIV2_2Type = struct {
            value: POSTDIV2_2Conf,

            pub fn get(self: *const POSTDIV2_2Type) comptime_int {
                if (!@hasDecl(this, "POSTDIV1_2")) {
                    @compileError("No Input POSTDIV1_2 for POSTDIV2_2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.POSTDIV1_2.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FOUTPOSTDIV2Type = struct {
            pub fn get(_: *const FOUTPOSTDIV2Type) comptime_int {
                const from_input = POSTDIV2_2.get();
                if (from_input < 16000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from POSTDIV2_2 on FOUTPOSTDIV2 | recive {d} min 16000000\n", .{from_input}));
                } else if (from_input > 3200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from POSTDIV2_2 on FOUTPOSTDIV2 | recive {d} max 3200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FBDIV3Type = struct {
            value: FBDIV3Conf,

            pub fn get(self: *const FBDIV3Type) comptime_int {
                if (!@hasDecl(this, "FREFDIV3")) {
                    @compileError("No Input FREFDIV3 for FBDIV3\n");
                } else if (!@hasDecl(this, "PLL3FRACV")) {
                    @compileError("No fractional  value: PLL3FRACV for FBDIV3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FREFDIV3.get());
                const frac: comptime_float = @floatFromInt(this.PLL3FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL3FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL3FRACVType = struct {
            value: PLL3FRACVConf,
            pub fn get(comptime self: PLL3FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const POSTDIV1_3Type = struct {
            value: POSTDIV1_3Conf,

            pub fn get(self: *const POSTDIV1_3Type) comptime_int {
                if (!@hasDecl(this, "FBDIV3")) {
                    @compileError("No Input FBDIV3 for POSTDIV1_3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FBDIV3.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const POSTDIV2_3Type = struct {
            value: POSTDIV2_3Conf,

            pub fn get(self: *const POSTDIV2_3Type) comptime_int {
                if (!@hasDecl(this, "POSTDIV1_3")) {
                    @compileError("No Input POSTDIV1_3 for POSTDIV2_3\n");
                }
                const from_input: comptime_float = @floatFromInt(this.POSTDIV1_3.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FOUTPOSTDIV3Type = struct {
            pub fn get(_: *const FOUTPOSTDIV3Type) comptime_int {
                const from_input = POSTDIV2_3.get();
                if (from_input < 16000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from POSTDIV2_3 on FOUTPOSTDIV3 | recive {d} min 16000000\n", .{from_input}));
                } else if (from_input > 3200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from POSTDIV2_3 on FOUTPOSTDIV3 | recive {d} max 3200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const FBDIV4Type = struct {
            value: FBDIV4Conf,

            pub fn get(self: *const FBDIV4Type) comptime_int {
                if (!@hasDecl(this, "FREFDIV4")) {
                    @compileError("No Input FREFDIV4 for FBDIV4\n");
                } else if (!@hasDecl(this, "PLL4FRACV")) {
                    @compileError("No fractional  value: PLL4FRACV for FBDIV4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FREFDIV4.get());
                const frac: comptime_float = @floatFromInt(this.PLL4FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL4FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL4FRACVType = struct {
            value: PLL4FRACVConf,
            pub fn get(comptime self: PLL4FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const POSTDIV1_4Type = struct {
            value: POSTDIV1_4Conf,

            pub fn get(self: *const POSTDIV1_4Type) comptime_int {
                if (!@hasDecl(this, "FBDIV4")) {
                    @compileError("No Input FBDIV4 for POSTDIV1_4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FBDIV4.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const POSTDIV2_4Type = struct {
            value: POSTDIV2_4Conf,

            pub fn get(self: *const POSTDIV2_4Type) comptime_int {
                if (!@hasDecl(this, "POSTDIV1_4")) {
                    @compileError("No Input POSTDIV1_4 for POSTDIV2_4\n");
                }
                const from_input: comptime_float = @floatFromInt(this.POSTDIV1_4.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FOUTPOSTDIV4Type = struct {
            pub fn get(_: *const FOUTPOSTDIV4Type) comptime_int {
                const from_input = POSTDIV2_4.get();
                if (from_input < 16000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from POSTDIV2_4 on FOUTPOSTDIV4 | recive {d} min 16000000\n", .{from_input}));
                } else if (from_input > 3200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from POSTDIV2_4 on FOUTPOSTDIV4 | recive {d} max 3200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const HSERTCDevisorType = struct {
            value: HSERTCDevisorConf,

            pub fn get(self: *const HSERTCDevisorType) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSERTCDevisor\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const RTCClkSourceType = struct {
            value: RTCClkSourceConf,
            pub fn get(comptime self: RTCClkSourceType) comptime_int {
                return switch (self.value) {
                    .HSERTCDevisor => HSERTCDevisor.get(),
                    .LSEOSC => LSEOSC.get(),
                    .LSIRC => LSIRC.get(),
                };
            }
        };
        const RTCOutputType = struct {
            pub fn get(_: *const RTCOutputType) comptime_int {
                const from_input = RTCClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from RTCClkSource on RTCOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 4000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from RTCClkSource on RTCOutput | recive {d} max 4000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const IWDGOutputType = struct {
            pub fn get(_: *const IWDGOutputType) comptime_int {
                return LSIRC.get();
            }
        };
        const HSIRC = HSIRCType{};
        const HSIDiv = HSIDivType{ .value = conf.HSIDiv };
        pub const HSIDivOutput = HSIDivOutputType{};
        const HSIDiv4 = HSIDiv4Type{ .value = conf.HSIDiv4 };
        pub const UCPDOutput = UCPDOutputType{};
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const HSEOSCDIV = HSEOSCDIVType{ .value = conf.HSEOSCDIV };
        const HSEDIV = HSEDIVType{ .value = conf.HSEDIV };
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const MSIRC = MSIRCType{ .value = conf.MSIRC };
        const I2S_CKIN = I2S_CKINType{};
        const IC1 = IC1Type{ .value = conf.IC1 };
        const IC1Div = IC1DivType{ .value = conf.IC1Div };
        pub const IC1Output = IC1OutputType{};
        const IC2 = IC2Type{ .value = conf.IC2 };
        const IC2Div = IC2DivType{ .value = conf.IC2Div };
        pub const IC2Output = IC2OutputType{};
        const IC3 = IC3Type{ .value = conf.IC3 };
        const IC3Div = IC3DivType{ .value = conf.IC3Div };
        pub const IC3Output = IC3OutputType{};
        const IC4 = IC4Type{ .value = conf.IC4 };
        const IC4Div = IC4DivType{ .value = conf.IC4Div };
        pub const IC4Output = IC4OutputType{};
        const IC5 = IC5Type{ .value = conf.IC5 };
        const IC5Div = IC5DivType{ .value = conf.IC5Div };
        pub const IC5Output = IC5OutputType{};
        const IC6 = IC6Type{ .value = conf.IC6 };
        const IC6Div = IC6DivType{ .value = conf.IC6Div };
        pub const IC6Output = IC6OutputType{};
        const IC7 = IC7Type{ .value = conf.IC7 };
        const IC7Div = IC7DivType{ .value = conf.IC7Div };
        pub const IC7Output = IC7OutputType{};
        const IC8 = IC8Type{ .value = conf.IC8 };
        const IC8Div = IC8DivType{ .value = conf.IC8Div };
        pub const IC8Output = IC8OutputType{};
        const IC9 = IC9Type{ .value = conf.IC9 };
        const IC9Div = IC9DivType{ .value = conf.IC9Div };
        pub const IC9Output = IC9OutputType{};
        const IC10 = IC10Type{ .value = conf.IC10 };
        const IC10Div = IC10DivType{ .value = conf.IC10Div };
        pub const IC10Output = IC10OutputType{};
        const IC11 = IC11Type{ .value = conf.IC11 };
        const IC11Div = IC11DivType{ .value = conf.IC11Div };
        pub const IC11Output = IC11OutputType{};
        const IC12 = IC12Type{ .value = conf.IC12 };
        const IC12Div = IC12DivType{ .value = conf.IC12Div };
        pub const IC12Output = IC12OutputType{};
        const IC13 = IC13Type{ .value = conf.IC13 };
        const IC13Div = IC13DivType{ .value = conf.IC13Div };
        pub const IC13Output = IC13OutputType{};
        const IC14 = IC14Type{ .value = conf.IC14 };
        const IC14Div = IC14DivType{ .value = conf.IC14Div };
        pub const IC14Output = IC14OutputType{};
        const IC15 = IC15Type{ .value = conf.IC15 };
        const IC15Div = IC15DivType{ .value = conf.IC15Div };
        pub const IC15Output = IC15OutputType{};
        const IC16 = IC16Type{ .value = conf.IC16 };
        const IC16Div = IC16DivType{ .value = conf.IC16Div };
        pub const IC16Output = IC16OutputType{};
        const IC17 = IC17Type{ .value = conf.IC17 };
        const IC17Div = IC17DivType{ .value = conf.IC17Div };
        pub const IC17Output = IC17OutputType{};
        const IC18 = IC18Type{ .value = conf.IC18 };
        const IC18Div = IC18DivType{ .value = conf.IC18Div };
        pub const IC18Output = IC18OutputType{};
        const IC19 = IC19Type{ .value = conf.IC19 };
        const IC19Div = IC19DivType{ .value = conf.IC19Div };
        pub const IC19Output = IC19OutputType{};
        const IC20 = IC20Type{ .value = conf.IC20 };
        const IC20Div = IC20DivType{ .value = conf.IC20Div };
        pub const IC20Output = IC20OutputType{};
        const MCOMult = MCOMultType{ .value = conf.MCOMult };
        const MCODiv = MCODivType{ .value = conf.MCODiv };
        pub const MCOPin = MCOPinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        const MCO2Div = MCO2DivType{ .value = conf.MCO2Div };
        pub const MCO2Pin = MCO2PinType{};
        const CKPERSource = CKPERSourceType{ .value = conf.CKPERSource };
        pub const CKPERoutput = CKPERoutputType{};
        const ADCMult = ADCMultType{ .value = conf.ADCMult };
        const ADCDIV = ADCDIVType{ .value = conf.ADCDIV };
        pub const ADCoutput = ADCoutputType{};
        const ADFMult = ADFMultType{ .value = conf.ADFMult };
        pub const ADFoutput = ADFoutputType{};
        const MDF1Mult = MDF1MultType{ .value = conf.MDF1Mult };
        pub const MDFoutput = MDFoutputType{};
        const PSSIMult = PSSIMultType{ .value = conf.PSSIMult };
        pub const PSSIoutput = PSSIoutputType{};
        const FDCANMult = FDCANMultType{ .value = conf.FDCANMult };
        pub const FDCANoutput = FDCANoutputType{};
        const I2C1Mult = I2C1MultType{ .value = conf.I2C1Mult };
        pub const I2C1output = I2C1outputType{};
        const I2C2Mult = I2C2MultType{ .value = conf.I2C2Mult };
        pub const I2C2output = I2C2outputType{};
        const I2C3Mult = I2C3MultType{ .value = conf.I2C3Mult };
        pub const I2C3output = I2C3outputType{};
        const I2C4Mult = I2C4MultType{ .value = conf.I2C4Mult };
        pub const I2C4output = I2C4outputType{};
        const I3C1Mult = I3C1MultType{ .value = conf.I3C1Mult };
        pub const I3C1output = I3C1outputType{};
        const I3C2Mult = I3C2MultType{ .value = conf.I3C2Mult };
        pub const I3C2output = I3C2outputType{};
        const LPTIM1Mult = LPTIM1MultType{ .value = conf.LPTIM1Mult };
        pub const LPTIM1output = LPTIM1outputType{};
        const LPTIM3Mult = LPTIM3MultType{ .value = conf.LPTIM3Mult };
        pub const LPTIM3output = LPTIM3outputType{};
        const LPTIM2Mult = LPTIM2MultType{ .value = conf.LPTIM2Mult };
        pub const LPTIM2output = LPTIM2outputType{};
        const LPTIM4Mult = LPTIM4MultType{ .value = conf.LPTIM4Mult };
        pub const LPTIM4output = LPTIM4outputType{};
        const LPTIM5Mult = LPTIM5MultType{ .value = conf.LPTIM5Mult };
        pub const LPTIM5output = LPTIM5outputType{};
        const LTDCMult = LTDCMultType{ .value = conf.LTDCMult };
        pub const LTDCoutput = LTDCoutputType{};
        const DCMIPPMult = DCMIPPMultType{ .value = conf.DCMIPPMult };
        pub const DCMIPPoutput = DCMIPPoutputType{};
        const FMCMult = FMCMultType{ .value = conf.FMCMult };
        pub const FMCoutput = FMCoutputType{};
        const SAI1Mult = SAI1MultType{ .value = conf.SAI1Mult };
        pub const SAI1output = SAI1outputType{};
        const SAI2Mult = SAI2MultType{ .value = conf.SAI2Mult };
        pub const SAI2output = SAI2outputType{};
        const USART1Mult = USART1MultType{ .value = conf.USART1Mult };
        pub const USART1output = USART1outputType{};
        const USART2Mult = USART2MultType{ .value = conf.USART2Mult };
        pub const USART2output = USART2outputType{};
        const USART3Mult = USART3MultType{ .value = conf.USART3Mult };
        pub const USART3output = USART3outputType{};
        const UART4Mult = UART4MultType{ .value = conf.UART4Mult };
        pub const UART4output = UART4outputType{};
        const UART5Mult = UART5MultType{ .value = conf.UART5Mult };
        pub const UART5output = UART5outputType{};
        const USART6Mult = USART6MultType{ .value = conf.USART6Mult };
        pub const USART6output = USART6outputType{};
        const UART7Mult = UART7MultType{ .value = conf.UART7Mult };
        pub const UART7output = UART7outputType{};
        const UART8Mult = UART8MultType{ .value = conf.UART8Mult };
        pub const UART8output = UART8outputType{};
        const UART9Mult = UART9MultType{ .value = conf.UART9Mult };
        pub const UART9output = UART9outputType{};
        const LPUART1Mult = LPUART1MultType{ .value = conf.LPUART1Mult };
        pub const LPUART1output = LPUART1outputType{};
        const USART10Mult = USART10MultType{ .value = conf.USART10Mult };
        pub const USART10output = USART10outputType{};
        const SPI1Mult = SPI1MultType{ .value = conf.SPI1Mult };
        pub const SPI1output = SPI1outputType{};
        const SPI2Mult = SPI2MultType{ .value = conf.SPI2Mult };
        pub const SPI2output = SPI2outputType{};
        const SPI3Mult = SPI3MultType{ .value = conf.SPI3Mult };
        pub const SPI3output = SPI3outputType{};
        const SPI4Mult = SPI4MultType{ .value = conf.SPI4Mult };
        pub const SPI4output = SPI4outputType{};
        const SPI5Mult = SPI5MultType{ .value = conf.SPI5Mult };
        pub const SPI5output = SPI5outputType{};
        const SPI6Mult = SPI6MultType{ .value = conf.SPI6Mult };
        pub const SPI6output = SPI6outputType{};
        const XSPI1Mult = XSPI1MultType{ .value = conf.XSPI1Mult };
        pub const XSPI1output = XSPI1outputType{};
        const XSPI2Mult = XSPI2MultType{ .value = conf.XSPI2Mult };
        pub const XSPI2output = XSPI2outputType{};
        const OTGHS1Mult = OTGHS1MultType{ .value = conf.OTGHS1Mult };
        pub const OTGHS1output = OTGHS1outputType{};
        const OTGHS2Mult = OTGHS2MultType{ .value = conf.OTGHS2Mult };
        pub const OTGHS2output = OTGHS2outputType{};
        const XSPI3Mult = XSPI3MultType{ .value = conf.XSPI3Mult };
        pub const XSPI3output = XSPI3outputType{};
        const OTGPHY1Mult = OTGPHY1MultType{ .value = conf.OTGPHY1Mult };
        pub const OTGPHY1output = OTGPHY1outputType{};
        const OTGPHY2Mult = OTGPHY2MultType{ .value = conf.OTGPHY2Mult };
        pub const OTGPHY2output = OTGPHY2outputType{};
        const SDMMC1Mult = SDMMC1MultType{ .value = conf.SDMMC1Mult };
        pub const SDMMC1output = SDMMC1outputType{};
        const SDMMC2Mult = SDMMC2MultType{ .value = conf.SDMMC2Mult };
        pub const SDMMC2output = SDMMC2outputType{};
        const ETH1Mult = ETH1MultType{ .value = conf.ETH1Mult };
        pub const ETH1output = ETH1outputType{};
        const SPDIFRX1Mult = SPDIFRX1MultType{ .value = conf.SPDIFRX1Mult };
        pub const SPDIFRX1output = SPDIFRX1outputType{};
        const SYSBClkSource = SYSBClkSourceType{ .value = conf.SYSBClkSource };
        const SYSCClkSource = SYSCClkSourceType{ .value = conf.SYSCClkSource };
        const SYSDClkSource = SYSDClkSourceType{ .value = conf.SYSDClkSource };
        pub const SYSBCLKOutput = SYSBCLKOutputType{};
        pub const SYSCCLKOutput = SYSCCLKOutputType{};
        pub const SYSDCLKOutput = SYSDCLKOutputType{};
        const SYSAClkSource = SYSAClkSourceType{ .value = conf.SYSAClkSource };
        const TPIUPrescaler = TPIUPrescalerType{ .value = conf.TPIUPrescaler };
        pub const TPIUOutput = TPIUOutputType{};
        const CortexPrescaler = CortexPrescalerType{ .value = conf.CortexPrescaler };
        pub const CortexSysOutput = CortexSysOutputType{};
        pub const CpuClockOutput = CpuClockOutputType{};
        pub const AXIClockOutput = AXIClockOutputType{};
        const HPREDiv = HPREDivType{ .value = conf.HPREDiv };
        const APB4DIV = APB4DIVType{ .value = conf.APB4DIV };
        pub const APB4Output = APB4OutputType{};
        const APB5DIV = APB5DIVType{ .value = conf.APB5DIV };
        pub const APB5Output = APB5OutputType{};
        const TIMGDIV = TIMGDIVType{ .value = conf.TIMGDIV };
        pub const TIMGOutput = TIMGOutputType{};
        const APB1DIV = APB1DIVType{ .value = conf.APB1DIV };
        pub const AHBOutput = AHBOutputType{};
        pub const APB1Output = APB1OutputType{};
        const APB2DIV = APB2DIVType{ .value = conf.APB2DIV };
        pub const APB2Output = APB2OutputType{};
        const PLL1Source = PLL1SourceType{ .value = conf.PLL1Source };
        const FREFDIV1 = FREFDIV1Type{ .value = conf.FREFDIV1 };
        const PLL2Source = PLL2SourceType{ .value = conf.PLL2Source };
        const FREFDIV2 = FREFDIV2Type{ .value = conf.FREFDIV2 };
        const PLL3Source = PLL3SourceType{ .value = conf.PLL3Source };
        const FREFDIV3 = FREFDIV3Type{ .value = conf.FREFDIV3 };
        const PLL4Source = PLL4SourceType{ .value = conf.PLL4Source };
        const FREFDIV4 = FREFDIV4Type{ .value = conf.FREFDIV4 };
        const FBDIV1 = FBDIV1Type{ .value = conf.FBDIV1 };
        const PLL1FRACV = PLL1FRACVType{ .value = conf.PLL1FRACV };
        const POSTDIV1_1 = POSTDIV1_1Type{ .value = conf.POSTDIV1_1 };
        const POSTDIV2_1 = POSTDIV2_1Type{ .value = conf.POSTDIV2_1 };
        pub const FOUTPOSTDIV1 = FOUTPOSTDIV1Type{};
        const FBDIV2 = FBDIV2Type{ .value = conf.FBDIV2 };
        const PLL2FRACV = PLL2FRACVType{ .value = conf.PLL2FRACV };
        const POSTDIV1_2 = POSTDIV1_2Type{ .value = conf.POSTDIV1_2 };
        const POSTDIV2_2 = POSTDIV2_2Type{ .value = conf.POSTDIV2_2 };
        pub const FOUTPOSTDIV2 = FOUTPOSTDIV2Type{};
        const FBDIV3 = FBDIV3Type{ .value = conf.FBDIV3 };
        const PLL3FRACV = PLL3FRACVType{ .value = conf.PLL3FRACV };
        const POSTDIV1_3 = POSTDIV1_3Type{ .value = conf.POSTDIV1_3 };
        const POSTDIV2_3 = POSTDIV2_3Type{ .value = conf.POSTDIV2_3 };
        pub const FOUTPOSTDIV3 = FOUTPOSTDIV3Type{};
        const FBDIV4 = FBDIV4Type{ .value = conf.FBDIV4 };
        const PLL4FRACV = PLL4FRACVType{ .value = conf.PLL4FRACV };
        const POSTDIV1_4 = POSTDIV1_4Type{ .value = conf.POSTDIV1_4 };
        const POSTDIV2_4 = POSTDIV2_4Type{ .value = conf.POSTDIV2_4 };
        pub const FOUTPOSTDIV4 = FOUTPOSTDIV4Type{};
        const HSERTCDevisor = HSERTCDevisorType{ .value = conf.HSERTCDevisor };
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};

        pub fn validate() void {
            _ = ADCoutput.get();
            _ = ADFoutput.get();
            _ = MDFoutput.get();
            _ = PSSIoutput.get();
            _ = FDCANoutput.get();
            _ = I2C1output.get();
            _ = I2C2output.get();
            _ = I2C3output.get();
            _ = I2C4output.get();
            _ = I3C1output.get();
            _ = I3C2output.get();
            _ = LPTIM1output.get();
            _ = LPTIM3output.get();
            _ = LPTIM2output.get();
            _ = LPTIM4output.get();
            _ = LPTIM5output.get();
            _ = LTDCoutput.get();
            _ = DCMIPPoutput.get();
            _ = FMCoutput.get();
            _ = SAI1output.get();
            _ = SAI2output.get();
            _ = USART1output.get();
            _ = USART2output.get();
            _ = USART3output.get();
            _ = UART4output.get();
            _ = UART5output.get();
            _ = USART6output.get();
            _ = UART7output.get();
            _ = UART8output.get();
            _ = UART9output.get();
            _ = LPUART1output.get();
            _ = USART10output.get();
            _ = SPI1output.get();
            _ = SPI2output.get();
            _ = SPI3output.get();
            _ = SPI4output.get();
            _ = SPI5output.get();
            _ = SPI6output.get();
            _ = XSPI1output.get();
            _ = XSPI2output.get();
            _ = OTGHS1output.get();
            _ = OTGHS2output.get();
            _ = XSPI3output.get();
            _ = OTGPHY1output.get();
            _ = OTGPHY2output.get();
            _ = SDMMC1output.get();
            _ = SDMMC2output.get();
            _ = ETH1output.get();
            _ = SPDIFRX1output.get();
            _ = SYSBCLKOutput.get();
            _ = SYSCCLKOutput.get();
            _ = SYSDCLKOutput.get();
            _ = TPIUOutput.get();
            _ = CortexSysOutput.get();
            _ = CpuClockOutput.get();
            _ = AXIClockOutput.get();
            _ = APB4Output.get();
            _ = APB5Output.get();
            _ = TIMGOutput.get();
            _ = AHBOutput.get();
            _ = APB1Output.get();
            _ = APB2Output.get();
        }
    };

    return ClockStruct;
}
