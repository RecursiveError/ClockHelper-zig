pub const ReferenceNumber = struct {
    default: usize,
    max: usize,
    min: usize,
};

pub const ReferenceNumberList = struct {
    default: f32,
    list: []const f32,
    id_list: []const []const u8,
};

pub const ReferenceInput = struct {
    DefaultInput: []const u8,
    ValidOptions: [][]const u8,
};

pub const ReferenceValue = union(enum) {
    NoReference: void,
    FixedNumber: usize,
    Number: ReferenceNumber,
    NumberList: ReferenceNumberList,
    Input: ReferenceInput,
};

pub const Reference = struct {
    expr: ?[]const u8 = null,
    pre_evaluated: bool = false,
    value: ReferenceValue,
};

pub const Output = struct {
    to: []const u8,
};

pub const Input = struct {
    from: []const u8,
    RefValue: ?[]const u8 = null,
};

pub const Condition = struct {
    expr: []const u8,
};

pub const Sources = union(enum) {
    output: Output,
    input: Input,
    condition: Condition,
};

pub const Element = struct {
    name: []const u8,
    Elementtype: []const u8,
    sources: []Sources,
    reference: []Reference,
    reference_id: []const u8,
};

pub const Tree = struct {
    name: []const u8,
    clocktree: []const u8,
    rcc: []const u8,
    family: []const u8,
    line: []const u8,
    element: []Element,
};
