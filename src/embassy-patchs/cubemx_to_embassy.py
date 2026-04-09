import json
import math
import re
from dataclasses import dataclass
from typing import Union

import numpy as np
import yaml
from data_link import data_link as embassy_register_data_link
from scipy import optimize
from sentence_transformers import SentenceTransformer, util
import logging


# ========data classes=========
@dataclass
class EmbassyRegister:
    name: str
    description: str
    enum_name: str
    bit_width: int


@dataclass
class EmbassyEnumField:
    name: str
    description: str
    value: int


@dataclass
class EmbassyEnum:
    name: str
    size: int
    variants: list[EmbassyEnumField]

    def __hash__(self):
        return hash(self.name)


@dataclass
class EmbassyData:
    register: dict[str, EmbassyRegister]
    enums: dict[str, EmbassyEnum]


@dataclass
class Context:
    tree_name: str
    embassy_patch_list: list[str]
    tree_data: dict
    embassy_data: EmbassyData


@dataclass
class Scores:
    reg: EmbassyRegister
    score: float


@dataclass
class NumberRef:
    min: int
    max: int
    numbers: list

@dataclass
class ListOptions:
    name: str
    semaphore:   None | str
    description: None | str

    def __hash__(self):
        return hash(self.name)
    
    def __eq__(self, other):
        if not isinstance(other, ListOptions):
            return NotImplemented
        return self.name == other.name

@dataclass
class ListRef:
    name: str
    options: list[ListOptions]


@dataclass
class ListPatch:
    register_name: str
    enum: str
    items: list[list[str]]
    incomplete: bool  # this is used to indicate that the patch is incomplete, meaning that not all the options of the ListRef could be matched to the variants of the enum, so the user need to manually check if the patch is correct and complete it if necessary.
    enum_or_ref: str  # if incomplete is true, this field indicate if the missing options are in the enum or in the ListRef, so that the user know where to look for the missing options.


@dataclass
class NumberPatch:
    pass  # for now, we dont have a good way to patch number references.


@dataclass
class LinkData:
    enum_useds: set[EmbassyEnum]
    patchs: list[Union[ListPatch, NumberPatch]]


Value = Union[NumberRef, ListRef]

# GLOBAL CONSTANTS
ANCHOR_SCORE_THRESHOLD = 0.7  # minimum score for a register to be considered an anchor
ANCHOR_LOWER_THRESHOLD = 0.3  # if the score is bellow this threshold;
ANCHOR_BUNUS = (
    0.12  # weight bonus added to the score of registers that are considered anchors.
)

MATCH_NAME_BONUS = (
    ANCHOR_BUNUS * 7
)  # bonus added to the score when the full enum name is present in the ListRef name.
COVERAGE_LOW__PENALTY_MULTIPLIER = 2.1  # aggressive penalty multiplier applyed when the enum has less variants than the ListRef.
COVERAGE_HIGH_PENALTY_MULTIPLIER = 1.8  # aggressive penalty multiplier applyed when the enum has more variants than the ListRef.
NO_ENUM_PENALTY = 0.7  # penalty applyed to the score when the register has no associated enum, since this makes it impossible to match the variants of the ListRef to the embassy data.
FIELD_MATCH_BUNUS_MULTIPLIER = 1.5  # bonus multiplier applyed to the ANCHOR_BUNUS when the register has the same number of variants as the ListRef..
NAME_MULTIPLIER = 0.55  # How much the name similarity should influence the final score
COVERAGE_MULTIPLIER = (
    0.85  # How much the coverage (number of variants) should influence the final score
)
ANCHOR_MULTIPLIER = 0.40  # How much the anchor bonus should influence the final score.

# if the registers has no enum but has a high name similarity, we can still consider it as a potential match.
# that's because sometimes the data might not have an enum for a register
# in that case we need a bonus to avoid a invalid match with other registers,
# that would be way worse than a match with no enum.

# this define how much the anchor bonus should be applyed to the final score when the register has no enum but has a high name similarity
NO_ENUM_WITH_ANCHOR_MULTIPLIER = 1.1

# minimum score for a register to be considered a perfect match
PERFECT_MATCH_THRESHOLD = 0.85
# scores bellow this threshold will be discarded, even if they are the best match for a reference.
DISCARD_MATCH_THRESHOLD = 0.32


