import jsonpath
import json
from jsonpath import JSONPatch as JPatch
from dataclasses import dataclass
from pathlib import Path

@dataclass
class Patch:
    to_apply: list[str]
    patch: str
    op: str
    value: object

patch_list: list[Patch] = [
    Patch(["F303E"], "$.nodes[?(@.name == \"PLLSource\")].variants[*].inputs[?(@.source == \"HSIRCDiv\" && @.source_ref == \"RCC_PLLSOURCE_HSI\")].source_ref", "replace" ,"RCC_PLLSOURCE_HSIDiv2"),
    Patch(["F303E"], "$.references[?(@.ref_name == \"PLLSourceVirtual\")].variants[*].ref.list.itens[?((@.name == \"RCC_PLLSOURCE_HSI\") && (@.description  == \"Pllsource Hsi/2\"))].name", "replace", "RCC_PLLSOURCE_HSIDiv2"),
    Patch(["F303E"], "$.references[?(@.ref_name == \"PLLSourceVirtual\")].variants[*].ref.list.default_name", "replace", "RCC_PLLSOURCE_HSIDiv2"),
    Patch(["F3", "F0"], "$.references[?(@.ref_name == \"RCC_MCOMult_Clock_Source_FROM_PLLMUL\")].variants[?(@.ref.fixed_integer == 2)].ref", "replace", {"single_item": {"name": "RCC_MCO1SOURCE_PLLCLK_DIV2","value": 2.0, "semaphore": None, "description": "2"}}),
    Patch(["G0"], "$.nodes[?(@.name == \"PLLR\")].enable_flag", "replace" ,"PLLUsed"),
    Patch(["G0"], "$.nodes[?(@.name == \"PLLQ\")].enable_flag", "replace" ,"PLLUsed"),
    Patch(["G0"], "$.nodes[?(@.name == \"PLLCLK\")].enable_flag", "replace" ,"PLLUsed"),
]




def main():
    ref_dir = Path("pre_patch_jsons")
    out_dir = Path("pre_patch_jsons")
    out_dir.mkdir(parents=True, exist_ok=True)

    for json_path in sorted(ref_dir.glob("*.json")):
        tree_name = json_path.stem
        to_apply: list[Patch] = []
        for patch in patch_list:
            if any( target in tree_name for target in patch.to_apply):
                to_apply.append(patch)

        if(len(to_apply) == 0):
            continue
        
        with json_path.open("r") as f:
            tree = json.load(f)
        
        print(f"TREE: {tree_name}")
        all_patch: list[dict[str, object]] = []
        for p in to_apply:
            print(f"Appling patch {p.patch}")
            match_target = jsonpath.finditer(p.patch, tree)
            for item in match_target:
                ptr = jsonpath.JSONPointer.from_match(item)
                all_patch.append({"op": p.op, "path": str(ptr), "value": p.value})
        JPatch(all_patch).apply(tree)
                
        
        
        out_path = out_dir / f"{tree_name}.json"
        with out_path.open("w") as patch_file:
            json.dump(tree, patch_file, indent=4)
   


if __name__ == "__main__":
    main()
