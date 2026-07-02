# TOPIST UPGRADE PLAN — SuperBro existing-skill hardening (NO duplicates)
## Upgrade what exists to the highest practical level · Project Bros stay consumers (L10) · No second project · No push until explicit PUSH authority
> *Բարձրացնել գոյություն ունեցողը մինչև ամենաբարձր գործնական մակարդակ · Project Bro-ները մնում են consumer (L10) · Ոչ երկրորդ project · Ոչ push մինչև բացահայտ PUSH authority։*

> **STATUS: 🌱 PLAN (Gate 1) — drafted by Bro 2026-06-29 on Gev authority "UPGRADE EXISTING SUPERBRO SKILLS TO TOPIST LEVEL — NO DUPLICATES". Baseline origin/main `0de6191`. No file upgraded yet by this plan; Gates 2–11 execute it; Gate 12 seals. NO push.**
> *Կազմված Bro-ի կողմից Գևի authority-ով։ Baseline `0de6191`։ Gate 2–11 կատարում են, Gate 12 կնքում։ Ոչ push։*

---

## 0. Anchors / խարիսխներ
- **Upgrade existing ONLY.** No duplicate skill files, no parallel systems. Every change merges into an existing doc/script/template/law.
- **L10 invariant:** only SuperBro strengthens; Project Bros are consumers; any project hardening is authored in SuperBro and delivered by governed template/spine/update.
- **No new file** unless there is **no existing canonical home** (decided per-capability below).
- **No autonomous law creation.** Where a capability wants a new law, Bro **FLAGS** it (L11 candidate) — Gev dictates; Bro never fills a law slot itself.
- **EP boundary:** no read/write of `C:\Users\Admin\Desktop\EP\memory`; EP touched ONLY through read-only project doctor/audit; no adopt/migrate/mirror; no second project.
- **STOP** on: duplicate created, EP-local self-evolution, EP/memory touched, second project touched, project content into `_own`, doctor/audit RED, unexplained dirty tree, push without authority.