def calc_anchor_bonus(score: float) -> float:
    if score >= ANCHOR_SCORE_THRESHOLD:
        return ANCHOR_BUNUS
    elif score <= ANCHOR_LOWER_THRESHOLD:
        return -ANCHOR_BUNUS
    else:
        return 0


def load_context(cubemx_name: str, embassy_names: list[str]) -> Context:
    embassy_data: dict[str, dict] = {}
    with open(f"pre_patch_jsons/{cubemx_name}.json", "r") as cube_file:
        cube_json = json.load(cube_file)
    for version in embassy_names:
        with open(f"embassy_registers/{version}.yaml", "r") as embassy_file:
            embassy_data[version] = yaml.safe_load(embassy_file)
        # get only the rcc register that configures the system clock

    return Context(
        tree_name=cubemx_name,
        embassy_patch_list=embassy_names,
        tree_data=cube_json,
        embassy_data=load_embassy_data(embassy_data),
    )


def load_embassy_data(embassy_ver_list: dict[str, dict]) -> EmbassyData:
    data = EmbassyData(register={}, enums={})
    for version, embassy_yaml in embassy_ver_list.items():
        prefix = version.split("_")[0].upper()
        for f_name, f_data in embassy_yaml.items():
            f_list = f_name.split("/")
            if f_list[0] == "fieldset":
                if "ENR" not in f_list[1] or "STR" not in f_list[1]:
                    for field in f_data["fields"]:
                        name = field.get("name", "INVALID_NAME")
                        description = field.get("description", "")
                        if not skip_field(name, description):
                            enum = field.get("enum", None)
                            enum_name = ""
                            if enum is not None:
                                enum_name = f"{prefix}_{enum}"

                            data.register[f"{prefix}_{name}"] = EmbassyRegister(
                                name=name,
                                description=description,
                                enum_name=enum_name,
                                bit_width=field.get("bit_width", 0),
                            )

            elif f_list[0] == "enum":
                data.enums[f"{prefix}_{f_list[1]}"] = EmbassyEnum(
                    name=f_list[1],
                    size=f_data.get("bit_size", None),
                    variants=[
                        EmbassyEnumField(
                            name=variant["name"],
                            value=variant["value"],
                            description=variant.get("description", ""),
                        )
                        for variant in f_data["variants"]
                        if variant.get("name", "").lower() != "disable"
                    ],
                )
    return data


def skip_field(name: str, disc: str) -> bool:
    to_skip = ["EN", "STR", "RDY", "BYP", "ON", "RST", "STF"]
    disc_skip = ["flag", "status", "interrupt"]
    lower_disc = disc.lower()

    return any(name.endswith(skip) for skip in to_skip) or any(
        skip in lower_disc for skip in disc_skip
    )


def get_link_data(ctx: Context, model: SentenceTransformer, top_k=3) -> LinkData:
    # step one, list top_k most similar registers between embassy and cubemx, based on the description of the register

    # create fixed regs document
    regs_items = list(ctx.embassy_data.register.items())
    regs = [f"{n.lower()} - {v.description.lower()}" for n, v in regs_items]
    encoded_regs = model.encode(regs, convert_to_tensor=True)
    enums_used = set()
    patchs = []
    score_sum = 0
    score_count = 0

    for ref in ctx.tree_data["references"]:
        if skip_ref(ref):
            continue
        ref_name: str = ref["ref_name"].lower()
        ref_query = f"{ref_name.replace('_', ' ')} - {ref['disc'].lower()} {ref_postfix(ref_name)}"
        ref_encoded = model.encode(ref_query, convert_to_tensor=True)
        tops = util.semantic_search(ref_encoded, encoded_regs, top_k=top_k)[0]
        scores = [
            Scores(reg=regs_items[tpk["corpus_id"]][1], score=tpk["score"])
            for tpk in tops
        ]

        # print(f"finding match for query: {ref_query:<50.50} -  with {len(scores)} candidates:")
        # for s in scores:
        #    print(f" - {s.reg.name} with score: {s.score:.4f}")

        perfect = find_perfect_match(ctx, ref, scores, model)
        if perfect["match"] is None:
            print(f"fail to find a match for {ref['ref_name']} - {ref['disc']}")
        else:
            mapping: ListPatch = perfect["match"]
            patchs.append(mapping)
            score = perfect["score"]
            score_sum += score
            score_count += 1
            c_enum = ctx.embassy_data.enums.get(mapping.enum, None)
            if c_enum is not None:
                c_enum.name = mapping.enum
                enums_used.add(c_enum)
            #print(
            #    f"perfect match found for {ref['ref_name']} - {ref['disc']}: {mapping.register_name} with score: {score:.4f}"
            #)
            #print(f" - field mapping:\n")
            #for item in mapping.items:
            #    print(f"    - {item[0]} -> {item[1]}")
            #print("\n")

    print(
        f"average perfect match score: {(score_sum / score_count) if score_count > 0 else 0:.4f}"
    )
    return LinkData(enum_useds=enums_used, patchs=patchs)

