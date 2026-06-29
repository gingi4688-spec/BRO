# tools/ — Super Bro scripts / Super Bro-ի script-եր

> **EN:** Real scripts that return exit codes — the **executors behind the Command Palette** (OD-4: Bro presents menu/preview/approval; scripts do the side-effects; hooks are the wall). Clean-build **Phase 0 ships ONLY** a minimal read-only bootstrap doctor. The full doctor/audit/drift/skill/spine suite **and** the structural hooks land in **Phase 2+**.
> **HY:** Real script-եր՝ exit-code վերադարձնող — **Command Palette-ի executor-ները** (OD-4: Bro-ն ներկայացնում է menu/preview/approval; script-երն անում են side-effect-ները; hook-երը պատն են)։ Մաքուր-build **Phase 0-ն բերում է ՄԻԱՅՆ** minimal read-only bootstrap doctor։ Լրիվ doctor/audit/drift/skill/spine + structural hook-երը՝ **Phase 2+**։

## Current scripts / ընթացիկ script-եր

### Phase 0 — bootstrap
- **`bro-doctor.ps1`** — read-only doctor. **Phase 0:** skeleton presence · `bro.manifest.json` validity + fields · **verify-only** authority (OD-3) · `_own` structure (no stray project content) · live spine at root (OD-6) + `RELEASES/` empty (OD-5). **Phase 1 (added):** Command Palette + library presence, library JSON validity + schema, read-only-backing resolution, and that **no critical command is live** in the clean build. Exit codes: `0`=GREEN · `1`=YELLOW · `2`=RED · `3`=CRITICAL. **Writes nothing.** / Read-only doctor — ոչինչ չի գրում։

### Phase 1 — Command Palette + Library
- **`bro-palette.ps1`** — Guided Command Palette runner (§6B / D10 / OD-4): **menu → preview → explicit `YES` → run**. Read-only commands (`HELP · SHOW REGISTRY · SHOW HEALTH · RUN DOCTOR · EXIT`) execute via **named, explicit dispatch** (no arbitrary execution); critical/future commands are **preview-wired but execution-gated** (refuse to run until their phase/system exists + Gev authority). Interactive menu (no args) or `-Command "<name>" [-Confirm YES]` non-interactively. / Palette runner՝ menu → preview → `YES` → run; read-only-ները live, critical-ները gated.
- **`bro-show-registry.ps1`** — read-only: prints `memory/_own/registry.json` (metadata only; empty in clean build). / read-only registry print.
- **`bro-show-health.ps1`** — read-only: prints the generated `memory/_own/health-dashboard.md` snapshot. / read-only health snapshot print.
- **`command-library.json`** — machine-readable catalog the palette reads (mirror of `_core/COMMAND_LIBRARY.md`, the human SSOT). / palette-ի machine catalog։
