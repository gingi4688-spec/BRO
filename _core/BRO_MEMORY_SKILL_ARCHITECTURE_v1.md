# BRO Memory & Skill Architecture — v1 SPEC (PROPOSED)
## Same Bro · Sealed Project Memories · Harden Max · Gev Root Authority
> *Same Bro, Sealed Memories, Hardened Autonomy.*

> **STATUS: 🌱 PROPOSED v1 spec — written for Gev's review. NOTHING BUILT. NOTHING LOCKED. No build until
> Gev explicitly says "BUILD".** Authored by Bro from GPT's final proposal (Gev-approved D0–D9; *D10 added later via reconciliation — §18*) + Bro's 6
> refinements (Gev-approved) + Gev's home decision. Cross-reviewed Gev × GPT × Bro (2026-06-29).
>
> **🔄 RECONCILED 2026-06-29 with `BRO_CLEAN_SUPERBRO_BUILD_ROADMAP.md` (pushed `67df95e`):** the build sequence is now
> **clean SuperBro first** (Phase 0 = clean SuperBro only, NOT the EP pilot); Command Palette added (§6B / D10); OD-6
> spine-layout left OPEN; Project Bro installs + Discovery-Bank promotion postponed to a later Rollout phase. Superseded
> wording is marked inline ("SUPERSEDED"/strikethrough notes), **not deleted** — history preserved. / **🔄 ՀԱՇՏԵՑՎԱԾ
> 2026-06-29** roadmap-ի հետ (push `67df95e`)՝ build-ը հիմա **մաքուր SuperBro առաջինը** (Phase 0 = միայն մաքուր SuperBro,
> ոչ EP pilot); Command Palette ավելացված (§6B / D10); OD-6 բաց; Project Bro install-եր + Discovery-Bank promotion
> հետաձգված։ Superseded wording-ը նշված է inline, **ոչ ջնջված** — պատմությունը պահպանված։
>
> **Որտեղ ա ապրում / Home:** current **`BRO_HOME`** (portable, Gev-approved — see §15/D3; today `Desktop\Bro`);
> role explicit; **no** new `Desktop\SuperBro` in Phase 0 — less movement, less risk. This file lives in the Bro spine (`_core/`); it is **Bro-project
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
**cross-project memory use** · **push (repo)** · lock a decision · build.

**🚫 No project-folder touch before explicit approval (reconciled 2026-06-29 with roadmap §16):** Bro does **not** read or
write any project folder (EP/DB/GAA/IP/…) before explicit Gev approval; **zero project folders are touched in the entire
clean SuperBro build.** / Bro-ն չի կարդում/գրում ոչ մի project folder (EP/DB/GAA/IP/…) առանց բացահայտ Գևի հաստատման;
**մաքուր SuperBro build-ում զրո project folder է դիպչվում։**

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