def find_perfect_match(
    ctx: Context, ref: dict, scores: list[Scores], model: SentenceTransformer
) -> dict[str, Union[None, ListPatch, NumberPatch, float]]:
    ref_type = type_ref(ref)
    type_callback = None
    if ref_type is None:
        return {
            "match": None,
            "score": 0,
        }  # if we cant determine the type of the reference, we cant find a perfect match for it, so we return None.

    elif isinstance(ref_type, ListRef):
        type_callback = match_list_to_register

    elif isinstance(ref_type, NumberRef):
        type_callback = match_number_to_register
        return {
            "match": None,
            "score": 0,
        }  # for now, we dont have a good way to patch number references, so we return None.

    best_match = None
    best_score = 0
    for s in scores:
        match = type_callback(ctx, ref_type, s, model)
        if match["final_score"] < DISCARD_MATCH_THRESHOLD:
            continue  # if the score is bellow the discard threshold, we discard this match, even if its the best one, since it would be a very weak match and could lead to incorrect patchs.
        elif match["final_score"] > best_score:
            best_score = match["final_score"]
            best_match = match.get("field_mapping", None)
    return {"match": best_match, "score": best_score}


def match_list_to_register(
    ctx: Context, ref_list: ListRef, score: Scores, model: SentenceTransformer
) -> dict:
    reg = score.reg
    scr = score.score

    true_enum_name = reg.enum_name.split("_")[
        -1
    ]  # the enum name has a prefix that is not present in the ListRef.
    coverage_penalty = 1.0
    anchor_bonus = calc_anchor_bonus(scr)
    anchor_bonus += (
        MATCH_NAME_BONUS
        if (true_enum_name.lower() in ref_list.name.lower())
        or (true_enum_name.lower() in ref_list.name.lower().replace("_", ""))
        else 0
    )  # if the enum name is present in the ListRef name, add a bonus to the anchor score, since this is a strong indication that this register is a good match for the ListRef.
    type_enum = ctx.embassy_data.enums.get(reg.enum_name, None)

    incomplete = False
    enum_or_ref = ""
    ref_query = None
    enum_doc = None
    if reg.enum_name == "" or type_enum is None or len(type_enum.variants) == 0:
        # list types can only be matched to registers that have an associated enum
        # when theres no enum for a ListRef, this can only mean one of three things:
        # - 1: ListRef does not repesent a actual hardware register, but rather a software configuration.
        # - 2: the ListRef contains literal hardware values, so theres no need to match it to an embassy register, since the values can be directly used in the code.
        # - 3: the embassy data is missing the enum associated with this register, which makes it impossible to match it to the ListRef.
        final_score = ((scr * NAME_MULTIPLIER) * NO_ENUM_PENALTY) + (
            (anchor_bonus * ANCHOR_MULTIPLIER) * NO_ENUM_WITH_ANCHOR_MULTIPLIER
        )
        return {
            "final_score": final_score
        }  # in this case we cant provide a field mapping, since we have no enum to match the ListRef options to.

    if is_ref_divisor(ref_list):
        divisor_keywords = ["div", "mul", "psc"]
        enum_is_div = all(
            any(k in v.name.lower() for k in divisor_keywords)
            for v in type_enum.variants
        )
        if not enum_is_div:
            # enum isn't a divisor -> invalid match
            return {"final_score": 0}

        number_regx = re.compile(r"(\d+)(?!.*\d)")
        ref_nums = []
        for opt in ref_list.options:
            m = number_regx.search(opt.name)
            if not m:
                return {"final_score": 0}
            ref_nums.append(int(m.group()))

        enum_nums = []
        for variant in type_enum.variants:
            m = number_regx.search(variant.name)
            if m:
                enum_nums.append(int(m.group()))

        # ensure all ref numbers are in enum numbers
        if not set(ref_nums).issubset(set(enum_nums)):
            return {"final_score": 0}

        field_mapping = []
        for opt in ref_list.options:
            num = int(number_regx.search(opt.name).group())
            # find the first enum variant that contains this number
            matched_variant = next((v for v in type_enum.variants if number_regx.search(v.name) and int(number_regx.search(v.name).group()) == num), None)
            if matched_variant is None:
                # shouldn't happen because of the subset check above, but guard anyway
                return {"final_score": 0}
            field_mapping.append([opt.name, matched_variant.name])

        # incomplete logic: compare counts
        if len(ref_list.options) > len(type_enum.variants):
            incomplete = True
            enum_or_ref = "enum"
        elif len(ref_list.options) < len(type_enum.variants):
            incomplete = True
            enum_or_ref = "ref"

        # compute a deterministic score without semantic analysis
        coverage = 1.0  # by construction all ref numbers are present
        if coverage == 1:
            anchor_bonus += ANCHOR_BUNUS * FIELD_MATCH_BUNUS_MULTIPLIER
        field_score = 1.0
        coverage_penalty = 1.0

        final_score = (
            (scr * NAME_MULTIPLIER)
            + ((field_score * coverage_penalty) * COVERAGE_MULTIPLIER)
            + (anchor_bonus * ANCHOR_MULTIPLIER)
        )

        return {
            "final_score": final_score,
            "field_mapping": ListPatch(
                register_name=ref_list.name,
                enum=reg.enum_name,
                items=field_mapping,
                incomplete=incomplete,
                enum_or_ref=enum_or_ref,
            ),
        }
    else:
        ref_query = model.encode(
            [
                f"{ref_enum_filter(option.name)} - {option.description if option.description is not None else ''}"
                for option in ref_list.options
            ],
            convert_to_tensor=True,
        )
        enum_doc = model.encode(
            [
                f"{variant.name.lower()}:{variant.value} - {variant.description}"
                for variant in type_enum.variants
            ],
            convert_to_tensor=True,
        )
        divisor = max(len(ref_list.options), len(type_enum.variants))
        div = min(len(ref_list.options), len(type_enum.variants))
        coverage = div / divisor

        if len(ref_list.options) > len(type_enum.variants):
            incomplete = True
            enum_or_ref = "enum"
            coverage_penalty = coverage**COVERAGE_LOW__PENALTY_MULTIPLIER
        elif len(ref_list.options) < len(type_enum.variants):
            incomplete = True
            enum_or_ref = "ref"
            coverage_penalty = coverage**COVERAGE_HIGH_PENALTY_MULTIPLIER
        else:
            # if they have the same number of variants, increase the score, since this is a strong indication that this register is a good match for the ListRef
            anchor_bonus += ANCHOR_BUNUS * FIELD_MATCH_BUNUS_MULTIPLIER

    enum_scores = model.similarity(ref_query, enum_doc)
    cost = -np.array(enum_scores)
    row_ind, col_ind = optimize.linear_sum_assignment(cost)
    field_score = np.mean([enum_scores[r][c] for r, c in zip(row_ind, col_ind)])
    anchor_bonus += calc_anchor_bonus(
        field_score
    )  # check if the field score is good enough to be considered an anchor.
    field_mapping = [
        list([ref_list.options[r].name, type_enum.variants[c].name])
        for r, c in zip(row_ind, col_ind)
    ]

    final_score = (
        (scr * NAME_MULTIPLIER)
        + ((field_score * coverage_penalty) * COVERAGE_MULTIPLIER)
        + (anchor_bonus * ANCHOR_MULTIPLIER)
    )
    # print(f"    - candidate: {reg.name} scores:")
    # print(
    # f'''
    #    - name similarity score: {scr:.4f}
    #    - field score: {field_score:.4f}
    #    - coverage: {coverage:.4f}
    #    - coverage penalty: {coverage_penalty:.4f}
    #    - anchor bonus: {anchor_bonus:.4f}
    #    - final score: {final_score:.4f}
    #''')

    # print(f" - field score: {field_score:.4f}, coverage penalty: {coverage_penalty:.4f}, anchor bonus: {anchor_bonus:.4f}")

    return {
        "final_score": final_score,
        "field_mapping": ListPatch(
            register_name=ref_list.name,
            enum=reg.enum_name,
            items=field_mapping,
            incomplete=incomplete,
            enum_or_ref=enum_or_ref,
        ),
    }


