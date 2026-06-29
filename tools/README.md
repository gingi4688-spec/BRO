# tools/ — Super Bro scripts / Super Bro-ի script-եր

> **EN:** Real scripts that return exit codes — the **executors behind the Command Palette** (OD-4: Bro presents menu/preview/approval; scripts do the side-effects; hooks are the wall). Clean-build **Phase 0 ships ONLY** a minimal read-only bootstrap doctor. The full doctor/audit/drift/skill/spine suite **and** the structural hooks land in **Phase 2+**.
> **HY:** Real script-եր՝ exit-code վերադարձնող — **Command Palette-ի executor-ները** (OD-4: Bro-ն ներկայացնում է menu/preview/approval; script-երն անում են side-effect-ները; hook-երը պատն են)։ Մաքուր-build **Phase 0-ն բերում է ՄԻԱՅՆ** minimal read-only bootstrap doctor։ Լրիվ doctor/audit/drift/skill/spine + structural hook-երը՝ **Phase 2+**։

## Current scripts / ընթացիկ script-եր
- **`bro-doctor.ps1`** — MINIMAL read-only bootstrap doctor (Phase 0 scope): checks skeleton presence · `bro.manifest.json` validity + fields · **verify-only** authority (OD-3) · `_own` structure (no stray project content) · live spine at root (OD-6) + `RELEASES/` empty (OD-5). Exit codes: `0`=GREEN · `1`=YELLOW · `2`=RED · `3`=CRITICAL. **Writes nothing.** / Minimal read-only bootstrap doctor — ոչինչ չի գրում։
