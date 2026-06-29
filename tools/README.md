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

### Phase 2 — Enforcement + Evidence + full Doctor/Audit (the WALL, §11/D5/B5)
- **`hooks/forbidden-path-write-guard.ps1`** — PreToolUse (Write|Edit): blocks writes to another project's memory, `memory/supermemory/**`, `memory/_own/secrets/**`, or anything outside BRO_HOME. / forbidden-path write block.
- **`hooks/log-append-only-guard.ps1`** — PreToolUse (Write|Edit): blocks Edit/Write on append-only evidence logs (use `bro-log.ps1`). Layered with the write-guard (defense-in-depth, C6). / evidence-log append-only.
- **`hooks/cross-memory-read-guard.ps1`** — PreToolUse (Read): blocks reading another project's sealed memory (B4/L8). / cross-project read block.
- **`hooks/critical-command-gate.ps1`** — PreToolUse (Bash|PowerShell): blocks `git push` and critical SuperBro scripts unless `BRO_GEV_APPROVED=1` (push = Gev-gated, §8A). / critical-command gate.
- **`hooks/preflight-printer.ps1`** — SessionStart: prints the per-session pre-flight banner (project · allowed memory · forbidden paths · spine version · critical-needs-Gev · cross-project OFF). / session pre-flight.
- **`bro-log.ps1`** — the ONLY sanctioned append-only evidence writer; **script-generated** timestamps + session_id (no fabrication). / append-only evidence writer.
- **`bro-audit.ps1`** — read-only audit suite (manifest · authority · `_own` boundary · drift · enforcement deliverables); flags only, never fixes. `-Log` appends one audit-log entry. F3 whitelist: filename-based `_own` check + GAAhex sealed-mirror whitelist. / read-only audit.
- **`bro-health.ps1`** — regenerates `memory/_own/health-dashboard.md` from doctor+audit (a generated snapshot, overwrite — not append-only). / health snapshot generator.
- **`bro-spine-check.ps1`** — read-only spine integrity (live spine at root OD-6 · key content · spine_version · RELEASES empty OD-5). / spine integrity.

> **Enforcement model:** hooks **fail OPEN** on any internal error (never brick a session) and **DENY (exit 2)** only on a confirmed forbidden match; matchers are narrow. Hooks are installed in `.claude/settings.json` (separate from the preserved `settings.local.json`) and proven by direct invocation (exit codes); **live enforcement applies on the next session load**. / Hook-երը fail-OPEN են error-ին, DENY միայն confirmed match-ին; proven exit-code-ով; live enforcement-ը հաջորդ session-ից։
