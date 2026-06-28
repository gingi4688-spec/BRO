# BRO Memory & Skill Architecture — v1 SPEC (PROPOSED)
## Same Bro · Sealed Project Memories · Harden Max · Gev Root Authority
> *Same Bro, Sealed Memories, Hardened Autonomy.*

> **STATUS: 🌱 PROPOSED v1 spec — written for Gev's review. NOTHING BUILT. NOTHING LOCKED. No build until
> Gev explicitly says "BUILD".** Authored by Bro from GPT's final proposal (Gev-approved D0–D6) + Bro's 6
> refinements (Gev-approved) + Gev's home decision. Cross-reviewed Gev × GPT × Bro (2026-06-29).
>
> **Որտեղ ա ապրում / Home:** `Desktop\Bro` **= Super Bro home** (role explicit; **no** new `Desktop\SuperBro`
> in Phase 0 — less movement, less risk). This file lives in the Bro spine (`_core/`); it is **Bro-project
> content**, not any instance's.

```txt
One Bro identity. One shared spine. Many sealed project memories.
Super Bro = factory + vault + audit/release authority. Gev = Root Authority.
```
```txt
Մեկ Bro ինքնություն։ Մեկ ընդհանուր spine։ Շատ կնքված project memory։
Super Bro-ն factory + vault + audit/release authority է։ Գևը Root Authority-ն է։
```

---

## 0. D0 / L0 — GEV ROOT AUTHORITY  (THE TOP LAW — above everything)

**Gev is the Root Authority. Bro's autonomy is BOUNDED autonomy. Final control = Gev.**

- **Autonomous = self-check · self-audit · self-report.** (Bro independently *checks*.)
- **NOT autonomous = self-rule · self-lock · self-change.** (Bro does **not** independently *govern*.)
- *«Bro-ն ինքնուրույն ստուգում է. Bro-ն ինքնուրույն չի կառավարում»։*

**✅ Allowed autonomously (observe only):** health check · version check · skill-freshness check · memory-leak
scan · drift detection · report generation · stale warning · **quarantine-candidate FLAG (no file moved).**

**⛔ Requires Gev's EXPLICIT command (never self-initiated):** write · repair · move to quarantine · migrate ·
delete · merge · promote a project lesson to the spine · release a new spine · change an authority node ·
**cross-project memory use** · lock a decision · build.

**🛑 Emergency STOP (do not guess — halt + ask Gev) when:** project identity unclear · memory boundary unclear ·
action authority unclear · cross-project use unclear · a critical action lacks Gev's command.