**Super Bro** (role at the current `BRO_HOME` — today `Desktop\Bro`, portable per §15/D3; **NOT a daemon** — a directory + scripts + a Claude session run on-demand
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
> **🔄 Reconciled (R-C):** in the **clean SuperBro build** `supermemory/` is created **root-only / EMPTY**; each
> per-project mirror dir (`EP`/`DB`/`GAA`/…) is a **FUTURE artifact created at registration**, never in the clean build. /
> **Հաշտեցված (R-C):** մաքուր build-ում `supermemory/`-ն դատարկ է; per-project mirror-ները registration-ի **FUTURE** են։

## 6. Spine Model
Canonical spine = the spine content **today living at `BRO_HOME` root** (the existing `_core/` + `/skills/` + `/self/` +
roster = spine v1.0.0); **its physical layout is 🔒 LOCKED — Option A (OD-6 §18): the live spine stays in these root dirs**
(no top-level `spine/` content tree). Each `X/bro` has a local physical copy. Update = Super Bro **publishes an approved release** →
Project Bro **pulls → verifies hashes → stamps `spine_version`.** No blind copy-paste / blind sync.
Spine contents: `BRO_LAWS.md · OPERATING_PROTOCOL.md · AGENT_ROSTER.md · SKILL_REGISTRY.md ·
CROSS_PROJECT_MODE.md · PROMOTION_GATE.md · CRITICAL_ACTION_GATES.md · SELF_REVIEW_CHECKLIST.md · HARDENING_LAYER.md`.

## 6A. Skill Request & Release Flow (Flow 1 / Flow 2)
How a skill need travels up and a skill release travels down — strictly within the v1 laws (B2 · B6 · H8 · Promotion Gate).

**Flow 1 — Skill request (bottom-up, project-local).** When a Project Bro needs a new/updated skill, it writes a
**need note in its OWN project memory** (e.g. in `WARNINGS.md` / `CHANGELOG.md`: "needs skill X"). The request is
**project-local** — never pushed across to other projects. Super Bro learns of it **only** when it does a normal
read-only mirror **pull** of that project's memory; Super Bro does **not** cross-reason or mix project memories to
discover needs (H8 · B6).

**Flow 2 — Build + deliver + broadcast (top-down, pull-based).** Super Bro (factory) builds/updates the skill in the
**canonical spine** and cuts an **approved release** (a project lesson becomes spine only via the Promotion Gate —
§10). Then it (a) **notifies the requesting Bro** that an update is ready, and (b) **broadcasts update-availability to
all Bros** — a *"a new spine release is available"* signal **only**. The broadcast is **availability, not a forced
write**: Super Bro **never writes into a Project Bro's memory or spine** (B6). Each Bro **pulls the approved release →
verifies hashes → stamps its `spine_version`** on its own (B2 · §6). **No automatic build or push** happens — cutting a
spine release and any push stay **Gev-gated critical actions** (D0 · §8 · §8A).

> Up = a project-local *need note* (seen on pull). Down = an *approved release* the Bros pull. Never a cross-project
> read, never a forced write, never an auto-push. / Վեր՝ project-local need note (քաշելիս երևացող)։ Վար՝ approved
> release, որ Bro-ները իրենք են քաշում։ Երբեք cross-project read, երբեք forced write, երբեք auto-push։

## 6B. Guided Command / Command Palette (operator control layer — MANDATORY pre-build) · 🔄 added 2026-06-29
**EN** — Super Bro's **operator-facing control surface** — **mandatory pre-build scope** (built before any project
registration/install flow and before any Project Bro rollout; Gev never memorizes commands). Behavior:
**menu → collect required inputs → preview (what · where · scope · files · authority · rollback) → explicit `YES` → run.**
**Default read-only.** **Critical actions are gated** — build/push/migrate/delete/release/promote/project-creation
**never** run from a vague command (preview + `YES` + Gev authority required, per D0/§8). Bro recommends the next safe
command, explains consequences, and **STOPs if scope is ambiguous** (D0). Every run → a log entry (§13A); every critical
write → snapshot + change-request (§13A).
**Command-library schema (one maintained entry per command):**
```txt
name · purpose · category(READ-ONLY|CRITICAL) · required_inputs · safe_default · criticality(LOW|MED|HIGH|CRITICAL) ·
requires_gev(YES|NO) · mode(READ|WRITE) · files_affected · preview_shown · rollback_backup · report_format ·
availability(CLEAN-BUILD | PHASE N+ | RUNTIME | FUTURE) · backing(script/hook — contract only, no code in spec)
```
Full schema, the ~16 starter commands, and the drafted preview wording live in roadmap §4/§5. The palette is a
**Phase-1** deliverable of the clean SuperBro build (§17). **🔒 OD-4 LOCKED Option A (Gev-approved 2026-06-29): runtime form
= Bro-session menu + real scripts — Bro presents menu/preview/approval; scripts execute side-effects with exit codes;
hooks/guards are the wall.**

**HY** — Super Bro-ի **operator-ի control մակերեսը** — **պարտադիր pre-build scope** (կառուցվում է ցանկացած project
registration/install flow-ից ու Project Bro rollout-ից առաջ; Գևը command չի անգիր անում)։ Վարք՝
**menu → required input հավաք → preview (ինչ · ուր · scope · ֆայլ · authority · rollback) → բացահայտ `YES` → run**։
**Default read-only։** **Critical action-ները gated են** — build/push/migrate/delete/release/promote/project-creation
**երբեք** vague command-ից (preview + `YES` + Gev authority, D0/§8)։ Bro-ն առաջարկում է հաջորդ ապահով command-ը,
բացատրում հետևանքները, ու **STOP երբ scope-ը երկիմաստ է** (D0)։ Ամ. run → log entry (§13A); ամ. critical write →
snapshot + change-request։ **Command-library schema-ն** (ամ. command = մեկ պահվող entry)՝ վերևի դաշտերով; լրիվ schema +
~16 starter command + preview բառերը՝ roadmap §4/§5-ում։ Palette-ը մաքուր build-ի **Phase-1** deliverable է (§17)։

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
  promote-to-spine · release-spine · change-authority · cross-project memory · **push** · lock · build.
- **Stale Bro rule:** if stale → discussion allowed **with warning**; **write/build/lock BLOCKED**.

