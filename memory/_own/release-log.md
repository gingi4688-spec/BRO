# Release Log / Release-ի log

> **EN:** Append-only evidence — spine release cuts (publish → verify → stamp, Flow 2). **OD-5 LOCKED:** no `v1.0.0` cut in the clean build; empty until the first Project Bro install/pull needs it or Gev separately commands it.
> **HY:** Append-only evidence — spine release-ներ (publish → verify → stamp, Flow 2)։ **OD-5 LOCKED:** մաքուր build-ում ոչ `v1.0.0` cut; դատարկ մինչ առաջին Project Bro install/pull-ի կարիք կամ Գևի առանձին հրաման։

<!-- entries appended below by the append-only script; do not hand-edit (D7/§13A) -->

## Entry 1 - Phase 4 mechanism test (NO real cut, OD-5)
```txt
timestamp: 2026-06-29T08:14:42+04:00
actor: Bro
session_id: BRO-20260629-081442
event: RELEASE_MECHANISM_TEST
action: SANDBOX_CUT_VERIFY_PULL_STAMP
target: scratchpad sandbox (NOT spine/RELEASES)
source_command: Gev: BUILD PHASES 1-4
authority: Gev-command
result: GREEN
files_changed: none in repo (sandbox only)
notes: bro-release sandbox cut v0.0.0-test/v0.0.1-test (391 files + rollup); bro-spine-verify VERIFIED; tamper -> REJECTED; bro-spine-pull VERIFIED; bro-spine-stamp stamped a sandbox manifest. OD-5: NO v1.0.0 cut; spine/RELEASES/ stays EMPTY. OD-6: live spine at root untouched.
```
