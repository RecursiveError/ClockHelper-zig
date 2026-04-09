# this script try to fix multiplexor and xbar nodes before passing to the codegen patch script.
# 
# the fix process is simple, we check if the node is a multiplexor or xbar
# if it is, we need to check if the reference for this node match the inputs of the node, if not, we need to update the reference to match based on these rules:
#
# - if a node input have a null reference, that maens "else" case for the multiplexor, 
#   so we need to check what item (or items) are not directly connected to another input
#   if it has at least one item that is not directly connected to another input, we remove those items from the reference, 
#   and add the "else" input directly to the reference (we do this because our code generation dont need to have a else case, as it already handle it by default)
#   if theres no item that is not directly connected to another input, we just remove the "else" input from the node.
#
# - if a node input have a reference that is not listed in the reference of the node, we just remove that input from the node, as it is not connected to anything.
# 

from data_link import data_link
from dataclasses import dataclass
from typing import Union
import json
from pathlib import Path

@dataclass
class NodeInput:
    name: str
    ref: Union[str, None]

    def __hash__(self):
        return hash(self.name)
    
    def __str__(self):
        return self.name

def main():
    ref_dir = Path("pre_patch_jsons")
    out_dir = Path("pre_patch_jsons")
    out_dir.mkdir(parents=True, exist_ok=True)

    for json_path in sorted(ref_dir.glob("*.json")):
        tree_name = json_path.stem
        print(f"Checking tree: {tree_name}")
        with json_path.open("r") as f:
            tree = json.load(f)
        refs_map = load_refs_items(tree)
        new_tree = check_nodes(tree, refs_map)
        out_path = out_dir / f"{tree_name}.json"
        with out_path.open("w") as patch_file:
            json.dump(new_tree, patch_file, indent=4)
        

def load_refs_items(tree:dict) -> dict[str, set[str]]:
    refs = {}
    for ref in tree["references"]:
        name = ref["ref_name"]
        items = set()
        for var in ref["variants"]:
            var_t = list(var["ref"].keys())[0].lower()
            var_v = var["ref"][var_t]
            if var_t == "list":
                for item in var_v["itens"]:
                    items.add(item["name"])
            elif var_t == "single_item":
                items.add(var_v["name"])
        if len(items) > 0:
            refs[name] = items
    return refs

def check_nodes(tree:dict, refs_map:dict[str, set[str]]) -> dict:
    tree_cpy = tree.copy()
    rename_sets: list[dict] = list()
    for idx, node in enumerate(tree["nodes"]):
        if node["node_type"] in ["multiplexor", "xbar"]:
            sources = list_node_inputs(node["variants"])
            none_null_refs = [src.name for src in sources if src.ref is None] 
            has_none_ref = len(none_null_refs) > 0
            node_set = set([src.ref for src in sources if src.ref is not None])
            references: list[str] = list(set([  ref_name for ref_name in node["reference"].split(",")]))
            actual_set = set()
            for ref in references:
                
                if ref in refs_map:
                    actual_set.update(refs_map[ref])
            if len(actual_set) == 0:
                continue
            elif len(node_set) > len(actual_set) and has_none_ref:
                print(f"Node {node['name']} has a null reference and more inputs than the actual reference items")
            elif len(node_set) > len(actual_set):
                print(f"Node {node['name']} has more inputs than the actual reference items")
            elif len(node_set) < len(actual_set) and has_none_ref:
               print(f"Node {node['name']} has a null reference and less inputs than the actual reference items")
               unused_names = actual_set.difference(node_set)
               if (len(none_null_refs) == 1) and (len(references) == 1):
                   new_dict: dict = {"reference": references[0],
                        "removed_items": list(unused_names),
                        "add_item": none_null_refs[0],
                    }
                   rename_sets.append(new_dict.copy())
                   
               for names in references:
                   swap_null_references(tree_cpy, names, none_null_refs, unused_names)
                   for v_idx, v in enumerate(node["variants"]):
                       for src_idx, src in enumerate(v["inputs"]):
                           if src["source_ref"] == None:
                               tree_cpy["nodes"][idx]["variants"][v_idx]["inputs"][src_idx]["source_ref"] = src["source"]
            
                
            elif len(node_set) < len(actual_set):
                print(f"Node {node['name']} has less inputs than the actual reference items")
    
    tree_cpy["fixed_multiplexors"] = rename_sets if len(rename_sets) > 0 else None
    return tree_cpy

def list_node_inputs(node_vars: list[dict]) -> set[NodeInput]:
    inputs = set()
    for vars in node_vars:
        var_inputs = [NodeInput(input["source"], input.get("source_ref", None)) for input in vars["inputs"]]
        inputs.update(var_inputs)
    return inputs

def swap_null_references(tree:dict, ref_name: str, to_add: list, to_remove:list[str]):
    for idx, ref in enumerate(tree["references"]):
        if ref["ref_name"] == ref_name:
            for v_idx, var in enumerate(ref["variants"]):
                var_t = list(var["ref"].keys())[0].lower()
                var_v = var["ref"][var_t]
                if var_t == "list":
                    has_item_to_add = False
                    for i_idx in range(len(var_v["itens"]) -1, -1, -1):
                        if var_v["itens"][i_idx]["name"] in to_remove:
                            del tree["references"][idx]["variants"][v_idx]["ref"][var_t]["itens"][i_idx]
                            has_item_to_add = True
                    if has_item_to_add:
                        for add in to_add:
                            tree["references"][idx]["variants"][v_idx]["ref"][var_t]["itens"].append({"name": add, "value": None, "semaphore": None, "description": None})
                elif var_t == "single_item":
                    if(var_v["name"] in to_remove):
                        tree["references"][idx]["variants"][v_idx]["ref"][var_t]["name"] = to_add[0]


if __name__ == "__main__":
    main()