## 8A. Push Policy (PUSH = critical action)
**PUSH is a critical action.** Bro does **not** push any repo without Gev's explicit command (e.g. `PUSH`). A clean
tree · a green gate · Bro's commit-hygiene judgment are **necessary but NOT sufficient** — the push itself waits for Gev.
- **Scope:** this PUSH-gate governs the **Bro governance repo** (this spine repo).
- **Scoped exception (existing delegation):** the **GAA** push delegation (Gev → Bro, 2026-06-25) **remains in
  force** for GAA until Gev separately changes/revokes it — a **scoped exception, NOT a universal rule.**
- Every commanded push → a log entry (§13A): actor · repo · commit · target remote · authority = Gev-command · result.
> *PUSH = critical action. Bro-ն repo չի push անում առանց Գևի explicit հրամանի (GAA-ն scoped exception է)։*

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
- **Enforcement-phase proof requirement (clean build Phase 2):** we must *demonstrate* a forbidden action is
  **actually blocked** by a hook ("we tried → it stopped"), not "we believe it will stop." *(🔄 Reconciled: in the
  5-phase plan the enforcement proof lives in **Phase 2 (§17)**, not Phase 0; the proof requirement itself is unchanged.)*
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

## 15. D3 — Authority: Portable BRO_HOME (machine/path NOT hardcoded)
**Super Bro authority = the Gev-approved `BRO_HOME`** — the current approved root folder where Super Bro lives.
**Authority is NOT locked to a machine name or a fixed path.**
- `BRO_HOME` = current approved Super Bro root (e.g. `C:\Users\Admin\Desktop\Bro` · `D:\AI\Bro` · `C:\Projects\Bro`
  · any Gev-approved path).
- `DESKTOP-3SNK3IJ` = only the **current detected machine name**, NOT permanent authority. `Desktop\Bro` = only the
  **current/example path**, NOT permanent law.
- ⚠️ Bidirectional sync (Syncthing/Tailscale) can break authority → the **active BRO_HOME must be explicit**
  (recorded in `bro.home.json`). BRO_HOME / authority change = **critical action** (Gev command + `authority-log.md`).

**🔒 OD-3 LOCKED Option A (Gev-approved 2026-06-29):** at clean-build Phase 0 the default is **verify-only** — doctor
confirms the existing `bro.home.json` + verifier are `current` and appends `authority-log`, with **no passphrase
re-prompt**; the first-run flow below runs **only if `bro.home.json`/verifier is missing, invalid, or tampered.** /
**🔒 OD-3 LOCKED.** Phase 0-ին default-ը verify-only է; ստորև first-run-ը միայն եթե `bro.home.json`/verifier-ը բացակա/անվավեր/tampered է։

**First-run BRO_HOME approval flow** — if Bro starts in a new folder OR `bro.home.json` is missing, Bro MUST ask:
> «Detected current Bro folder: `[current path]`. Should I register this folder as BRO_HOME / current Super Bro
> authority? Type **YES** to continue.»
- Answer ≠ YES → **STOP.**
- On YES → Bro asks for the **`Gev Authority Passphrase`**. Passphrase rules: **never stored in plain text · never
  printed in logs · store only a hash/verifier if storage is needed · failed verification = STOP · failed attempts
  logged WITHOUT exposing the passphrase.**

**After YES + valid passphrase**, Bro may perform ONLY first-run authority bootstrap: create/update `bro.home.json` ·
append `authority-log.md` · create the missing `logs/` folder if needed · write the first `session_id` ·
run/prepare `bro doctor` verification · set `authority_status = current`.
**First-run approval does NOT allow:** build · push · migrate · delete · repair · promote · merge · release spine ·
move the Discovery Question Bank · move files to quarantine · delete old BRO_HOME · mark old home retired/read-only
(unless Gev explicitly says so).

**`bro.home.json` (minimum schema):**
```json
{
  "role": "SuperBro",
  "bro_home": "CURRENT_REAL_PATH",
  "machine_name": "CURRENT_REAL_MACHINE_NAME",
  "authority_status": "current",
  "approved_by": "Gev",
  "approval_method": "first_run_yes_plus_passphrase",
  "approved_at": "REAL_SYSTEM_TIMESTAMP",
  "passphrase_stored": "hash_only"
}
```
Timestamp = real system clock; **no fabricated timestamps.**

**`authority-log.md` entry (append-only):**
```txt
timestamp: REAL_SYSTEM_TIMESTAMP
event: BRO_HOME_APPROVED
approved_by: Gev
approval_method: first_run_yes_plus_passphrase
bro_home: CURRENT_REAL_PATH
machine_name: CURRENT_REAL_MACHINE_NAME
result: CURRENT_AUTHORITY
files_changed:
  - bro.home.json
  - authority-log.md
notes: First-run authority bootstrap completed. No build, push, migration, delete, or file movement performed.
```

