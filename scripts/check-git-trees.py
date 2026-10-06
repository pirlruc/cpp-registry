#!/usr/bin/env python3
"""Check that each port's git tree matches the newest versions entry."""

import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def git_tree(port: str) -> str:
    return subprocess.check_output(
        ["git", "rev-parse", f"HEAD:ports/{port}"], cwd=ROOT, text=True
    ).strip()


def main() -> int:
    baseline = json.loads((ROOT / "versions" / "baseline.json").read_text())
    failed = False
    for port_dir in sorted((ROOT / "ports").iterdir()):
        if not port_dir.is_dir():
            continue
        name = port_dir.name
        bucket = name[0] if name[0].isalpha() else "0"
        version_file = ROOT / "versions" / f"{bucket}-" / f"{name}.json"
        if not version_file.is_file():
            print(f"missing version file for {name}", file=sys.stderr)
            failed = True
            continue
        versions = json.loads(version_file.read_text())["versions"]
        newest = versions[0]
        tree = git_tree(name)
        if newest["git-tree"] != tree:
            print(
                f"{name}: versions git-tree {newest['git-tree']} != ports tree {tree}",
                file=sys.stderr,
            )
            failed = True
        baseline_version = baseline["default"][name]["baseline"]
        if newest["version"] != baseline_version:
            print(
                f"{name}: baseline {baseline_version} != newest version {newest['version']}",
                file=sys.stderr,
            )
            failed = True
    if failed:
        return 1
    print(f"git-tree check passed for {len(list((ROOT / 'ports').iterdir()))} ports")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