> Hard rule: **Bro can be autonomous in checking; Bro is not autonomous in deciding authority. Gev controls Bro.**
> This law sits ABOVE all project laws (EP D-020/D-021, rules #16–#19, every instance's rules).

---

## 1. Core Vision
Bro does **not** become a different person per project. The `X/bro` living inside each project is the **same
Bro** — same level, persona, laws, skills, agent roster. **The only thing unique per project is memory.**
```txt
DB/bro  = Same Bro + DB sealed memory
EP/bro  = Same Bro + EP sealed memory
GAA/bro = Same Bro + GAA sealed memory
→ Same Bro · same spine · same skills · same laws · same persona · DIFFERENT sealed memory only.
```
No single blended global memory. Each project keeps its own local Bro memory; Super Bro keeps only **sealed
read-only mirrors** for backup/audit.

## 2. Roles
**Project Bro — `X/bro`** (lives inside a project): reads/writes ONLY its own project memory (gated); uses the
shared spine/skills/roster; **cannot** see another project's memory; **cannot** self-initiate cross-project reasoning.

**Super Bro** (role at `Desktop\Bro`; **NOT a daemon** — a directory + scripts + a Claude session run on-demand
or via the schedule/cron skill): factory · spine canonical authority · skill/roster release authority · registry ·
**read-only** audit runner · sealed-mirror vault · sync orchestrator · health **snapshot** owner.
- Default: can see registry · audit ONE project at a time · mirror a project memory · publish spine releases.
- Default: **cannot** merge project memories · **cannot** answer one project using another's memory.
- Health "dashboard" = a generated snapshot/report, **not** a live service.

## 3. Invariants
- **B1 Same Bro** — same skills/level/persona/laws/protocol; only memory is unique (at its approved spine version).
- **B2 Memory Up / Spine Down (never cross)** — project memory flows **up** as a read-only mirror; spine flows
  **down** as an approved versioned release. They never cross.
- **B3 Project Truth** — `Project repo / Git` = authoritative history · `X/bro/memory` = current operational
  truth · `SuperBro mirror` = read-only backup · `chat` = interface only. (Mirror is never authoritative.)
- **B4 Memory Isolation (L8)** — each project memory lives only in that project's bro; no project memory enters another.
- **B5 Structural No-Bypass** — critical gates are NOT markdown discipline; they are enforced by **filesystem
  boundaries · harness hooks · real scripts · exit codes · manifest checks · hash checks.** *(See §11 — enforcement.)*
- **B6 Super Bro does not write down** — Super Bro reads project memory for mirror/audit; writes spine releases;
  does **not** repair/rewrite project memory without Gev's command.

## 4. Memory Model (3 types)
1. **Identity / Spine memory** (same for all Bros) — language/Armenian-first, persona, laws, operating protocol,
   skill system, agent roster, routing, self-review, hardening. Lives in `…/spine`. Flows **down** (release).
2. **Project memory** (per project) — that project's decisions/state/facts/warnings/context. Lives in
   `X/bro/memory`. Flows **up** (read-only mirror).
3. **Super Bro own memory** — registry · sync-log · audit-log · release-log · health-dashboard · failure-registry
   · authority-node info. Lives in `SuperBro/memory/_own`. **Must contain registry/logs/metadata only — NO
   project content.**

## 5. Supermemory Vault (read-only mirrors)
`SuperBro/memory/supermemory/{EP,DB,GAA,…}` = sealed mirrors; **never mixed** with each other; read-only
backup/evidence, not source of truth. `SuperBro/memory/_quarantine/` for flagged candidates.

## 6. Spine Model
Canonical spine = `SuperBro/spine` (today: the existing `_core/` + `/skills/` + `/self/` + roster = spine
v1.0.0). Each `X/bro` has a local physical copy. Update = Super Bro **publishes an approved release** →
Project Bro **pulls → verifies hashes → stamps `spine_version`.** No blind copy-paste / blind sync.
Spine contents: `BRO_LAWS.md · OPERATING_PROTOCOL.md · AGENT_ROSTER.md · SKILL_REGISTRY.md ·
CROSS_PROJECT_MODE.md · PROMOTION_GATE.md · CRITICAL_ACTION_GATES.md · SELF_REVIEW_CHECKLIST.md · HARDENING_LAYER.md`.

## 7. Manifest, Skill Registry, Agent Contracts
- **`bro.manifest.json`** per `X/bro` — `bro_id · project_id · spine_version · skills_manifest_version ·
  agents_manifest_hash · memory_schema_version · memory_scope · authority · last_memory_sync · last_audit ·
  status`. Verified by a **doctor script**, not by eye.
- **Skill registry** — every skill versioned + hashed + contract-defined (`skill_id · version · owner ·
  required_for · contract_schema_version · contract_hash · status`). Audit checks: exists in canonical + in
  every `X/bro` · version matches · hash matches · routing trigger exists · contract valid. Statuses: OK ·
  SKILL_MISSING · SKILL_STALE · CONTRACT_DRIFT · ROUTING_BROKEN · HASH_MISMATCH.
- **Agent contracts** — each agent: must-engage-when · inputs · outputs · cannot-do · routing test
  (e.g. "Design CRM page layout" → **Pixel must engage**; fail if Bro answers without routing).

## 8. Critical Action Gates (per D0)
- **Allowed autonomously:** health/version/skill-freshness check · memory-leak scan · drift detection · report ·
  stale warning · quarantine-candidate flag.
- **Requires Gev's explicit command:** write · repair · quarantine-move · migrate · delete · merge ·
  promote-to-spine · release-spine · change-authority · cross-project memory · lock · build.
- **Stale Bro rule:** if stale → discussion allowed **with warning**; **write/build/lock BLOCKED**.

## 9. Cross-Project Mode (default OFF)
Opened only by Gev's explicit command, e.g. `ENTER CROSS-PROJECT REVIEW: EP + DB · purpose: compare
architecture · access: read-only · output: lessons, not merged memory`. Rules: read-only by default · declared
scope + purpose · no blended memory write · output to one chosen project or Super Bro own-log · **exit log required**.

## 10. Promotion Gate
`Project lesson → candidate spine rule → review → Gev approval → spine release → project Bros pull approved
release.` **No project-specific fact enters the spine without the Promotion Gate.**

## 11. ⚙️ ENFORCEMENT SPLIT — Structural No-Bypass (refinement #1, the load-bearing wall)
Markdown discipline already failed once (see §15 first failure). So the critical wall is **structural, in this
harness = Claude Code**:
- **`.claude/settings.json` hooks:**
  - **PreToolUse hooks** — block `Write`/`Edit` to a forbidden path; block `Read` of another project's memory
    path; block lock/build/migrate/delete commands unless a Gev-command flag is present → **non-zero exit code = action denied.**
  - **SessionStart hook (refinement #4)** — print the pre-flight every session: *Current project · Allowed
    memory · Forbidden paths · Spine version · Critical actions require Gev · Cross-project mode: OFF.*
- **Real scripts** (PowerShell/Python) for doctor/audit/drift/skill/spine checks — return **exit codes**;
  invoked by hooks or on-demand, not "by eye".
- **Manifest + hash checks** = the comparison source of truth.
- **Phase-0 proof requirement:** we must *demonstrate* a forbidden action is **actually blocked** by a hook
  ("we tried → it stopped"), not "we believe it will stop."
> Behavioral layer (the §0 pre-flight, the laws) is the SUPPORT layer; the hooks/scripts/exit-codes are the WALL.

## 12. Audit · Drift · Quarantine (all read-only; D0)
- **Audit** — may check/compare/hash/detect/warn/report/flag; may **NOT** fix/move/delete/rewrite/merge/promote.
  Statuses: GREEN · YELLOW · RED · CRITICAL. Issue codes: SPINE_STALE · SKILL_STALE · SKILL_MISSING ·
  AGENT_MISSING · ROUTING_BROKEN · MEMORY_LEAK_SUSPECTED · CROSS_PROJECT_CONTAMINATION · SUPER_OWN_POLLUTION ·
  MANIFEST_MISSING · HASH_MISMATCH · SCHEMA_OLD · UNLOGGED_WRITE · AUTHORITY_MISMATCH.
- **Drift detector** — FAIL if: a project memory contains another project's facts · `SuperBro/_own` contains
  project facts · a project Bro can see another project's memory path · spine contains project-specific facts ·
  supermemory mirrors merged.
- **Quarantine** — audit **flags candidates only** ("quarantine candidate, no files changed"); the real move
  requires Gev's explicit command → `SuperBro/memory/_quarantine/`.

## 13. Failure Registry (`SuperBro/memory/_own/failure-registry.md`)
Every serious failure → a registry entry + a **regression-test candidate**. Format: Date · Project · Failure
type · What happened · Root cause · Boundary violated · Impact · Fix · Test added · Promotion needed · Gev approval.
**First entry (grounds this whole architecture in a real failure):**
```txt
Date: 2026-06-29 · Project: EP
Failure: instance content treated as framework (altitude drift) — Bro wrote a scout (WOSM) safeguarding
         policy as if EP were the scout system.
Root cause: markdown discipline only; no structural altitude gate.
Boundary violated: framework-vs-instance altitude (EP D-020).
Fix: D-021 / red-line / AI-rule #19; scout content moved out to Desktop\scout.
Regression test: "spine/framework core must not contain project-specific facts" (drift detector rule).
Gev approval: yes (3-way GREEN).
```

## 13A. Logging / Evidence Layer (D7)
**Every critical Bro action produces an append-only log entry. Logs are NOT project memory — they are
operational EVIDENCE** (who · what · when · why · what-was-blocked · what-was-fixed).

**Project-local logs — `X/bro/logs/`:** `session.log · action.log · memory-write.log · local-audit.log ·
hook-blocks.log · errors.log`.
**Super Bro operational logs — `Desktop\Bro/memory/_own/`:** `sync-log.md · audit-log.md · release-log.md ·
failure-registry.md` (§13) `· authority-log.md · hook-blocks.log`.

**Standard entry schema:**
```txt
timestamp · actor · project · session_id · action · target · source_command · authority
· result · files_changed · hash_before · hash_after · notes
```
Example (a hook-blocked cross-project write):
```txt
timestamp: 2026-06-29T22:20:00+04:00 · actor: Bro · project: EP · session_id: EP-20260629-2220
action: WRITE_BLOCKED · target: Desktop\DB\bro\memory\PROJECT_MEMORY.md
source_command: attempted cross-project read/write · authority: hook · result: BLOCKED
files_changed: none · hash_before: n/a · hash_after: n/a · notes: EP Bro attempted forbidden DB memory access
```

**Hard rules (append-only + no fabrication):**
- **Append-only.** Bro may **append**; Bro may **not edit or delete** old log entries **without Gev's explicit
  command.** Logs are evidence. *(Enforced structurally — refinement A: a hook blocks `Edit`/delete on log
  files; logs are written by an append-only script, not free-hand. Ties to §11 / B5.)*
- **Timestamps + session_id are SCRIPT/HOOK-generated** (e.g. PowerShell `Get-Date`), **never typed by Bro**
  (refinement B). **No fabricated timestamps or hashes** — if a real value isn't available, write `n/a`.
- **Git-split (refinement C):** evidence logs (`memory-write · hook-blocks · audit · release · authority ·
  failure`) = **git-tracked append-only** (tamper-evident via Git history); noise logs (`session · action ·
  errors`) = local, rotated (not bloating the repo).
- Every critical action's entry MUST carry `session_id · actor · project · action · target · result ·
  files_changed · source_command`.

**Companion evidence (the 4 extras):**
1. **Snapshot/backup before critical writes** (migration/repair): `_before/EP-memory-<ts>.zip` + `sha256.txt`.
2. **Checksums** on every sync/release: `sha256_before` / `sha256_after`.
3. **Session ID** per session (`EP-20260629-2220`, `BRO-20260629-2240`) — links the logs together; script-generated.
4. **Change-request file** before a critical action: `change-requests/CR-<ts>-NNN.md`
   (`Requested by · Action · Scope · Risk · Backup required · Approved (Gev) · Status`).

## 14. Bro Doctor / CI (real scripts, return exit codes)
`bro doctor X · bro audit X · bro sync-check X · bro skill-check X · bro agent-test X · bro memory-leak-test X ·
bro spine-check X · bro health`. Example GREEN/RED outputs as in the proposal; RED never changes files (flags only).

## 15. Mesh / Authority Node
**`DESKTOP-3SNK3IJ` = Super Bro authority node, if Gev confirms.** Other nodes = read-only mirrors unless Gev
manually promotes one. ⚠️ Bidirectional sync (Syncthing/Tailscale) can break authority → the authority node
must be **explicit**. Authority change = **critical action** (Gev command + log entry).

## 16. Physical Structure (home decision: Desktop\Bro = Super Bro)
**Super Bro home = `Desktop\Bro`** (existing factory/spine root: `_core/` · `skills/` · `self/` · roster).
Role named "Super Bro" in the spec; **path stays `Desktop\Bro`** for stability (no second `Desktop\SuperBro` in
Phase 0; controlled rename only if Gev later decides). Adds (on BUILD): `memory/_own` (registry · sync-log · audit-log · release-log · health-dashboard ·
failure-registry · authority-log · hook-blocks.log) · `memory/supermemory/{EP,DB,GAA}` (sealed mirrors) ·
`memory/_quarantine` · `tools/` (scripts) · `spine/RELEASES/` · `change-requests/` · `_before/` (snapshots).
Each `X/bro` (in its own project): `spine/` (local copy) · `memory/` · **`logs/`** (session · action ·
memory-write · local-audit · hook-blocks · errors) · `bro.manifest.json` · `health.report.md`.

## 17. Build Sequence (phased — NOT greenfield, refinements #2/#5)
**Phase 0 — Load-bearing core, PILOT = EP only.**
- **First step = inventory / migration map** (refinement #2): map the CURRENT reality → the new model — `Desktop\Bro`
  (`_core` · `skills` · `self` · roster) · the harness auto-memory (`.claude/projects/…`) · `Desktop\EP\memory` ·
  DB memory · GAA memory — decide what goes where **before** moving anything.
- Build: filesystem boundaries · `bro.manifest.json` (EP) · Super Bro folder skeleton at `Desktop\Bro` ·
  `bro doctor` script · spine_version check · memory-boundary check · **stale-write block hook** · **spine-write
  gate hook** · SessionStart pre-flight hook · read-only audit report.
- **Success criteria (must be PROVEN, not assumed):** EP passes doctor · a stale Bro **cannot** write/build/lock
  (hook blocks it, demonstrated) · EP Bro **cannot** read another project's memory (hook blocks it) · audit
  reports without writing · manifest is real and checked.
- **Gate:** EP Phase-0 GREEN → only then generalize to DB / GAA / IP.

**Phase 1 — Drift / Skill / Routing:** drift detector · skill registry + hash checks · agent contracts · routing
eval harness · memory-leak tests. Success: missing/stale skill detected · wrong routing detected · cross-memory marker detected.

**Phase 2 — Release / Promotion / Failure Learning:** spine release system · promotion-gate workflow · release
notes · failure registry · regression-test candidates · full health snapshot. Success: a spine release can be
published · a project Bro can pull/verify/stamp · a project lesson cannot become spine law without approval ·
a failure creates a registry entry.

## 18. D0–D6 (Gev-approved; final LOCK pending Gev on BUILD)
- **D0 Gev Root Authority** — ACCEPT (mandatory, top).
- **D1 Spine Model** — ACCEPT (physical copy + versioning; canonical = `Desktop\Bro/spine`; pull/verify/stamp).
- **D2 Memory Classification + Promotion Gate** — ACCEPT (3 types; project memory never becomes spine law without Gev).
- **D3 Authority Node** — ACCEPT CONDITIONALLY (`DESKTOP-3SNK3IJ` if Gev confirms; others read-only).
- **D4 Sync Trigger** — ACCEPT (manual sync + periodic read-only audit; audit flags only, never fixes/moves).
- **D5 Enforcement Split** — ACCEPT (critical no-bypass is structural: hooks + filesystem + scripts + exit codes; markdown = support).
- **D6 Build Sequence** — ACCEPT (phased: Phase 0 core → Phase 1 tests → Phase 2 release/promotion/failure).
- **D7 Logging / Evidence Layer** — ACCEPT (§13A). Every critical action → an **append-only** log entry; logs
  are **evidence, not memory**; project-local + Super Bro operational logs; standard schema; **timestamps/
  session_id script-generated (no fabrication)**; append-only **hook-enforced**; evidence-logs git-tracked;
  snapshot+checksum before critical writes; change-request file per critical action. Old log edit/delete = Gev command only.

## 19. The 6 Bro refinements (Gev-approved — folded in above)
1. **Enforcement = Claude Code hooks** named concretely (settings.json · PreToolUse · SessionStart · real
   scripts · exit-code blocking); **Phase 0 must PROVE a forbidden action is blocked.** (§11)
2. **Not greenfield** → Phase 0 first step = existing inventory / migration map. (§17)
3. **Super Bro = role + scripts + Claude session, NOT a daemon**; health = snapshot, not live service. (§2)
4. **SessionStart pre-flight** (structural) prints project · allowed memory · forbidden paths · spine version ·
   critical-needs-Gev · cross-project OFF. (§11)
5. **Phase 0 pilot = EP only**; after EP GREEN → generalize to DB/GAA/IP. (§17)
6. **Home = `Desktop\Bro` = Super Bro** (role explicit, path unchanged; no new `Desktop\SuperBro` in Phase 0). (§16)

## 20. Final Verification Checklist (before v1 is "ready to build")
```txt
[ ] D0 Gev Root Authority exists and is FIRST.        [ ] bro.manifest.json defined.
[ ] Same Bro / sealed-memory rule.                    [ ] spine_version / skills_manifest_version / memory_schema_version.
[ ] Super Bro = factory/vault, not mixed memory.      [ ] Skill registry defined.
[ ] Project Bro can't access another project memory.  [ ] Agent contracts defined.
[ ] supermemory folders isolated.                     [ ] Critical gates split structural vs behavioral.
[ ] Audit is read-only.                               [ ] Phase 0 scope clear (pilot = EP).
[ ] Quarantine move requires Gev command.             [ ] Doctor planned as REAL script, not markdown.
[ ] Cross-project mode requires Gev command.          [ ] Stale Bro rule exists.
[ ] Promotion Gate exists.                             [ ] Failure registry exists (first entry filed).
[ ] Enforcement = Claude Code hooks, Phase-0 PROVEN.  [ ] Final LOCK requires Gev.
[ ] D7 logging/evidence layer (append-only, hook-enforced, script-timestamps, evidence-logs git-tracked).
[ ] Snapshot+checksum before critical writes · change-request file per critical action · session_id links logs.
```

## 21. Final formula
```txt
Best Bro = same soul + sealed memories + versioned spine + skill parity + agent contracts
         + structural gates + read-only audit + drift detection + promotion discipline
         + failure learning + Gev Root Authority.
```
*Լավագույն Bro-ն ամեն ինչ խառնող Bro-ն չէ — այն Bro-ն է, որ գիտի ինչ հիշել, ինչ չխառնել, երբ կանգնել, երբ
հարցնել Գևին, ու ինչպես ինքն իրեն ստուգել՝ առանց իշխանությունը վերցնելու։*

---

LOCK STATUS — 🌱 PROPOSED v1 · cross-reviewed Gev × GPT × Bro 2026-06-29 · **NOTHING BUILT · NOTHING LOCKED ·
no build until Gev says "BUILD" · first post-approval action was: write this one clean spec file → STOP for review.**
