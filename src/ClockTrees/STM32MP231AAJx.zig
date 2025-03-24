const std = @import("std");

pub const HSEOSCConf = enum(comptime_int) {
    _,
    pub fn get(num: HSEOSCConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 16000000) {
            @compileError("min value for HSEOSC is 16000000\n");
        } else if (val > 48000000) {
            @compileError("min value for HSEOSC is 48000000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 48000000;
    }

    pub fn min() comptime_int {
        return 16000000;
    }
};
pub const HSEDIV2Conf = enum {
    const this = @This();
    DIV2,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV2 => 2,
        };
    }
};
pub const SPDIFConf = enum(comptime_int) {
    _,
    pub fn get(num: SPDIFConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 3072000) {
            @compileError("min value for SPDIF is 3072000\n");
        } else if (val > 12288000) {
            @compileError("min value for SPDIF is 12288000\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 12288000;
    }

    pub fn min() comptime_int {
        return 3072000;
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
pub const XBAR0Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR0PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR0FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR0FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR0Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR0Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR1Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR1PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR1FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR1FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR1Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR1Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR2Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR2PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR2FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR2FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR2Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR2Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR3Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR3PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR3FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR3FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR3Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR3Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR4Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR4PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR4FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR4FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR4Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR4Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR5Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR5PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR5FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR5FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR5Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR5Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR6Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR6PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR6FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR6FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR6Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR6Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR7Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    LSIRC,
    LSEOSC,
};
pub const XBAR7PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR7FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR7FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR7Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR7Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR8Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR8PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR8FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR8FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR8Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR8Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR9Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR9PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR9FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR9FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR9Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR9Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR10Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR10PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR10FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR10FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR10Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR10Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR11Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
};
pub const XBAR11PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR11FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR11FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR11Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR11Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR12Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR12PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR12FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR12FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR12Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR12Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR13Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR13PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR13FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR13FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR13Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR13Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR14Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR14PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR14FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR14FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR14Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR14Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR15Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR15PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR15FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR15FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR15Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR15Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR16Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR16PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR16FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR16FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR16Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR16Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR17Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR17PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR17FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR17FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR17Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR17Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR18Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR18PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR18FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR18FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR18Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR18Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR19Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR19PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR19FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR19FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR19Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR19Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR20Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR20PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR20FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR20FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR20Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR20Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR21Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR21PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR21FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR21FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR21Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR21Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR22Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR22PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR22FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR22FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR22Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR22Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR23Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
};
pub const XBAR23PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR23FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR23FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR23Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR23Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR24Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
};
pub const XBAR24PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR24FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR24FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR24Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR24Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR25Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
};
pub const XBAR25PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR25FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR25FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR25Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR25Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR26Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR26PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR26FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR26FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR26Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR26Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR27Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR27PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR27FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR27FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR27Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR27Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR28Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR28PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR28FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR28FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR28Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR28Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR29Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR29PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR29FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR29FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR29Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR29Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR30Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR30PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR30FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR30FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR30Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR30Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR31Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR31PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR31FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR31FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR31Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR31Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR32Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR32PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR32FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR32FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR32Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR32Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR33Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
};
pub const XBAR33PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR33FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR33FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR33Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR33Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR34Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR34PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR34FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR34FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR34Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR34Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR35Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
};
pub const XBAR35PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR35FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR35FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR35Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR35Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR36Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR36PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR36FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR36FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR36Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR36Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR37Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    I2S_CKIN,
};
pub const XBAR37PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR37FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR37FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR37Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR37Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR38Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    MSIRC,
};
pub const XBAR38PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR38FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR38FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR38Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR38Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR39Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR39PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR39FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR39FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR39Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR39Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR40Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    LSIRC,
    LSEOSC,
};
pub const XBAR40PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR40FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR40FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR40Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR40Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR41Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    LSIRC,
    LSEOSC,
};
pub const XBAR41PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR41FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR41FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR41Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR41Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR42Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR42PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR42FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR42FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR42Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR42Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR43Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR43PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR43FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR43FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR43Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR43Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR44Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR44PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR44FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR44FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR44Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR44Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR45Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR45PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR45FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR45FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR45Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR45Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR46Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR46PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR46FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR46FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR46Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR46Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR47Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR47PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR47FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR47FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR47Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR47Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR48Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR48PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR48FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR48FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR48Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR48Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR49Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR49PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR49FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR49FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR49Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR49Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR50Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR50PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR50FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR50FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR50Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR50Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR51Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
};
pub const XBAR51PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR51FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR51FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR51Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR51Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR52Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
};
pub const XBAR52PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR52FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR52FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR52Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR52Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR53Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
};
pub const XBAR53PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR53FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR53FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR53Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR53Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR54Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR54PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR54FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR54FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR54Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR54Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR55Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR55PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR55FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR55FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR55Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR55Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR56Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR56PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR56FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR56FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR56Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR56Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR57Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR57PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR57FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR57FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR57Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR57Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR58Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSEOSC,
};
pub const XBAR58PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR58FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR58FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR58Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR58Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR59Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR59PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR59FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR59FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR59Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR59Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR60Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
};
pub const XBAR60PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR60FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR60FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR60Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR60Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR61Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR61PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR61FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR61FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR61Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR61Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR62Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
};
pub const XBAR62PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR62FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR62FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR62Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR62Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const XBAR63Conf = enum {
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    HSIRC,
    HSEOSC,
    MSIRC,
};
pub const XBAR63PredivConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV1024,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV1024 => 1024,
        };
    }
};
pub const XBAR63FindivConf = enum(comptime_int) {
    _,
    pub fn get(num: XBAR63FindivConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for XBAR63Findiv is 1\n");
        } else if (val > 64) {
            @compileError("min value for XBAR63Findiv is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const CKINTSEL0Conf = enum {
    HSIRC,
    HSEOSC,
    MSIRC,
    PLL4Source,
    PLL5Source,
    PLL6Source,
    PLL7Source,
    PLL8Source,
    PLL1Source,
    PLL2Source,
    PLL3Source,
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
    XBAR0Output,
    XBAR1Output,
    XBAR2Output,
    XBAR3Output,
    XBAR4Output,
    XBAR5Output,
    XBAR6Output,
    XBAR7Output,
    XBAR8Output,
    XBAR9Output,
    XBAR10Output,
    XBAR11Output,
    XBAR12Output,
    XBAR13Output,
    XBAR14Output,
    XBAR15Output,
    XBAR16Output,
    XBAR17Output,
    XBAR18Output,
    XBAR19Output,
    XBAR20Output,
    XBAR21Output,
    XBAR22Output,
    XBAR23Output,
    XBAR24Output,
    XBAR25Output,
    XBAR26Output,
    XBAR27Output,
    XBAR28Output,
    XBAR29Output,
    XBAR30Output,
    XBAR31Output,
    XBAR32Output,
    XBAR33Output,
    XBAR34Output,
    XBAR35Output,
    XBAR36Output,
    XBAR37Output,
    XBAR38Output,
    XBAR39Output,
    XBAR40Output,
    XBAR41Output,
    XBAR42Output,
    XBAR43Output,
    XBAR44Output,
    XBAR45Output,
    XBAR46Output,
    XBAR47Output,
    XBAR48Output,
    XBAR49Output,
    XBAR50Output,
    XBAR51Output,
    XBAR52Output,
    XBAR53Output,
    XBAR54Output,
    XBAR55Output,
    XBAR56Output,
    XBAR57Output,
    XBAR58Output,
    XBAR59Output,
    XBAR60Output,
    XBAR61Output,
    XBAR62Output,
    XBAR63Output,
};
pub const CKEXTSEL0Conf = enum {
    PLL1Div42,
    PLL2Div4,
    PLL3Div2,
};
pub const CKINTSEL1Conf = enum {
    HSIRC,
    HSEOSC,
    MSIRC,
    PLL4Source,
    PLL5Source,
    PLL6Source,
    PLL7Source,
    PLL8Source,
    PLL1Source,
    PLL2Source,
    PLL3Source,
    FOUTPOSTDIV4,
    FOUTPOSTDIV5,
    FOUTPOSTDIV6,
    FOUTPOSTDIV7,
    FOUTPOSTDIV8,
    SPDIF,
    I2S_CKIN,
    LSIRC,
    LSEOSC,
    XBAR0Output,
    XBAR1Output,
    XBAR2Output,
    XBAR3Output,
    XBAR4Output,
    XBAR5Output,
    XBAR6Output,
    XBAR7Output,
    XBAR8Output,
    XBAR9Output,
    XBAR10Output,
    XBAR11Output,
    XBAR12Output,
    XBAR13Output,
    XBAR14Output,
    XBAR15Output,
    XBAR16Output,
    XBAR17Output,
    XBAR18Output,
    XBAR19Output,
    XBAR20Output,
    XBAR21Output,
    XBAR22Output,
    XBAR23Output,
    XBAR24Output,
    XBAR25Output,
    XBAR26Output,
    XBAR27Output,
    XBAR28Output,
    XBAR29Output,
    XBAR30Output,
    XBAR31Output,
    XBAR32Output,
    XBAR33Output,
    XBAR34Output,
    XBAR35Output,
    XBAR36Output,
    XBAR37Output,
    XBAR38Output,
    XBAR39Output,
    XBAR40Output,
    XBAR41Output,
    XBAR42Output,
    XBAR43Output,
    XBAR44Output,
    XBAR45Output,
    XBAR46Output,
    XBAR47Output,
    XBAR48Output,
    XBAR49Output,
    XBAR50Output,
    XBAR51Output,
    XBAR52Output,
    XBAR53Output,
    XBAR54Output,
    XBAR55Output,
    XBAR56Output,
    XBAR57Output,
    XBAR58Output,
    XBAR59Output,
    XBAR60Output,
    XBAR61Output,
    XBAR62Output,
    XBAR63Output,
};
pub const CKEXTSEL1Conf = enum {
    PLL1Div42,
    PLL2Div4,
    PLL3Div2,
};
pub const OBS0Conf = enum {
    CKINTSEL0,
    CKEXTSEL0,
};
pub const OBS1Conf = enum {
    CKINTSEL1,
    CKEXTSEL1,
};
pub const MCO1MultConf = enum {
    XBAR61Output,
    OBS0Output,
};
pub const MCO2MultConf = enum {
    XBAR62Output,
    OBS1Output,
};
pub const D3PERConf = enum {
    MSIRC,
    LSIRC,
    LSEOSC,
};
pub const DTSConf = enum {
    MSIRC,
    HSIRC,
    HSEOSC,
};
pub const DSIPHYConf = enum {
    XBAR28Output,
    HSEOSC,
};
pub const DSIBLANEConf = enum {
    DSIPHYOutput,
    XBAR27Output,
};
pub const USB2PHY1Conf = enum {
    XBAR57Output,
    HSEDIV2,
};
pub const USB2PHY2Conf = enum {
    XBAR58Output,
    HSEDIV2,
};
pub const USB3PCIPHYConf = enum {
    XBAR34Output,
    HSEDIV2,
};
pub const SysClkSourceConf = enum {
    XBAR0Output,
    HSIRC,
};
pub const MCUDIVConf = enum {
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
pub const APB3DIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const APB4DIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const APBDBGDIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const APB1DIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const APB2DIVConf = enum {
    const this = @This();
    DIV1,
    DIV2,
    DIV4,
    DIV8,
    DIV16,
    pub fn get(comptime self: this) comptime_float {
        return switch (self) {
            .DIV1 => 1,
            .DIV2 => 2,
            .DIV4 => 4,
            .DIV8 => 8,
            .DIV16 => 16,
        };
    }
};
pub const ADC12MultConf = enum {
    XBAR46Output,
    XBAR0Output,
};
pub const ADC3MultConf = enum {
    XBAR47Output,
    XBAR0Output,
    XBAR46Output,
};
pub const PLL1SourceConf = enum {
    HSIRC,
    HSEOSC,
    MSIRC,
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
    HSEOSC,
    MSIRC,
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
        if (val < 16) {
            @compileError("min value for FBDIV1 is 16\n");
        } else if (val > 2500) {
            @compileError("min value for FBDIV1 is 2500\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 2500;
    }

    pub fn min() comptime_int {
        return 16;
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
pub const PLL5SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
};
pub const FREFDIV5Conf = enum(comptime_int) {
    _,
    pub fn get(num: FREFDIV5Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for FREFDIV5 is 1\n");
        } else if (val > 63) {
            @compileError("min value for FREFDIV5 is 63\n");
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
pub const FBDIV5Conf = enum(comptime_int) {
    _,
    pub fn get(num: FBDIV5Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 20) {
            @compileError("min value for FBDIV5 is 20\n");
        } else if (val > 500) {
            @compileError("min value for FBDIV5 is 500\n");
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
pub const PLL5FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL5FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL5FRACV is 0\n");
        } else if (val > 16777215) {
            @compileError("min value for PLL5FRACV is 16777215\n");
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
pub const POSTDIV1_5Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV1_5Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV1_5 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV1_5 is 7\n");
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
pub const POSTDIV2_5Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV2_5Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV2_5 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV2_5 is 7\n");
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
pub const PLL6SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
};
pub const FREFDIV6Conf = enum(comptime_int) {
    _,
    pub fn get(num: FREFDIV6Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for FREFDIV6 is 1\n");
        } else if (val > 63) {
            @compileError("min value for FREFDIV6 is 63\n");
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
pub const FBDIV6Conf = enum(comptime_int) {
    _,
    pub fn get(num: FBDIV6Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 20) {
            @compileError("min value for FBDIV6 is 20\n");
        } else if (val > 500) {
            @compileError("min value for FBDIV6 is 500\n");
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
pub const PLL6FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL6FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL6FRACV is 0\n");
        } else if (val > 16777215) {
            @compileError("min value for PLL6FRACV is 16777215\n");
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
pub const POSTDIV1_6Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV1_6Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV1_6 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV1_6 is 7\n");
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
pub const POSTDIV2_6Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV2_6Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV2_6 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV2_6 is 7\n");
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
pub const PLL7SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
};
pub const FREFDIV7Conf = enum(comptime_int) {
    _,
    pub fn get(num: FREFDIV7Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for FREFDIV7 is 1\n");
        } else if (val > 63) {
            @compileError("min value for FREFDIV7 is 63\n");
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
pub const FBDIV7Conf = enum(comptime_int) {
    _,
    pub fn get(num: FBDIV7Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 20) {
            @compileError("min value for FBDIV7 is 20\n");
        } else if (val > 500) {
            @compileError("min value for FBDIV7 is 500\n");
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
pub const PLL7FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL7FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL7FRACV is 0\n");
        } else if (val > 16777215) {
            @compileError("min value for PLL7FRACV is 16777215\n");
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
pub const POSTDIV1_7Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV1_7Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV1_7 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV1_7 is 7\n");
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
pub const POSTDIV2_7Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV2_7Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV2_7 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV2_7 is 7\n");
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
pub const PLL8SourceConf = enum {
    HSIRC,
    MSIRC,
    HSEOSC,
};
pub const FREFDIV8Conf = enum(comptime_int) {
    _,
    pub fn get(num: FREFDIV8Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for FREFDIV8 is 1\n");
        } else if (val > 63) {
            @compileError("min value for FREFDIV8 is 63\n");
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
pub const FBDIV8Conf = enum(comptime_int) {
    _,
    pub fn get(num: FBDIV8Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 20) {
            @compileError("min value for FBDIV8 is 20\n");
        } else if (val > 500) {
            @compileError("min value for FBDIV8 is 500\n");
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
pub const PLL8FRACVConf = enum(comptime_int) {
    _,
    pub fn get(num: PLL8FRACVConf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 0) {
            @compileError("min value for PLL8FRACV is 0\n");
        } else if (val > 16777215) {
            @compileError("min value for PLL8FRACV is 16777215\n");
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
pub const POSTDIV1_8Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV1_8Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV1_8 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV1_8 is 7\n");
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
pub const POSTDIV2_8Conf = enum(comptime_int) {
    _,
    pub fn get(num: POSTDIV2_8Conf) comptime_int {
        const val: comptime_int = @intFromEnum(num);
        if (val < 1) {
            @compileError("min value for POSTDIV2_8 is 1\n");
        } else if (val > 7) {
            @compileError("min value for POSTDIV2_8 is 7\n");
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
        if (val < 1) {
            @compileError("min value for HSERTCDevisor is 1\n");
        } else if (val > 64) {
            @compileError("min value for HSERTCDevisor is 64\n");
        }
        return val;
    }

    pub fn max() comptime_int {
        return 64;
    }

    pub fn min() comptime_int {
        return 1;
    }
};
pub const RTCClkSourceConf = enum {
    HSERTCDevisor,
    LSEOSC,
    LSIRC,
};
pub const Config = struct {
    HSEOSC: HSEOSCConf = @enumFromInt(40000000),
    HSEDIV2: HSEDIV2Conf = .DIV2,
    SPDIF: SPDIFConf = @enumFromInt(12288000),
    LSEOSC: LSEOSCConf = @enumFromInt(32768),
    MSIRC: MSIRCConf = .CLOCK_16,
    XBAR0: XBAR0Conf = .HSIRC,
    XBAR0Prediv: XBAR0PredivConf = .DIV1,
    XBAR0Findiv: XBAR0FindivConf = @enumFromInt(1),
    XBAR1: XBAR1Conf = .HSIRC,
    XBAR1Prediv: XBAR1PredivConf = .DIV1,
    XBAR1Findiv: XBAR1FindivConf = @enumFromInt(1),
    XBAR2: XBAR2Conf = .HSIRC,
    XBAR2Prediv: XBAR2PredivConf = .DIV1,
    XBAR2Findiv: XBAR2FindivConf = @enumFromInt(1),
    XBAR3: XBAR3Conf = .HSIRC,
    XBAR3Prediv: XBAR3PredivConf = .DIV1,
    XBAR3Findiv: XBAR3FindivConf = @enumFromInt(1),
    XBAR4: XBAR4Conf = .HSIRC,
    XBAR4Prediv: XBAR4PredivConf = .DIV1,
    XBAR4Findiv: XBAR4FindivConf = @enumFromInt(1),
    XBAR5: XBAR5Conf = .HSIRC,
    XBAR5Prediv: XBAR5PredivConf = .DIV1,
    XBAR5Findiv: XBAR5FindivConf = @enumFromInt(1),
    XBAR6: XBAR6Conf = .HSIRC,
    XBAR6Prediv: XBAR6PredivConf = .DIV1,
    XBAR6Findiv: XBAR6FindivConf = @enumFromInt(1),
    XBAR7: XBAR7Conf = .LSIRC,
    XBAR7Prediv: XBAR7PredivConf = .DIV1,
    XBAR7Findiv: XBAR7FindivConf = @enumFromInt(1),
    XBAR8: XBAR8Conf = .HSIRC,
    XBAR8Prediv: XBAR8PredivConf = .DIV1,
    XBAR8Findiv: XBAR8FindivConf = @enumFromInt(1),
    XBAR9: XBAR9Conf = .HSIRC,
    XBAR9Prediv: XBAR9PredivConf = .DIV1,
    XBAR9Findiv: XBAR9FindivConf = @enumFromInt(1),
    XBAR10: XBAR10Conf = .HSIRC,
    XBAR10Prediv: XBAR10PredivConf = .DIV1,
    XBAR10Findiv: XBAR10FindivConf = @enumFromInt(1),
    XBAR11: XBAR11Conf = .HSIRC,
    XBAR11Prediv: XBAR11PredivConf = .DIV1,
    XBAR11Findiv: XBAR11FindivConf = @enumFromInt(1),
    XBAR12: XBAR12Conf = .HSIRC,
    XBAR12Prediv: XBAR12PredivConf = .DIV1,
    XBAR12Findiv: XBAR12FindivConf = @enumFromInt(1),
    XBAR13: XBAR13Conf = .HSIRC,
    XBAR13Prediv: XBAR13PredivConf = .DIV1,
    XBAR13Findiv: XBAR13FindivConf = @enumFromInt(1),
    XBAR14: XBAR14Conf = .HSIRC,
    XBAR14Prediv: XBAR14PredivConf = .DIV1,
    XBAR14Findiv: XBAR14FindivConf = @enumFromInt(1),
    XBAR15: XBAR15Conf = .HSIRC,
    XBAR15Prediv: XBAR15PredivConf = .DIV1,
    XBAR15Findiv: XBAR15FindivConf = @enumFromInt(1),
    XBAR16: XBAR16Conf = .HSIRC,
    XBAR16Prediv: XBAR16PredivConf = .DIV1,
    XBAR16Findiv: XBAR16FindivConf = @enumFromInt(1),
    XBAR17: XBAR17Conf = .HSIRC,
    XBAR17Prediv: XBAR17PredivConf = .DIV1,
    XBAR17Findiv: XBAR17FindivConf = @enumFromInt(1),
    XBAR18: XBAR18Conf = .HSIRC,
    XBAR18Prediv: XBAR18PredivConf = .DIV1,
    XBAR18Findiv: XBAR18FindivConf = @enumFromInt(1),
    XBAR19: XBAR19Conf = .HSIRC,
    XBAR19Prediv: XBAR19PredivConf = .DIV1,
    XBAR19Findiv: XBAR19FindivConf = @enumFromInt(1),
    XBAR20: XBAR20Conf = .HSIRC,
    XBAR20Prediv: XBAR20PredivConf = .DIV1,
    XBAR20Findiv: XBAR20FindivConf = @enumFromInt(1),
    XBAR21: XBAR21Conf = .HSIRC,
    XBAR21Prediv: XBAR21PredivConf = .DIV1,
    XBAR21Findiv: XBAR21FindivConf = @enumFromInt(1),
    XBAR22: XBAR22Conf = .HSIRC,
    XBAR22Prediv: XBAR22PredivConf = .DIV1,
    XBAR22Findiv: XBAR22FindivConf = @enumFromInt(1),
    XBAR23: XBAR23Conf = .HSIRC,
    XBAR23Prediv: XBAR23PredivConf = .DIV1,
    XBAR23Findiv: XBAR23FindivConf = @enumFromInt(1),
    XBAR24: XBAR24Conf = .HSIRC,
    XBAR24Prediv: XBAR24PredivConf = .DIV1,
    XBAR24Findiv: XBAR24FindivConf = @enumFromInt(1),
    XBAR25: XBAR25Conf = .HSIRC,
    XBAR25Prediv: XBAR25PredivConf = .DIV1,
    XBAR25Findiv: XBAR25FindivConf = @enumFromInt(1),
    XBAR26: XBAR26Conf = .HSEOSC,
    XBAR26Prediv: XBAR26PredivConf = .DIV1,
    XBAR26Findiv: XBAR26FindivConf = @enumFromInt(1),
    XBAR27: XBAR27Conf = .FOUTPOSTDIV8,
    XBAR27Prediv: XBAR27PredivConf = .DIV1,
    XBAR27Findiv: XBAR27FindivConf = @enumFromInt(1),
    XBAR28: XBAR28Conf = .HSEOSC,
    XBAR28Prediv: XBAR28PredivConf = .DIV1,
    XBAR28Findiv: XBAR28FindivConf = @enumFromInt(1),
    XBAR29: XBAR29Conf = .FOUTPOSTDIV8,
    XBAR29Prediv: XBAR29PredivConf = .DIV1,
    XBAR29Findiv: XBAR29FindivConf = @enumFromInt(1),
    XBAR30: XBAR30Conf = .HSEOSC,
    XBAR30Prediv: XBAR30PredivConf = .DIV1,
    XBAR30Findiv: XBAR30FindivConf = @enumFromInt(1),
    XBAR31: XBAR31Conf = .HSEOSC,
    XBAR31Prediv: XBAR31PredivConf = .DIV1,
    XBAR31Findiv: XBAR31FindivConf = @enumFromInt(1),
    XBAR32: XBAR32Conf = .HSEOSC,
    XBAR32Prediv: XBAR32PredivConf = .DIV1,
    XBAR32Findiv: XBAR32FindivConf = @enumFromInt(1),
    XBAR33: XBAR33Conf = .HSIRC,
    XBAR33Prediv: XBAR33PredivConf = .DIV1,
    XBAR33Findiv: XBAR33FindivConf = @enumFromInt(1),
    XBAR34: XBAR34Conf = .HSEOSC,
    XBAR34Prediv: XBAR34PredivConf = .DIV1,
    XBAR34Findiv: XBAR34FindivConf = @enumFromInt(1),
    XBAR35: XBAR35Conf = .HSIRC,
    XBAR35Prediv: XBAR35PredivConf = .DIV1,
    XBAR35Findiv: XBAR35FindivConf = @enumFromInt(1),
    XBAR36: XBAR36Conf = .MSIRC,
    XBAR36Prediv: XBAR36PredivConf = .DIV1,
    XBAR36Findiv: XBAR36FindivConf = @enumFromInt(1),
    XBAR37: XBAR37Conf = .HSIRC,
    XBAR37Prediv: XBAR37PredivConf = .DIV1,
    XBAR37Findiv: XBAR37FindivConf = @enumFromInt(1),
    XBAR38: XBAR38Conf = .HSIRC,
    XBAR38Prediv: XBAR38PredivConf = .DIV1,
    XBAR38Findiv: XBAR38FindivConf = @enumFromInt(1),
    XBAR39: XBAR39Conf = .HSIRC,
    XBAR39Prediv: XBAR39PredivConf = .DIV1,
    XBAR39Findiv: XBAR39FindivConf = @enumFromInt(1),
    XBAR40: XBAR40Conf = .LSIRC,
    XBAR40Prediv: XBAR40PredivConf = .DIV1,
    XBAR40Findiv: XBAR40FindivConf = @enumFromInt(1),
    XBAR41: XBAR41Conf = .LSIRC,
    XBAR41Prediv: XBAR41PredivConf = .DIV1,
    XBAR41Findiv: XBAR41FindivConf = @enumFromInt(1),
    XBAR42: XBAR42Conf = .HSIRC,
    XBAR42Prediv: XBAR42PredivConf = .DIV1,
    XBAR42Findiv: XBAR42FindivConf = @enumFromInt(1),
    XBAR43: XBAR43Conf = .FOUTPOSTDIV8,
    XBAR43Prediv: XBAR43PredivConf = .DIV1,
    XBAR43Findiv: XBAR43FindivConf = @enumFromInt(1),
    XBAR44: XBAR44Conf = .FOUTPOSTDIV8,
    XBAR44Prediv: XBAR44PredivConf = .DIV1,
    XBAR44Findiv: XBAR44FindivConf = @enumFromInt(1),
    XBAR45: XBAR45Conf = .FOUTPOSTDIV8,
    XBAR45Prediv: XBAR45PredivConf = .DIV1,
    XBAR45Findiv: XBAR45FindivConf = @enumFromInt(1),
    XBAR46: XBAR46Conf = .HSIRC,
    XBAR46Prediv: XBAR46PredivConf = .DIV1,
    XBAR46Findiv: XBAR46FindivConf = @enumFromInt(1),
    XBAR47: XBAR47Conf = .FOUTPOSTDIV8,
    XBAR47Prediv: XBAR47PredivConf = .DIV1,
    XBAR47Findiv: XBAR47FindivConf = @enumFromInt(1),
    XBAR48: XBAR48Conf = .FOUTPOSTDIV8,
    XBAR48Prediv: XBAR48PredivConf = .DIV1,
    XBAR48Findiv: XBAR48FindivConf = @enumFromInt(1),
    XBAR49: XBAR49Conf = .FOUTPOSTDIV8,
    XBAR49Prediv: XBAR49PredivConf = .DIV1,
    XBAR49Findiv: XBAR49FindivConf = @enumFromInt(1),
    XBAR50: XBAR50Conf = .FOUTPOSTDIV8,
    XBAR50Prediv: XBAR50PredivConf = .DIV1,
    XBAR50Findiv: XBAR50FindivConf = @enumFromInt(1),
    XBAR51: XBAR51Conf = .HSIRC,
    XBAR51Prediv: XBAR51PredivConf = .DIV1,
    XBAR51Findiv: XBAR51FindivConf = @enumFromInt(1),
    XBAR52: XBAR52Conf = .HSIRC,
    XBAR52Prediv: XBAR52PredivConf = .DIV1,
    XBAR52Findiv: XBAR52FindivConf = @enumFromInt(1),
    XBAR53: XBAR53Conf = .HSIRC,
    XBAR53Prediv: XBAR53PredivConf = .DIV1,
    XBAR53Findiv: XBAR53FindivConf = @enumFromInt(1),
    XBAR54: XBAR54Conf = .FOUTPOSTDIV8,
    XBAR54Prediv: XBAR54PredivConf = .DIV1,
    XBAR54Findiv: XBAR54FindivConf = @enumFromInt(1),
    XBAR55: XBAR55Conf = .FOUTPOSTDIV8,
    XBAR55Prediv: XBAR55PredivConf = .DIV1,
    XBAR55Findiv: XBAR55FindivConf = @enumFromInt(1),
    XBAR56: XBAR56Conf = .HSIRC,
    XBAR56Prediv: XBAR56PredivConf = .DIV1,
    XBAR56Findiv: XBAR56FindivConf = @enumFromInt(1),
    XBAR57: XBAR57Conf = .HSEOSC,
    XBAR57Prediv: XBAR57PredivConf = .DIV1,
    XBAR57Findiv: XBAR57FindivConf = @enumFromInt(1),
    XBAR58: XBAR58Conf = .HSEOSC,
    XBAR58Prediv: XBAR58PredivConf = .DIV1,
    XBAR58Findiv: XBAR58FindivConf = @enumFromInt(1),
    XBAR59: XBAR59Conf = .FOUTPOSTDIV8,
    XBAR59Prediv: XBAR59PredivConf = .DIV1,
    XBAR59Findiv: XBAR59FindivConf = @enumFromInt(1),
    XBAR60: XBAR60Conf = .FOUTPOSTDIV8,
    XBAR60Prediv: XBAR60PredivConf = .DIV1,
    XBAR60Findiv: XBAR60FindivConf = @enumFromInt(1),
    XBAR61: XBAR61Conf = .HSIRC,
    XBAR61Prediv: XBAR61PredivConf = .DIV1,
    XBAR61Findiv: XBAR61FindivConf = @enumFromInt(1),
    XBAR62: XBAR62Conf = .HSIRC,
    XBAR62Prediv: XBAR62PredivConf = .DIV1,
    XBAR62Findiv: XBAR62FindivConf = @enumFromInt(1),
    XBAR63: XBAR63Conf = .HSIRC,
    XBAR63Prediv: XBAR63PredivConf = .DIV1,
    XBAR63Findiv: XBAR63FindivConf = @enumFromInt(1),
    CKINTSEL0: CKINTSEL0Conf = .MSIRC,
    CKEXTSEL0: CKEXTSEL0Conf = .PLL1Div42,
    CKINTSEL1: CKINTSEL1Conf = .MSIRC,
    CKEXTSEL1: CKEXTSEL1Conf = .PLL1Div42,
    OBS0: OBS0Conf = .CKINTSEL0,
    OBS1: OBS1Conf = .CKINTSEL1,
    MCO1Mult: MCO1MultConf = .XBAR61Output,
    MCO2Mult: MCO2MultConf = .XBAR62Output,
    D3PER: D3PERConf = .MSIRC,
    DTS: DTSConf = .MSIRC,
    DSIPHY: DSIPHYConf = .XBAR28Output,
    DSIBLANE: DSIBLANEConf = .DSIPHYOutput,
    USB2PHY1: USB2PHY1Conf = .XBAR57Output,
    USB2PHY2: USB2PHY2Conf = .XBAR58Output,
    USB3PCIPHY: USB3PCIPHYConf = .XBAR34Output,
    SysClkSource: SysClkSourceConf = .XBAR0Output,
    MCUDIV: MCUDIVConf = .DIV1,
    APB3DIV: APB3DIVConf = .DIV1,
    APB4DIV: APB4DIVConf = .DIV1,
    APBDBGDIV: APBDBGDIVConf = .DIV1,
    APB1DIV: APB1DIVConf = .DIV1,
    APB2DIV: APB2DIVConf = .DIV1,
    ADC12Mult: ADC12MultConf = .XBAR46Output,
    ADC3Mult: ADC3MultConf = .XBAR47Output,
    PLL1Source: PLL1SourceConf = .HSIRC,
    FREFDIV1: FREFDIV1Conf = @enumFromInt(1),
    PLL2Source: PLL2SourceConf = .HSIRC,
    FREFDIV2: FREFDIV2Conf = @enumFromInt(1),
    PLL3Source: PLL3SourceConf = .HSIRC,
    FREFDIV3: FREFDIV3Conf = @enumFromInt(1),
    PLL4Source: PLL4SourceConf = .HSIRC,
    FREFDIV4: FREFDIV4Conf = @enumFromInt(1),
    FBDIV1: FBDIV1Conf = @enumFromInt(25),
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
    PLL5Source: PLL5SourceConf = .HSIRC,
    FREFDIV5: FREFDIV5Conf = @enumFromInt(1),
    FBDIV5: FBDIV5Conf = @enumFromInt(25),
    PLL5FRACV: PLL5FRACVConf = @enumFromInt(0),
    POSTDIV1_5: POSTDIV1_5Conf = @enumFromInt(1),
    POSTDIV2_5: POSTDIV2_5Conf = @enumFromInt(1),
    PLL6Source: PLL6SourceConf = .HSIRC,
    FREFDIV6: FREFDIV6Conf = @enumFromInt(1),
    FBDIV6: FBDIV6Conf = @enumFromInt(25),
    PLL6FRACV: PLL6FRACVConf = @enumFromInt(0),
    POSTDIV1_6: POSTDIV1_6Conf = @enumFromInt(1),
    POSTDIV2_6: POSTDIV2_6Conf = @enumFromInt(1),
    PLL7Source: PLL7SourceConf = .HSIRC,
    FREFDIV7: FREFDIV7Conf = @enumFromInt(1),
    FBDIV7: FBDIV7Conf = @enumFromInt(25),
    PLL7FRACV: PLL7FRACVConf = @enumFromInt(0),
    POSTDIV1_7: POSTDIV1_7Conf = @enumFromInt(1),
    POSTDIV2_7: POSTDIV2_7Conf = @enumFromInt(1),
    PLL8Source: PLL8SourceConf = .HSIRC,
    FREFDIV8: FREFDIV8Conf = @enumFromInt(1),
    FBDIV8: FBDIV8Conf = @enumFromInt(25),
    PLL8FRACV: PLL8FRACVConf = @enumFromInt(0),
    POSTDIV1_8: POSTDIV1_8Conf = @enumFromInt(1),
    POSTDIV2_8: POSTDIV2_8Conf = @enumFromInt(1),
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
        const HSEOSCType = struct {
            value: HSEOSCConf,
            pub fn get(comptime self: HSEOSCType) comptime_int {
                return self.value.get();
            }
        };
        const HSEDIV2Type = struct {
            value: HSEDIV2Conf,

            pub fn get(self: *const HSEDIV2Type) comptime_int {
                if (!@hasDecl(this, "HSEOSC")) {
                    @compileError("No Input HSEOSC for HSEDIV2\n");
                }
                const from_input: comptime_float = @floatFromInt(this.HSEOSC.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const SPDIFType = struct {
            value: SPDIFConf,
            pub fn get(comptime self: SPDIFType) comptime_int {
                return self.value.get();
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
        const XBAR0Type = struct {
            value: XBAR0Conf,
            pub fn get(comptime self: XBAR0Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR0PredivType = struct {
            value: XBAR0PredivConf,

            pub fn get(self: *const XBAR0PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR0")) {
                    @compileError("No Input XBAR0 for XBAR0Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR0.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR0FindivType = struct {
            value: XBAR0FindivConf,

            pub fn get(self: *const XBAR0FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR0Prediv")) {
                    @compileError("No Input XBAR0Prediv for XBAR0Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR0Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR0OutputType = struct {
            pub fn get(_: *const XBAR0OutputType) comptime_int {
                const from_input = XBAR0Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR0Findiv on XBAR0Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR0Findiv on XBAR0Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR1Type = struct {
            value: XBAR1Conf,
            pub fn get(comptime self: XBAR1Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR1PredivType = struct {
            value: XBAR1PredivConf,

            pub fn get(self: *const XBAR1PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR1")) {
                    @compileError("No Input XBAR1 for XBAR1Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR1.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR1FindivType = struct {
            value: XBAR1FindivConf,

            pub fn get(self: *const XBAR1FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR1Prediv")) {
                    @compileError("No Input XBAR1Prediv for XBAR1Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR1Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR1OutputType = struct {
            pub fn get(_: *const XBAR1OutputType) comptime_int {
                const from_input = XBAR1Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR1Findiv on XBAR1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR1Findiv on XBAR1Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR2Type = struct {
            value: XBAR2Conf,
            pub fn get(comptime self: XBAR2Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR2PredivType = struct {
            value: XBAR2PredivConf,

            pub fn get(self: *const XBAR2PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR2")) {
                    @compileError("No Input XBAR2 for XBAR2Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR2.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR2FindivType = struct {
            value: XBAR2FindivConf,

            pub fn get(self: *const XBAR2FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR2Prediv")) {
                    @compileError("No Input XBAR2Prediv for XBAR2Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR2Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR2OutputType = struct {
            pub fn get(_: *const XBAR2OutputType) comptime_int {
                const from_input = XBAR2Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR2Findiv on XBAR2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR2Findiv on XBAR2Output | recive {d} max 600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR3Type = struct {
            value: XBAR3Conf,
            pub fn get(comptime self: XBAR3Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR3PredivType = struct {
            value: XBAR3PredivConf,

            pub fn get(self: *const XBAR3PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR3")) {
                    @compileError("No Input XBAR3 for XBAR3Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR3.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR3FindivType = struct {
            value: XBAR3FindivConf,

            pub fn get(self: *const XBAR3FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR3Prediv")) {
                    @compileError("No Input XBAR3Prediv for XBAR3Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR3Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR3OutputType = struct {
            pub fn get(_: *const XBAR3OutputType) comptime_int {
                const from_input = XBAR3Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR3Findiv on XBAR3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR3Findiv on XBAR3Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR4Type = struct {
            value: XBAR4Conf,
            pub fn get(comptime self: XBAR4Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR4PredivType = struct {
            value: XBAR4PredivConf,

            pub fn get(self: *const XBAR4PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR4")) {
                    @compileError("No Input XBAR4 for XBAR4Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR4.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR4FindivType = struct {
            value: XBAR4FindivConf,

            pub fn get(self: *const XBAR4FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR4Prediv")) {
                    @compileError("No Input XBAR4Prediv for XBAR4Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR4Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR4OutputType = struct {
            pub fn get(_: *const XBAR4OutputType) comptime_int {
                const from_input = XBAR4Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR4Findiv on XBAR4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 300000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR4Findiv on XBAR4Output | recive {d} max 300000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR5Type = struct {
            value: XBAR5Conf,
            pub fn get(comptime self: XBAR5Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR5PredivType = struct {
            value: XBAR5PredivConf,

            pub fn get(self: *const XBAR5PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR5")) {
                    @compileError("No Input XBAR5 for XBAR5Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR5.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR5FindivType = struct {
            value: XBAR5FindivConf,

            pub fn get(self: *const XBAR5FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR5Prediv")) {
                    @compileError("No Input XBAR5Prediv for XBAR5Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR5Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR5OutputType = struct {
            pub fn get(_: *const XBAR5OutputType) comptime_int {
                const from_input = XBAR5Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR5Findiv on XBAR5Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR5Findiv on XBAR5Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR6Type = struct {
            value: XBAR6Conf,
            pub fn get(comptime self: XBAR6Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR6PredivType = struct {
            value: XBAR6PredivConf,

            pub fn get(self: *const XBAR6PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR6")) {
                    @compileError("No Input XBAR6 for XBAR6Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR6.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR6FindivType = struct {
            value: XBAR6FindivConf,

            pub fn get(self: *const XBAR6FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR6Prediv")) {
                    @compileError("No Input XBAR6Prediv for XBAR6Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR6Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR6OutputType = struct {
            pub fn get(_: *const XBAR6OutputType) comptime_int {
                const from_input = XBAR6Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR6Findiv on XBAR6Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR6Findiv on XBAR6Output | recive {d} max 600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR7Type = struct {
            value: XBAR7Conf,
            pub fn get(comptime self: XBAR7Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR7PredivType = struct {
            value: XBAR7PredivConf,

            pub fn get(self: *const XBAR7PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR7")) {
                    @compileError("No Input XBAR7 for XBAR7Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR7.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR7FindivType = struct {
            value: XBAR7FindivConf,

            pub fn get(self: *const XBAR7FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR7Prediv")) {
                    @compileError("No Input XBAR7Prediv for XBAR7Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR7Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR7OutputType = struct {
            pub fn get(_: *const XBAR7OutputType) comptime_int {
                const from_input = XBAR7Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR7Findiv on XBAR7Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR7Findiv on XBAR7Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR8Type = struct {
            value: XBAR8Conf,
            pub fn get(comptime self: XBAR8Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR8PredivType = struct {
            value: XBAR8PredivConf,

            pub fn get(self: *const XBAR8PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR8")) {
                    @compileError("No Input XBAR8 for XBAR8Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR8.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR8FindivType = struct {
            value: XBAR8FindivConf,

            pub fn get(self: *const XBAR8FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR8Prediv")) {
                    @compileError("No Input XBAR8Prediv for XBAR8Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR8Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR8OutputType = struct {
            pub fn get(_: *const XBAR8OutputType) comptime_int {
                const from_input = XBAR8Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR8Findiv on XBAR8Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR8Findiv on XBAR8Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR9Type = struct {
            value: XBAR9Conf,
            pub fn get(comptime self: XBAR9Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR9PredivType = struct {
            value: XBAR9PredivConf,

            pub fn get(self: *const XBAR9PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR9")) {
                    @compileError("No Input XBAR9 for XBAR9Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR9.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR9FindivType = struct {
            value: XBAR9FindivConf,

            pub fn get(self: *const XBAR9FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR9Prediv")) {
                    @compileError("No Input XBAR9Prediv for XBAR9Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR9Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR9OutputType = struct {
            pub fn get(_: *const XBAR9OutputType) comptime_int {
                const from_input = XBAR9Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR9Findiv on XBAR9Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR9Findiv on XBAR9Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR10Type = struct {
            value: XBAR10Conf,
            pub fn get(comptime self: XBAR10Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const XBAR10PredivType = struct {
            value: XBAR10PredivConf,

            pub fn get(self: *const XBAR10PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR10")) {
                    @compileError("No Input XBAR10 for XBAR10Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR10.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR10FindivType = struct {
            value: XBAR10FindivConf,

            pub fn get(self: *const XBAR10FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR10Prediv")) {
                    @compileError("No Input XBAR10Prediv for XBAR10Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR10Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR10OutputType = struct {
            pub fn get(_: *const XBAR10OutputType) comptime_int {
                const from_input = XBAR10Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR10Findiv on XBAR10Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR10Findiv on XBAR10Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR11Type = struct {
            value: XBAR11Conf,
            pub fn get(comptime self: XBAR11Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const XBAR11PredivType = struct {
            value: XBAR11PredivConf,

            pub fn get(self: *const XBAR11PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR11")) {
                    @compileError("No Input XBAR11 for XBAR11Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR11.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR11FindivType = struct {
            value: XBAR11FindivConf,

            pub fn get(self: *const XBAR11FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR11Prediv")) {
                    @compileError("No Input XBAR11Prediv for XBAR11Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR11Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR11OutputType = struct {
            pub fn get(_: *const XBAR11OutputType) comptime_int {
                const from_input = XBAR11Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR11Findiv on XBAR11Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR11Findiv on XBAR11Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR12Type = struct {
            value: XBAR12Conf,
            pub fn get(comptime self: XBAR12Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR12PredivType = struct {
            value: XBAR12PredivConf,

            pub fn get(self: *const XBAR12PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR12")) {
                    @compileError("No Input XBAR12 for XBAR12Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR12.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR12FindivType = struct {
            value: XBAR12FindivConf,

            pub fn get(self: *const XBAR12FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR12Prediv")) {
                    @compileError("No Input XBAR12Prediv for XBAR12Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR12Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR12OutputType = struct {
            pub fn get(_: *const XBAR12OutputType) comptime_int {
                const from_input = XBAR12Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR12Findiv on XBAR12Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR12Findiv on XBAR12Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR13Type = struct {
            value: XBAR13Conf,
            pub fn get(comptime self: XBAR13Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR13PredivType = struct {
            value: XBAR13PredivConf,

            pub fn get(self: *const XBAR13PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR13")) {
                    @compileError("No Input XBAR13 for XBAR13Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR13.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR13FindivType = struct {
            value: XBAR13FindivConf,

            pub fn get(self: *const XBAR13FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR13Prediv")) {
                    @compileError("No Input XBAR13Prediv for XBAR13Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR13Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR13OutputType = struct {
            pub fn get(_: *const XBAR13OutputType) comptime_int {
                const from_input = XBAR13Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR13Findiv on XBAR13Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR13Findiv on XBAR13Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR14Type = struct {
            value: XBAR14Conf,
            pub fn get(comptime self: XBAR14Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR14PredivType = struct {
            value: XBAR14PredivConf,

            pub fn get(self: *const XBAR14PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR14")) {
                    @compileError("No Input XBAR14 for XBAR14Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR14.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR14FindivType = struct {
            value: XBAR14FindivConf,

            pub fn get(self: *const XBAR14FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR14Prediv")) {
                    @compileError("No Input XBAR14Prediv for XBAR14Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR14Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR14OutputType = struct {
            pub fn get(_: *const XBAR14OutputType) comptime_int {
                const from_input = XBAR14Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR14Findiv on XBAR14Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR14Findiv on XBAR14Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR15Type = struct {
            value: XBAR15Conf,
            pub fn get(comptime self: XBAR15Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR15PredivType = struct {
            value: XBAR15PredivConf,

            pub fn get(self: *const XBAR15PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR15")) {
                    @compileError("No Input XBAR15 for XBAR15Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR15.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR15FindivType = struct {
            value: XBAR15FindivConf,

            pub fn get(self: *const XBAR15FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR15Prediv")) {
                    @compileError("No Input XBAR15Prediv for XBAR15Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR15Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR15OutputType = struct {
            pub fn get(_: *const XBAR15OutputType) comptime_int {
                const from_input = XBAR15Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR15Findiv on XBAR15Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR15Findiv on XBAR15Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR16Type = struct {
            value: XBAR16Conf,
            pub fn get(comptime self: XBAR16Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const XBAR16PredivType = struct {
            value: XBAR16PredivConf,

            pub fn get(self: *const XBAR16PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR16")) {
                    @compileError("No Input XBAR16 for XBAR16Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR16.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR16FindivType = struct {
            value: XBAR16FindivConf,

            pub fn get(self: *const XBAR16FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR16Prediv")) {
                    @compileError("No Input XBAR16Prediv for XBAR16Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR16Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR16OutputType = struct {
            pub fn get(_: *const XBAR16OutputType) comptime_int {
                const from_input = XBAR16Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR16Findiv on XBAR16Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR16Findiv on XBAR16Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR17Type = struct {
            value: XBAR17Conf,
            pub fn get(comptime self: XBAR17Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const XBAR17PredivType = struct {
            value: XBAR17PredivConf,

            pub fn get(self: *const XBAR17PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR17")) {
                    @compileError("No Input XBAR17 for XBAR17Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR17.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR17FindivType = struct {
            value: XBAR17FindivConf,

            pub fn get(self: *const XBAR17FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR17Prediv")) {
                    @compileError("No Input XBAR17Prediv for XBAR17Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR17Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR17OutputType = struct {
            pub fn get(_: *const XBAR17OutputType) comptime_int {
                const from_input = XBAR17Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR17Findiv on XBAR17Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR17Findiv on XBAR17Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR18Type = struct {
            value: XBAR18Conf,
            pub fn get(comptime self: XBAR18Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const XBAR18PredivType = struct {
            value: XBAR18PredivConf,

            pub fn get(self: *const XBAR18PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR18")) {
                    @compileError("No Input XBAR18 for XBAR18Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR18.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR18FindivType = struct {
            value: XBAR18FindivConf,

            pub fn get(self: *const XBAR18FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR18Prediv")) {
                    @compileError("No Input XBAR18Prediv for XBAR18Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR18Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR18OutputType = struct {
            pub fn get(_: *const XBAR18OutputType) comptime_int {
                const from_input = XBAR18Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR18Findiv on XBAR18Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR18Findiv on XBAR18Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR19Type = struct {
            value: XBAR19Conf,
            pub fn get(comptime self: XBAR19Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR19PredivType = struct {
            value: XBAR19PredivConf,

            pub fn get(self: *const XBAR19PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR19")) {
                    @compileError("No Input XBAR19 for XBAR19Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR19.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR19FindivType = struct {
            value: XBAR19FindivConf,

            pub fn get(self: *const XBAR19FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR19Prediv")) {
                    @compileError("No Input XBAR19Prediv for XBAR19Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR19Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR19OutputType = struct {
            pub fn get(_: *const XBAR19OutputType) comptime_int {
                const from_input = XBAR19Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR19Findiv on XBAR19Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR19Findiv on XBAR19Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR20Type = struct {
            value: XBAR20Conf,
            pub fn get(comptime self: XBAR20Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR20PredivType = struct {
            value: XBAR20PredivConf,

            pub fn get(self: *const XBAR20PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR20")) {
                    @compileError("No Input XBAR20 for XBAR20Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR20.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR20FindivType = struct {
            value: XBAR20FindivConf,

            pub fn get(self: *const XBAR20FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR20Prediv")) {
                    @compileError("No Input XBAR20Prediv for XBAR20Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR20Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR20OutputType = struct {
            pub fn get(_: *const XBAR20OutputType) comptime_int {
                const from_input = XBAR20Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR20Findiv on XBAR20Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR20Findiv on XBAR20Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR21Type = struct {
            value: XBAR21Conf,
            pub fn get(comptime self: XBAR21Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR21PredivType = struct {
            value: XBAR21PredivConf,

            pub fn get(self: *const XBAR21PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR21")) {
                    @compileError("No Input XBAR21 for XBAR21Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR21.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR21FindivType = struct {
            value: XBAR21FindivConf,

            pub fn get(self: *const XBAR21FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR21Prediv")) {
                    @compileError("No Input XBAR21Prediv for XBAR21Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR21Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR21OutputType = struct {
            pub fn get(_: *const XBAR21OutputType) comptime_int {
                const from_input = XBAR21Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR21Findiv on XBAR21Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR21Findiv on XBAR21Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR22Type = struct {
            value: XBAR22Conf,
            pub fn get(comptime self: XBAR22Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR22PredivType = struct {
            value: XBAR22PredivConf,

            pub fn get(self: *const XBAR22PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR22")) {
                    @compileError("No Input XBAR22 for XBAR22Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR22.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR22FindivType = struct {
            value: XBAR22FindivConf,

            pub fn get(self: *const XBAR22FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR22Prediv")) {
                    @compileError("No Input XBAR22Prediv for XBAR22Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR22Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR22OutputType = struct {
            pub fn get(_: *const XBAR22OutputType) comptime_int {
                const from_input = XBAR22Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR22Findiv on XBAR22Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR22Findiv on XBAR22Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR23Type = struct {
            value: XBAR23Conf,
            pub fn get(comptime self: XBAR23Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const XBAR23PredivType = struct {
            value: XBAR23PredivConf,

            pub fn get(self: *const XBAR23PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR23")) {
                    @compileError("No Input XBAR23 for XBAR23Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR23.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR23FindivType = struct {
            value: XBAR23FindivConf,

            pub fn get(self: *const XBAR23FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR23Prediv")) {
                    @compileError("No Input XBAR23Prediv for XBAR23Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR23Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR23OutputType = struct {
            pub fn get(_: *const XBAR23OutputType) comptime_int {
                const from_input = XBAR23Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR23Findiv on XBAR23Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR23Findiv on XBAR23Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR24Type = struct {
            value: XBAR24Conf,
            pub fn get(comptime self: XBAR24Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const XBAR24PredivType = struct {
            value: XBAR24PredivConf,

            pub fn get(self: *const XBAR24PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR24")) {
                    @compileError("No Input XBAR24 for XBAR24Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR24.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR24FindivType = struct {
            value: XBAR24FindivConf,

            pub fn get(self: *const XBAR24FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR24Prediv")) {
                    @compileError("No Input XBAR24Prediv for XBAR24Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR24Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR24OutputType = struct {
            pub fn get(_: *const XBAR24OutputType) comptime_int {
                const from_input = XBAR24Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR24Findiv on XBAR24Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR24Findiv on XBAR24Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR25Type = struct {
            value: XBAR25Conf,
            pub fn get(comptime self: XBAR25Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const XBAR25PredivType = struct {
            value: XBAR25PredivConf,

            pub fn get(self: *const XBAR25PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR25")) {
                    @compileError("No Input XBAR25 for XBAR25Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR25.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR25FindivType = struct {
            value: XBAR25FindivConf,

            pub fn get(self: *const XBAR25FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR25Prediv")) {
                    @compileError("No Input XBAR25Prediv for XBAR25Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR25Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR25OutputType = struct {
            pub fn get(_: *const XBAR25OutputType) comptime_int {
                const from_input = XBAR25Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR25Findiv on XBAR25Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR25Findiv on XBAR25Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR26Type = struct {
            value: XBAR26Conf,
            pub fn get(comptime self: XBAR26Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR26PredivType = struct {
            value: XBAR26PredivConf,

            pub fn get(self: *const XBAR26PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR26")) {
                    @compileError("No Input XBAR26 for XBAR26Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR26.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR26FindivType = struct {
            value: XBAR26FindivConf,

            pub fn get(self: *const XBAR26FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR26Prediv")) {
                    @compileError("No Input XBAR26Prediv for XBAR26Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR26Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR26OutputType = struct {
            pub fn get(_: *const XBAR26OutputType) comptime_int {
                const from_input = XBAR26Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR26Findiv on XBAR26Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR26Findiv on XBAR26Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR27Type = struct {
            value: XBAR27Conf,
            pub fn get(comptime self: XBAR27Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR27PredivType = struct {
            value: XBAR27PredivConf,

            pub fn get(self: *const XBAR27PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR27")) {
                    @compileError("No Input XBAR27 for XBAR27Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR27.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR27FindivType = struct {
            value: XBAR27FindivConf,

            pub fn get(self: *const XBAR27FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR27Prediv")) {
                    @compileError("No Input XBAR27Prediv for XBAR27Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR27Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR27OutputType = struct {
            pub fn get(_: *const XBAR27OutputType) comptime_int {
                const from_input = XBAR27Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR27Findiv on XBAR27Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 314000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR27Findiv on XBAR27Output | recive {d} max 314000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR28Type = struct {
            value: XBAR28Conf,
            pub fn get(comptime self: XBAR28Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR28PredivType = struct {
            value: XBAR28PredivConf,

            pub fn get(self: *const XBAR28PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR28")) {
                    @compileError("No Input XBAR28 for XBAR28Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR28.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR28FindivType = struct {
            value: XBAR28FindivConf,

            pub fn get(self: *const XBAR28FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR28Prediv")) {
                    @compileError("No Input XBAR28Prediv for XBAR28Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR28Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR28OutputType = struct {
            pub fn get(_: *const XBAR28OutputType) comptime_int {
                const from_input = XBAR28Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR28Findiv on XBAR28Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 27000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR28Findiv on XBAR28Output | recive {d} max 27000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR29Type = struct {
            value: XBAR29Conf,
            pub fn get(comptime self: XBAR29Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR29PredivType = struct {
            value: XBAR29PredivConf,

            pub fn get(self: *const XBAR29PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR29")) {
                    @compileError("No Input XBAR29 for XBAR29Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR29.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR29FindivType = struct {
            value: XBAR29FindivConf,

            pub fn get(self: *const XBAR29FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR29Prediv")) {
                    @compileError("No Input XBAR29Prediv for XBAR29Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR29Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR29OutputType = struct {
            pub fn get(_: *const XBAR29OutputType) comptime_int {
                const from_input = XBAR29Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR29Findiv on XBAR29Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 333000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR29Findiv on XBAR29Output | recive {d} max 333000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR30Type = struct {
            value: XBAR30Conf,
            pub fn get(comptime self: XBAR30Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR30PredivType = struct {
            value: XBAR30PredivConf,

            pub fn get(self: *const XBAR30PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR30")) {
                    @compileError("No Input XBAR30 for XBAR30Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR30.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR30FindivType = struct {
            value: XBAR30FindivConf,

            pub fn get(self: *const XBAR30FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR30Prediv")) {
                    @compileError("No Input XBAR30Prediv for XBAR30Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR30Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR30OutputType = struct {
            pub fn get(_: *const XBAR30OutputType) comptime_int {
                const from_input = XBAR30Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR30Findiv on XBAR30Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 20000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR30Findiv on XBAR30Output | recive {d} max 20000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR31Type = struct {
            value: XBAR31Conf,
            pub fn get(comptime self: XBAR31Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR31PredivType = struct {
            value: XBAR31PredivConf,

            pub fn get(self: *const XBAR31PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR31")) {
                    @compileError("No Input XBAR31 for XBAR31Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR31.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR31FindivType = struct {
            value: XBAR31FindivConf,

            pub fn get(self: *const XBAR31FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR31Prediv")) {
                    @compileError("No Input XBAR31Prediv for XBAR31Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR31Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR31OutputType = struct {
            pub fn get(_: *const XBAR31OutputType) comptime_int {
                const from_input = XBAR31Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR31Findiv on XBAR31Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 27000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR31Findiv on XBAR31Output | recive {d} max 27000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR32Type = struct {
            value: XBAR32Conf,
            pub fn get(comptime self: XBAR32Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR32PredivType = struct {
            value: XBAR32PredivConf,

            pub fn get(self: *const XBAR32PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR32")) {
                    @compileError("No Input XBAR32 for XBAR32Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR32.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR32FindivType = struct {
            value: XBAR32FindivConf,

            pub fn get(self: *const XBAR32FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR32Prediv")) {
                    @compileError("No Input XBAR32Prediv for XBAR32Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR32Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR32OutputType = struct {
            pub fn get(_: *const XBAR32OutputType) comptime_int {
                const from_input = XBAR32Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR32Findiv on XBAR32Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 27000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR32Findiv on XBAR32Output | recive {d} max 27000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR33Type = struct {
            value: XBAR33Conf,
            pub fn get(comptime self: XBAR33Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR33PredivType = struct {
            value: XBAR33PredivConf,

            pub fn get(self: *const XBAR33PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR33")) {
                    @compileError("No Input XBAR33 for XBAR33Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR33.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR33FindivType = struct {
            value: XBAR33FindivConf,

            pub fn get(self: *const XBAR33FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR33Prediv")) {
                    @compileError("No Input XBAR33Prediv for XBAR33Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR33Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR33OutputType = struct {
            pub fn get(_: *const XBAR33OutputType) comptime_int {
                const from_input = XBAR33Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR33Findiv on XBAR33Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR33Findiv on XBAR33Output | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR34Type = struct {
            value: XBAR34Conf,
            pub fn get(comptime self: XBAR34Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR34PredivType = struct {
            value: XBAR34PredivConf,

            pub fn get(self: *const XBAR34PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR34")) {
                    @compileError("No Input XBAR34 for XBAR34Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR34.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR34FindivType = struct {
            value: XBAR34FindivConf,

            pub fn get(self: *const XBAR34FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR34Prediv")) {
                    @compileError("No Input XBAR34Prediv for XBAR34Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR34Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR34OutputType = struct {
            pub fn get(_: *const XBAR34OutputType) comptime_int {
                const from_input = XBAR34Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR34Findiv on XBAR34Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 25000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR34Findiv on XBAR34Output | recive {d} max 25000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR35Type = struct {
            value: XBAR35Conf,
            pub fn get(comptime self: XBAR35Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR35PredivType = struct {
            value: XBAR35PredivConf,

            pub fn get(self: *const XBAR35PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR35")) {
                    @compileError("No Input XBAR35 for XBAR35Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR35.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR35FindivType = struct {
            value: XBAR35FindivConf,

            pub fn get(self: *const XBAR35FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR35Prediv")) {
                    @compileError("No Input XBAR35Prediv for XBAR35Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR35Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR35OutputType = struct {
            pub fn get(_: *const XBAR35OutputType) comptime_int {
                const from_input = XBAR35Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR35Findiv on XBAR35Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR35Findiv on XBAR35Output | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR36Type = struct {
            value: XBAR36Conf,
            pub fn get(comptime self: XBAR36Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR36PredivType = struct {
            value: XBAR36PredivConf,

            pub fn get(self: *const XBAR36PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR36")) {
                    @compileError("No Input XBAR36 for XBAR36Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR36.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR36FindivType = struct {
            value: XBAR36FindivConf,

            pub fn get(self: *const XBAR36FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR36Prediv")) {
                    @compileError("No Input XBAR36Prediv for XBAR36Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR36Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR36OutputType = struct {
            pub fn get(_: *const XBAR36OutputType) comptime_int {
                const from_input = XBAR36Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR36Findiv on XBAR36Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR36Findiv on XBAR36Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR37Type = struct {
            value: XBAR37Conf,
            pub fn get(comptime self: XBAR37Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                };
            }
        };
        const XBAR37PredivType = struct {
            value: XBAR37PredivConf,

            pub fn get(self: *const XBAR37PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR37")) {
                    @compileError("No Input XBAR37 for XBAR37Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR37.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR37FindivType = struct {
            value: XBAR37FindivConf,

            pub fn get(self: *const XBAR37FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR37Prediv")) {
                    @compileError("No Input XBAR37Prediv for XBAR37Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR37Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR37OutputType = struct {
            pub fn get(_: *const XBAR37OutputType) comptime_int {
                const from_input = XBAR37Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR37Findiv on XBAR37Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR37Findiv on XBAR37Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR38Type = struct {
            value: XBAR38Conf,
            pub fn get(comptime self: XBAR38Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR38PredivType = struct {
            value: XBAR38PredivConf,

            pub fn get(self: *const XBAR38PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR38")) {
                    @compileError("No Input XBAR38 for XBAR38Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR38.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR38FindivType = struct {
            value: XBAR38FindivConf,

            pub fn get(self: *const XBAR38FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR38Prediv")) {
                    @compileError("No Input XBAR38Prediv for XBAR38Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR38Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR38OutputType = struct {
            pub fn get(_: *const XBAR38OutputType) comptime_int {
                const from_input = XBAR38Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR38Findiv on XBAR38Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR38Findiv on XBAR38Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR39Type = struct {
            value: XBAR39Conf,
            pub fn get(comptime self: XBAR39Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR39PredivType = struct {
            value: XBAR39PredivConf,

            pub fn get(self: *const XBAR39PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR39")) {
                    @compileError("No Input XBAR39 for XBAR39Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR39.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR39FindivType = struct {
            value: XBAR39FindivConf,

            pub fn get(self: *const XBAR39FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR39Prediv")) {
                    @compileError("No Input XBAR39Prediv for XBAR39Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR39Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR39OutputType = struct {
            pub fn get(_: *const XBAR39OutputType) comptime_int {
                const from_input = XBAR39Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR39Findiv on XBAR39Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR39Findiv on XBAR39Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR40Type = struct {
            value: XBAR40Conf,
            pub fn get(comptime self: XBAR40Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR40PredivType = struct {
            value: XBAR40PredivConf,

            pub fn get(self: *const XBAR40PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR40")) {
                    @compileError("No Input XBAR40 for XBAR40Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR40.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR40FindivType = struct {
            value: XBAR40FindivConf,

            pub fn get(self: *const XBAR40FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR40Prediv")) {
                    @compileError("No Input XBAR40Prediv for XBAR40Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR40Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR40OutputType = struct {
            pub fn get(_: *const XBAR40OutputType) comptime_int {
                const from_input = XBAR40Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR40Findiv on XBAR40Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR40Findiv on XBAR40Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR41Type = struct {
            value: XBAR41Conf,
            pub fn get(comptime self: XBAR41Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR41PredivType = struct {
            value: XBAR41PredivConf,

            pub fn get(self: *const XBAR41PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR41")) {
                    @compileError("No Input XBAR41 for XBAR41Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR41.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR41FindivType = struct {
            value: XBAR41FindivConf,

            pub fn get(self: *const XBAR41FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR41Prediv")) {
                    @compileError("No Input XBAR41Prediv for XBAR41Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR41Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR41OutputType = struct {
            pub fn get(_: *const XBAR41OutputType) comptime_int {
                const from_input = XBAR41Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR41Findiv on XBAR41Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 100000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR41Findiv on XBAR41Output | recive {d} max 100000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR42Type = struct {
            value: XBAR42Conf,
            pub fn get(comptime self: XBAR42Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR42PredivType = struct {
            value: XBAR42PredivConf,

            pub fn get(self: *const XBAR42PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR42")) {
                    @compileError("No Input XBAR42 for XBAR42Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR42.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR42FindivType = struct {
            value: XBAR42FindivConf,

            pub fn get(self: *const XBAR42FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR42Prediv")) {
                    @compileError("No Input XBAR42Prediv for XBAR42Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR42Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR42OutputType = struct {
            pub fn get(_: *const XBAR42OutputType) comptime_int {
                const from_input = XBAR42Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR42Findiv on XBAR42Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR42Findiv on XBAR42Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR43Type = struct {
            value: XBAR43Conf,
            pub fn get(comptime self: XBAR43Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR43PredivType = struct {
            value: XBAR43PredivConf,

            pub fn get(self: *const XBAR43PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR43")) {
                    @compileError("No Input XBAR43 for XBAR43Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR43.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR43FindivType = struct {
            value: XBAR43FindivConf,

            pub fn get(self: *const XBAR43FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR43Prediv")) {
                    @compileError("No Input XBAR43Prediv for XBAR43Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR43Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR43OutputType = struct {
            pub fn get(_: *const XBAR43OutputType) comptime_int {
                const from_input = XBAR43Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR43Findiv on XBAR43Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR43Findiv on XBAR43Output | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR44Type = struct {
            value: XBAR44Conf,
            pub fn get(comptime self: XBAR44Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR44PredivType = struct {
            value: XBAR44PredivConf,

            pub fn get(self: *const XBAR44PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR44")) {
                    @compileError("No Input XBAR44 for XBAR44Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR44.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR44FindivType = struct {
            value: XBAR44FindivConf,

            pub fn get(self: *const XBAR44FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR44Prediv")) {
                    @compileError("No Input XBAR44Prediv for XBAR44Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR44Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR44OutputType = struct {
            pub fn get(_: *const XBAR44OutputType) comptime_int {
                const from_input = XBAR44Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR44Findiv on XBAR44Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR44Findiv on XBAR44Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR45Type = struct {
            value: XBAR45Conf,
            pub fn get(comptime self: XBAR45Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR45PredivType = struct {
            value: XBAR45PredivConf,

            pub fn get(self: *const XBAR45PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR45")) {
                    @compileError("No Input XBAR45 for XBAR45Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR45.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR45FindivType = struct {
            value: XBAR45FindivConf,

            pub fn get(self: *const XBAR45FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR45Prediv")) {
                    @compileError("No Input XBAR45Prediv for XBAR45Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR45Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR45OutputType = struct {
            pub fn get(_: *const XBAR45OutputType) comptime_int {
                const from_input = XBAR45Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR45Findiv on XBAR45Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR45Findiv on XBAR45Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR46Type = struct {
            value: XBAR46Conf,
            pub fn get(comptime self: XBAR46Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR46PredivType = struct {
            value: XBAR46PredivConf,

            pub fn get(self: *const XBAR46PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR46")) {
                    @compileError("No Input XBAR46 for XBAR46Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR46.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR46FindivType = struct {
            value: XBAR46FindivConf,

            pub fn get(self: *const XBAR46FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR46Prediv")) {
                    @compileError("No Input XBAR46Prediv for XBAR46Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR46Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR46OutputType = struct {
            pub fn get(_: *const XBAR46OutputType) comptime_int {
                const from_input = XBAR46Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR46Findiv on XBAR46Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR46Findiv on XBAR46Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR47Type = struct {
            value: XBAR47Conf,
            pub fn get(comptime self: XBAR47Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR47PredivType = struct {
            value: XBAR47PredivConf,

            pub fn get(self: *const XBAR47PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR47")) {
                    @compileError("No Input XBAR47 for XBAR47Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR47.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR47FindivType = struct {
            value: XBAR47FindivConf,

            pub fn get(self: *const XBAR47FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR47Prediv")) {
                    @compileError("No Input XBAR47Prediv for XBAR47Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR47Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR47OutputType = struct {
            pub fn get(_: *const XBAR47OutputType) comptime_int {
                const from_input = XBAR47Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR47Findiv on XBAR47Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR47Findiv on XBAR47Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR48Type = struct {
            value: XBAR48Conf,
            pub fn get(comptime self: XBAR48Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR48PredivType = struct {
            value: XBAR48PredivConf,

            pub fn get(self: *const XBAR48PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR48")) {
                    @compileError("No Input XBAR48 for XBAR48Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR48.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR48FindivType = struct {
            value: XBAR48FindivConf,

            pub fn get(self: *const XBAR48FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR48Prediv")) {
                    @compileError("No Input XBAR48Prediv for XBAR48Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR48Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR48OutputType = struct {
            pub fn get(_: *const XBAR48OutputType) comptime_int {
                const from_input = XBAR48Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR48Findiv on XBAR48Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR48Findiv on XBAR48Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR49Type = struct {
            value: XBAR49Conf,
            pub fn get(comptime self: XBAR49Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR49PredivType = struct {
            value: XBAR49PredivConf,

            pub fn get(self: *const XBAR49PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR49")) {
                    @compileError("No Input XBAR49 for XBAR49Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR49.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR49FindivType = struct {
            value: XBAR49FindivConf,

            pub fn get(self: *const XBAR49FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR49Prediv")) {
                    @compileError("No Input XBAR49Prediv for XBAR49Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR49Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR49OutputType = struct {
            pub fn get(_: *const XBAR49OutputType) comptime_int {
                const from_input = XBAR49Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR49Findiv on XBAR49Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR49Findiv on XBAR49Output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR50Type = struct {
            value: XBAR50Conf,
            pub fn get(comptime self: XBAR50Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR50PredivType = struct {
            value: XBAR50PredivConf,

            pub fn get(self: *const XBAR50PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR50")) {
                    @compileError("No Input XBAR50 for XBAR50Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR50.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR50FindivType = struct {
            value: XBAR50FindivConf,

            pub fn get(self: *const XBAR50FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR50Prediv")) {
                    @compileError("No Input XBAR50Prediv for XBAR50Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR50Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR50OutputType = struct {
            pub fn get(_: *const XBAR50OutputType) comptime_int {
                const from_input = XBAR50Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR50Findiv on XBAR50Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR50Findiv on XBAR50Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR51Type = struct {
            value: XBAR51Conf,
            pub fn get(comptime self: XBAR51Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const XBAR51PredivType = struct {
            value: XBAR51PredivConf,

            pub fn get(self: *const XBAR51PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR51")) {
                    @compileError("No Input XBAR51 for XBAR51Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR51.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR51FindivType = struct {
            value: XBAR51FindivConf,

            pub fn get(self: *const XBAR51FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR51Prediv")) {
                    @compileError("No Input XBAR51Prediv for XBAR51Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR51Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR51OutputType = struct {
            pub fn get(_: *const XBAR51OutputType) comptime_int {
                const from_input = XBAR51Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR51Findiv on XBAR51Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR51Findiv on XBAR51Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR52Type = struct {
            value: XBAR52Conf,
            pub fn get(comptime self: XBAR52Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const XBAR52PredivType = struct {
            value: XBAR52PredivConf,

            pub fn get(self: *const XBAR52PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR52")) {
                    @compileError("No Input XBAR52 for XBAR52Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR52.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR52FindivType = struct {
            value: XBAR52FindivConf,

            pub fn get(self: *const XBAR52FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR52Prediv")) {
                    @compileError("No Input XBAR52Prediv for XBAR52Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR52Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR52OutputType = struct {
            pub fn get(_: *const XBAR52OutputType) comptime_int {
                const from_input = XBAR52Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR52Findiv on XBAR52Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR52Findiv on XBAR52Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR53Type = struct {
            value: XBAR53Conf,
            pub fn get(comptime self: XBAR53Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const XBAR53PredivType = struct {
            value: XBAR53PredivConf,

            pub fn get(self: *const XBAR53PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR53")) {
                    @compileError("No Input XBAR53 for XBAR53Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR53.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR53FindivType = struct {
            value: XBAR53FindivConf,

            pub fn get(self: *const XBAR53FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR53Prediv")) {
                    @compileError("No Input XBAR53Prediv for XBAR53Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR53Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR53OutputType = struct {
            pub fn get(_: *const XBAR53OutputType) comptime_int {
                const from_input = XBAR53Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR53Findiv on XBAR53Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR53Findiv on XBAR53Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR54Type = struct {
            value: XBAR54Conf,
            pub fn get(comptime self: XBAR54Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR54PredivType = struct {
            value: XBAR54PredivConf,

            pub fn get(self: *const XBAR54PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR54")) {
                    @compileError("No Input XBAR54 for XBAR54Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR54.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR54FindivType = struct {
            value: XBAR54FindivConf,

            pub fn get(self: *const XBAR54FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR54Prediv")) {
                    @compileError("No Input XBAR54Prediv for XBAR54Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR54Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR54OutputType = struct {
            pub fn get(_: *const XBAR54OutputType) comptime_int {
                const from_input = XBAR54Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR54Findiv on XBAR54Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR54Findiv on XBAR54Output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR55Type = struct {
            value: XBAR55Conf,
            pub fn get(comptime self: XBAR55Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR55PredivType = struct {
            value: XBAR55PredivConf,

            pub fn get(self: *const XBAR55PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR55")) {
                    @compileError("No Input XBAR55 for XBAR55Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR55.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR55FindivType = struct {
            value: XBAR55FindivConf,

            pub fn get(self: *const XBAR55FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR55Prediv")) {
                    @compileError("No Input XBAR55Prediv for XBAR55Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR55Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR55OutputType = struct {
            pub fn get(_: *const XBAR55OutputType) comptime_int {
                const from_input = XBAR55Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR55Findiv on XBAR55Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 125000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR55Findiv on XBAR55Output | recive {d} max 125000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR56Type = struct {
            value: XBAR56Conf,
            pub fn get(comptime self: XBAR56Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR56PredivType = struct {
            value: XBAR56PredivConf,

            pub fn get(self: *const XBAR56PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR56")) {
                    @compileError("No Input XBAR56 for XBAR56Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR56.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR56FindivType = struct {
            value: XBAR56FindivConf,

            pub fn get(self: *const XBAR56FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR56Prediv")) {
                    @compileError("No Input XBAR56Prediv for XBAR56Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR56Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR56OutputType = struct {
            pub fn get(_: *const XBAR56OutputType) comptime_int {
                const from_input = XBAR56Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR56Findiv on XBAR56Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR56Findiv on XBAR56Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR57Type = struct {
            value: XBAR57Conf,
            pub fn get(comptime self: XBAR57Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR57PredivType = struct {
            value: XBAR57PredivConf,

            pub fn get(self: *const XBAR57PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR57")) {
                    @compileError("No Input XBAR57 for XBAR57Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR57.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR57FindivType = struct {
            value: XBAR57FindivConf,

            pub fn get(self: *const XBAR57FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR57Prediv")) {
                    @compileError("No Input XBAR57Prediv for XBAR57Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR57Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR57OutputType = struct {
            pub fn get(_: *const XBAR57OutputType) comptime_int {
                const from_input = XBAR57Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR57Findiv on XBAR57Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 24000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR57Findiv on XBAR57Output | recive {d} max 24000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR58Type = struct {
            value: XBAR58Conf,
            pub fn get(comptime self: XBAR58Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const XBAR58PredivType = struct {
            value: XBAR58PredivConf,

            pub fn get(self: *const XBAR58PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR58")) {
                    @compileError("No Input XBAR58 for XBAR58Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR58.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR58FindivType = struct {
            value: XBAR58FindivConf,

            pub fn get(self: *const XBAR58FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR58Prediv")) {
                    @compileError("No Input XBAR58Prediv for XBAR58Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR58Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR58OutputType = struct {
            pub fn get(_: *const XBAR58OutputType) comptime_int {
                const from_input = XBAR58Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR58Findiv on XBAR58Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 24000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR58Findiv on XBAR58Output | recive {d} max 24000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR59Type = struct {
            value: XBAR59Conf,
            pub fn get(comptime self: XBAR59Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR59PredivType = struct {
            value: XBAR59PredivConf,

            pub fn get(self: *const XBAR59PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR59")) {
                    @compileError("No Input XBAR59 for XBAR59Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR59.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR59FindivType = struct {
            value: XBAR59FindivConf,

            pub fn get(self: *const XBAR59FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR59Prediv")) {
                    @compileError("No Input XBAR59Prediv for XBAR59Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR59Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR59OutputType = struct {
            pub fn get(_: *const XBAR59OutputType) comptime_int {
                const from_input = XBAR59Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR59Findiv on XBAR59Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 600000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR59Findiv on XBAR59Output | recive {d} max 600000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR60Type = struct {
            value: XBAR60Conf,
            pub fn get(comptime self: XBAR60Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                };
            }
        };
        const XBAR60PredivType = struct {
            value: XBAR60PredivConf,

            pub fn get(self: *const XBAR60PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR60")) {
                    @compileError("No Input XBAR60 for XBAR60Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR60.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR60FindivType = struct {
            value: XBAR60FindivConf,

            pub fn get(self: *const XBAR60FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR60Prediv")) {
                    @compileError("No Input XBAR60Prediv for XBAR60Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR60Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR60OutputType = struct {
            pub fn get(_: *const XBAR60OutputType) comptime_int {
                const from_input = XBAR60Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR60Findiv on XBAR60Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 50000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR60Findiv on XBAR60Output | recive {d} max 50000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR61Type = struct {
            value: XBAR61Conf,
            pub fn get(comptime self: XBAR61Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR61PredivType = struct {
            value: XBAR61PredivConf,

            pub fn get(self: *const XBAR61PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR61")) {
                    @compileError("No Input XBAR61 for XBAR61Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR61.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR61FindivType = struct {
            value: XBAR61FindivConf,

            pub fn get(self: *const XBAR61FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR61Prediv")) {
                    @compileError("No Input XBAR61Prediv for XBAR61Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR61Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR61OutputType = struct {
            pub fn get(_: *const XBAR61OutputType) comptime_int {
                const from_input = XBAR61Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR61Findiv on XBAR61Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 160000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR61Findiv on XBAR61Output | recive {d} max 160000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR62Type = struct {
            value: XBAR62Conf,
            pub fn get(comptime self: XBAR62Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const XBAR62PredivType = struct {
            value: XBAR62PredivConf,

            pub fn get(self: *const XBAR62PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR62")) {
                    @compileError("No Input XBAR62 for XBAR62Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR62.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR62FindivType = struct {
            value: XBAR62FindivConf,

            pub fn get(self: *const XBAR62FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR62Prediv")) {
                    @compileError("No Input XBAR62Prediv for XBAR62Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR62Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR62OutputType = struct {
            pub fn get(_: *const XBAR62OutputType) comptime_int {
                const from_input = XBAR62Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR62Findiv on XBAR62Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 160000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR62Findiv on XBAR62Output | recive {d} max 160000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const XBAR63Type = struct {
            value: XBAR63Conf,
            pub fn get(comptime self: XBAR63Type) comptime_int {
                return switch (self.value) {
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                };
            }
        };
        const XBAR63PredivType = struct {
            value: XBAR63PredivConf,

            pub fn get(self: *const XBAR63PredivType) comptime_int {
                if (!@hasDecl(this, "XBAR63")) {
                    @compileError("No Input XBAR63 for XBAR63Prediv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR63.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const XBAR63FindivType = struct {
            value: XBAR63FindivConf,

            pub fn get(self: *const XBAR63FindivType) comptime_int {
                if (!@hasDecl(this, "XBAR63Prediv")) {
                    @compileError("No Input XBAR63Prediv for XBAR63Findiv\n");
                }
                const from_input: comptime_float = @floatFromInt(this.XBAR63Prediv.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const XBAR63OutputType = struct {
            pub fn get(_: *const XBAR63OutputType) comptime_int {
                const from_input = XBAR63Findiv.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from XBAR63Findiv on XBAR63Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from XBAR63Findiv on XBAR63Output | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const CKINTSEL0Type = struct {
            value: CKINTSEL0Conf,
            pub fn get(comptime self: CKINTSEL0Type) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .PLL4Source => PLL4Source.get(),
                    .PLL5Source => PLL5Source.get(),
                    .PLL6Source => PLL6Source.get(),
                    .PLL7Source => PLL7Source.get(),
                    .PLL8Source => PLL8Source.get(),
                    .PLL1Source => PLL1Source.get(),
                    .PLL2Source => PLL2Source.get(),
                    .PLL3Source => PLL3Source.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .XBAR0Output => XBAR0Output.get(),
                    .XBAR1Output => XBAR1Output.get(),
                    .XBAR2Output => XBAR2Output.get(),
                    .XBAR3Output => XBAR3Output.get(),
                    .XBAR4Output => XBAR4Output.get(),
                    .XBAR5Output => XBAR5Output.get(),
                    .XBAR6Output => XBAR6Output.get(),
                    .XBAR7Output => XBAR7Output.get(),
                    .XBAR8Output => XBAR8Output.get(),
                    .XBAR9Output => XBAR9Output.get(),
                    .XBAR10Output => XBAR10Output.get(),
                    .XBAR11Output => XBAR11Output.get(),
                    .XBAR12Output => XBAR12Output.get(),
                    .XBAR13Output => XBAR13Output.get(),
                    .XBAR14Output => XBAR14Output.get(),
                    .XBAR15Output => XBAR15Output.get(),
                    .XBAR16Output => XBAR16Output.get(),
                    .XBAR17Output => XBAR17Output.get(),
                    .XBAR18Output => XBAR18Output.get(),
                    .XBAR19Output => XBAR19Output.get(),
                    .XBAR20Output => XBAR20Output.get(),
                    .XBAR21Output => XBAR21Output.get(),
                    .XBAR22Output => XBAR22Output.get(),
                    .XBAR23Output => XBAR23Output.get(),
                    .XBAR24Output => XBAR24Output.get(),
                    .XBAR25Output => XBAR25Output.get(),
                    .XBAR26Output => XBAR26Output.get(),
                    .XBAR27Output => XBAR27Output.get(),
                    .XBAR28Output => XBAR28Output.get(),
                    .XBAR29Output => XBAR29Output.get(),
                    .XBAR30Output => XBAR30Output.get(),
                    .XBAR31Output => XBAR31Output.get(),
                    .XBAR32Output => XBAR32Output.get(),
                    .XBAR33Output => XBAR33Output.get(),
                    .XBAR34Output => XBAR34Output.get(),
                    .XBAR35Output => XBAR35Output.get(),
                    .XBAR36Output => XBAR36Output.get(),
                    .XBAR37Output => XBAR37Output.get(),
                    .XBAR38Output => XBAR38Output.get(),
                    .XBAR39Output => XBAR39Output.get(),
                    .XBAR40Output => XBAR40Output.get(),
                    .XBAR41Output => XBAR41Output.get(),
                    .XBAR42Output => XBAR42Output.get(),
                    .XBAR43Output => XBAR43Output.get(),
                    .XBAR44Output => XBAR44Output.get(),
                    .XBAR45Output => XBAR45Output.get(),
                    .XBAR46Output => XBAR46Output.get(),
                    .XBAR47Output => XBAR47Output.get(),
                    .XBAR48Output => XBAR48Output.get(),
                    .XBAR49Output => XBAR49Output.get(),
                    .XBAR50Output => XBAR50Output.get(),
                    .XBAR51Output => XBAR51Output.get(),
                    .XBAR52Output => XBAR52Output.get(),
                    .XBAR53Output => XBAR53Output.get(),
                    .XBAR54Output => XBAR54Output.get(),
                    .XBAR55Output => XBAR55Output.get(),
                    .XBAR56Output => XBAR56Output.get(),
                    .XBAR57Output => XBAR57Output.get(),
                    .XBAR58Output => XBAR58Output.get(),
                    .XBAR59Output => XBAR59Output.get(),
                    .XBAR60Output => XBAR60Output.get(),
                    .XBAR61Output => XBAR61Output.get(),
                    .XBAR62Output => XBAR62Output.get(),
                    .XBAR63Output => XBAR63Output.get(),
                };
            }
        };
        const CKEXTSEL0Type = struct {
            value: CKEXTSEL0Conf,
            pub fn get(comptime self: CKEXTSEL0Type) comptime_int {
                return switch (self.value) {
                    .PLL1Div42 => PLL1Div42.get(),
                    .PLL2Div4 => PLL2Div4.get(),
                    .PLL3Div2 => PLL3Div2.get(),
                };
            }
        };
        const CKINTSEL1Type = struct {
            value: CKINTSEL1Conf,
            pub fn get(comptime self: CKINTSEL1Type) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
                    .PLL4Source => PLL4Source.get(),
                    .PLL5Source => PLL5Source.get(),
                    .PLL6Source => PLL6Source.get(),
                    .PLL7Source => PLL7Source.get(),
                    .PLL8Source => PLL8Source.get(),
                    .PLL1Source => PLL1Source.get(),
                    .PLL2Source => PLL2Source.get(),
                    .PLL3Source => PLL3Source.get(),
                    .FOUTPOSTDIV4 => FOUTPOSTDIV4.get(),
                    .FOUTPOSTDIV5 => FOUTPOSTDIV5.get(),
                    .FOUTPOSTDIV6 => FOUTPOSTDIV6.get(),
                    .FOUTPOSTDIV7 => FOUTPOSTDIV7.get(),
                    .FOUTPOSTDIV8 => FOUTPOSTDIV8.get(),
                    .SPDIF => SPDIF.get(),
                    .I2S_CKIN => I2S_CKIN.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                    .XBAR0Output => XBAR0Output.get(),
                    .XBAR1Output => XBAR1Output.get(),
                    .XBAR2Output => XBAR2Output.get(),
                    .XBAR3Output => XBAR3Output.get(),
                    .XBAR4Output => XBAR4Output.get(),
                    .XBAR5Output => XBAR5Output.get(),
                    .XBAR6Output => XBAR6Output.get(),
                    .XBAR7Output => XBAR7Output.get(),
                    .XBAR8Output => XBAR8Output.get(),
                    .XBAR9Output => XBAR9Output.get(),
                    .XBAR10Output => XBAR10Output.get(),
                    .XBAR11Output => XBAR11Output.get(),
                    .XBAR12Output => XBAR12Output.get(),
                    .XBAR13Output => XBAR13Output.get(),
                    .XBAR14Output => XBAR14Output.get(),
                    .XBAR15Output => XBAR15Output.get(),
                    .XBAR16Output => XBAR16Output.get(),
                    .XBAR17Output => XBAR17Output.get(),
                    .XBAR18Output => XBAR18Output.get(),
                    .XBAR19Output => XBAR19Output.get(),
                    .XBAR20Output => XBAR20Output.get(),
                    .XBAR21Output => XBAR21Output.get(),
                    .XBAR22Output => XBAR22Output.get(),
                    .XBAR23Output => XBAR23Output.get(),
                    .XBAR24Output => XBAR24Output.get(),
                    .XBAR25Output => XBAR25Output.get(),
                    .XBAR26Output => XBAR26Output.get(),
                    .XBAR27Output => XBAR27Output.get(),
                    .XBAR28Output => XBAR28Output.get(),
                    .XBAR29Output => XBAR29Output.get(),
                    .XBAR30Output => XBAR30Output.get(),
                    .XBAR31Output => XBAR31Output.get(),
                    .XBAR32Output => XBAR32Output.get(),
                    .XBAR33Output => XBAR33Output.get(),
                    .XBAR34Output => XBAR34Output.get(),
                    .XBAR35Output => XBAR35Output.get(),
                    .XBAR36Output => XBAR36Output.get(),
                    .XBAR37Output => XBAR37Output.get(),
                    .XBAR38Output => XBAR38Output.get(),
                    .XBAR39Output => XBAR39Output.get(),
                    .XBAR40Output => XBAR40Output.get(),
                    .XBAR41Output => XBAR41Output.get(),
                    .XBAR42Output => XBAR42Output.get(),
                    .XBAR43Output => XBAR43Output.get(),
                    .XBAR44Output => XBAR44Output.get(),
                    .XBAR45Output => XBAR45Output.get(),
                    .XBAR46Output => XBAR46Output.get(),
                    .XBAR47Output => XBAR47Output.get(),
                    .XBAR48Output => XBAR48Output.get(),
                    .XBAR49Output => XBAR49Output.get(),
                    .XBAR50Output => XBAR50Output.get(),
                    .XBAR51Output => XBAR51Output.get(),
                    .XBAR52Output => XBAR52Output.get(),
                    .XBAR53Output => XBAR53Output.get(),
                    .XBAR54Output => XBAR54Output.get(),
                    .XBAR55Output => XBAR55Output.get(),
                    .XBAR56Output => XBAR56Output.get(),
                    .XBAR57Output => XBAR57Output.get(),
                    .XBAR58Output => XBAR58Output.get(),
                    .XBAR59Output => XBAR59Output.get(),
                    .XBAR60Output => XBAR60Output.get(),
                    .XBAR61Output => XBAR61Output.get(),
                    .XBAR62Output => XBAR62Output.get(),
                    .XBAR63Output => XBAR63Output.get(),
                };
            }
        };
        const CKEXTSEL1Type = struct {
            value: CKEXTSEL1Conf,
            pub fn get(comptime self: CKEXTSEL1Type) comptime_int {
                return switch (self.value) {
                    .PLL1Div42 => PLL1Div42.get(),
                    .PLL2Div4 => PLL2Div4.get(),
                    .PLL3Div2 => PLL3Div2.get(),
                };
            }
        };
        const OBS0Type = struct {
            value: OBS0Conf,
            pub fn get(comptime self: OBS0Type) comptime_int {
                return switch (self.value) {
                    .CKINTSEL0 => CKINTSEL0.get(),
                    .CKEXTSEL0 => CKEXTSEL0.get(),
                };
            }
        };
        const OBS0OutputType = struct {
            pub fn get(_: *const OBS0OutputType) comptime_int {
                return OBS0.get();
            }
        };
        const OBS1Type = struct {
            value: OBS1Conf,
            pub fn get(comptime self: OBS1Type) comptime_int {
                return switch (self.value) {
                    .CKINTSEL1 => CKINTSEL1.get(),
                    .CKEXTSEL1 => CKEXTSEL1.get(),
                };
            }
        };
        const OBS1OutputType = struct {
            pub fn get(_: *const OBS1OutputType) comptime_int {
                return OBS1.get();
            }
        };
        const MCO1MultType = struct {
            value: MCO1MultConf,
            pub fn get(comptime self: MCO1MultType) comptime_int {
                return switch (self.value) {
                    .XBAR61Output => XBAR61Output.get(),
                    .OBS0Output => OBS0Output.get(),
                };
            }
        };
        const MCO1PinType = struct {
            pub fn get(_: *const MCO1PinType) comptime_int {
                return MCO1Mult.get();
            }
        };
        const MCO2MultType = struct {
            value: MCO2MultConf,
            pub fn get(comptime self: MCO2MultType) comptime_int {
                return switch (self.value) {
                    .XBAR62Output => XBAR62Output.get(),
                    .OBS1Output => OBS1Output.get(),
                };
            }
        };
        const MCO2PinType = struct {
            pub fn get(_: *const MCO2PinType) comptime_int {
                return MCO2Mult.get();
            }
        };
        const D3PERType = struct {
            value: D3PERConf,
            pub fn get(comptime self: D3PERType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .LSIRC => LSIRC.get(),
                    .LSEOSC => LSEOSC.get(),
                };
            }
        };
        const D3PEROutputType = struct {
            pub fn get(_: *const D3PEROutputType) comptime_int {
                const from_input = D3PER.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from D3PER on D3PEROutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from D3PER on D3PEROutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DTSType = struct {
            value: DTSConf,
            pub fn get(comptime self: DTSType) comptime_int {
                return switch (self.value) {
                    .MSIRC => MSIRC.get(),
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const DTSOutputType = struct {
            pub fn get(_: *const DTSOutputType) comptime_int {
                const from_input = DTS.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DTS on DTSOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 64000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DTS on DTSOutput | recive {d} max 64000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DSIPHYType = struct {
            value: DSIPHYConf,
            pub fn get(comptime self: DSIPHYType) comptime_int {
                return switch (self.value) {
                    .XBAR28Output => XBAR28Output.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const DSIPHYOutputType = struct {
            pub fn get(_: *const DSIPHYOutputType) comptime_int {
                const from_input = DSIPHY.get();
                if (from_input < 17000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DSIPHY on DSIPHYOutput | recive {d} min 17000000\n", .{from_input}));
                } else if (from_input > 27000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DSIPHY on DSIPHYOutput | recive {d} max 27000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const DSIBLANEType = struct {
            value: DSIBLANEConf,
            pub fn get(comptime self: DSIBLANEType) comptime_int {
                return switch (self.value) {
                    .DSIPHYOutput => DSIPHYOutput.get(),
                    .XBAR27Output => XBAR27Output.get(),
                };
            }
        };
        const DSIBLANEOutputType = struct {
            pub fn get(_: *const DSIBLANEOutputType) comptime_int {
                const from_input = DSIBLANE.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from DSIBLANE on DSIBLANEOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 314000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from DSIBLANE on DSIBLANEOutput | recive {d} max 314000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USB2PHY1Type = struct {
            value: USB2PHY1Conf,
            pub fn get(comptime self: USB2PHY1Type) comptime_int {
                return switch (self.value) {
                    .XBAR57Output => XBAR57Output.get(),
                    .HSEDIV2 => HSEDIV2.get(),
                };
            }
        };
        const USB2PHY1OutputType = struct {
            pub fn get(_: *const USB2PHY1OutputType) comptime_int {
                const from_input = USB2PHY1.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USB2PHY1 on USB2PHY1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 24000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USB2PHY1 on USB2PHY1Output | recive {d} max 24000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USB2PHY2Type = struct {
            value: USB2PHY2Conf,
            pub fn get(comptime self: USB2PHY2Type) comptime_int {
                return switch (self.value) {
                    .XBAR58Output => XBAR58Output.get(),
                    .HSEDIV2 => HSEDIV2.get(),
                };
            }
        };
        const USB2PHY2OutputType = struct {
            pub fn get(_: *const USB2PHY2OutputType) comptime_int {
                const from_input = USB2PHY2.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USB2PHY2 on USB2PHY2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 24000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USB2PHY2 on USB2PHY2Output | recive {d} max 24000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const USB3PCIPHYType = struct {
            value: USB3PCIPHYConf,
            pub fn get(comptime self: USB3PCIPHYType) comptime_int {
                return switch (self.value) {
                    .XBAR34Output => XBAR34Output.get(),
                    .HSEDIV2 => HSEDIV2.get(),
                };
            }
        };
        const USB3PCIPHYOutputType = struct {
            pub fn get(_: *const USB3PCIPHYOutputType) comptime_int {
                const from_input = USB3PCIPHY.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from USB3PCIPHY on USB3PCIPHYOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 25000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from USB3PCIPHY on USB3PCIPHYOutput | recive {d} max 25000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const SysClkSourceType = struct {
            value: SysClkSourceConf,
            pub fn get(comptime self: SysClkSourceType) comptime_int {
                return switch (self.value) {
                    .XBAR0Output => XBAR0Output.get(),
                    .HSIRC => HSIRC.get(),
                };
            }
        };
        const SysCLKOutputType = struct {
            pub fn get(_: *const SysCLKOutputType) comptime_int {
                const from_input = SysClkSource.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysClkSource on SysCLKOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysClkSource on SysCLKOutput | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const MCUDIVType = struct {
            value: MCUDIVConf,

            pub fn get(self: *const MCUDIVType) comptime_int {
                if (!@hasDecl(this, "SysCLKOutput")) {
                    @compileError("No Input SysCLKOutput for MCUDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.SysCLKOutput.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const McuClockOutputType = struct {
            pub fn get(_: *const McuClockOutputType) comptime_int {
                const from_input = SysCLKOutput.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from SysCLKOutput on McuClockOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 400000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from SysCLKOutput on McuClockOutput | recive {d} max 400000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB3DIVType = struct {
            value: APB3DIVConf,

            pub fn get(self: *const APB3DIVType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for APB3DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB3OutputType = struct {
            pub fn get(_: *const APB3OutputType) comptime_int {
                const from_input = APB3DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB3DIV on APB3Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB3DIV on APB3Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB4DIVType = struct {
            value: APB4DIVConf,

            pub fn get(self: *const APB4DIVType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for APB4DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APB4OutputType = struct {
            pub fn get(_: *const APB4OutputType) comptime_int {
                const from_input = APB4DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB4DIV on APB4Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB4DIV on APB4Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APBDBGDIVType = struct {
            value: APBDBGDIVConf,

            pub fn get(self: *const APBDBGDIVType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for APBDBGDIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const APBDBGOutputType = struct {
            pub fn get(_: *const APBDBGOutputType) comptime_int {
                const from_input = APBDBGDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APBDBGDIV on APBDBGOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APBDBGDIV on APBDBGOutput | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB1DIVType = struct {
            value: APB1DIVConf,

            pub fn get(self: *const APB1DIVType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for APB1DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const Tim1MulType = struct {
            pub fn get(_: *const Tim1MulType) comptime_int {
                if (!@hasDecl(this, "APB1DIV")) {
                    @compileError("No Input APB1DIV for Tim1Mul\n");
                }
                const from_input = this.APB1DIV.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const Tim1OutputType = struct {
            pub fn get(_: *const Tim1OutputType) comptime_int {
                const from_input = Tim1Mul.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from Tim1Mul on Tim1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from Tim1Mul on Tim1Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const AHBOutputType = struct {
            pub fn get(_: *const AHBOutputType) comptime_int {
                const from_input = MCUDIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from MCUDIV on AHBOutput | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from MCUDIV on AHBOutput | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB1OutputType = struct {
            pub fn get(_: *const APB1OutputType) comptime_int {
                const from_input = APB1DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB1DIV on APB1Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB1DIV on APB1Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB2DIVType = struct {
            value: APB2DIVConf,

            pub fn get(self: *const APB2DIVType) comptime_int {
                if (!@hasDecl(this, "MCUDIV")) {
                    @compileError("No Input MCUDIV for APB2DIV\n");
                }
                const from_input: comptime_float = @floatFromInt(this.MCUDIV.get());
                const div: comptime_float = self.value.get();
                return @intFromFloat((from_input / div));
            }
        };

        const Tim2MulType = struct {
            pub fn get(_: *const Tim2MulType) comptime_int {
                if (!@hasDecl(this, "APB2DIV")) {
                    @compileError("No Input APB2DIV for Tim2Mul\n");
                }
                const from_input = this.APB2DIV.get();
                const multi = 2;
                return (from_input * multi);
            }
        };

        const Tim2OutputType = struct {
            pub fn get(_: *const Tim2OutputType) comptime_int {
                const from_input = Tim2Mul.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from Tim2Mul on Tim2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from Tim2Mul on Tim2Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const APB2OutputType = struct {
            pub fn get(_: *const APB2OutputType) comptime_int {
                const from_input = APB2DIV.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from APB2DIV on APB2Output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from APB2DIV on APB2Output | recive {d} max 200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const ADC12MultType = struct {
            value: ADC12MultConf,
            pub fn get(comptime self: ADC12MultType) comptime_int {
                return switch (self.value) {
                    .XBAR46Output => XBAR46Output.get(),
                    .XBAR0Output => XBAR0Output.get(),
                };
            }
        };
        const ADC12outputType = struct {
            pub fn get(_: *const ADC12outputType) comptime_int {
                const from_input = ADC12Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADC12Mult on ADC12output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADC12Mult on ADC12output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const ADC3MultType = struct {
            value: ADC3MultConf,
            pub fn get(comptime self: ADC3MultType) comptime_int {
                return switch (self.value) {
                    .XBAR47Output => XBAR47Output.get(),
                    .XBAR0Output => XBAR0Output.get(),
                    .XBAR46Output => XBAR46Output.get(),
                };
            }
        };
        const ADC3outputType = struct {
            pub fn get(_: *const ADC3outputType) comptime_int {
                const from_input = ADC3Mult.get();
                if (from_input < 0) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from ADC3Mult on ADC3output | recive {d} min 0\n", .{from_input}));
                } else if (from_input > 133000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from ADC3Mult on ADC3output | recive {d} max 133000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLL1SourceType = struct {
            value: PLL1SourceConf,
            pub fn get(comptime self: PLL1SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
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
                    .HSEOSC => HSEOSC.get(),
                    .MSIRC => MSIRC.get(),
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
        const PLL1Div42Type = struct {
            pub fn get(_: *const PLL1Div42Type) comptime_int {
                if (!@hasDecl(this, "FOUTPOSTDIV1")) {
                    @compileError("No Input FOUTPOSTDIV1 for PLL1Div42\n");
                }
                const from_input = this.FOUTPOSTDIV1.get();
                const div = 42;
                return (from_input / div);
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
        const PLL2Div4Type = struct {
            pub fn get(_: *const PLL2Div4Type) comptime_int {
                if (!@hasDecl(this, "FOUTPOSTDIV2")) {
                    @compileError("No Input FOUTPOSTDIV2 for PLL2Div4\n");
                }
                const from_input = this.FOUTPOSTDIV2.get();
                const div = 4;
                return (from_input / div);
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
        const PLL3Div2Type = struct {
            pub fn get(_: *const PLL3Div2Type) comptime_int {
                if (!@hasDecl(this, "FOUTPOSTDIV3")) {
                    @compileError("No Input FOUTPOSTDIV3 for PLL3Div2\n");
                }
                const from_input = this.FOUTPOSTDIV3.get();
                const div = 2;
                return (from_input / div);
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
        const PLL5SourceType = struct {
            value: PLL5SourceConf,
            pub fn get(comptime self: PLL5SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const FREFDIV5Type = struct {
            value: FREFDIV5Conf,

            pub fn get(self: *const FREFDIV5Type) comptime_int {
                if (!@hasDecl(this, "PLL5Source")) {
                    @compileError("No Input PLL5Source for FREFDIV5\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL5Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FBDIV5Type = struct {
            value: FBDIV5Conf,

            pub fn get(self: *const FBDIV5Type) comptime_int {
                if (!@hasDecl(this, "FREFDIV5")) {
                    @compileError("No Input FREFDIV5 for FBDIV5\n");
                } else if (!@hasDecl(this, "PLL5FRACV")) {
                    @compileError("No fractional  value: PLL5FRACV for FBDIV5\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FREFDIV5.get());
                const frac: comptime_float = @floatFromInt(this.PLL5FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL5FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL5FRACVType = struct {
            value: PLL5FRACVConf,
            pub fn get(comptime self: PLL5FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const POSTDIV1_5Type = struct {
            value: POSTDIV1_5Conf,

            pub fn get(self: *const POSTDIV1_5Type) comptime_int {
                if (!@hasDecl(this, "FBDIV5")) {
                    @compileError("No Input FBDIV5 for POSTDIV1_5\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FBDIV5.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const POSTDIV2_5Type = struct {
            value: POSTDIV2_5Conf,

            pub fn get(self: *const POSTDIV2_5Type) comptime_int {
                if (!@hasDecl(this, "POSTDIV1_5")) {
                    @compileError("No Input POSTDIV1_5 for POSTDIV2_5\n");
                }
                const from_input: comptime_float = @floatFromInt(this.POSTDIV1_5.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FOUTPOSTDIV5Type = struct {
            pub fn get(_: *const FOUTPOSTDIV5Type) comptime_int {
                const from_input = POSTDIV2_5.get();
                if (from_input < 16000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from POSTDIV2_5 on FOUTPOSTDIV5 | recive {d} min 16000000\n", .{from_input}));
                } else if (from_input > 3200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from POSTDIV2_5 on FOUTPOSTDIV5 | recive {d} max 3200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLL6SourceType = struct {
            value: PLL6SourceConf,
            pub fn get(comptime self: PLL6SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const FREFDIV6Type = struct {
            value: FREFDIV6Conf,

            pub fn get(self: *const FREFDIV6Type) comptime_int {
                if (!@hasDecl(this, "PLL6Source")) {
                    @compileError("No Input PLL6Source for FREFDIV6\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL6Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FBDIV6Type = struct {
            value: FBDIV6Conf,

            pub fn get(self: *const FBDIV6Type) comptime_int {
                if (!@hasDecl(this, "FREFDIV6")) {
                    @compileError("No Input FREFDIV6 for FBDIV6\n");
                } else if (!@hasDecl(this, "PLL6FRACV")) {
                    @compileError("No fractional  value: PLL6FRACV for FBDIV6\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FREFDIV6.get());
                const frac: comptime_float = @floatFromInt(this.PLL6FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL6FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL6FRACVType = struct {
            value: PLL6FRACVConf,
            pub fn get(comptime self: PLL6FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const POSTDIV1_6Type = struct {
            value: POSTDIV1_6Conf,

            pub fn get(self: *const POSTDIV1_6Type) comptime_int {
                if (!@hasDecl(this, "FBDIV6")) {
                    @compileError("No Input FBDIV6 for POSTDIV1_6\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FBDIV6.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const POSTDIV2_6Type = struct {
            value: POSTDIV2_6Conf,

            pub fn get(self: *const POSTDIV2_6Type) comptime_int {
                if (!@hasDecl(this, "POSTDIV1_6")) {
                    @compileError("No Input POSTDIV1_6 for POSTDIV2_6\n");
                }
                const from_input: comptime_float = @floatFromInt(this.POSTDIV1_6.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FOUTPOSTDIV6Type = struct {
            pub fn get(_: *const FOUTPOSTDIV6Type) comptime_int {
                const from_input = POSTDIV2_6.get();
                if (from_input < 16000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from POSTDIV2_6 on FOUTPOSTDIV6 | recive {d} min 16000000\n", .{from_input}));
                } else if (from_input > 3200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from POSTDIV2_6 on FOUTPOSTDIV6 | recive {d} max 3200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLL7SourceType = struct {
            value: PLL7SourceConf,
            pub fn get(comptime self: PLL7SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const FREFDIV7Type = struct {
            value: FREFDIV7Conf,

            pub fn get(self: *const FREFDIV7Type) comptime_int {
                if (!@hasDecl(this, "PLL7Source")) {
                    @compileError("No Input PLL7Source for FREFDIV7\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL7Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FBDIV7Type = struct {
            value: FBDIV7Conf,

            pub fn get(self: *const FBDIV7Type) comptime_int {
                if (!@hasDecl(this, "FREFDIV7")) {
                    @compileError("No Input FREFDIV7 for FBDIV7\n");
                } else if (!@hasDecl(this, "PLL7FRACV")) {
                    @compileError("No fractional  value: PLL7FRACV for FBDIV7\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FREFDIV7.get());
                const frac: comptime_float = @floatFromInt(this.PLL7FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL7FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL7FRACVType = struct {
            value: PLL7FRACVConf,
            pub fn get(comptime self: PLL7FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const POSTDIV1_7Type = struct {
            value: POSTDIV1_7Conf,

            pub fn get(self: *const POSTDIV1_7Type) comptime_int {
                if (!@hasDecl(this, "FBDIV7")) {
                    @compileError("No Input FBDIV7 for POSTDIV1_7\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FBDIV7.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const POSTDIV2_7Type = struct {
            value: POSTDIV2_7Conf,

            pub fn get(self: *const POSTDIV2_7Type) comptime_int {
                if (!@hasDecl(this, "POSTDIV1_7")) {
                    @compileError("No Input POSTDIV1_7 for POSTDIV2_7\n");
                }
                const from_input: comptime_float = @floatFromInt(this.POSTDIV1_7.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FOUTPOSTDIV7Type = struct {
            pub fn get(_: *const FOUTPOSTDIV7Type) comptime_int {
                const from_input = POSTDIV2_7.get();
                if (from_input < 16000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from POSTDIV2_7 on FOUTPOSTDIV7 | recive {d} min 16000000\n", .{from_input}));
                } else if (from_input > 3200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from POSTDIV2_7 on FOUTPOSTDIV7 | recive {d} max 3200000000\n", .{from_input}));
                }
                return from_input;
            }
        };
        const PLL8SourceType = struct {
            value: PLL8SourceConf,
            pub fn get(comptime self: PLL8SourceType) comptime_int {
                return switch (self.value) {
                    .HSIRC => HSIRC.get(),
                    .MSIRC => MSIRC.get(),
                    .HSEOSC => HSEOSC.get(),
                };
            }
        };
        const FREFDIV8Type = struct {
            value: FREFDIV8Conf,

            pub fn get(self: *const FREFDIV8Type) comptime_int {
                if (!@hasDecl(this, "PLL8Source")) {
                    @compileError("No Input PLL8Source for FREFDIV8\n");
                }
                const from_input: comptime_float = @floatFromInt(this.PLL8Source.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FBDIV8Type = struct {
            value: FBDIV8Conf,

            pub fn get(self: *const FBDIV8Type) comptime_int {
                if (!@hasDecl(this, "FREFDIV8")) {
                    @compileError("No Input FREFDIV8 for FBDIV8\n");
                } else if (!@hasDecl(this, "PLL8FRACV")) {
                    @compileError("No fractional  value: PLL8FRACV for FBDIV8\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FREFDIV8.get());
                const frac: comptime_float = @floatFromInt(this.PLL8FRACV.get());
                const max_frac: comptime_float = @floatFromInt(this.PLL8FRACV.max());
                const multi: comptime_float = self.value.get();
                return @intFromFloat((from_input * (multi + (frac / max_frac))));
            }
        };

        const PLL8FRACVType = struct {
            value: PLL8FRACVConf,
            pub fn get(comptime self: PLL8FRACVType) comptime_int {
                return self.value.get();
            }
        };
        const POSTDIV1_8Type = struct {
            value: POSTDIV1_8Conf,

            pub fn get(self: *const POSTDIV1_8Type) comptime_int {
                if (!@hasDecl(this, "FBDIV8")) {
                    @compileError("No Input FBDIV8 for POSTDIV1_8\n");
                }
                const from_input: comptime_float = @floatFromInt(this.FBDIV8.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const POSTDIV2_8Type = struct {
            value: POSTDIV2_8Conf,

            pub fn get(self: *const POSTDIV2_8Type) comptime_int {
                if (!@hasDecl(this, "POSTDIV1_8")) {
                    @compileError("No Input POSTDIV1_8 for POSTDIV2_8\n");
                }
                const from_input: comptime_float = @floatFromInt(this.POSTDIV1_8.get());
                const div = self.value.get();
                return @intFromFloat(from_input / div);
            }
        };

        const FOUTPOSTDIV8Type = struct {
            pub fn get(_: *const FOUTPOSTDIV8Type) comptime_int {
                const from_input = POSTDIV2_8.get();
                if (from_input < 16000000) {
                    @compileError(std.fmt.comptimePrint("Underflow clock from POSTDIV2_8 on FOUTPOSTDIV8 | recive {d} min 16000000\n", .{from_input}));
                } else if (from_input > 3200000000) {
                    @compileError(std.fmt.comptimePrint("OverFlow clock from POSTDIV2_8 on FOUTPOSTDIV8 | recive {d} max 3200000000\n", .{from_input}));
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
        const HSEOSC = HSEOSCType{ .value = conf.HSEOSC };
        const HSEDIV2 = HSEDIV2Type{ .value = conf.HSEDIV2 };
        const SPDIF = SPDIFType{ .value = conf.SPDIF };
        const LSIRC = LSIRCType{};
        const LSEOSC = LSEOSCType{ .value = conf.LSEOSC };
        const MSIRC = MSIRCType{ .value = conf.MSIRC };
        const I2S_CKIN = I2S_CKINType{};
        const XBAR0 = XBAR0Type{ .value = conf.XBAR0 };
        const XBAR0Prediv = XBAR0PredivType{ .value = conf.XBAR0Prediv };
        const XBAR0Findiv = XBAR0FindivType{ .value = conf.XBAR0Findiv };
        pub const XBAR0Output = XBAR0OutputType{};
        const XBAR1 = XBAR1Type{ .value = conf.XBAR1 };
        const XBAR1Prediv = XBAR1PredivType{ .value = conf.XBAR1Prediv };
        const XBAR1Findiv = XBAR1FindivType{ .value = conf.XBAR1Findiv };
        pub const XBAR1Output = XBAR1OutputType{};
        const XBAR2 = XBAR2Type{ .value = conf.XBAR2 };
        const XBAR2Prediv = XBAR2PredivType{ .value = conf.XBAR2Prediv };
        const XBAR2Findiv = XBAR2FindivType{ .value = conf.XBAR2Findiv };
        pub const XBAR2Output = XBAR2OutputType{};
        const XBAR3 = XBAR3Type{ .value = conf.XBAR3 };
        const XBAR3Prediv = XBAR3PredivType{ .value = conf.XBAR3Prediv };
        const XBAR3Findiv = XBAR3FindivType{ .value = conf.XBAR3Findiv };
        pub const XBAR3Output = XBAR3OutputType{};
        const XBAR4 = XBAR4Type{ .value = conf.XBAR4 };
        const XBAR4Prediv = XBAR4PredivType{ .value = conf.XBAR4Prediv };
        const XBAR4Findiv = XBAR4FindivType{ .value = conf.XBAR4Findiv };
        pub const XBAR4Output = XBAR4OutputType{};
        const XBAR5 = XBAR5Type{ .value = conf.XBAR5 };
        const XBAR5Prediv = XBAR5PredivType{ .value = conf.XBAR5Prediv };
        const XBAR5Findiv = XBAR5FindivType{ .value = conf.XBAR5Findiv };
        pub const XBAR5Output = XBAR5OutputType{};
        const XBAR6 = XBAR6Type{ .value = conf.XBAR6 };
        const XBAR6Prediv = XBAR6PredivType{ .value = conf.XBAR6Prediv };
        const XBAR6Findiv = XBAR6FindivType{ .value = conf.XBAR6Findiv };
        pub const XBAR6Output = XBAR6OutputType{};
        const XBAR7 = XBAR7Type{ .value = conf.XBAR7 };
        const XBAR7Prediv = XBAR7PredivType{ .value = conf.XBAR7Prediv };
        const XBAR7Findiv = XBAR7FindivType{ .value = conf.XBAR7Findiv };
        pub const XBAR7Output = XBAR7OutputType{};
        const XBAR8 = XBAR8Type{ .value = conf.XBAR8 };
        const XBAR8Prediv = XBAR8PredivType{ .value = conf.XBAR8Prediv };
        const XBAR8Findiv = XBAR8FindivType{ .value = conf.XBAR8Findiv };
        pub const XBAR8Output = XBAR8OutputType{};
        const XBAR9 = XBAR9Type{ .value = conf.XBAR9 };
        const XBAR9Prediv = XBAR9PredivType{ .value = conf.XBAR9Prediv };
        const XBAR9Findiv = XBAR9FindivType{ .value = conf.XBAR9Findiv };
        pub const XBAR9Output = XBAR9OutputType{};
        const XBAR10 = XBAR10Type{ .value = conf.XBAR10 };
        const XBAR10Prediv = XBAR10PredivType{ .value = conf.XBAR10Prediv };
        const XBAR10Findiv = XBAR10FindivType{ .value = conf.XBAR10Findiv };
        pub const XBAR10Output = XBAR10OutputType{};
        const XBAR11 = XBAR11Type{ .value = conf.XBAR11 };
        const XBAR11Prediv = XBAR11PredivType{ .value = conf.XBAR11Prediv };
        const XBAR11Findiv = XBAR11FindivType{ .value = conf.XBAR11Findiv };
        pub const XBAR11Output = XBAR11OutputType{};
        const XBAR12 = XBAR12Type{ .value = conf.XBAR12 };
        const XBAR12Prediv = XBAR12PredivType{ .value = conf.XBAR12Prediv };
        const XBAR12Findiv = XBAR12FindivType{ .value = conf.XBAR12Findiv };
        pub const XBAR12Output = XBAR12OutputType{};
        const XBAR13 = XBAR13Type{ .value = conf.XBAR13 };
        const XBAR13Prediv = XBAR13PredivType{ .value = conf.XBAR13Prediv };
        const XBAR13Findiv = XBAR13FindivType{ .value = conf.XBAR13Findiv };
        pub const XBAR13Output = XBAR13OutputType{};
        const XBAR14 = XBAR14Type{ .value = conf.XBAR14 };
        const XBAR14Prediv = XBAR14PredivType{ .value = conf.XBAR14Prediv };
        const XBAR14Findiv = XBAR14FindivType{ .value = conf.XBAR14Findiv };
        pub const XBAR14Output = XBAR14OutputType{};
        const XBAR15 = XBAR15Type{ .value = conf.XBAR15 };
        const XBAR15Prediv = XBAR15PredivType{ .value = conf.XBAR15Prediv };
        const XBAR15Findiv = XBAR15FindivType{ .value = conf.XBAR15Findiv };
        pub const XBAR15Output = XBAR15OutputType{};
        const XBAR16 = XBAR16Type{ .value = conf.XBAR16 };
        const XBAR16Prediv = XBAR16PredivType{ .value = conf.XBAR16Prediv };
        const XBAR16Findiv = XBAR16FindivType{ .value = conf.XBAR16Findiv };
        pub const XBAR16Output = XBAR16OutputType{};
        const XBAR17 = XBAR17Type{ .value = conf.XBAR17 };
        const XBAR17Prediv = XBAR17PredivType{ .value = conf.XBAR17Prediv };
        const XBAR17Findiv = XBAR17FindivType{ .value = conf.XBAR17Findiv };
        pub const XBAR17Output = XBAR17OutputType{};
        const XBAR18 = XBAR18Type{ .value = conf.XBAR18 };
        const XBAR18Prediv = XBAR18PredivType{ .value = conf.XBAR18Prediv };
        const XBAR18Findiv = XBAR18FindivType{ .value = conf.XBAR18Findiv };
        pub const XBAR18Output = XBAR18OutputType{};
        const XBAR19 = XBAR19Type{ .value = conf.XBAR19 };
        const XBAR19Prediv = XBAR19PredivType{ .value = conf.XBAR19Prediv };
        const XBAR19Findiv = XBAR19FindivType{ .value = conf.XBAR19Findiv };
        pub const XBAR19Output = XBAR19OutputType{};
        const XBAR20 = XBAR20Type{ .value = conf.XBAR20 };
        const XBAR20Prediv = XBAR20PredivType{ .value = conf.XBAR20Prediv };
        const XBAR20Findiv = XBAR20FindivType{ .value = conf.XBAR20Findiv };
        pub const XBAR20Output = XBAR20OutputType{};
        const XBAR21 = XBAR21Type{ .value = conf.XBAR21 };
        const XBAR21Prediv = XBAR21PredivType{ .value = conf.XBAR21Prediv };
        const XBAR21Findiv = XBAR21FindivType{ .value = conf.XBAR21Findiv };
        pub const XBAR21Output = XBAR21OutputType{};
        const XBAR22 = XBAR22Type{ .value = conf.XBAR22 };
        const XBAR22Prediv = XBAR22PredivType{ .value = conf.XBAR22Prediv };
        const XBAR22Findiv = XBAR22FindivType{ .value = conf.XBAR22Findiv };
        pub const XBAR22Output = XBAR22OutputType{};
        const XBAR23 = XBAR23Type{ .value = conf.XBAR23 };
        const XBAR23Prediv = XBAR23PredivType{ .value = conf.XBAR23Prediv };
        const XBAR23Findiv = XBAR23FindivType{ .value = conf.XBAR23Findiv };
        pub const XBAR23Output = XBAR23OutputType{};
        const XBAR24 = XBAR24Type{ .value = conf.XBAR24 };
        const XBAR24Prediv = XBAR24PredivType{ .value = conf.XBAR24Prediv };
        const XBAR24Findiv = XBAR24FindivType{ .value = conf.XBAR24Findiv };
        pub const XBAR24Output = XBAR24OutputType{};
        const XBAR25 = XBAR25Type{ .value = conf.XBAR25 };
        const XBAR25Prediv = XBAR25PredivType{ .value = conf.XBAR25Prediv };
        const XBAR25Findiv = XBAR25FindivType{ .value = conf.XBAR25Findiv };
        pub const XBAR25Output = XBAR25OutputType{};
        const XBAR26 = XBAR26Type{ .value = conf.XBAR26 };
        const XBAR26Prediv = XBAR26PredivType{ .value = conf.XBAR26Prediv };
        const XBAR26Findiv = XBAR26FindivType{ .value = conf.XBAR26Findiv };
        pub const XBAR26Output = XBAR26OutputType{};
        const XBAR27 = XBAR27Type{ .value = conf.XBAR27 };
        const XBAR27Prediv = XBAR27PredivType{ .value = conf.XBAR27Prediv };
        const XBAR27Findiv = XBAR27FindivType{ .value = conf.XBAR27Findiv };
        pub const XBAR27Output = XBAR27OutputType{};
        const XBAR28 = XBAR28Type{ .value = conf.XBAR28 };
        const XBAR28Prediv = XBAR28PredivType{ .value = conf.XBAR28Prediv };
        const XBAR28Findiv = XBAR28FindivType{ .value = conf.XBAR28Findiv };
        pub const XBAR28Output = XBAR28OutputType{};
        const XBAR29 = XBAR29Type{ .value = conf.XBAR29 };
        const XBAR29Prediv = XBAR29PredivType{ .value = conf.XBAR29Prediv };
        const XBAR29Findiv = XBAR29FindivType{ .value = conf.XBAR29Findiv };
        pub const XBAR29Output = XBAR29OutputType{};
        const XBAR30 = XBAR30Type{ .value = conf.XBAR30 };
        const XBAR30Prediv = XBAR30PredivType{ .value = conf.XBAR30Prediv };
        const XBAR30Findiv = XBAR30FindivType{ .value = conf.XBAR30Findiv };
        pub const XBAR30Output = XBAR30OutputType{};
        const XBAR31 = XBAR31Type{ .value = conf.XBAR31 };
        const XBAR31Prediv = XBAR31PredivType{ .value = conf.XBAR31Prediv };
        const XBAR31Findiv = XBAR31FindivType{ .value = conf.XBAR31Findiv };
        pub const XBAR31Output = XBAR31OutputType{};
        const XBAR32 = XBAR32Type{ .value = conf.XBAR32 };
        const XBAR32Prediv = XBAR32PredivType{ .value = conf.XBAR32Prediv };
        const XBAR32Findiv = XBAR32FindivType{ .value = conf.XBAR32Findiv };
        pub const XBAR32Output = XBAR32OutputType{};
        const XBAR33 = XBAR33Type{ .value = conf.XBAR33 };
        const XBAR33Prediv = XBAR33PredivType{ .value = conf.XBAR33Prediv };
        const XBAR33Findiv = XBAR33FindivType{ .value = conf.XBAR33Findiv };
        pub const XBAR33Output = XBAR33OutputType{};
        const XBAR34 = XBAR34Type{ .value = conf.XBAR34 };
        const XBAR34Prediv = XBAR34PredivType{ .value = conf.XBAR34Prediv };
        const XBAR34Findiv = XBAR34FindivType{ .value = conf.XBAR34Findiv };
        pub const XBAR34Output = XBAR34OutputType{};
        const XBAR35 = XBAR35Type{ .value = conf.XBAR35 };
        const XBAR35Prediv = XBAR35PredivType{ .value = conf.XBAR35Prediv };
        const XBAR35Findiv = XBAR35FindivType{ .value = conf.XBAR35Findiv };
        pub const XBAR35Output = XBAR35OutputType{};
        const XBAR36 = XBAR36Type{ .value = conf.XBAR36 };
        const XBAR36Prediv = XBAR36PredivType{ .value = conf.XBAR36Prediv };
        const XBAR36Findiv = XBAR36FindivType{ .value = conf.XBAR36Findiv };
        pub const XBAR36Output = XBAR36OutputType{};
        const XBAR37 = XBAR37Type{ .value = conf.XBAR37 };
        const XBAR37Prediv = XBAR37PredivType{ .value = conf.XBAR37Prediv };
        const XBAR37Findiv = XBAR37FindivType{ .value = conf.XBAR37Findiv };
        pub const XBAR37Output = XBAR37OutputType{};
        const XBAR38 = XBAR38Type{ .value = conf.XBAR38 };
        const XBAR38Prediv = XBAR38PredivType{ .value = conf.XBAR38Prediv };
        const XBAR38Findiv = XBAR38FindivType{ .value = conf.XBAR38Findiv };
        pub const XBAR38Output = XBAR38OutputType{};
        const XBAR39 = XBAR39Type{ .value = conf.XBAR39 };
        const XBAR39Prediv = XBAR39PredivType{ .value = conf.XBAR39Prediv };
        const XBAR39Findiv = XBAR39FindivType{ .value = conf.XBAR39Findiv };
        pub const XBAR39Output = XBAR39OutputType{};
        const XBAR40 = XBAR40Type{ .value = conf.XBAR40 };
        const XBAR40Prediv = XBAR40PredivType{ .value = conf.XBAR40Prediv };
        const XBAR40Findiv = XBAR40FindivType{ .value = conf.XBAR40Findiv };
        pub const XBAR40Output = XBAR40OutputType{};
        const XBAR41 = XBAR41Type{ .value = conf.XBAR41 };
        const XBAR41Prediv = XBAR41PredivType{ .value = conf.XBAR41Prediv };
        const XBAR41Findiv = XBAR41FindivType{ .value = conf.XBAR41Findiv };
        pub const XBAR41Output = XBAR41OutputType{};
        const XBAR42 = XBAR42Type{ .value = conf.XBAR42 };
        const XBAR42Prediv = XBAR42PredivType{ .value = conf.XBAR42Prediv };
        const XBAR42Findiv = XBAR42FindivType{ .value = conf.XBAR42Findiv };
        pub const XBAR42Output = XBAR42OutputType{};
        const XBAR43 = XBAR43Type{ .value = conf.XBAR43 };
        const XBAR43Prediv = XBAR43PredivType{ .value = conf.XBAR43Prediv };
        const XBAR43Findiv = XBAR43FindivType{ .value = conf.XBAR43Findiv };
        pub const XBAR43Output = XBAR43OutputType{};
        const XBAR44 = XBAR44Type{ .value = conf.XBAR44 };
        const XBAR44Prediv = XBAR44PredivType{ .value = conf.XBAR44Prediv };
        const XBAR44Findiv = XBAR44FindivType{ .value = conf.XBAR44Findiv };
        pub const XBAR44Output = XBAR44OutputType{};
        const XBAR45 = XBAR45Type{ .value = conf.XBAR45 };
        const XBAR45Prediv = XBAR45PredivType{ .value = conf.XBAR45Prediv };
        const XBAR45Findiv = XBAR45FindivType{ .value = conf.XBAR45Findiv };
        pub const XBAR45Output = XBAR45OutputType{};
        const XBAR46 = XBAR46Type{ .value = conf.XBAR46 };
        const XBAR46Prediv = XBAR46PredivType{ .value = conf.XBAR46Prediv };
        const XBAR46Findiv = XBAR46FindivType{ .value = conf.XBAR46Findiv };
        pub const XBAR46Output = XBAR46OutputType{};
        const XBAR47 = XBAR47Type{ .value = conf.XBAR47 };
        const XBAR47Prediv = XBAR47PredivType{ .value = conf.XBAR47Prediv };
        const XBAR47Findiv = XBAR47FindivType{ .value = conf.XBAR47Findiv };
        pub const XBAR47Output = XBAR47OutputType{};
        const XBAR48 = XBAR48Type{ .value = conf.XBAR48 };
        const XBAR48Prediv = XBAR48PredivType{ .value = conf.XBAR48Prediv };
        const XBAR48Findiv = XBAR48FindivType{ .value = conf.XBAR48Findiv };
        pub const XBAR48Output = XBAR48OutputType{};
        const XBAR49 = XBAR49Type{ .value = conf.XBAR49 };
        const XBAR49Prediv = XBAR49PredivType{ .value = conf.XBAR49Prediv };
        const XBAR49Findiv = XBAR49FindivType{ .value = conf.XBAR49Findiv };
        pub const XBAR49Output = XBAR49OutputType{};
        const XBAR50 = XBAR50Type{ .value = conf.XBAR50 };
        const XBAR50Prediv = XBAR50PredivType{ .value = conf.XBAR50Prediv };
        const XBAR50Findiv = XBAR50FindivType{ .value = conf.XBAR50Findiv };
        pub const XBAR50Output = XBAR50OutputType{};
        const XBAR51 = XBAR51Type{ .value = conf.XBAR51 };
        const XBAR51Prediv = XBAR51PredivType{ .value = conf.XBAR51Prediv };
        const XBAR51Findiv = XBAR51FindivType{ .value = conf.XBAR51Findiv };
        pub const XBAR51Output = XBAR51OutputType{};
        const XBAR52 = XBAR52Type{ .value = conf.XBAR52 };
        const XBAR52Prediv = XBAR52PredivType{ .value = conf.XBAR52Prediv };
        const XBAR52Findiv = XBAR52FindivType{ .value = conf.XBAR52Findiv };
        pub const XBAR52Output = XBAR52OutputType{};
        const XBAR53 = XBAR53Type{ .value = conf.XBAR53 };
        const XBAR53Prediv = XBAR53PredivType{ .value = conf.XBAR53Prediv };
        const XBAR53Findiv = XBAR53FindivType{ .value = conf.XBAR53Findiv };
        pub const XBAR53Output = XBAR53OutputType{};
        const XBAR54 = XBAR54Type{ .value = conf.XBAR54 };
        const XBAR54Prediv = XBAR54PredivType{ .value = conf.XBAR54Prediv };
        const XBAR54Findiv = XBAR54FindivType{ .value = conf.XBAR54Findiv };
        pub const XBAR54Output = XBAR54OutputType{};
        const XBAR55 = XBAR55Type{ .value = conf.XBAR55 };
        const XBAR55Prediv = XBAR55PredivType{ .value = conf.XBAR55Prediv };
        const XBAR55Findiv = XBAR55FindivType{ .value = conf.XBAR55Findiv };
        pub const XBAR55Output = XBAR55OutputType{};
        const XBAR56 = XBAR56Type{ .value = conf.XBAR56 };
        const XBAR56Prediv = XBAR56PredivType{ .value = conf.XBAR56Prediv };
        const XBAR56Findiv = XBAR56FindivType{ .value = conf.XBAR56Findiv };
        pub const XBAR56Output = XBAR56OutputType{};
        const XBAR57 = XBAR57Type{ .value = conf.XBAR57 };
        const XBAR57Prediv = XBAR57PredivType{ .value = conf.XBAR57Prediv };
        const XBAR57Findiv = XBAR57FindivType{ .value = conf.XBAR57Findiv };
        pub const XBAR57Output = XBAR57OutputType{};
        const XBAR58 = XBAR58Type{ .value = conf.XBAR58 };
        const XBAR58Prediv = XBAR58PredivType{ .value = conf.XBAR58Prediv };
        const XBAR58Findiv = XBAR58FindivType{ .value = conf.XBAR58Findiv };
        pub const XBAR58Output = XBAR58OutputType{};
        const XBAR59 = XBAR59Type{ .value = conf.XBAR59 };
        const XBAR59Prediv = XBAR59PredivType{ .value = conf.XBAR59Prediv };
        const XBAR59Findiv = XBAR59FindivType{ .value = conf.XBAR59Findiv };
        pub const XBAR59Output = XBAR59OutputType{};
        const XBAR60 = XBAR60Type{ .value = conf.XBAR60 };
        const XBAR60Prediv = XBAR60PredivType{ .value = conf.XBAR60Prediv };
        const XBAR60Findiv = XBAR60FindivType{ .value = conf.XBAR60Findiv };
        pub const XBAR60Output = XBAR60OutputType{};
        const XBAR61 = XBAR61Type{ .value = conf.XBAR61 };
        const XBAR61Prediv = XBAR61PredivType{ .value = conf.XBAR61Prediv };
        const XBAR61Findiv = XBAR61FindivType{ .value = conf.XBAR61Findiv };
        pub const XBAR61Output = XBAR61OutputType{};
        const XBAR62 = XBAR62Type{ .value = conf.XBAR62 };
        const XBAR62Prediv = XBAR62PredivType{ .value = conf.XBAR62Prediv };
        const XBAR62Findiv = XBAR62FindivType{ .value = conf.XBAR62Findiv };
        pub const XBAR62Output = XBAR62OutputType{};
        const XBAR63 = XBAR63Type{ .value = conf.XBAR63 };
        const XBAR63Prediv = XBAR63PredivType{ .value = conf.XBAR63Prediv };
        const XBAR63Findiv = XBAR63FindivType{ .value = conf.XBAR63Findiv };
        pub const XBAR63Output = XBAR63OutputType{};
        const CKINTSEL0 = CKINTSEL0Type{ .value = conf.CKINTSEL0 };
        const CKEXTSEL0 = CKEXTSEL0Type{ .value = conf.CKEXTSEL0 };
        const CKINTSEL1 = CKINTSEL1Type{ .value = conf.CKINTSEL1 };
        const CKEXTSEL1 = CKEXTSEL1Type{ .value = conf.CKEXTSEL1 };
        const OBS0 = OBS0Type{ .value = conf.OBS0 };
        pub const OBS0Output = OBS0OutputType{};
        const OBS1 = OBS1Type{ .value = conf.OBS1 };
        pub const OBS1Output = OBS1OutputType{};
        const MCO1Mult = MCO1MultType{ .value = conf.MCO1Mult };
        pub const MCO1Pin = MCO1PinType{};
        const MCO2Mult = MCO2MultType{ .value = conf.MCO2Mult };
        pub const MCO2Pin = MCO2PinType{};
        const D3PER = D3PERType{ .value = conf.D3PER };
        pub const D3PEROutput = D3PEROutputType{};
        const DTS = DTSType{ .value = conf.DTS };
        pub const DTSOutput = DTSOutputType{};
        const DSIPHY = DSIPHYType{ .value = conf.DSIPHY };
        pub const DSIPHYOutput = DSIPHYOutputType{};
        const DSIBLANE = DSIBLANEType{ .value = conf.DSIBLANE };
        pub const DSIBLANEOutput = DSIBLANEOutputType{};
        const USB2PHY1 = USB2PHY1Type{ .value = conf.USB2PHY1 };
        pub const USB2PHY1Output = USB2PHY1OutputType{};
        const USB2PHY2 = USB2PHY2Type{ .value = conf.USB2PHY2 };
        pub const USB2PHY2Output = USB2PHY2OutputType{};
        const USB3PCIPHY = USB3PCIPHYType{ .value = conf.USB3PCIPHY };
        pub const USB3PCIPHYOutput = USB3PCIPHYOutputType{};
        const SysClkSource = SysClkSourceType{ .value = conf.SysClkSource };
        pub const SysCLKOutput = SysCLKOutputType{};
        const MCUDIV = MCUDIVType{ .value = conf.MCUDIV };
        pub const McuClockOutput = McuClockOutputType{};
        const APB3DIV = APB3DIVType{ .value = conf.APB3DIV };
        pub const APB3Output = APB3OutputType{};
        const APB4DIV = APB4DIVType{ .value = conf.APB4DIV };
        pub const APB4Output = APB4OutputType{};
        const APBDBGDIV = APBDBGDIVType{ .value = conf.APBDBGDIV };
        pub const APBDBGOutput = APBDBGOutputType{};
        const APB1DIV = APB1DIVType{ .value = conf.APB1DIV };
        const Tim1Mul = Tim1MulType{};
        pub const Tim1Output = Tim1OutputType{};
        pub const AHBOutput = AHBOutputType{};
        pub const APB1Output = APB1OutputType{};
        const APB2DIV = APB2DIVType{ .value = conf.APB2DIV };
        const Tim2Mul = Tim2MulType{};
        pub const Tim2Output = Tim2OutputType{};
        pub const APB2Output = APB2OutputType{};
        const ADC12Mult = ADC12MultType{ .value = conf.ADC12Mult };
        pub const ADC12output = ADC12outputType{};
        const ADC3Mult = ADC3MultType{ .value = conf.ADC3Mult };
        pub const ADC3output = ADC3outputType{};
        const PLL1Source = PLL1SourceType{ .value = conf.PLL1Source };
        const FREFDIV1 = FREFDIV1Type{ .value = conf.FREFDIV1 };
        const PLL2Source = PLL2SourceType{ .value = conf.PLL2Source };
        const FREFDIV2 = FREFDIV2Type{ .value = conf.FREFDIV2 };
        const PLL3Source = PLL3SourceType{ .value = conf.PLL3Source };
        const FREFDIV3 = FREFDIV3Type{ .value = conf.FREFDIV3 };
        const PLL4Source = PLL4SourceType{ .value = conf.PLL4Source };
        const FREFDIV4 = FREFDIV4Type{ .value = conf.FREFDIV4 };
        const FBDIV1 = FBDIV1Type{ .value = conf.FBDIV1 };
        const POSTDIV1_1 = POSTDIV1_1Type{ .value = conf.POSTDIV1_1 };
        const POSTDIV2_1 = POSTDIV2_1Type{ .value = conf.POSTDIV2_1 };
        pub const FOUTPOSTDIV1 = FOUTPOSTDIV1Type{};
        const PLL1Div42 = PLL1Div42Type{};
        const FBDIV2 = FBDIV2Type{ .value = conf.FBDIV2 };
        const PLL2FRACV = PLL2FRACVType{ .value = conf.PLL2FRACV };
        const POSTDIV1_2 = POSTDIV1_2Type{ .value = conf.POSTDIV1_2 };
        const POSTDIV2_2 = POSTDIV2_2Type{ .value = conf.POSTDIV2_2 };
        pub const FOUTPOSTDIV2 = FOUTPOSTDIV2Type{};
        const PLL2Div4 = PLL2Div4Type{};
        const FBDIV3 = FBDIV3Type{ .value = conf.FBDIV3 };
        const PLL3FRACV = PLL3FRACVType{ .value = conf.PLL3FRACV };
        const POSTDIV1_3 = POSTDIV1_3Type{ .value = conf.POSTDIV1_3 };
        const POSTDIV2_3 = POSTDIV2_3Type{ .value = conf.POSTDIV2_3 };
        pub const FOUTPOSTDIV3 = FOUTPOSTDIV3Type{};
        const PLL3Div2 = PLL3Div2Type{};
        const FBDIV4 = FBDIV4Type{ .value = conf.FBDIV4 };
        const PLL4FRACV = PLL4FRACVType{ .value = conf.PLL4FRACV };
        const POSTDIV1_4 = POSTDIV1_4Type{ .value = conf.POSTDIV1_4 };
        const POSTDIV2_4 = POSTDIV2_4Type{ .value = conf.POSTDIV2_4 };
        pub const FOUTPOSTDIV4 = FOUTPOSTDIV4Type{};
        const PLL5Source = PLL5SourceType{ .value = conf.PLL5Source };
        const FREFDIV5 = FREFDIV5Type{ .value = conf.FREFDIV5 };
        const FBDIV5 = FBDIV5Type{ .value = conf.FBDIV5 };
        const PLL5FRACV = PLL5FRACVType{ .value = conf.PLL5FRACV };
        const POSTDIV1_5 = POSTDIV1_5Type{ .value = conf.POSTDIV1_5 };
        const POSTDIV2_5 = POSTDIV2_5Type{ .value = conf.POSTDIV2_5 };
        pub const FOUTPOSTDIV5 = FOUTPOSTDIV5Type{};
        const PLL6Source = PLL6SourceType{ .value = conf.PLL6Source };
        const FREFDIV6 = FREFDIV6Type{ .value = conf.FREFDIV6 };
        const FBDIV6 = FBDIV6Type{ .value = conf.FBDIV6 };
        const PLL6FRACV = PLL6FRACVType{ .value = conf.PLL6FRACV };
        const POSTDIV1_6 = POSTDIV1_6Type{ .value = conf.POSTDIV1_6 };
        const POSTDIV2_6 = POSTDIV2_6Type{ .value = conf.POSTDIV2_6 };
        pub const FOUTPOSTDIV6 = FOUTPOSTDIV6Type{};
        const PLL7Source = PLL7SourceType{ .value = conf.PLL7Source };
        const FREFDIV7 = FREFDIV7Type{ .value = conf.FREFDIV7 };
        const FBDIV7 = FBDIV7Type{ .value = conf.FBDIV7 };
        const PLL7FRACV = PLL7FRACVType{ .value = conf.PLL7FRACV };
        const POSTDIV1_7 = POSTDIV1_7Type{ .value = conf.POSTDIV1_7 };
        const POSTDIV2_7 = POSTDIV2_7Type{ .value = conf.POSTDIV2_7 };
        pub const FOUTPOSTDIV7 = FOUTPOSTDIV7Type{};
        const PLL8Source = PLL8SourceType{ .value = conf.PLL8Source };
        const FREFDIV8 = FREFDIV8Type{ .value = conf.FREFDIV8 };
        const FBDIV8 = FBDIV8Type{ .value = conf.FBDIV8 };
        const PLL8FRACV = PLL8FRACVType{ .value = conf.PLL8FRACV };
        const POSTDIV1_8 = POSTDIV1_8Type{ .value = conf.POSTDIV1_8 };
        const POSTDIV2_8 = POSTDIV2_8Type{ .value = conf.POSTDIV2_8 };
        pub const FOUTPOSTDIV8 = FOUTPOSTDIV8Type{};
        const HSERTCDevisor = HSERTCDevisorType{ .value = conf.HSERTCDevisor };
        const RTCClkSource = RTCClkSourceType{ .value = conf.RTCClkSource };
        pub const RTCOutput = RTCOutputType{};
        pub const IWDGOutput = IWDGOutputType{};

        pub fn validate() void {
            _ = XBAR0Output.get();
            _ = XBAR1Output.get();
            _ = XBAR2Output.get();
            _ = XBAR3Output.get();
            _ = XBAR4Output.get();
            _ = XBAR5Output.get();
            _ = XBAR6Output.get();
            _ = XBAR7Output.get();
            _ = XBAR8Output.get();
            _ = XBAR9Output.get();
            _ = XBAR10Output.get();
            _ = XBAR11Output.get();
            _ = XBAR12Output.get();
            _ = XBAR13Output.get();
            _ = XBAR14Output.get();
            _ = XBAR15Output.get();
            _ = XBAR16Output.get();
            _ = XBAR17Output.get();
            _ = XBAR18Output.get();
            _ = XBAR19Output.get();
            _ = XBAR20Output.get();
            _ = XBAR21Output.get();
            _ = XBAR22Output.get();
            _ = XBAR23Output.get();
            _ = XBAR24Output.get();
            _ = XBAR25Output.get();
            _ = XBAR26Output.get();
            _ = XBAR27Output.get();
            _ = XBAR28Output.get();
            _ = XBAR29Output.get();
            _ = XBAR30Output.get();
            _ = XBAR31Output.get();
            _ = XBAR32Output.get();
            _ = XBAR33Output.get();
            _ = XBAR34Output.get();
            _ = XBAR35Output.get();
            _ = XBAR36Output.get();
            _ = XBAR37Output.get();
            _ = XBAR38Output.get();
            _ = XBAR39Output.get();
            _ = XBAR40Output.get();
            _ = XBAR41Output.get();
            _ = XBAR42Output.get();
            _ = XBAR43Output.get();
            _ = XBAR44Output.get();
            _ = XBAR45Output.get();
            _ = XBAR46Output.get();
            _ = XBAR47Output.get();
            _ = XBAR48Output.get();
            _ = XBAR49Output.get();
            _ = XBAR50Output.get();
            _ = XBAR51Output.get();
            _ = XBAR52Output.get();
            _ = XBAR53Output.get();
            _ = XBAR54Output.get();
            _ = XBAR55Output.get();
            _ = XBAR56Output.get();
            _ = XBAR57Output.get();
            _ = XBAR58Output.get();
            _ = XBAR59Output.get();
            _ = XBAR60Output.get();
            _ = XBAR61Output.get();
            _ = XBAR62Output.get();
            _ = XBAR63Output.get();
            _ = DSIPHYOutput.get();
            _ = DSIBLANEOutput.get();
            _ = USB2PHY1Output.get();
            _ = USB2PHY2Output.get();
            _ = USB3PCIPHYOutput.get();
            _ = SysCLKOutput.get();
            _ = McuClockOutput.get();
            _ = APB3Output.get();
            _ = APB4Output.get();
            _ = APBDBGOutput.get();
            _ = AHBOutput.get();
            _ = APB1Output.get();
            _ = APB2Output.get();
            _ = ADC12output.get();
            _ = ADC3output.get();
            _ = FOUTPOSTDIV1.get();
            _ = FOUTPOSTDIV2.get();
            _ = FOUTPOSTDIV3.get();
            _ = FOUTPOSTDIV4.get();
            _ = FOUTPOSTDIV5.get();
            _ = FOUTPOSTDIV6.get();
            _ = FOUTPOSTDIV7.get();
            _ = FOUTPOSTDIV8.get();
        }
    };

    return ClockStruct;
}