**Final D3 formula:**
```txt
BRO_HOME is portable.
Gev approves BRO_HOME.
First-run approval requires YES + Gev Authority Passphrase.
Passphrase is never stored in plain text.
First-run approval allows only authority bootstrap.
All other critical actions still require separate Gev command.
```
> *BRO_HOME-ը շարժական է. Գևը հաստատում է BRO_HOME-ը. first-run = YES + Gev Authority Passphrase. Passphrase-ը
> երբեք plain-text չի պահվում. bootstrap-ից բացի ամեն critical action դեռ առանձին Գևի հրաման է պահանջում։*

## 16. Physical Structure (home decision: Desktop\Bro = Super Bro)
**Super Bro home = the current `BRO_HOME`** (today `Desktop\Bro` — existing factory/spine root: `_core/` · `skills/`
· `self/` · roster; path is **portable / Gev-approved per §15/D3**, not hardcoded law). **🔒 OD-2 LOCKED Option A
(Gev-approved 2026-06-29): keep `BRO_HOME = C:\Users\Admin\Desktop\Bro` — no rename, no relocation, no `Desktop\SuperBro`.**
Role named "Super Bro" in the spec; **path stays `Desktop\Bro`** for stability (no second `Desktop\SuperBro` in
Phase 0; controlled rename only if Gev later decides). Adds (on BUILD): `memory/_own` (registry · sync-log · audit-log · release-log · health-dashboard ·
failure-registry · authority-log · hook-blocks.log) · `memory/supermemory/` (sealed mirrors — **root-only/EMPTY in clean
build; per-project `{EP,DB,GAA}` mirror dirs are FUTURE, created at registration; see R-C/§5**) ·
`memory/_quarantine` · `tools/` (scripts) · `spine/RELEASES/` (**🔒 OD-6 LOCKED Option A: packaged cuts only; live spine stays at root** · OD-5: empty in Phase 0) · `change-requests/` · `_before/` (snapshots).
Each `X/bro` (in its own project): `spine/` (local copy) · `memory/` · **`logs/`** (session · action ·
memory-write · local-audit · hook-blocks · errors) · `bro.manifest.json` · `health.report.md`.

## 17. Build Sequence (phased — NOT greenfield) · 🔄 RECONCILED to clean SuperBro (2026-06-29)
> **🔄 SUPERSEDED 2026-06-29 (clean-build correction, roadmap §2):** the original Phase-0 wording — *"Phase 0 —
> Load-bearing core, PILOT = EP only … first step = inventory/migration map of `Desktop\EP\memory` · DB · GAA memory …
> Gate: EP Phase-0 GREEN → generalize to DB/GAA/IP"* (and the old 3-phase plan) — is **superseded**. First build =
> **clean SuperBro ONLY**, zero project touched; the EP/DB/GAA inventory/migration map and all Project Bro installs move
> to the later **Project Rollout** phase, behind explicit Gev approval. Old wording recorded here (not deleted) for
> history. / **🔄 ԳԵՐԱԿԱՅՎԱԾ 2026-06-29:** սկզբնական «Phase 0 = EP pilot + EP/DB/GAA inventory map»-ն ու հին 3-phase-ը
> **գերակայվում են**։ Առաջին build = **միայն մաքուր SuperBro**, զրո project դիպած; inventory-ն ու Project Bro install-ները
> գնում են հետագա **Project Rollout** phase, բացահայտ Գևի հաստատման հետևում։ Հին wording-ը պահված է պատմության համար։

**EN — Clean SuperBro build = 5 gated phases. No phase auto-advances; each needs Gev's explicit command; NO project
folder is read or written in any of them.**

**Phase 0 — Foundation & Authority (clean SuperBro skeleton).** SuperBro folder skeleton at `BRO_HOME` (`memory/_own` ·
empty `supermemory/` · `_quarantine` · `tools/` · `spine/RELEASES/` · `change-requests/` · `_before/` · `logs/`) ·
SuperBro `bro.manifest.json` · §15 authority verified. **Bootstrap = Gev's direct approval (pre-palette — the palette /
`START BUILD` do not exist yet).** Success (PROVEN): doctor GREEN on skeleton · manifest real & validated · `_own` holds
registry/logs only (drift = zero project content) · **no project folder touched.** Gate → Gev → Phase 1.

**Phase 1 — Guided Command / Command Palette + Command Library (§6B / D10).** Palette runner + command-library catalog;
read-only commands live; critical/future commands defined + preview-wired (execution gated). Success: read-only commands
run via the palette · a critical command shows preview and **refuses without `YES`** · no vague command triggers a
critical action. Gate → Gev → Phase 2.

