import os
import json
from typing import Dict, Any


def gather_semaphores_from_reference(ref: Dict[str, Any]) -> Dict[str, Any]:
    """Return a mapping item_name -> semaphore for the given reference.

    Handles both 'list' variants and 'single_item' variants.
    """
    sem_map: Dict[str, Any] = {}
    for var in ref.get("variants", []):
        if not isinstance(var, dict) or "ref" not in var:
            continue
        var_t = list(var["ref"].keys())[0].lower()
        var_v = var["ref"][list(var["ref"].keys())[0]]
        if var_t == "list":
            itens = var_v.get("itens", [])
            for it in itens:
                name = it.get("name")
                if name is None:
                    continue
                if "semaphore" in it:
                    sem_map[name] = it["semaphore"]
        elif var_t == "single_item":
            name = var_v.get("name")
            if name is None:
                continue
            if "semaphore" in var_v:
                sem_map[name] = var_v["semaphore"]
    return sem_map


def merge_semaphores(virtual_ref: Dict[str, Any], sem_map: Dict[str, Any]) -> bool:
    """Merge semaphores from sem_map into virtual_ref items.

    Returns True if any change was made.
    """
    changed = False
    for var in virtual_ref.get("variants", []):
        if not isinstance(var, dict) or "ref" not in var:
            continue
        var_t = list(var["ref"].keys())[0].lower()
        var_v = var["ref"][list(var["ref"].keys())[0]]
        if var_t == "list":
            for it in var_v.get("itens", []):
                name = it.get("name")
                if name is None:
                    continue
                if name in sem_map and sem_map[name] is not None:
                    if "semaphore" not in it or it.get("semaphore") is None:
                        it["semaphore"] = sem_map[name]
                        changed = True
        elif var_t == "single_item":
            name = var_v.get("name")
            if name and name in sem_map and sem_map[name] is not None:
                if "semaphore" not in var_v or var_v.get("semaphore") is None:
                    var_v["semaphore"] = sem_map[name]
                    changed = True
    return changed


def process_file(path: str, out_dir: str) -> None:
    with open(path, "r") as f:
        tree = json.load(f)

    refs: Dict[str, Dict] = {}
    for r in tree.get("references", []):
        refs[r.get("ref_name")] = r

    to_remove = set()
    for ref_name, ref in list(refs.items()):
        if not isinstance(ref_name, str):
            continue
        if not ref_name.endswith("Virtual"):
            continue
        counterpart_name = ref_name[:-7]
        counterpart = refs.get(counterpart_name)
        if counterpart is None:
            # no counterpart, skip
            continue

        sem_map = gather_semaphores_from_reference(counterpart)
        if not sem_map:
            # nothing to merge but still delete counterpart per spec
            print(f"[{os.path.basename(path)}] found '{ref_name}' counterpart '{counterpart_name}' but no semaphores to merge.")
        else:
            changed = merge_semaphores(ref, sem_map)
            print(f"[{os.path.basename(path)}] merged semaphores from '{counterpart_name}' into '{ref_name}' (changed={changed})")

        # schedule deletion of the non-virtual reference
        to_remove.add(counterpart_name)

    if to_remove:
        new_refs = [r for r in tree.get("references", []) if r.get("ref_name") not in to_remove]
        tree["references"] = new_refs

    # ensure output dir exists
    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, os.path.basename(path))
    with open(out_path, "w") as f:
        json.dump(tree, f, indent=4)


def main():
    root = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
    clock_ref_dir = os.path.join(root, "clock_ref_data")
    out_dir = os.path.join(root, "pre_patch_jsons")

    if not os.path.isdir(clock_ref_dir):
        print(f"clock_ref_data directory not found at: {clock_ref_dir}")
        return

    files = sorted([f for f in os.listdir(clock_ref_dir) if f.lower().endswith(".json")])
    if not files:
        print("No json files found in clock_ref_data")
        return

    for fn in files:
        path = os.path.join(clock_ref_dir, fn)
        try:
            process_file(path, out_dir)
        except Exception as e:
            print(f"Error processing {fn}: {e}")


if __name__ == "__main__":
    main()