def match_number_to_register(
    ctx: Context, ref_num: NumberRef, score: Scores, model: SentenceTransformer
) -> dict:
    return {"final_score": 0}  # for now, just return the original score.


def type_ref(ref: dict) -> Value:
    variants: list[dict] = ref.get("variants", [])
    numbers = set()
    itens: set[ListOptions] = set()

    for v in variants:
        v_type = list(v["ref"].keys())[0].lower()
        v_val: dict = v["ref"][v_type]
        if v_type in ["fixed_integer", "fixed_float"]:
            numbers.add(v_val)
        elif v_type in ["integer_range", "float_range"]:
            min = v_val.get("min", 0)
            max = v_val.get("max", 0)
            numbers = numbers | set(
                range(
                    int(min) if min is not None else 0,
                    int(max + 1) if max is not None else 1,
                )
            )
        elif v_type == "list":
            for val in v_val.get("itens", []):
                name = val.get("name", "")
                semaphore = val.get("semaphore", None)
                description = val.get("description", None)
                itens.add(ListOptions(name=name, semaphore=semaphore, description=description))
        elif v_type == "single_item":
            name = v_val.get("name", "")
            semaphore = v_val.get("semaphore", None)
            description = v_val.get("description", None)
            itens.add(ListOptions(name=name, semaphore=semaphore, description=description))

    if len(itens) > 0 and len(numbers) == 0:
        return ListRef(
            name=ref.get("ref_name", ""), options=list(itens))
    elif len(numbers) > 0 and len(itens) == 0:
        numbers = list(numbers)
        numbers.sort()
        return NumberRef(min=numbers[0], max=numbers[-1], numbers=numbers)
    else:
        return None