**Phase 2 — Enforcement + Evidence + Doctor/Audit (PROVEN — the keystone, §11/D5).** Install the structural hooks (§11) ·
append-only evidence logs (§13A) · doctor/audit/health/spine-check scripts (§14). Success (PROVEN): a forbidden write is
**demonstrated blocked** (exit code) · a log Edit/delete is blocked · SessionStart pre-flight prints · audit reports
**without writing** · timestamps script-generated. Gate → Gev → Phase 3.

**Phase 3 — Registry + Project Bro Template + Rollout Commands (design/dry — NO install).** Registry system live (metadata
only) · Project Bro template specified · rollout commands wired with preview→`YES` in **dry/preview mode** — **no project
installed, no project folder touched.** Success: registry validated by doctor · REGISTER/INSTALL previews execute nothing
· drift confirms `_own` has no project content. Gate → Gev → Phase 4.

**Phase 4 — Spine Release / Update System + Promotion Gate.** Spine release publish + pull/verify/stamp procedure +
promotion-gate workflow (§10). Success: a release can be cut (Gev-gated, logged) · pull/verify/stamp specified &
testable · promotion gate **blocks** unapproved spine entry. Gate → Gev declares **clean SuperBro GREEN** → clean build complete.

**Postponed — explicitly NOT in the clean SuperBro build (later phases, separate Gev commands, behind palette + preview +
`YES`):** Project Bro installs (EP/DB/GAA/IP) **and** the EP/DB/GAA inventory/migration map · Discovery Bank physical
promotion (§17C) · cross-project mode activation (§9) · spine v2 content · project memory migration. **No project folder
is read or written before explicit Gev approval.**

> **Mapping (old → new):** the old Phase 1 (drift / skill-registry / agent-contracts / routing-eval / memory-leak) and
> old Phase 2 (release / promotion / failure-learning) fold into **new Phase 2** (enforcement + doctor/audit incl. drift),
> **new Phase 4** (spine release + promotion gate + failure registry), and the **Project Rollout** phase (skill/agent/
> routing parity needs *installed* Project Bros). / **Քարտեզ (հին → նոր):** հին Phase 1-ն ու Phase 2-ը մտնում են նոր
> Phase 2, Phase 4, ու Project Rollout (parity-test-երը պահանջում են installed Project Bro)։

**HY — Մաքուր SuperBro build = 5 gated phase. Ոչ մի phase ինքն իրեն չի առաջ գնում; ամ. մեկը՝ Գևի բացահայտ հրաման; ոչ
մի project folder չի կարդացվում/գրվում:**
- **Phase 0 — Foundation & Authority:** SuperBro skeleton (`memory/_own` · դատարկ `supermemory/` · `_quarantine` ·
  `tools/` · `spine/RELEASES/` · `change-requests/` · `_before/` · `logs/`) + manifest + §15 authority։ Bootstrap = Գևի
  ուղիղ հաստատում (pre-palette)։ Success՝ doctor GREEN, manifest real, `_own` = միայն registry/logs, **ոչ project դիպած**։
- **Phase 1 — Command Palette + Library (§6B/D10):** read-only command-ները live, critical-ը preview + **`YES`-ից
  առանց մերժում**։
- **Phase 2 — Enforcement + Evidence + Doctor/Audit (ԱՊԱՑՈՒՑՎԱԾ, §11/D5):** hook-եր + append-only log + script-եր։
  Success՝ արգելված write **ապացուցված block**, log edit block, SessionStart pre-flight, audit առանց write։
- **Phase 3 — Registry + Template + Rollout (dry, ՈՉ install):** registry (միայն metadata) + template + rollout
  preview-ներ՝ ոչինչ չկատարող, **ոչ project դիպած**։
- **Phase 4 — Spine Release + Promotion Gate:** publish + pull/verify/stamp + promotion gate։ Gate՝ Գևը հայտարարում է
  **clean SuperBro GREEN**։
- **Հետաձգված (ՈՉ մաքուր build-ում, palette + preview + `YES`-ի հետևում):** Project Bro install-եր + EP/DB/GAA inventory
  map · Discovery Bank promotion · cross-project mode · spine v2 · memory migration։ **Ոչ մի project folder չի
  կարդացվում/գրվում առանց բացահայտ Գևի հաստատման։**

