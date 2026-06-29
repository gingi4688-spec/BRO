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
- **`hooks/forbidden-path-write-guard.ps1`** — PreToolUse (Write|Edit): blocks writes to another project's memory, `memory/supermemory/**`, `memory/_own/secrets/**`, or anything outside BRO_HOME. **R-1 refinement:** a narrow, **slug-keyed whitelist** allows THIS project's legitimate harness paths (`~/.claude/projects/<slug>/` auto-memory and `…\Temp\claude\<slug>\` scratchpad); another project's harness memory and every EP/DB/GAA/IP folder stay blocked. **Gate-2 exception:** a **registry-keyed** allowance for a **registered** project's `<project_path>\bro\` subtree ONLY (validated against the registry, status REGISTERED|INSTALLED) — never the project root, never `<project_path>\memory`, never an unregistered project. Registration (Gev-gated) is the approval. Registry source = `$env:BRO_REGISTRY_PATH` if set (test seam), else `memory/_own/registry.json`. / forbidden-path write block + slug-keyed harness whitelist + registry-keyed `\bro\` exception.
- **`hooks/log-append-only-guard.ps1`** — PreToolUse (Write|Edit): blocks Edit/Write on append-only evidence logs (use `bro-log.ps1`). Layered with the write-guard (defense-in-depth, C6). / evidence-log append-only.
- **`hooks/cross-memory-read-guard.ps1`** — PreToolUse (Read): blocks reading another project's sealed memory (B4/L8). / cross-project read block.
- **`hooks/critical-command-gate.ps1`** — PreToolUse (Bash|PowerShell): blocks a real `git push` and actual execution of a critical SuperBro script (`bro-release/promote/register/install/update-spine`) unless `BRO_GEV_APPROVED=1` (push = Gev-gated, §8A). **R-1 refinement:** detection runs on a **scrubbed** command (heredoc bodies + quoted strings removed) and is **anchored to actual command tokens / `-File` execution**, so a critical word in a commit message, prose, comment, or a file-path argument (e.g. `git add tools/bro-register.ps1`) no longer false-blocks. / critical-command gate, anchored.
- **`hooks/preflight-printer.ps1`** — SessionStart: prints the per-session pre-flight banner (project · allowed memory · forbidden paths · spine version · critical-needs-Gev · cross-project OFF). / session pre-flight.
- **`bro-log.ps1`** — the ONLY sanctioned append-only evidence writer; **script-generated** timestamps + session_id (no fabrication). / append-only evidence writer.
- **`bro-audit.ps1`** — read-only audit suite (manifest · authority · `_own` boundary · drift · enforcement deliverables); flags only, never fixes. `-Log` appends one audit-log entry. F3 whitelist: filename-based `_own` check + GAAhex sealed-mirror whitelist. / read-only audit.
- **`bro-health.ps1`** — regenerates `memory/_own/health-dashboard.md` from doctor+audit (a generated snapshot, overwrite — not append-only). / health snapshot generator.
- **`bro-spine-check.ps1`** — read-only spine integrity (live spine at root OD-6 · key content · spine_version · RELEASES empty OD-5). / spine integrity.

> **Enforcement model:** hooks **fail OPEN** on any internal error (never brick a session) and **DENY (exit 2)** only on a confirmed forbidden match; matchers are narrow. Hooks are installed in `.claude/settings.json` (separate from the preserved `settings.local.json`) and proven by direct invocation (exit codes); **live enforcement applies on the next session load**. / Hook-երը fail-OPEN են error-ին, DENY միայն confirmed match-ին; proven exit-code-ով; live enforcement-ը հաջորդ session-ից։

### Phase 3 — Registry + Project Bro Template + Rollout Dry-Run (design/dry, NO install)
- **`bro-register.ps1`** — REGISTER PROJECT, **DRY-RUN only**: previews the metadata-only registry entry it WOULD write and executes nothing; refuses a path inside another project's memory or inside BRO_HOME (B4). / DRY register.
- **`bro-install.ps1`** — INSTALL PROJECT BRO, **DRY-RUN only**: previews the `X/bro` skeleton it WOULD create from the template; creates nothing, touches no project. / DRY install.
- **`bro-update-spine.ps1`** — UPDATE PROJECT BRO SPINE, **DRY-RUN only**: previews the pull→verify→stamp plan; executes nothing (the procedure itself is Phase 4). / DRY spine update.
- **`bro-registry-check.ps1`** — read-only registry validator (schema + empty + no cross-project path, B4). / read-only registry check.
- **`templates/project-bro/`** — the install copy-source skeleton (manifest+health templates with `<PLACEHOLDER>` tokens; empty `memory/ spine/ logs/`). Nothing here is an installed Bro. Full contract: `_core/PROJECT_BRO_TEMPLATE.md`. / install copy-source.

> **DRY model:** rollout commands are palette-wired (preview→YES) but **execute nothing** in the clean build — even on YES, no project is registered, no Project Bro is created, no project folder is touched. Real execution is a later, Gev-gated Rollout step (requires `BRO_GEV_APPROVED=1` + Gev command). / Rollout-ները palette-wired են (preview→YES) բայց **ոչինչ չեն կատարում**; real execution-ը հետագա Gev-gated Rollout է։

### Phase 4 — Spine Release / Update System + Promotion Gate (§6A Flow 2 / §9 / §10)
- **`bro-release.ps1`** — cut a versioned, hash-verified spine release (manifest + payload + sha256). CRITICAL, Gev-gated. **OD-5: real cut into `spine/RELEASES/` is DEFERRED** — use `-Sandbox <dir>` to TEST the mechanism without touching `spine/RELEASES/` (stays empty). / release cut (sandbox-testable).
- **`bro-spine-verify.ps1`** — recompute every payload file's sha256 vs the manifest + rollup; **REJECT on any mismatch** (no blind copy/sync). / hash verify.
- **`bro-spine-pull.ps1`** — copy a release payload into a target spine dir, then verify (a Bro's own pull; never forced, B6). / pull + verify.
- **`bro-spine-stamp.ps1`** — on VERIFIED, stamp `spine_version` into the target manifest. / stamp.
- **`bro-promote.ps1`** — **Promotion Gate**: BLOCKS unapproved candidates and project-specific candidates (altitude); only a generic, Gev-approved rule passes (dry — no spine write in the clean build). / promotion gate.

> **OD-5/OD-6 honored:** the release mechanism is built and **testable only in a sandbox**; `spine/RELEASES/` stays empty (no `v1.0.0` cut); the live spine stays at the BRO_HOME root dirs. A real cut is a separate, explicit Gev command. / Release mechanism-ը testable է **միայն sandbox-ում**; `spine/RELEASES/`-ը դատարկ; live spine-ը root-ում; real cut-ը առանձին Gev հրաման է։