def intersect_ref_enum(ref: ListRef, enum: EmbassyEnum) -> float:
    if not is_enum_divisor(enum):
        return 0.0

    number_regx = re.compile(r"(\d+)(?!.*\d)")
    enum_item_set = set(
        [
            int(num.group())
            for variant in enum.variants
            if (num := number_regx.search(variant.name))
        ]
    )
    ref_item_set = set(
        [
            int(num.group())
            for option in ref.options
            if (num := number_regx.search(option.name))
        ]
    )

    intersect = enum_item_set.intersection(ref_item_set)
    if len(ref_item_set) == 0:
        return 0.0
    return len(intersect) / len(ref_item_set)


def is_enum_divisor(enum: EmbassyEnum) -> bool:
    divisor_keywords = ["div", "mul", "psc"]
    first_state = False
    last_state = False
    for keyword in divisor_keywords:
        if keyword in enum.variants[0].name.lower():
            first_state = True
        if keyword in enum.variants[-1].name.lower():
            last_state = True
    return first_state and last_state


def is_ref_divisor(ref: ListRef) -> bool:
    divisor_keywords = ["div", "mul", "psc"]
    if ref is None:
        return False

    opts = ref.options
    if not opts:
        return False

    for opt in opts:
        opt_name = opt.name.lower()
        if any(k in opt_name for k in divisor_keywords):
            continue
        if opt_name.isnumeric():
            continue
        return False

    return True


# based in the ref name, we can add a postfix to the query that will help to find the correct register in the embassy data.
# for example if the name contains "div" or "mult" we can add "prescaler" to the query, since these types of registers are usually used to configure prescalers.
def ref_postfix(ref_name: str) -> str:
    low_name = ref_name.lower()
    if "sysclksource" in low_name:
        return " (system switch [sw])"
    elif "pllsource" in low_name:
        return " (pllsrc)"
    elif "ckpre" in low_name:
        return " (per_ck)"
    elif "tim_preescaler_Selection" in low_name:
        return " (timpre)"
    elif "vci_" in low_name:
        return " (pllrge)"
    elif "vco_" in low_name:
        return " (pllvcosel)"
    elif "hpre" in low_name:
        return " (ahb prescaler)"
    elif "ppre" in low_name:
        return " (apb prescaler)"
    elif "clockselection" in low_name:
        return low_name.replace("clockselection", "sel")
    elif any(keyword in low_name for keyword in ["div", "mul", "psc"]):
        if "apb" in low_name:
            return " (PPRE)"
        elif "ahb" in low_name:
            return " (HPRE)"
        elif (len(low_name) - 3) < 3:
            # check if the name have more than 3 characters after removing the keywords
            # if it does, then its probably a PLL.
            return f"(pll{low_name[3:]})"
        else:
            return " (prescaler)"
    elif any(keyword in low_name for keyword in ["sel", "src", "switch", "mux"]):
        return " (selection/source)"
    else:
        return ""


