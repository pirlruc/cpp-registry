# AI agent handoff — cpp-registry

vcpkg git registry for the pirlruc C++ libraries. Consumer instructions are in
[`README.md`](../README.md).

## Pins

| Item | Value |
|------|-------|
| Branch | `main` (`a92500f`, pull request 4). Do not move the edda 0.1.0 git-tree that port-version 0 recorded. |
| `docs/guardrails` | tag **1.13.1** → `1945211ac851c3c0f83694bd4ea53571fdced4ab` |
| `.github/scaffold` | tag **1.10.2** → `c8eddcfb2c8a808981e640fa9739cb4fcefa991e` |
| commondevops doc verify | tag **5.6.2** → `b85f95bbac8ba7d82eb90d1d84d1b8d1e8590a12` |
| edda port | version **0.1.0**, port-version **1**, feature `protobuf-json` |
| runa port | version **0.3.0**, REF `4a0f8dcd353be55bc14f8c5407f02fe4aaa925d7` (`v0.3.0`) |

## Commands

```bash
python3 scripts/check-git-trees.py
python3 scripts/validate-yaml.py docs/issues.yml --glob '.github/workflows/*.yml'
```

Doc verify calls
[common-doc-verify](https://github.com/pirlruc/commondevops/blob/5.6.2/.github/workflows/common-doc-verify.yml).
commondevops is public, so the caller does not pass `checkout_token`.

## Known pitfalls

- `scripts/check-git-trees.py` compares `HEAD:ports/<name>` with the newest
  `versions/` entry. Update the git-tree in the same commit as the port.
- Do not change package visibility. This registry does not publish images.

## Suggested next work

Bump a library port only after that library's release tag exists. heimdallcv
and draupnir have no ports yet.

## Recent history

- 2026-10-28: Pull request 4 merged as `a92500f`. guardrails is 1.13.1, github-scaffold is 1.10.2, edda port-version 1 publishes `protobuf-json`, and doc verify calls commondevops 5.6.2. Issue sync created and closed [#5](https://github.com/pirlruc/cpp-registry/issues/5) and [#6](https://github.com/pirlruc/cpp-registry/issues/6). Pull requests 2 and 3 were already on `b1796ab`.

*Last updated: 2026-10-28 (PR 4 on main; REG-001 closed)*
