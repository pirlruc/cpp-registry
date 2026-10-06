# cpp-registry

vcpkg registry for the pirlruc C++ libraries.

## Use

Point `vcpkg-configuration.json` at this repository and pin `baseline` to a
commit. Packages: `bor`, `runa`, `mjolnir`, `edda`, `mimir`, `bifrost`, `nornir`.

Each port's `REF` is the commit of the library release tag. `versions/<letter>-/<port>.json`
records the git tree of `ports/<port>` at that version. `scripts/check-git-trees.py`
checks that the newest entry matches `git rev-parse HEAD:ports/<port>` and the
baseline version.

## Bump a port

1. Tag the library.
2. Update `ports/<name>/portfile.cmake` (`REF`) and `vcpkg.json` (`version`).
3. Run `vcpkg x-add-version <name> --overwrite-version` from a vcpkg checkout, or
   update `versions/` and `versions/baseline.json` so the git-tree matches.
4. Open a pull request. The registry workflow runs `scripts/check-git-trees.py`.
