const std = @import("std");

pub const MCU_Info = struct {
    name: []const u8,
    clock_ref_file_union: []const u8,
    extra_data: []const []const u8,
};

//Clock Types
pub const Clock_Tree = struct {
    nodes: []const Clock_Node,
    extra_nodes: []const []const u8,
    references: []const Reference, //all references
    extra_reference: []const []const u8, // names of references used as dependencies
    config_ref_names: []const []const u8, // names of references that are part of the main configuration
    extra_flags: []const []const u8,

    fixed_multiplexors: ?[]const FixedMultiplexor = null,
    ///this patches are used as a reference for the code gen to alter small details of the generated code,
    ///like renaming nodes & references and type layouts.
    ///this allows the same code gen to be used by different HALs that may have different naming conventions and code styles.
    ///if null, no patches will be applied, code gen will use RAW cubeMX data as reference for code gen.
    ///
    ///more complex patches need to be added externally.
    gen_patches: ?Patchs = null,
};

pub const Clock_Node = struct {
    name: []const u8,
    node_type: []const u8,
    reference: []const u8,
    enable_flag: ?[]const u8,
    variants: []const Clock_Node_Variant,
};

pub const Clock_Node_Variant = struct {
    expr: ?[]const u8 = null,
    diagnostic: ?[]const u8 = null,
    inputs: []const Clock_Node_Input,
    outputs: []const []const u8,
};

pub const Clock_Node_Input = struct {
    source: []const u8,
    source_ref: ?[]const u8,
};

//Ref Types
pub const Reference = struct {
    ref_name: []const u8,
    disc: ?[]const u8,
    variants: []Ref_variant,
};

pub const Ref_variant = struct {
    expr: ?[]const u8 = null,
    diagnostic: ?[]const u8 = null,
    ref: Ref_type,
};

pub const Ref_type = union(enum) {
    fixed_integer: u32,
    fixed_float: f32,
    fixed_expr: Fixed_Expr,
    integer_range: Integrer_Range,
    float_range: Float_Range,
    dynamic_range: Dynamic_Range,
    list: List,
    single_item: List_Item,
    no_value: void,
    string: []const u8,
};

pub const Integrer_Range = struct {
    default_value: ?u32 = null,
    min: ?u32,
    max: ?u32,
};

pub const Float_Range = struct {
    default_value: ?f32 = null,
    min: ?f32,
    max: ?f32,
};

//Dynamic range uses expressions to define min, max and default values insted of fixed numbers
pub const Dynamic_Range = struct {
    default_value: ?[]const u8 = null,
    min: ?[]const u8,
    max: ?[]const u8,
    integer: bool,
};

pub const Fixed_Expr = struct {
    value: []const u8,
    integer: bool,
};

pub const List = struct {
    default_name: ?[]const u8 = null,
    itens: []List_Item,
};

pub const List_Item = struct {
    name: []const u8,
    value: ?f32 = null, //not all list items have asscoiated values
    semaphore: ?[]const u8 = null, //not all list items have asscoiated semaphores
    description: ?[]const u8 = null, //not all list items have asscoiated descriptions
};

pub const FixedMultiplexor = struct {
    reference: []const u8,
    removed_items: []const []const u8,
    add_item: []const u8,
};

//gen patches types

pub const Patchs = struct {
    enums: []const Enum_Patch,
    rename_nodes: []const Rename_Node_Patch,
    match_ref_to_enum: []const Match_Ref_To_Enum_Patch,
};

pub const EnumField = struct {
    name: []const u8,
    value: u32,
};

pub const Enum_Patch = struct {
    //if null, no bit-width will be applied, and as consequence, tags cannot have asscoiated values.
    name: []const u8,
    fields: []const EnumField,
    bit_size: ?u32 = null,
};

pub const Rename_Node_Patch = struct {
    original_name: []const u8,
    new_name: []const u8,
};

pub const Match_Ref_To_Enum_Patch = struct {
    ref_name: []const u8,
    @"enum": []const u8,
    items: []const Rename_Ref_Item_Patch,
    incomplete: bool, //if true, not all enum fields will have a matching reference item, and as consequence, some enum fields will not have asscoiated values.
    enum_or_ref: []const u8, //if incomplete is true, this field indicate if the missing options are in the enum or in the ListRef, so that the user know where to look for the missing options.

};

pub const Rename_Ref_Item_Patch = struct {
    ref_item_name: []const u8,
    enum_item_name: []const u8,
};
