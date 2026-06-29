# Health Dashboard (snapshot) / Health Dashboard (snapshot)

> **EN:** Generated read-only snapshot (NOT a live service, §2). Source: `tools/bro-doctor.ps1` (minimal, Phase 0).
> **HY:** Գեներացված read-only snapshot (ոչ live service, §2)։ Աղբյուր՝ `tools/bro-doctor.ps1` (minimal, Phase 0)։

```txt
last_run: 2026-06-29T07:15:08+04:00
phase:    phase-0-foundation
doctor:   bro-doctor.ps1 (minimal, read-only)
RESULT:   GREEN  (problems=0, warnings=0, exit=0)
checks:   skeleton presence OK | manifest valid+fields OK | authority verify-only OK (current) |
          _own structure clean (no project content) | live spine at root OK (OD-6) | RELEASES empty (OD-5)
authority: current (verify-only; no passphrase prompt)
scope:    clean SuperBro Phase 0 skeleton ONLY — no project touch, no Project Bro, no hooks,
          no Discovery Bank move, no migration, no release cut, no push.
```