## 1. Duplicate ledger (Gate 0 result) / duplicate-ի հաշվառում
- **Duplicates found: 0.** Nothing to remove.
- Reviewed overlaps, both **layered (kept)**: `bro-update-spine` (DRY rollout wrapper) vs `bro-spine-pull`+`bro-spine-stamp` (real primitives); template hooks vs SuperBro hooks (governed L10 delivery copy).
- **New-file decisions:** rollback/recovery (#8) and secret-guard (#12) are added as **modes/seams on existing scripts**, NOT new parallel systems (§ per-capability). The only genuinely-new artifact is **this plan doc** (a planning artifact, not a capability) — no existing home for it.

---

## 2. Per-capability upgrade specs (build-ready) / capability- առ-capability spec

### Gate 2 — Memory governance · COMPLETE → reinforce
- **Home:** `_core/laws/05_memory_isolation.md`, `_core/laws/02_architecture.md` (L10), `bro-audit.ps1 [C][D]`, `bro-project-audit.ps1`.
- **Already does:** `_own` filename-whitelist (no project content), supermemory sealed-mirror whitelist, B4 cross-path refusal, L10 law.
- **Weak:** "isolation proof required for GREEN" is implied, not asserted as a named gate; "no project-local self-evolution" lives in L10 prose but is not a doctor/audit assertion.
- **Upgrade:** add an explicit **ISOLATION line** to `bro-audit` output (`_own` content-free + supermemory sealed-only + registry metadata-only → one ISOLATION verdict); cross-reference L10 in `05_memory_isolation.md`.
- **Refusal rules:** any project content in `_own` → RED `SUPER_OWN_POLLUTION`; unexpected supermemory mirror → YELLOW→ (topist) RED `CROSS_PROJECT_CONTAMINATION`.
- **Evidence:** audit-log entry shows ISOLATION verdict; Beast isolation proof (Gate 11).
- **GREEN:** `_own` metadata/evidence only · supermemory only sealed mirrors · registry metadata-only · EP/memory untouched.
- **RED:** any of the above violated.
- **Belongs in:** script (`bro-audit`) + law cross-ref.

### Gate 3 — Audit/Seal · PARTIAL → topist seal
- **Home:** `bro-audit.ps1`, `bro-project-audit.ps1`, `bro-log.ps1` (seal writer), `audit-log.md`.
- **Already does:** GREEN/YELLOW/RED/CRITICAL + issue codes; project-audit refuses (exit 3) on registry↔manifest mismatch; `-Log` appends a seal entry.
- **Weak:** seal carries no **commit hash**, no **scope/commands/exit-codes/changed-files/touched-paths** block, no **limitations**, no **`BLACK`** level, no **version-bound** stamp, no explicit **"what GREEN does NOT mean"**, and the seal can write **without evidence**.
- **Upgrade:**
  1. `bro-audit`/`bro-project-audit`: add a **SEAL block** to output + `-Log` note: `commit=<HEAD7>`, `scope`, `commands`, `exit`, `changed_files`, `touched_paths`, `limitations`, `green_does_not_mean`.
  2. Add **`BLACK` (code 4)** = evidence missing / tamper / hash-verify failure (distinct from RED=policy fail). Risk ladder becomes GREEN(0)/YELLOW(1)/RED(2)/CRITICAL(3)/**BLACK(4)**.
  3. **No-evidence-no-seal:** `-Log` refuses to stamp GREEN if required evidence (HEAD hash, exit code) is absent → emits `BLACK`, writes no seal.
  4. **Version-bound:** seal records `spine_version` + `skills_manifest_version` so a stale-version GREEN can't masquerade as current.
- **Refusal rules:** mismatch → exit 3; missing evidence → `BLACK`(4), no seal written.
- **Evidence:** the seal entry itself (now self-describing); commit-bound.
- **GREEN:** all checks pass AND evidence complete AND version current.
- **RED/BLACK:** policy fail / evidence-missing-or-tampered.
- **Belongs in:** scripts + audit-log schema (README note).

### Gate 4 — Doctor/Health · PARTIAL → unified fail-closed
- **Home:** `bro-doctor.ps1`, `bro-project-doctor.ps1`, `bro-health.ps1`, `bro-spine-check.ps1`, `bro-registry-check.ps1`.
- **Already does:** skeleton/manifest/authority/spine/registry checks; project-doctor fail-closed (unknown/mismatch → RED).
- **Weak:** `bro-doctor` (SuperBro) lacks a **dirty-tree** check, an explicit **hook-presence/wiring** check, and an **isolation** check; "health" doesn't aggregate project-doctor; fail-closed is per-script, not a stated contract for SuperBro doctor.
- **Upgrade:** add to `bro-doctor`: **dirty-tree** (git status porcelain → YELLOW, with `-Strict`→RED), **hook check** (5 hooks present + wired in `.claude/settings.json`), **isolation check** (delegates to the Gate-2 ISOLATION assertion). `bro-health` aggregates SuperBro doctor+audit AND (if registry non-empty) project-doctor verdict into the snapshot. State fail-closed: unknown/missing input → RED, never silent pass.
- **Refusal rules:** missing manifest/hook/spine → RED; dirty tree unexplained → YELLOW/strict-RED.
- **Evidence:** health-dashboard snapshot (regenerated), doctor exit codes.
- **GREEN:** skeleton+manifest+authority+spine+hooks+isolation OK · tree clean (or explained).
- **RED:** any structural element missing/mismatched.
- **Belongs in:** scripts.

### Gate 5 — Release/Spine · COMPLETE → reconcile + prove
- **Home:** `bro-release.ps1`, `bro-spine-verify/pull/stamp.ps1`, `_core/RELEASE_MANIFEST_SCHEMA.md`, `spine/RELEASES/v1.0.0/`, `tools/README.md`.
- **Already does:** per-file SHA-256 + rollup, tamper reject, stamp, v1.0.0 cut + verified (392 files).
- **Weak:** **doc drift** — `tools/README.md` still says "RELEASES stays empty / no v1.0.0 cut" though v1.0.0 IS cut+verified; "no Project Bro self-invented spine" is not asserted as a check.
- **Upgrade:** reconcile `README.md` (and any stale OD-5 "deferred/empty" lines) to the real state (v1.0.0 live, governed); add a one-line **"spine_version is SuperBro-stamped only; a Project Bro never authors spine"** assertion to `bro-spine-verify` notes / project-doctor (already verifies 392/392 — make the L10 framing explicit). v1.0.0 compatibility preserved (no re-cut).
- **Refusal rules:** any hash mismatch → reject (BLACK at Gate 3 mapping); defer-cut still blocked unless gated.
- **Evidence:** release verify exit 0 (Beast), rollup hash match.
- **GREEN:** manifest correct · per-file+rollup hashes verify · tamper rejected · stamp present.
- **RED/BLACK:** hash mismatch / tamper.
- **Belongs in:** README + script notes (no logic rewrite — release logic already topist).

### Gate 6 — Project Bro factory · PARTIAL → full lifecycle
- **Home:** `bro-register.ps1`, `bro-install.ps1`, `bro-update-spine.ps1`, `templates/project-bro/`, `_core/PROJECT_BRO_TEMPLATE.md`, `EP_PILOT_ASSUMPTIONS.md`.
- **Already does:** assumption-seal, register (gated real), install (gated real), update-spine, pull/verify/stamp, project-audit; fresh-memory default; metadata-only registry; no adopt/migrate/mirror.
- **Weak:** lifecycle missing **VERIFY** (one-shot post-install verify command), **ROLLBACK** (undo a failed/partial install), **RETIRE** (registry status → RETIRED, instance left in place, no delete).
- **Upgrade (modes on EXISTING scripts — no new parallel system):**
  - **VERIFY** = `bro-project-doctor` already IS verify; expose it as palette `VERIFY PROJECT BRO` (Gate 10) — no new script.
  - **ROLLBACK** = `bro-install -Rollback -ProjectId X` → removes a freshly-created `X/bro` ONLY if it is a clean install artifact (manifest matches, never touches `X/memory`), restores `registry` from the pre-op `_before` snapshot, logs it. Gev-gated (`-Yes` + `BRO_GEV_APPROVED=1`).
  - **RETIRE** = `bro-register -Retire -ProjectId X` → flips registry status `INSTALLED→RETIRED` (metadata only; no file deletion), logs the transition. Gev-gated.
- **Refusal rules:** rollback refuses if `X/bro` is not a clean install artifact or if it would touch `X/memory`; retire refuses on unknown project_id.
- **Evidence:** `_before` snapshot + registry-log + audit-log entries.
- **GREEN:** register→install→verify→update→rollback→retire all governed, metadata-only registry, EP untouched.
- **RED:** any step touches project content or bypasses a gate.
- **Belongs in:** existing factory scripts (modes) + template/README + law cross-ref (rollback doctrine FLAGGED, §Gate 9).

### Gate 7 — Guard/Wall · COMPLETE → harden seams
- **Home:** `tools/hooks/{forbidden-path-write,cross-memory-read,critical-command-gate,log-append-only,preflight-printer}.ps1`, `.claude/settings.json`, template hooks.
- **Already does:** 5 guards, fail-OPEN on internal error / DENY(exit2) on confirmed match, `BRO_TEST_MODE`-gated test seams (Beast Gate 4), registry-keyed `\bro\` exception, no broad EP write.
- **Weak:** "fail-closed defaults" wording in the brief vs the wall's deliberate **fail-OPEN-on-internal-error** (to not brick sessions) — must be **reconciled, not blindly flipped**: critical-command-gate and forbidden-path **must fail-CLOSED on an unparseable critical target** (deny), while still fail-OPEN on benign internal errors. The template lacks `log-append-only-guard` (gap). No explicit **no-Project-Bro-self-evolution bypass** assertion.
- **Upgrade:**
  1. Document + assert the **fail policy precisely** in each guard header: DENY on confirmed-forbidden OR on an ambiguous critical target; fail-OPEN only on benign internal error. (Topist = ambiguity on a *critical* path resolves to DENY.)
  2. Add `log-append-only-guard` to the **template** (so installed Project Bros also protect their `logs/hook-blocks.md`) — governed L10 delivery, not project-authored.
  3. Add a guard assertion that a Project Bro cannot install new enforcement of its own (covered structurally: hooks come only from template; assert in project-doctor that `X/bro/.claude` matches template hash).
- **Refusal rules:** ambiguous critical command/path → DENY; evidence-log Edit → DENY.
- **Evidence:** Beast guard regression (Gate 11) including the new ambiguity-deny case.
- **GREEN:** all guards present+wired; ambiguity-on-critical denies; template carries the full guard set.
- **RED:** any guard missing/bypassable.
- **Belongs in:** hook scripts + template + README.

### Gate 8 — Registry · PARTIAL → strict schema
- **Home:** `bro-registry-check.ps1`, `bro-register.ps1`, `registry.json`.
- **Already does:** schema_version/entry_schema present, projects array, required fields per entry, B4 cross-path refusal.
- **Weak:** stale "(clean build) empty" header; no **project_id uniqueness**, no **memory_scope validation** (must be `<id>_only`), no **status enum** validation (`REGISTERED|INSTALLED|STALE|RETIRED`), no **status-transition** legality, no **registry↔manifest mismatch** refusal at registry-check level.
- **Upgrade `bro-registry-check`:** reconcile header; add checks — duplicate `project_id` → RED; `memory_scope` not in allowed set / not matching `<project_id>_only` → RED; `status` not in enum → RED; `project_path` empty/relative → RED. Add **transition legality** note (REGISTERED→INSTALLED→RETIRED; no INSTALLED→REGISTERED). Mismatch refusal stays primarily in `bro-project-audit` (already exit 3) — registry-check flags, project-audit refuses.
- **Refusal rules:** duplicate id / bad scope / bad status / B4 path → RED.
- **Evidence:** registry-check exit code in Beast.
- **GREEN:** unique ids · valid scopes · valid statuses · no B4 path · metadata-only.
- **RED:** any violated.
- **Belongs in:** script + README header reconcile.

### Gate 9 — Rollback/Recovery · WEAK → canonical home (no parallel system)
- **Home (decided):** **doctrine** → `tools/README.md` "Recovery" section + a **FLAGGED law candidate (L11)** for Gev; **executors** → modes on existing `bro-install -Rollback` / `bro-register -Retire` (Gate 6); **dirty-tree STOP** → `bro-doctor` (Gate 4).
- **Already does (fragments):** `_before/` snapshots, register registry snapshot, forward-fix doctrine (the L10 correction used forward-fix, not history rewrite).
- **Weak:** no single stated recovery doctrine; rollback has no executor; "no force-push unless special explicit authority" not written.
- **Upgrade:** write the **Recovery Runbook** (existing README section): (a) failed install → `bro-install -Rollback`; (b) bad registry → restore `_before/registry-<ts>.json`; (c) corrupted release → re-verify, reject, re-pull from a good release (never edit in place); (d) mistaken boundary → **forward-fix** (new commit), never history rewrite; (e) **dirty tree → STOP** (doctor); (f) **no force-push** except a separate explicit Gev FORCE authority. **FLAG L11 candidate** to Gev: "Recovery is snapshot-restore + forward-fix; never history rewrite; dirty tree STOPs; force-push requires separate explicit authority."
- **Refusal rules:** rollback that would touch project memory → refuse; any history-rewrite/force-push without explicit authority → refuse.
- **Evidence:** `_before` snapshots + audit-log rollback entries.
- **GREEN:** every recovery path documented + executable + evidence-backed; no history rewrite.
- **RED:** recovery touches project content or rewrites history without authority.
- **Belongs in:** README (runbook) + factory scripts (executors) + **law (FLAGGED, Gev dictates)**.

### Gate 10 — Command Palette · PARTIAL → complete + reconciled
- **Home:** `bro-palette.ps1`, `command-library.json`, `_core/COMMAND_LIBRARY.md`.
- **Already does:** menu→preview→YES→run; read-only live; critical gated by name dispatch.
- **Weak:** **stale availability** (RUN AUDIT "PHASE-2 lands", REGISTER/INSTALL "PHASE-3-DRY", RUN PROJECT AUDIT "FUTURE/no project" — all DONE); missing **VERIFY PROJECT BRO** and **ROLLBACK PROJECT BRO**; `UPDATE PROJECT BRO SPINE` naming vs brief's `UPDATE PROJECT BRO`.
- **Upgrade:** reconcile every `availability`/`preview` to the real state (Phase 2–4 + EP rollout live; gated-real not "dry/future"); add **VERIFY PROJECT BRO** (backing `bro-project-doctor`) and **ROLLBACK PROJECT BRO** (backing `bro-install -Rollback`, Gev-gated); add **RETIRE** alias note. Keep machine `command-library.json` mirrored to human `COMMAND_LIBRARY.md`. **No command may bypass gates** — assert each critical command still requires `BRO_GEV_APPROVED` + YES.
- **Refusal rules:** critical command without YES/authority → cancel/refuse (unchanged, now also for VERIFY=read-only, ROLLBACK=gated).
- **Evidence:** palette dispatch proofs (Gate 12 spot-check).
- **GREEN:** all 12 brief commands present, mapped to a real script, gate-correct, availability accurate.
- **RED:** any command bypasses a gate or maps to nothing.
- **Belongs in:** `command-library.json` + `COMMAND_LIBRARY.md` + `bro-palette.ps1` dispatch.

### Gate 11 — Beast regression · PARTIAL → topist matrix
- **Home:** `bro-beast-check.ps1`.
- **Already does:** 17 checks (git/doctor/audit/spine/registry/project-doctor+audit/release/guard-regression/isolation/no-secret).
- **Weak:** missing **L10 check**, **no-duplicate-skills check**, **no-Project-Bro-self-evolution check**, **idempotency check**; secret-guard is embedded not asserted as its own row.
- **Upgrade — add rows:**
  - **L10** — `_core/laws/02_architecture.md` contains the L10 statement (string assert).
  - **no-duplicate-skills** — no two tool scripts cover the same capability (filename heuristic + a known-set assertion); `tools/` has no `*-v2`/`*-copy`/`*-new` siblings.
  - **no-Project-Bro-self-evolution** — for any INSTALLED project, `X/bro/.claude` + `X/bro/tools/hooks` match the SuperBro template (hash/inventory), proving the project carries only governed enforcement (read-only check; metadata only).
  - **idempotency** — running doctor/audit/registry-check twice changes no tracked file (hash before/after equal); beast itself stays idempotent on canonical logs.
  - **secret-guard** — promote the no-secret dry check to a named row.
- **Refusal rules:** any new row failing → RED verdict (exit 2).
- **Evidence:** the matrix output itself (Beast result).
- **GREEN:** all rows pass incl. L10/no-dup/no-self-evo/idempotency.
- **RED:** any row fails.
- **Belongs in:** `bro-beast-check.ps1`.

---

## 3. Execution order & gates / կատարման հերթ
2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 10 → 11 → 12 (seal). Each gate: edit existing home(s) → run the relevant script(s) → confirm GREEN → audit-log where the change is structural. **No push until Gev's explicit PUSH authority** (Gate 12 ends at a sealed, un-pushed GREEN).

## 4. What this plan will NOT do / ինչ ՉԻ անի
No new parallel skill; no second project; no EP/memory touch; no adopt/migrate/mirror; no autonomous law creation (L11 FLAGGED only); no release re-cut; no history rewrite; no push.

---
**LOCK — 🌱 PLAN (Gate 1) · Bro 2026-06-29 · baseline `0de6191` · upgrade-existing-only · L10 held · NO push.**
*LOCK — 🌱 ՊԼԱՆ (Gate 1) · Bro 2026-06-29 · baseline `0de6191` · միայն-upgrade · L10 պահված · ՈՉ push։*