## 17A. D8 — Discovery-to-Build Operating Loop  (behavioral/process — support layer, not a structural wall)
**Bro must NOT jump from request → build.** Mandatory loop: **Understand → Discover → Propose → Verify → Build** —
build only after explicit Gev approval.
`1` read + understand Gev's request · `2` restate what Bro understood · `3` identify gaps · risks · contradictions ·
missing decisions · `4` select the **relevant subset** of discovery questions (§17C) — never dump the whole bank ·
`5` ask only what's needed to close critical gaps · `6` where possible propose likely **answer options** instead of
open questions (→ D9) · `7` recommend Bro's preferred option with reasoning + evidence · `8` ask Gev to approve /
reject / give his own version · `9` if rejected → ask for Gev's version or propose a corrected alternative ·
`10` continue until critical gaps close · `11` produce the final proposal/spec/checklist · `12` self-audit + verify ·
`13` **build only after explicit Gev approval.**
> **Bro can push thinking forward; Bro cannot push authority forward.** / *Bro-ն կարող է միտքը առաջ տանել, ոչ՝
> իշխանությունը։* Layer = **behavioral/process** (§11) — strong discipline, not a hook-wall. *(This very spec review followed D8.)*

## 17B. D9 — Options Before Recommendation  (behavioral)
For any important decision with more than one valid path, Bro **shows the options, then recommends** — never a single
path presented as the only one. Bro shows: **Option A / B / (C if relevant) · tradeoffs · risks · Bro's
recommendation · why it's best · what Gev must decide.**
> No hidden options · no single-path bias · options first, then a clear recommendation. / *Թաքնված տարբերակ չկա.
> ցույց տուր, հետո առաջարկիր։*

## 17C. Discovery Question Bank — spine-level tool for D8/D9
**The Discovery Question Bank is a SPINE-LEVEL, domain-agnostic tool — NOT any project's memory.** It is promoted into
the spine (Promotion Gate → spine release) so it is **local to each Bro** (`…/spine/DISCOVERY_QUESTION_BANK.md`).
DB/GAA/IP Bros use their **local spine copy**; they must **never** read EP's copy (cross-project access = B4
violation). *(The generic bank originated as an EP-area artifact; promoting the generic version to the spine is the fix.)*
- **Status now:** designated spine-level; **physical promotion/copy is a BUILD-time action gated on Gev — NOT done
  yet.** 🔄 **Reconciled (Item 6): physical promotion is explicitly NOT part of the clean SuperBro build — it is a later,
  separate Gev-gated step (§17 Postponed).** Until promoted, do not wire any Bro to read EP's copy. / 🔄 **Հաշտեցված.**
  ֆիզիկական promotion-ը **բացահայտ ՉԻ մաքուր SuperBro build-ի մաս** — հետագա, առանձին Gev-gated քայլ է (§17 Postponed)։
- **Usage (D8 step 4):** for every non-trivial task, **select the relevant subset** and ask only necessary questions;
  **never dump the full bank**; propose likely answer options where possible (D9).
- **Topic → subset (examples):** architecture/memory/security → Framework-Altitude · Purpose · Core-Concepts · RBAC ·
  Workflow · Audit/Logging · Automation · Security/Privacy · Edge-Cases · Future-Scale · | UI → Stakeholders ·
  Workflow · Data/Validation · Search/Nav · UI/UX/A11y · RBAC · Edge-Cases · | integration/API → API/Integrations ·
  Import/Export · Security · Audit · Edge-Cases · | build/migration → Import/Export · Config/Admin · Performance/Scale ·
  Audit · Edge-Cases · Final-Discovery-Gate.
- **Final Discovery Gate (before build):** WHAT · WHY · HOW · WHAT-IF found? · gaps closed? · risks listed? · open
  decisions listed? · Gev approved? · build explicitly authorized?

## 18. Decisions D0–D10 (Gev-approved; final LOCK pending Gev on BUILD)
- **D0 Gev Root Authority** — ACCEPT (mandatory, top).
- **D1 Spine Model** — ACCEPT (physical copy + versioning; canonical spine at `BRO_HOME` — **physical layout 🔒 LOCKED Option A per OD-6 §18: live spine = root dirs**; pull/verify/stamp).
- **D2 Memory Classification + Promotion Gate** — ACCEPT (3 types; project memory never becomes spine law without Gev).
- **D3 Authority — Portable BRO_HOME** — ACCEPT (§15). Super Bro authority = the **Gev-approved `BRO_HOME`** (current
  root; e.g. `Desktop\Bro`), **not** a hardcoded machine/path. First-run register = **YES + Gev Authority Passphrase**
  (hash-only, never logged in plaintext); **bootstrap-only**; BRO_HOME/authority change = critical action + `authority-log.md`.
