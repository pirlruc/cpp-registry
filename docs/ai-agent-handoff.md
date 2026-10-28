# AI agent handoff — cpp-registry

vcpkg git registry for the pirlruc C++ libraries. Consumer instructions are in
[`README.md`](../README.md).

## Pins

| Item | Value |
|------|-------|
| Branch | `feature-registry-scaffold` |
| `docs/guardrails` | tag **1.13.1** → `1945211ac851c3c0f83694bd4ea53571fdced4ab` |
| `.github/scaffold` | tag **1.10.2** → `c8eddcfb2c8a808981e640fa9739cb4fcefa991e` |
| commondevops doc verify | tag **5.6.2** → `b85f95bbac8ba7d82eb90d1d84d1b8d1e8590a12` |
| edda port | version **0.1.0**, port-version **1**, feature `protobuf-json` |

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

- 2026-10-28: Pull requests 2 and 3 are on `main` (`b1796ab`). This branch adds
  the companion submodules, the edda `protobuf-json` feature, the doc-verify
  caller, `docs/issues.yml`, and this handoff.

*Last updated: 2026-10-28 (registry companions and edda protobuf-json feature)*