# just a basic space cleaner for the ref name, to help the model to focus on the most relevant part of the name for the matching.
def ref_enum_filter(txt: str) -> str:
    full_txt = txt.lower().split("_")
    lower: str = full_txt[-1][:]
    to_space = ["pll1", "pll2", "pll3", "vco", "vci"]
    to_remove = ["div", "mul", "psc"]
    for keyword in to_space:
        if keyword in lower:
            lower = lower.replace(keyword, f" {keyword} ")
    for keyword in to_remove:
        lower = lower.replace(keyword, "")
    if len(full_txt) > 1:
        if full_txt[1] == "timpres":
            lower = lower.replace("desactivated", "defaultx2").replace(
                "activated", "defaultx4"
            )
        if("vco_" in txt.lower()):
            lower = lower.replace("low", "medium").replace("high", "wide")
    if(("pll" in full_txt[-1]) and len(full_txt[-1]) > 5 and  full_txt[-1][-1].isnumeric()):
        lower = " ".join([lower, f"(pll{full_txt[-1][-1]})"])
    return lower


def ref_div_normalize(txt: str) -> str:
    number_regx = re.compile(r"(\d+)(?!.*\d)")
    ret = number_regx.search(txt)
    if ret:
        return f"div{ret.group()}"
    else:
        return txt


def skip_ref(ref: dict) -> bool:
    low_name = ref["ref_name"].lower()
    low_disc = ref["disc"].lower()
    name_to_skip = [
        "value",
        "enable",
        "enbale",
        "state",
        "from",
        "string",
        "used",
        "type",
        "timout",
        "output",
        "cortex",
        "trace",
    ]
    disc_to_skip = ["startup", "systick", "crs"]

    return any(skip in low_name for skip in name_to_skip) or any(
        skip in low_disc for skip in disc_to_skip
    )


def get_enum_patch(enums: set[EmbassyEnum]) -> list[dict]:
    patch = []
    for enum in enums:
        patch_item = {}
        patch_item["name"] = enum.name
        patch_item["fields"] = [{"name": variant.name, "value": variant.value} for variant in enum.variants]
        if(enum.size is not None):
            patch_item["bit_size"] = enum.size
        patch.append(patch_item)
    return patch

def get_type_patchs(patchs: list[Union[ListPatch, NumberPatch]]) -> list[dict]:
    type_patchs = []
    for patch in patchs:
        if isinstance(patch, ListPatch):
            patch_items = [{"ref_item_name": item[0], "enum_item_name": item[1]} for item in patch.items]
            type_patch = {
                "ref_name": patch.register_name,
                "enum": patch.enum,
                "items": patch_items,
                "incomplete": patch.incomplete,
                "enum_or_ref": patch.enum_or_ref,
            }
            type_patchs.append(type_patch)
            
        else:
            continue
    return type_patchs



def main():

    model = SentenceTransformer(
        "all-MiniLM-L6-v2"
    )
    # load cubeMX and its respective embassy patch
    context_list: list[Context] = []
    for cubemx_name, embassy_names in embassy_register_data_link.items():
        ctx = load_context(cubemx_name, embassy_names)
        print(f"""
Context for {ctx.tree_name} with embassy patches {ctx.embassy_patch_list} loaded successfully:
    - registers: {len(ctx.embassy_data.register)}
    - enums: {len(ctx.embassy_data.enums)}
          """)
        context_list.append(ctx)

    print(f"Total contexts loaded: {len(context_list)}\n\n")

    for ctx in context_list:
        print(f"Finding links between {ctx.tree_name} and embassy patches {ctx.embassy_patch_list}...\n")
        link = get_link_data(ctx, model, top_k=5)
        print(f" - Enums used in the patchs: {[enum.name for enum in link.enum_useds if enum is not None]}")
        print(f" finish finding links for {ctx.tree_name} and embassy patches {ctx.embassy_patch_list}\n\n")
        enums = get_enum_patch(link.enum_useds)
        type_patchs = get_type_patchs(link.patchs)
        all = {
            "enums": enums,
            "rename_nodes": [], #no renames yet, since we are focusing on type patchs for now.
            "match_ref_to_enum": type_patchs
            }
        tree_clone = ctx.tree_data.copy()
        tree_clone["gen_patches"] = all

        with open(f"patch_tree_data/{ctx.tree_name}.json", "w") as patch_file:
            json.dump(tree_clone, patch_file, indent=4)
        




if __name__ == "__main__":
    main()