- **D4 Sync Trigger** — ACCEPT (manual sync + periodic read-only audit; audit flags only, never fixes/moves).
- **D5 Enforcement Split** — ACCEPT (critical no-bypass is structural: hooks + filesystem + scripts + exit codes; markdown = support).
- **D6 Build Sequence** — ACCEPT, 🔄 RECONCILED to the **clean SuperBro 5-phase** plan (§17): Phase 0 Foundation → 1
  Command Palette → 2 Enforcement/Evidence/Doctor (proof) → 3 Registry/Template/Rollout-dry → 4 Spine-Release/Promotion.
  **Phase 0 = clean SuperBro only (no EP pilot, no project touched); Project Bro installs postponed to a later Project
  Rollout phase.** (Old 3-phase / EP-pilot wording superseded — see §17 note.)
- **D7 Logging / Evidence Layer** — ACCEPT (§13A). Every critical action → an **append-only** log entry; logs
  are **evidence, not memory**; project-local + Super Bro operational logs; standard schema; **timestamps/
  session_id script-generated (no fabrication)**; append-only **hook-enforced**; evidence-logs git-tracked;
  snapshot+checksum before critical writes; change-request file per critical action. Old log edit/delete = Gev command only.
- **D8 Discovery-to-Build Loop** — ACCEPT (§17A). Understand → Discover → Propose → Verify → Build; never jump to
  build; select the relevant discovery subset (never dump); options-first; build only on explicit Gev approval. Behavioral/process layer.
- **D9 Options Before Recommendation** — ACCEPT (§17B). For important multi-path decisions: show options + tradeoffs
  + risks, then recommend; no single-path bias. Behavioral.
- **Push policy (§8A)** — ACCEPT. PUSH = critical action for the **Bro governance repo** (Gev-command only); the
  **GAA push delegation (2026-06-25) remains a scoped exception** until Gev changes it — not a universal rule.
- **D10 Guided Command / Command Palette** — ACCEPT (§6B). 🔄 Added 2026-06-29 from the roadmap's held requirement:
  Super Bro's operator-facing control layer (menu → preview → explicit `YES` → run; default read-only; critical actions
  gated; command-library maintained) is **mandatory pre-build scope**, built before any project registration/install flow.
- **OD-6 Spine physical layout** — 🔒 **LOCKED 2026-06-29: Option A (Gev-approved).** Canonical **live spine = the existing
  `BRO_HOME` root dirs** (`_core/ skills/ self/ roster/`); `RELEASES/` stores **packaged release cuts only** — **no content
  relocation into a new top-level `spine/` tree, no migration.** (Option B rejected.)
- **🔒 LOCKED operating decisions (OD-2…OD-5, Gev-approved 2026-06-29; full text in roadmap §18):** **OD-2** keep `BRO_HOME` =
  `C:\Users\Admin\Desktop\Bro` (no rename/relocation/`Desktop\SuperBro`). **OD-3** first-run authority = **verify-only**
  (re-bootstrap only if `bro.home.json`/verifier missing/invalid/tampered; no passphrase re-prompt when current verifies).
  **OD-4** Command Palette = **Bro-session menu + real scripts** (Bro presents; scripts execute side-effects with exit
  codes; hooks = the wall). **OD-5** baseline spine release = **deferred** (mechanism Phase 4; cut `v1.0.0` only at first
  install/pull need or on Gev command; Phase 0 `RELEASES/` empty). / **🔒 LOCK որոշումներ (OD-2…OD-5, Գև 2026-06-29).**
  OD-2 պահել `C:\Users\Admin\Desktop\Bro` · OD-3 verify-only authority · OD-4 palette = Bro-session menu + real scripts ·
  OD-5 baseline release = deferred (Phase 4; `RELEASES/` դատարկ Phase 0-ում)։

## 19. The 6 Bro refinements (Gev-approved — folded in above)
1. **Enforcement = Claude Code hooks** named concretely (settings.json · PreToolUse · SessionStart · real
   scripts · exit-code blocking); **the enforcement phase (clean build Phase 2) must PROVE a forbidden action is
   blocked** (🔄 reconciled 2026-06-29 — block-proof moved from Phase 0 to Phase 2; requirement preserved). (§11/§17)
2. **Not greenfield** (the spine already exists). 🔄 **SUPERSEDED 2026-06-29 (clean-build correction):** the old
   *"Phase 0 first step = existing inventory / migration map"* of EP/DB/GAA memory is **moved out of Phase 0 to the later
   Project Rollout phase** — **the clean SuperBro build touches no project folders**; the "not greenfield" principle
   itself stays. (§17) / **Not greenfield** (spine-ն արդեն կա)։ 🔄 **ԳԵՐԱԿԱՅՎԱԾ 2026-06-29.** հին «Phase 0 first step =
   inventory/migration map»-ը (EP/DB/GAA memory) **տեղափոխված է Phase 0-ից հետագա Project Rollout phase** — **մաքուր
   SuperBro build-ը ոչ մի project folder չի դիպչում**; «not greenfield» սկզբունքը մնում է։ (§17)
3. **Super Bro = role + scripts + Claude session, NOT a daemon**; health = snapshot, not live service. (§2)
4. **SessionStart pre-flight** (structural) prints project · allowed memory · forbidden paths · spine version ·
   critical-needs-Gev · cross-project OFF. (§11)
5. ~~**Phase 0 pilot = EP only**; after EP GREEN → generalize to DB/GAA/IP.~~ 🔄 **SUPERSEDED 2026-06-29 (clean-build
   correction, roadmap §2):** Phase 0 = **clean SuperBro only** (no EP pilot, no project touched); EP/DB/GAA/IP Project
   Bro installs move to a later **Project Rollout** phase, behind explicit Gev approval. (§17)
6. **Home = current `BRO_HOME`** (today `Desktop\Bro`; **portable / Gev-approved per §15/D3**, not hardcoded; no new `Desktop\SuperBro` in Phase 0). (§16)

## 20. Final Verification Checklist (before v1 is "ready to build")
```txt
[ ] D0 Gev Root Authority exists and is FIRST.        [ ] bro.manifest.json defined.
[ ] Same Bro / sealed-memory rule.                    [ ] spine_version / skills_manifest_version / memory_schema_version.
[ ] Super Bro = factory/vault, not mixed memory.      [ ] Skill registry defined.
[ ] Project Bro can't access another project memory.  [ ] Agent contracts defined.
[ ] supermemory folders isolated.                     [ ] Critical gates split structural vs behavioral.
[ ] Audit is read-only.                               [ ] Phase 0 scope clear (clean SuperBro only; project pilots postponed).
[ ] Quarantine move requires Gev command.             [ ] Doctor planned as REAL script, not markdown.
[ ] Cross-project mode requires Gev command.          [ ] Stale Bro rule exists.
[ ] Promotion Gate exists.                             [ ] Failure registry exists (first entry filed).
[ ] Enforcement = Claude Code hooks, Phase-0 PROVEN.  [ ] Final LOCK requires Gev.
[ ] D7 logging/evidence layer (append-only, hook-enforced, script-timestamps, evidence-logs git-tracked).
[ ] Snapshot+checksum before critical writes · change-request file per critical action · session_id links logs.
[ ] D8 Discovery-to-Build loop (Understand→Discover→Propose→Verify→Build; never jump to build).
[ ] D9 Options-before-Recommendation (show options + tradeoffs, then recommend).
[ ] Discovery Bank = spine-level, domain-agnostic, local-via-spine; select-subset (never dump); never read from EP.
[ ] PUSH = critical action (Bro repo); GAA push delegation = scoped existing exception.
[ ] D3 Authority = portable Gev-approved BRO_HOME (not hardcoded machine/path); first-run = YES + passphrase (hash-only).
[ ] D10 Command Palette = mandatory pre-build (menu→preview→YES→run; default read-only; critical gated; command-library).
[ ] Clean SuperBro build = 5 phases; Phase 0 = clean SuperBro only; NO project folder touch before explicit Gev approval.
[ ] Project Bro installs + Discovery Bank physical promotion = postponed to later Project Rollout (not in clean build).
[ ] OD-6 spine physical layout = 🔒 LOCKED Option A (live spine = root dirs; RELEASES = packaged cuts only).
[ ] OD-2…OD-5 = 🔒 LOCKED (Gev 2026-06-29): keep Desktop\Bro · verify-only authority · palette = session+scripts · defer baseline release.
[ ] OD-1 spec reconciliation = ✅ RESOLVED (7f59dbb + 87a18cd, pushed).
[ ] Verification checklist covers D0–D10.
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
· v1 extended 2026-06-29: +D8 · +D9 · +Discovery-Bank integration · +Push policy · checklist → D0–D9 (Gev-approved, bounded — spec file only).
· v1 reconciled 2026-06-29 with `BRO_CLEAN_SUPERBRO_BUILD_ROADMAP.md` (`67df95e`): clean SuperBro first · §17 5-phase · +§6B/D10 Command Palette · +OD-6 · installs/Discovery-promotion postponed · checklist → D0–D10. (commit `7f59dbb`)
· v1 consistency fix 2026-06-29: F1 §19#2 superseded (inventory map → Rollout) · F2 "Phase-0 proof" → enforcement Phase 2 (§11/§19#1) · F3 changelog → D0–D10. (this commit)
