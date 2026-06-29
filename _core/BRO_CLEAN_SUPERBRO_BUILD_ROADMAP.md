# BRO CLEAN SUPERBRO BUILD ROADMAP
## Clean SuperBro first · Command Palette before any build · Project Bros installed later · Gev Root Authority
> *Մաքուր SuperBro առաջինը · Command Palette ամեն build-ից առաջ · Project Bro-ները հետո · Գևը Root Authority։*

> **STATUS: 🌱 PROPOSED ROADMAP — NOTHING BUILT · NOTHING LOCKED · no build until Gev explicitly says "BUILD".**
> EN: Drafted by Bro on **2026-06-29** per Gev's roadmap-shaping direction (Q1–Q9 answered + hybrid approach chosen).
> This is the **BUILD ROADMAP** for the architecture in `_core/BRO_MEMORY_SKILL_ARCHITECTURE_v1.md`. Build-ready
> depth, **no code, no build, no project folder touched.** This turn = write this one file → self-check → commit (NO push).
> HY: Կազմված է Bro-ի կողմից **2026-06-29**-ին՝ Գևի roadmap-shaping ուղղությամբ (Q1–Q9 պատասխանված + hybrid մոտեցում)։
> Սա `_core/BRO_MEMORY_SKILL_ARCHITECTURE_v1.md`-ի ճարտարապետության **BUILD ROADMAP-ն է**։ Build-ready խորություն,
> **ոչ կոդ, ոչ build, ոչ մի project folder դիպած։** Այս քայլ = գրել այս մեկ ֆայլը → self-check → commit (ՈՉ push)։

```txt
Authority chain:  GPT recommends → Gev approves → Bro locks → Bro builds (ONLY on Gev's word).
Document type:    Hybrid — phased plan (backbone) + per-component build-ready technical spec (attached).
Home (BRO_HOME):  current Gev-approved root (today Desktop\Bro; portable per spec §15/D3 — not hardcoded).
```
```txt
Authority chain:  GPT-ն առաջարկում → Գևը հաստատում → Bro-ն lock անում → Bro-ն կառուցում (ՄԻԱՅՆ Գևի խոսքով)։
Document type:    Hybrid — phased plan (ողնաշար) + per-component build-ready technical spec (կցված)։
Home (BRO_HOME):  ընթացիկ Gev-approved root (այսօր Desktop\Bro; շարժական spec §15/D3-ով — ոչ hardcoded)։
```

---

## 0. Reading Guide & Scope Lock / ընթերցման ուղեցույց ու scope-ի կողպեք

**EN** — Read this with the architecture spec open; this roadmap does not restate the architecture, it sequences its **build**. Four corrections are LOCKED for this roadmap and govern wherever they conflict with older wording:

1. **First build = CLEAN SUPERBRO ONLY.** Not the EP pilot. Not DB/GAA/IP. **Zero project folders touched.**
2. **Guided Command / Command Palette is mandatory PRE-BUILD scope** — it is part of the clean SuperBro build itself, designed before any project registration/install flow and before any Project Bro rollout.
3. **Project Bros are installed LATER** — only after SuperBro is ready and Gev chooses/registers each project through the palette.
4. **Spec reconciliation is required.** The canonical spec (§17/D6, §19 refinement #5) currently says *"Phase 0 pilot = EP only."* This roadmap **proposes the clean correction** (Phase 0 = clean SuperBro only; project pilots move to a later phase). The actual edit to the canonical spec is a **separate Gev-gated action — NOT performed here** (this turn does not edit the canonical spec).

**Depth (Q1=B):** build-ready — each component carries enough spec to build from later, **no code now.**
**Type (Q2=C):** both — phased plan as backbone + per-component technical spec.

**HY** — Կարդա սա ճարտարապետության spec-ը բաց պահելով․ այս roadmap-ը ճարտարապետությունը չի կրկնում, այն հերթականացնում է դրա **build-ը**։ Չորս ուղղում LOCK են այս roadmap-ի համար ու գերակա են, որտեղ հին ձևակերպման հետ բախվում են․

1. **Առաջին build = ՄԻԱՅՆ ՄԱՔՈՒՐ SuperBro։** Ոչ EP pilot։ Ոչ DB/GAA/IP։ **Զրո project folder դիպած։**
2. **Guided Command / Command Palette-ը պարտադիր PRE-BUILD scope է** — մաս է հենց մաքուր SuperBro build-ի, նախագծվում է ցանկացած project registration/install flow-ից ու Project Bro rollout-ից առաջ։
3. **Project Bro-ները install են լինում ՀԵՏՈ** — միայն SuperBro-ի պատրաստ լինելուց հետո, երբ Գևը palette-ով ընտրի/register անի ամեն project։
4. **Spec-ի հաշտեցում է պետք։** Canonical spec-ը (§17/D6, §19 refinement #5) հիմա ասում է *«Phase 0 pilot = EP only»*։ Այս roadmap-ը **առաջարկում է մաքուր ուղղումը** (Phase 0 = միայն մաքուր SuperBro; project pilot-ները տեղափոխվում են ավելի ուշ phase)։ Canonical spec-ի իրական խմբագրումը **առանձին Gev-gated գործողություն է — այստեղ ՉԻ կատարվում**։

**Խորություն (Q1=B):** build-ready — ամ. բաղադրիչ բավարար spec ունի հետո կառուցելու, **հիմա ոչ կոդ։**
**Տեսակ (Q2=C):** երկուսն էլ — phased plan = ողնաշար + per-component technical spec։

---

# PART A — Frame & Baseline / Շրջանակ ու ելակետ

## 1. Current Baseline & Verified State / ընթացիկ ելակետ ու ստուգված վիճակ

**EN** — Where we stand at roadmap time (verified this session):
- **Repo:** `gingi4688-spec/BRO` (PRIVATE). Branch `main`. `HEAD = c023535 = origin/main`. Working tree **CLEAN**.
- **Exists (the spine):** `_core/` (laws · behavior · canonical architecture spec) · `skills/` (32 god-level skills + agents layer) · `self/` (persona · personalization) · `roster/` · `.claude/agents/` (32 runtime wrappers).
- **Architecture spec:** `_core/BRO_MEMORY_SKILL_ARCHITECTURE_v1.md` — PROPOSED v1 (D0–D9, B1–B6, §6A Flow 1/2, §8A push, §11 enforcement, §15 portable BRO_HOME, §17 phased build).
- **Sealed evidence:** old GAAhex memory mirrored read-only at `memory/supermemory/GAAhex/` (NOT active spine).
- **Secrets:** `bro.home.json` + `memory/_own/secrets/bro-home.verifier.json` (PBKDF2 hash-only) exist locally, **gitignored, machine-local**; no plaintext passphrase anywhere; `pwd.txt` deleted.
- **NOT built:** no SuperBro `_own` operational tree, no doctor/audit scripts, no hooks, no command palette, no registry, no Project Bro, no logs system. **Nothing built. No project folder touched.**

**HY** — Որտեղ ենք roadmap-ի պահին (այս session-ին ստուգված)․
- **Repo:** `gingi4688-spec/BRO` (PRIVATE)։ Branch `main`։ `HEAD = c023535 = origin/main`։ Working tree **ՄԱՔՈՒՐ**։
- **Կա (spine-ը):** `_core/` · `skills/` (32 skill + agents layer) · `self/` · `roster/` · `.claude/agents/` (32 wrapper)։
- **Architecture spec:** `_core/BRO_MEMORY_SKILL_ARCHITECTURE_v1.md` — PROPOSED v1 (D0–D9 և այլն)։
- **Կնքված evidence:** հին GAAhex memory-ն read-only mirror `memory/supermemory/GAAhex/`-ում (ակտիվ spine չէ)։
- **Secrets:** `bro.home.json` + `bro-home.verifier.json` (PBKDF2 hash-only) տեղական են, **gitignored, machine-local**; plaintext passphrase ոչ մի տեղ; `pwd.txt` ջնջված։
- **ՉԻ կառուցված:** ոչ SuperBro `_own` tree, ոչ doctor/audit script, ոչ hook, ոչ command palette, ոչ registry, ոչ Project Bro, ոչ logs system։ **Ոչինչ չի կառուցվել։ Ոչ մի project folder դիպած։**

## 2. Clean-Build Correction / մաքուր-build ուղղում

**EN** — This is the load-bearing correction of the whole roadmap.
- **Old wording (canonical spec §17/D6 · §19 refinement #5):** *"Phase 0 — Load-bearing core, PILOT = EP only … after EP GREEN → generalize to DB/GAA/IP."*
- **New, LOCKED direction (Gev, 2026-06-29):** **The first build is a CLEAN SUPERBRO BUILD ONLY.** No EP pilot. No DB/GAA/IP. No project folder touched. No Project Bro installed. Project Bros are installed later — by running the finished SuperBro and registering each project through the Command Palette (§17).
- **Why the correction is safe and better:** it removes the largest Phase-0 risk (touching a live project's memory before the factory + the structural gates + the operator control layer are proven). We harden the factory and the gates first, on empty ground, then install projects one at a time behind preview→YES.
- **Reconciliation proposal (Gev-gated, not done here):** amend canonical spec §17 (rename Phase 0 to *clean SuperBro*; move EP/DB/GAA/IP to a later "Project Rollout" phase) and §19 refinement #5 accordingly, and cross-link this roadmap. **This edit waits for a separate Gev command.**

**HY** — Սա ամբողջ roadmap-ի կրող ուղղումն է։
- **Հին ձևակերպում (canonical §17/D6 · §19 #5):** *«Phase 0 — PILOT = միայն EP … EP GREEN-ից հետո → ընդհանրացնել DB/GAA/IP»*։
- **Նոր, LOCK ուղղություն (Գև, 2026-06-29):** **Առաջին build-ը ՄԻԱՅՆ ՄԱՔՈՒՐ SuperBro BUILD է։** Ոչ EP pilot։ Ոչ DB/GAA/IP։ Ոչ մի project folder դիպած։ Ոչ Project Bro install։ Project Bro-ները հետո են install լինում՝ պատրաստ SuperBro-ն աշխատեցնելով ու ամեն project-ը Command Palette-ով register անելով (§17)։
- **Ինչու է ուղղումն ապահով ու ավելի լավ:** հանում է Phase-0-ի ամենամեծ ռիսկը (live project-ի memory-ին դիպչել նախքan factory-ն + կառուցվածքային gate-երը + operator-ի control շերտը ապացուցված լինեն)։ Նախ պնդացնում ենք factory-ն ու gate-երը՝ դատարկ հողի վրա, հետո install անում project-ները մեկ առ մեկ՝ preview→YES-ի հետևում։
- **Հաշտեցման առաջարկ (Gev-gated, այստեղ չի արվում):** խմբագրել canonical §17-ը (Phase 0-ն վերանվանել *clean SuperBro*; EP/DB/GAA/IP տեղափոխել հետագա «Project Rollout» phase) ու §19 #5-ը, ու cross-link անել այս roadmap-ը։ **Այս խմբագրումը սպասում է առանձին Գևի հրամանի։**

## 3. Target Architecture (End-State) / նպատակային ճարտարապետություն

**EN** — The end-state this roadmap builds toward (full detail lives in the architecture spec; summarized here so the build has a target):
- **One Bro identity, one shared spine, many sealed Project Bros.** Same persona/laws/skills/roster everywhere; **only memory is unique per project** (B1).
- **Super Bro** = factory + spine canonical authority + skill/roster release authority + registry + read-only audit runner + sealed-mirror vault + sync orchestrator + health-snapshot owner. **Not a daemon** (a directory + scripts + a Claude session, on demand).
- **Project Bro `X/bro`** = same Bro + that project's sealed memory; reads/writes only its own memory; cannot see another project's memory.
- **Invariants (B1–B6):** memory flows **UP** as read-only mirror; spine flows **DOWN** as approved versioned release; **never cross**; critical gates are **structural** (hooks/filesystem/scripts/exit-codes), not markdown.
- **Gev Root Authority (D0/L0):** Bro autonomous in checking; not autonomous in deciding authority.

**HY** — Վերջնական վիճակը, որին այս roadmap-ը կառուցում է (լրիվ մանրամասը՝ architecture spec-ում; այստեղ ամփոփ՝ որ build-ը թիրախ ունենա)․
- **Մեկ Bro ինքնություն, մեկ ընդհանուր spine, շատ կնքված Project Bro։** Ամ. տեղ նույն persona/laws/skills/roster; **միայն memory-ն է unique ըստ project-ի** (B1)։
- **Super Bro** = factory + spine canonical authority + skill/roster release authority + registry + read-only audit runner + sealed-mirror vault + sync orchestrator + health-snapshot։ **Daemon չէ** (folder + script + Claude session, ըստ պահանջի)։
- **Project Bro `X/bro`** = նույն Bro + այդ project-ի կնքված memory; կարդում/գրում է միայն իր memory-ն; ուրիշ project-ի memory-ն չի տեսնում։
- **Invariant-ներ (B1–B6):** memory-ն գնում է **ՎԵՐ** read-only mirror; spine-ը գնում է **ՎԱՐ** approved release; **երբեք cross չեն լինում**; critical gate-երը **կառուցվածքային** են, ոչ markdown։
- **Gev Root Authority (D0/L0):** Bro-ն ինքնուրույն ստուգում է; ինքնուրույն իշխանություն չի որոշում։

---

# PART B — Operator Control Layer (mandatory pre-build) / Operator-ի control շերտ

## 4. Guided Command / Command Palette / ուղղորդվող հրամանների վահանակ

**EN** — SuperBro's operator-facing control surface, and **mandatory pre-build scope** — Gev never memorizes commands.

**Purpose.** Gev opens SuperBro and is shown a **menu of safe actions**; he picks one; SuperBro **collects required inputs**, shows a **preview** (what · where · scope · files · authority · rollback), asks for an **explicit YES**, and **runs only after approval**.

**Behavior contract (the rules every guided command obeys):**
- **Default read-only.** Read-only commands run after a light confirm; **critical** commands always require the full preview + explicit `YES`.
- **No critical action from a vague command.** Build/push/delete/migrate/hook-install/project-creation/release/promote **never** run without preview + `YES` + (where D0 requires) Gev authority.
- **Preview → YES → run, always, for critical.** Cancel on anything other than `YES`.
- **Recommend the next safe command** after each action ("you may now RUN DOCTOR").
- **Explain consequences** in plain language before running.
- **STOP if scope is ambiguous** (D0 emergency STOP) — ask, do not guess.
- **Every run produces a log entry** (§11) and, for critical writes, a snapshot + change-request (§11/§13A of spec).

**Structure (clean build):** a palette runner (Bro-session-driven menu, backed by **real scripts** for any action with side effects) + the Command Library (§5) as its catalog. Read-only commands are live in the clean build; critical/project commands are **defined and preview-wired but execution-gated/deferred** (no project touched).

**Interaction / preview wording (drafted — Q5=C):**
```txt
Bro> SuperBro ready · BRO_HOME: <path> · spine v<ver> · mode: READ-ONLY · cross-project: OFF
     Choose a command:
       READ-ONLY
        [1] SHOW REGISTRY     [2] SHOW HEALTH      [3] RUN DOCTOR
        [4] RUN AUDIT         [5] REVIEW QUARANTINE (flags only)
       CRITICAL — needs preview + YES (+ Gev authority)
        [6] RELEASE SPINE     [7] REGISTER PROJECT      [8] INSTALL PROJECT BRO
        [9] UPDATE PROJECT BRO SPINE   [10] PROMOTE SKILL   [11] CROSS-PROJECT AUDIT
        [12] START BUILD
       [0] EXIT     [?] HELP / SHOW COMMANDS

Gev> 6
Bro> PREVIEW — RELEASE SPINE
     Action:        publish spine release v1.0.1
     Scope:         canonical spine  →  spine/RELEASES/v1.0.1/
     Reads:         spine/            Writes: spine/RELEASES/v1.0.1/ + memory/_own/release-log.md
     Criticality:   CRITICAL          Requires Gev authority: YES
     Backup:        _before/spine-<ts>.zip + sha256.txt
     Rollback:      delete RELEASES/v1.0.1/; no Project Bro pulls until it stamps spine_version
     Consequence:   makes a new spine version available for Bros to PULL (pull-based, never forced)
     Type YES to proceed · anything else cancels.
Gev> YES
Bro> [runs release script] → result: OK · release-log appended · next safe command: RUN AUDIT
```

**Out-of-scope (clean build):** actually executing any project-touching command (REGISTER/INSTALL/UPDATE/PROMOTE/CROSS-PROJECT). These are designed + preview-wired now; **execution is deferred** to the rollout phase on Gev's command.

**HY** — SuperBro-ի operator-ի control մակերեսն է ու **պարտադիր pre-build scope** — Գևը երբեք command չի անգիր անում։

**Նպատակ.** Գևը բացում է SuperBro-ն, տեսնում է **ապահով գործողությունների menu**; ընտրում է մեկը; SuperBro-ն **հավաքում է required input-ները**, ցույց է տալիս **preview** (ինչ · ուր · scope · ֆայլեր · authority · rollback), հարցնում է **բացահայտ YES**, ու **գործում է միայն հաստատումից հետո**։

**Behavior contract (կանոնները, որ ամ. command պահում է):** default read-only; critical-ը միշտ՝ լրիվ preview + `YES`; ոչ մի critical action vague command-ից; preview → YES → run; առաջարկում է հաջորդ ապահով command-ը; բացատրում է հետևանքները; STOP երբ scope-ը երկիմաստ է; ամ. run → log entry (+ snapshot/change-request critical write-ի դեպքում)։

**Կառուցվածք (մաքուր build):** palette runner (Bro-session menu, side-effect-ով ամ. action-ի համար՝ **real script**) + Command Library (§5) որպես catalog։ Read-only command-ները live են մաքուր build-ում; critical/project command-ները **սահմանված ու preview-wired են, բայց execution-gated/հետաձգված** (ոչ մի project դիպած)։

**Interaction/preview բառերը՝ վերևի drafted block-ում** (Q5=C)։
**Out-of-scope (մաքուր build):** project-ի դիպչող command-ի իրական կատարումը (REGISTER/INSTALL/UPDATE/PROMOTE/CROSS-PROJECT)։ Հիմա նախագծվում + preview-wired են; **կատարումը հետաձգված է** rollout phase-ին, Գևի հրամանով։

## 5. Command Library / հրամանների գրադարան

**EN** — The maintained catalog behind the palette. Every command is one library entry with this schema:

```txt
Command Library Entry (schema):
  name                · short verb name shown in the palette
  purpose             · one line: what it does
  category            · READ-ONLY | CRITICAL
  required_inputs     · inputs SuperBro must collect (with prompts + validation)
  safe_default        · the safest default value/behavior if input omitted
  criticality         · LOW | MED | HIGH | CRITICAL
  requires_gev        · YES | NO (Gev authority/command required)
  mode                · READ | WRITE
  files_affected      · paths read/written
  preview_shown       · what the preview displays before YES
  rollback_backup     · snapshot/rollback method (n/a for read-only)
  report_format       · what the result report contains
  availability        · CLEAN-BUILD (live) | FUTURE (designed, execution deferred)
  backing             · script/hook the command invokes (contract only — no code now)
```

**Starter commands (Q5=C · Q8 future flows designed now):**

| name | mode | criticality | requires_gev | availability | purpose (EN / HY) |
|---|---|---|---|---|---|
| HELP / SHOW COMMANDS | READ | LOW | NO | CLEAN-BUILD | list commands + what's safe / թվարկել command-ները |
| SHOW REGISTRY | READ | LOW | NO | CLEAN-BUILD | show registered projects (none yet) / ցույց տալ registry-ն |
| SHOW HEALTH | READ | LOW | NO | CLEAN-BUILD | print last health snapshot / health snapshot-ը |
| RUN DOCTOR | READ | LOW | NO | CLEAN-BUILD | manifest/skeleton/authority self-check / self-check |
| RUN AUDIT | READ | MED | NO | CLEAN-BUILD | read-only audit, flags only / read-only audit |
| REVIEW QUARANTINE | READ | MED | NO | CLEAN-BUILD | list quarantine candidates (flags only) / candidate-ները |
| RELEASE SPINE | WRITE | CRITICAL | YES | CLEAN-BUILD* | publish a spine release / spine release |
| START BUILD | WRITE | CRITICAL | YES | CLEAN-BUILD | begin an approved build phase / approved build phase |
| REGISTER PROJECT | WRITE | CRITICAL | YES | FUTURE | register a project in the registry / register project |
| INSTALL PROJECT BRO | WRITE | CRITICAL | YES | FUTURE | install `X/bro` into a project / Project Bro install |
| UPDATE PROJECT BRO SPINE | WRITE | CRITICAL | YES | FUTURE | pull approved release into `X/bro` / spine update |
| RUN PROJECT AUDIT | READ | MED | NO | FUTURE | audit one project (read-only) / project audit |
| PROMOTE SKILL | WRITE | CRITICAL | YES | FUTURE | promote a lesson to spine (Promotion Gate) / promote |
| CROSS-PROJECT AUDIT MODE | READ | HIGH | YES | FUTURE | Gev-opened read-only cross-project review / cross-project |
| EXIT | READ | LOW | NO | CLEAN-BUILD | leave the palette / դուրս գալ |

> `*` RELEASE SPINE & START BUILD are defined and preview-wired in the clean build but each **run** still requires a Gev command. FUTURE commands are **designed + preview-wired now, execution deferred** to rollout.

**Fully-expanded examples (build-ready):**
```txt
RUN DOCTOR
  purpose: verify SuperBro skeleton, manifest, authority, spine_version integrity
  category: READ-ONLY · criticality: LOW · requires_gev: NO · mode: READ
  required_inputs: none (safe_default = check SuperBro self)
  files_affected: reads bro.home.json, bro.manifest.json, spine/, memory/_own/* ; writes none
  preview_shown: "Doctor will READ skeleton + manifest, write nothing. Continue?"
  rollback_backup: n/a (read-only)
  report_format: GREEN/YELLOW/RED/CRITICAL + per-check line + issue codes
  backing: tools/bro-doctor (script contract §12)

REGISTER PROJECT  (FUTURE — designed, not executed in clean build)
  purpose: add a project to the registry so a Project Bro can later be installed
  category: CRITICAL · criticality: HIGH · requires_gev: YES · mode: WRITE
  required_inputs: project_id, project_path, memory_scope, authority (prompted + validated)
  safe_default: none (must be explicit) · refuses if path is inside another project's memory
  files_affected: writes memory/_own/registry.json + registry-log; touches NO project content
  preview_shown: project_id · path · scope · authority · "writes registry only, no project files"
  rollback_backup: registry snapshot _before/registry-<ts>.json
  report_format: registered entry echo + next safe command (INSTALL PROJECT BRO)
  backing: tools/bro-register (script contract — future build)
```

**HY** — Palette-ի հետևի պահվող catalog-ը։ Ամ. command = մեկ library entry՝ վերևի schema-ով (name · purpose · category · required_inputs · safe_default · criticality · requires_gev · mode · files_affected · preview_shown · rollback_backup · report_format · availability · backing)։ Starter command-ները՝ վերևի աղյուսակում (READ-ONLY-ները live մաքուր build-ում; FUTURE-ները նախագծված + preview-wired, կատարումը հետաձգված)։ Երկու full օրինակ (RUN DOCTOR, REGISTER PROJECT)՝ վերևի block-ում, build-ready խորությամբ։

---

# PART C — Core Build Components / Հիմնական build-բաղադրիչներ

## 6. SuperBro Core Build / SuperBro-ի կորիզի build

**EN** — The factory/vault/authority skeleton built first, on empty ground, at `BRO_HOME` (today `Desktop\Bro`).

**Structure to create (clean build — adds alongside existing `_core/ skills/ self/ roster/`):**
```txt
BRO_HOME/
  bro.home.json                      (exists; verified, not rewritten without authority change)
  bro.manifest.json                  (NEW — SuperBro manifest, see contract below)
  memory/
    _own/                            (NEW — registry + logs + metadata ONLY; no project content)
      registry.json
      sync-log.md  audit-log.md  release-log.md  authority-log.md  failure-registry.md
      health-dashboard.md            (generated snapshot, not a service)
      hook-blocks.log
      secrets/                       (exists; gitignored; verifier only)
    supermemory/                     (NEW — root only, EMPTY in clean build; per-project mirror dirs created at registration = FUTURE)
    _quarantine/                     (NEW — empty; moves require Gev command)
  spine/
    RELEASES/                        (NEW — empty; releases cut later, Gev-gated)
  tools/                             (NEW — doctor/audit/etc. script files = written at build-time, NOT now)
  change-requests/                   (NEW — empty; one CR file per critical action)
  _before/                          (NEW — empty; snapshots before critical writes)
  logs/                              (NEW — session/action/errors, rotated)
```

**`bro.manifest.json` contract (SuperBro):**
```txt
bro_id · role=SuperBro · project_id=_super · spine_version · skills_manifest_version ·
agents_manifest_hash · memory_schema_version · memory_scope=own_only · authority=SuperBro ·
last_memory_sync · last_audit · status
```

**Gates:** authority via §15 first-run (YES + passphrase, hash-only) must be `current` before any write; manifest written by script, verified by doctor (not by eye).
**Success criteria (PROVEN):** skeleton exists · `bro.manifest.json` real and doctor-validated · authority `current` · `memory/_own` holds registry/logs only (drift check: zero project content) · **no project folder touched.**
**Out-of-scope:** any project mirror content, any Project Bro, any spine release content.

**HY** — factory/vault/authority կմախքը՝ առաջինը, դատարկ հողի վրա, `BRO_HOME`-ում (այսօր `Desktop\Bro`)։ Ստեղծվող կառուցվածքը՝ վերևի ծառում (`_own` = միայն registry/logs/metadata, ոչ project content; `supermemory/` = միայն root, ԴԱՏԱՐԿ; per-project mirror dir-երը registration-ին = FUTURE; `_quarantine`, `RELEASES`, `tools`, `change-requests`, `_before`, `logs` = դատարկ)։ `bro.manifest.json`-ի contract-ը՝ վերևում։ **Gate-եր:** authority `current` լինի (§15 first-run) ցանկացած write-ից առաջ; manifest-ը script գրի, doctor ստուգի։ **Success (ԱՊԱՑՈՒՑՎԱԾ):** կմախք կա · manifest real · authority current · `_own`-ը միայն registry/logs (drift = զրո project content) · **ոչ մի project folder դիպած։**

## 7. Project Bro Template / Project Bro-ի կաղապար

**EN** — The reusable, installable shape of a Project Bro — **defined now, installed later** (no install in clean build).

**Template structure (what an install will later create inside `X/`):**
```txt
X/bro/
  spine/                 (local physical copy of an approved spine release)
  memory/                (that project's sealed memory — the ONLY unique part)
  logs/                  (session · action · memory-write · local-audit · hook-blocks · errors)
  bro.manifest.json      (bro_id · project_id · spine_version · ..._manifest_version · memory_scope · authority · status)
  health.report.md       (generated)
```
**Contracts:** manifest schema (§7 spec); memory_scope pinned to this project; spine_version stamped on pull/verify; isolation enforced structurally (§10/§13).
**Clean-build scope:** the template, its manifest schema, and the install **flow + preview** are specified and palette-wired; **no Project Bro is created** and no project folder is touched.
**Deferred (FUTURE):** actual install of EP/DB/GAA/IP Bros.

**HY** — Project Bro-ի վերաօգտագործվող, install-վող ձևը — **հիմա սահմանվում, հետո install**։ Template-ի կառուցվածքը (ինչ install-ը հետո կստեղծի `X/`-ի մեջ)՝ վերևում (`spine/` local copy · `memory/` = միակ unique մասը · `logs/` · `bro.manifest.json` · `health.report.md`)։ Contract-ները՝ manifest schema, memory_scope pinned, spine_version stamped, isolation կառուցվածքային։ **Մաքուր-build scope:** template + manifest schema + install flow/preview սահմանվում ու palette-wired են; **ոչ մի Project Bro չի ստեղծվում**։ **Հետաձգված (FUTURE):** EP/DB/GAA/IP Bro-ների իրական install։

## 8. Project Registry System / project-ի registry համակարգ

**EN** — How SuperBro knows which projects exist — **registry holds metadata only, never project content** (B4/§4).

**Structure:** `memory/_own/registry.json` (+ append-only `registry-log`). Per entry:
```txt
project_id · project_path · memory_scope · authority · spine_version_expected ·
status (REGISTERED | INSTALLED | STALE | RETIRED) · last_audit · last_sync · notes
```
**Rules:** registering writes the registry only (no project files); a path that sits inside another project's memory is **refused**; status transitions are logged; SuperBro never copies project content into `_own`.
**Clean-build scope:** registry file + schema + `SHOW REGISTRY` (read-only, live) + `REGISTER PROJECT` **preview** (designed, not executed). In the clean build the registry is **empty** (no project registered).
**Success criteria:** registry exists, schema validated by doctor, drift check confirms `_own` contains no project content.

**HY** — Ոնց է SuperBro-ն իմանում որ project-ները կան — **registry-ն պահում է միայն metadata, երբեք project content** (B4/§4)։ Կառուցվածք՝ `memory/_own/registry.json` (+ append-only `registry-log`); ամ. entry-ն՝ վերևի դաշտերով։ **Կանոններ:** register-ը գրում է միայն registry (ոչ project ֆայլ); ուրիշ project-ի memory-ի մեջ ընկած path = **մերժվում է**; status-ի անցումները log; SuperBro-ն երբեք project content չի պատճենում `_own`։ **Մաքուր-build scope:** registry ֆայլ + schema + `SHOW REGISTRY` (live) + `REGISTER PROJECT` preview (չկատարվող); registry-ն **դատարկ է**։ **Success:** registry կա, schema doctor-validated, drift = զրո project content `_own`-ում։

---

# PART D — Cross-Cutting Systems / Լայնակի համակարգեր

## 9. Spine Release / Update System / spine release ու update համակարգ

**EN** — Versioned spine down-flow (Flow 2): SuperBro publishes an approved release; a Project Bro pulls → verifies hashes → stamps `spine_version`. **No blind copy/sync; never forced; never auto.**

**Structure:** `spine/RELEASES/v<ver>/` (release payload + `manifest` + `sha256`), `memory/_own/release-log.md` (append-only). Broadcast = an *availability signal only* (B6 — SuperBro never writes into a Bro's memory/spine).
**Contracts:** release manifest (files + hashes + version + notes); pull/verify/stamp procedure; promotion gate (§14/§10) is the only path a project lesson becomes spine.
**Gates:** cutting a release = CRITICAL, Gev-command + log + snapshot. Pull is each Bro's own action (future).
**Clean-build scope:** `RELEASES/` dir + release manifest schema + `RELEASE SPINE` preview/flow + release-log; **no Project Bro exists to pull yet**, so update execution is **FUTURE**. (Whether a v1.0.0 baseline release is cut in the clean build = open decision OD-5, §18.)

**HY** — Spine-ի տարբերակված վար-հոսք (Flow 2)․ SuperBro-ն հրապարակում է approved release; Project Bro-ն pull → hash ստուգում → `spine_version` դրոշմ։ **Ոչ կույր copy/sync; երբեք forced; երբեք auto։** Կառուցվածք՝ `spine/RELEASES/v<ver>/` (payload + manifest + sha256) + `release-log.md`։ Broadcast-ը = միայն *availability signal* (B6)։ **Gate-եր:** release կտրելը = CRITICAL, Գևի հրաման + log + snapshot։ **Մաքուր-build scope:** `RELEASES/` + release manifest schema + `RELEASE SPINE` preview/flow + release-log; **pull անող Project Bro դեռ չկա** → update կատարումը FUTURE է։ (v1.0.0 baseline release-ը մաքուր build-ում կտրվի՞ = open decision OD-5, §18)։

## 10. Memory Boundary System / memory-ի սահմանների համակարգ

**EN** — Sealed per-project memory + isolation enforcement. This is **specified here, enforced structurally in §13.**
**Rules (B2/B4/L8):** project memory flows UP as a read-only mirror; spine flows DOWN as approved release; **never cross**; SuperBro never blends; a project Bro cannot read another project's memory path; `_own` holds no project content; supermemory mirrors never merged.
**Clean-build scope:** the boundary **rules + the forbidden-path map** are defined and wired into the enforcement hooks (§13); since no project is installed, the live surface is SuperBro's own `_own`/`supermemory` isolation (mirrors empty). Project-to-project isolation is **proven later** at first install.
**Drift checks (read-only, §12):** a project memory containing another project's facts · `_own` containing project facts · a Bro able to see another project's memory path · spine containing project-specific facts · merged mirrors → all FAIL flags.

**HY** — Կնքված per-project memory + մեկուսացման կիրառում։ Այստեղ **սահմանվում է, §13-ում կառուցվածքային կիրառվում**։ **Կանոններ (B2/B4/L8):** project memory-ն ՎԵՐ read-only mirror; spine-ը ՎԱՐ approved release; **երբեք cross**; SuperBro-ն չի խառնում; project Bro-ն ուրիշ project-ի memory path չի կարդում; `_own`-ը project content չունի; mirror-ները չեն merge։ **Մաքուր-build scope:** boundary կանոնները + forbidden-path map-ը սահմանվում ու hook-երի մեջ wired են (§13); project չլինելու պատճառով live մակերեսը SuperBro-ի `_own`/`supermemory` isolation-ն է (mirror-ները դատարկ)։ Project-to-project isolation-ը **ապացուցվում է հետո**՝ առաջին install-ին։ **Drift checks**՝ վերևի FAIL-flag-երը։

## 11. Logs / Evidence System / log-եր ու evidence համակարգ

**EN** — Append-only evidence layer (D7). **Logs are evidence, not memory.**
**Structure:** Super Bro operational logs in `memory/_own/` (`sync-log · audit-log · release-log · failure-registry · authority-log · hook-blocks.log`); project-local logs in `X/bro/logs/` (future). Standard entry schema:
```txt
timestamp · actor · project · session_id · action · target · source_command · authority ·
result · files_changed · hash_before · hash_after · notes
```
**Hard rules:** **append-only** (a hook blocks Edit/delete on evidence logs); **timestamps + session_id are SCRIPT/HOOK-generated**, never typed by Bro; **no fabricated timestamps/hashes** (write `n/a` if unavailable); **git-split** — evidence logs git-tracked (tamper-evident), noise logs (session/action/errors) local + rotated.
**Companion evidence:** snapshot+checksum before critical writes (`_before/…zip` + `sha256.txt`); per-session `session_id`; a `change-requests/CR-<ts>-NNN.md` before each critical action.
**Clean-build scope:** the `_own` evidence logs + the schema + the append-only **hook contract** (§13) are built; entries begin accruing from Phase 0 (authority-log already in use).

**HY** — Append-only evidence շերտ (D7)։ **Log-երը evidence են, ոչ memory։** Կառուցվածք՝ `memory/_own/`-ի operational log-եր (sync/audit/release/failure/authority/hook-blocks) + project-local `X/bro/logs/` (future)։ Entry schema-ն՝ վերևում։ **Կոշտ կանոններ:** **append-only** (hook-ը block է Edit/delete evidence log-ի վրա); **timestamp + session_id = script/hook-generated**, ոչ Bro-ի ձեռքով; **ոչ fabricated** (չկա → `n/a`); **git-split** (evidence = git-tracked, noise = local+rotated)։ **Companion:** snapshot+checksum critical write-ից առաջ; `session_id`; `change-requests/CR-…md` ամ. critical action-ից առաջ։ **Մաքուր-build scope:** `_own` evidence log-երը + schema + append-only hook contract-ը կառուցվում են։

## 12. Doctor / Audit System / doctor ու audit համակարգ

**EN** — Read-only health & integrity checks via **real scripts that return exit codes** — flags only, **never fixes/moves/deletes** (D0/§12).
**Scripts (clean build — contracts only per Q6=A; code written at build-time):**
```txt
tools/bro-doctor    · verify skeleton + manifest + authority + spine_version integrity
tools/bro-audit     · read-only audit: drift + manifest + hash + boundary; emit findings
tools/bro-health    · generate health snapshot (memory/_own/health-dashboard.md)
tools/bro-spine-check · spine present/intact/version match
(future, project-scoped) bro-skill-check · bro-agent-test · bro-memory-leak-test · bro-sync-check
```
**Per-script contract:** purpose · inputs · outputs · **exit codes** (0=GREEN, 1=YELLOW, 2=RED, 3=CRITICAL) · what it reads · report format. **Issue codes:** SPINE_STALE · SKILL_STALE · SKILL_MISSING · AGENT_MISSING · ROUTING_BROKEN · MEMORY_LEAK_SUSPECTED · CROSS_PROJECT_CONTAMINATION · SUPER_OWN_POLLUTION · MANIFEST_MISSING · HASH_MISMATCH · SCHEMA_OLD · UNLOGGED_WRITE · AUTHORITY_MISMATCH.
**Report format:** status (GREEN/YELLOW/RED/CRITICAL) + per-check line + issue codes + "no files changed" assertion.
**Hard rule:** RED/CRITICAL **never changes files** — flags only.
**Clean-build scope:** doctor · audit · health · spine-check run against SuperBro itself (skeleton + manifest + `_own` isolation). Project-scoped checks = FUTURE.

**HY** — Read-only health/integrity ստուգումներ՝ **exit-code վերադարձնող real script-երով** — միայն flag, **երբեք fix/move/delete** (D0/§12)։ Script-երը (մաքուր build, Q6=A = միայն contract)՝ վերևում (doctor · audit · health · spine-check live; skill/agent/memory-leak/sync = future)։ **Per-script contract:** purpose · inputs · outputs · **exit code** (0=GREEN, 1=YELLOW, 2=RED, 3=CRITICAL) · ինչ է կարդում · report format։ **Issue code-եր**՝ վերևի ցանկը։ **Կոշտ կանոն:** RED/CRITICAL-ը **երբեք ֆայլ չի փոխում**։ **Մաքուր-build scope:** doctor/audit/health/spine-check աշխատում են SuperBro-ի վրա; project-scoped-ը = FUTURE։

## 13. Hooks / Enforcement Plan / hook-եր ու enforcement պլան

**EN** — The **structural wall** (D5/§11/B5) — critical gates are NOT markdown; they are Claude Code hooks + scripts + exit codes. **Contracts only now (Q6=A); code at build-time.** **Phase-0 proof requirement: a forbidden action must be DEMONSTRATED blocked, not assumed.**

**Hook contracts (in `.claude/settings.json`):**
```txt
PreToolUse · forbidden-path-write-guard
  blocks: Write/Edit to forbidden paths (e.g. another project's memory; _own project-content; logs except append-script)
  inputs: tool call + target path + Gev-command flag   outputs: allow | DENY+message   exit: 0 allow / non-0 deny
PreToolUse · cross-memory-read-guard
  blocks: Read of another project's memory path while scoped to a different project
  inputs: tool call + path + current project scope     outputs: allow | DENY+message   exit: 0 / non-0
PreToolUse · critical-command-gate
  blocks: build · push · migrate · delete · release · promote · lock unless a Gev-command flag is present
  inputs: command + Gev-authority flag                 outputs: allow | DENY+message   exit: 0 / non-0
PreToolUse · log-append-only-guard
  blocks: Edit/delete on evidence log files (append via script only)
  inputs: tool call + target log path                  outputs: allow | DENY+message   exit: 0 / non-0
SessionStart · preflight-printer
  prints: current project · allowed memory · forbidden paths · spine version · "critical needs Gev" · cross-project OFF
  inputs: session context                              outputs: printed pre-flight banner   exit: 0
```
**Report format (hook block):** a `hook-blocks.log` entry (schema §11) with `result: BLOCKED`, target, source_command, authority=hook.
**Clean-build scope:** all five hook **contracts** specified; in the build phase they are installed and **proven** (try a forbidden write → it is denied by exit code). Project-to-project read-block is proven once a second scope exists (first install) but the mechanism is built + unit-proven on SuperBro paths.

**HY** — **Կառուցվածքային պատը** (D5/§11/B5) — critical gate-երը markdown չեն; Claude Code hook + script + exit code են։ **Հիմա միայն contract (Q6=A); կոդը build-ին։** **Phase-0 proof:** արգելված action-ը պետք է ԱՊԱՑՈՒՑՎԻ որ block է, ոչ ենթադրվի։ Հինգ hook-ի contract-ները՝ վերևում (forbidden-path-write · cross-memory-read · critical-command-gate · log-append-only · SessionStart preflight)։ **Report format:** `hook-blocks.log` entry՝ `result: BLOCKED`։ **Մաքուր-build scope:** հինգ contract-ը սահմանվում; build phase-ին install + **ապացուցվում** (արգելված write փորձ → deny exit-code-ով)։ Project-to-project read-block-ը ապացուցվում է երկրորդ scope-ի դեպքում (առաջին install), բայց մեխանիզմը SuperBro path-երի վրա build + unit-proven է։

---

# PART E — Governance & Tools / Կառավարում ու գործիքներ

## 14. Discovery Bank Handling / Discovery Bank-ի մշակում

**EN** — Decision recorded, **physical promotion postponed (Q7=A).**
- **What it is:** a domain-agnostic Discovery Question Bank, a **spine-level tool** for D8/D9 (select-subset, never dump).
- **Decision:** it is **designated** spine-level and will live as a **local spine copy** in each Bro (`…/spine/DISCOVERY_QUESTION_BANK.md`), reached only via the local spine — never by reading EP's copy (B4).
- **Postponed:** the **physical promotion/copy into the spine is a build-time, Gev-gated action — NOT done in the clean build.** Until promoted, no Bro is wired to read EP's copy. Promotion (when commanded) goes through the Promotion Gate (§10) and a spine release (§9).
- **Clean-build scope:** describe handling + decision only (this section); zero file movement.

**HY** — Որոշումը գրանցված, **ֆիզիկական promotion-ը հետաձգված (Q7=A)։** Ինչ է՝ domain-agnostic Discovery Question Bank, **spine-level գործիք** D8/D9-ի (select-subset, երբեք dump)։ Որոշում՝ **designated** spine-level, ապրելու է **local spine copy** ամ. Bro-ում, հասանելի միայն local spine-ով — երբեք EP-ի copy կարդալով (B4)։ Հետաձգված՝ **ֆիզիկական promotion/copy-ն build-time, Gev-gated action է — մաքուր build-ում ՉԻ արվում**։ Մինչ promotion՝ ոչ մի Bro չի wired EP-ի copy կարդալու։ Promotion-ը (հրամայվելիս) անցնում է Promotion Gate (§10) + spine release (§9)։ **Մաքուր-build scope:** միայն նկարագրել մոտեցումն ու որոշումը; զրո ֆայլ տեղափոխում։

## 15. Approval Gates / հաստատման gate-եր

**EN** — The Gev-gated critical-action list (D0/§8). **Allowed autonomously (observe only):** health/version/skill-freshness check · memory-leak scan · drift detection · report · stale warning · quarantine-candidate FLAG (no file moved). **Requires Gev's explicit command:** write · repair · quarantine-move · migrate · delete · merge · promote-to-spine · release-spine · change-authority · cross-project memory · **push** · lock · build. **Stale-Bro rule:** stale → discussion allowed with warning; **write/build/lock BLOCKED.** **Push policy (§8A):** PUSH is a critical action for this governance repo (Gev-command only); the GAA push delegation (2026-06-25) remains a **scoped exception**, not a universal rule.

**HY** — Gev-gated critical-action ցանկը (D0/§8)։ **Ինքնավար թույլատրված (միայն դիտել):** health/version/skill-freshness check · memory-leak scan · drift detection · report · stale warning · quarantine-candidate FLAG (ոչ ֆայլ շարժած)։ **Գևի բացահայտ հրաման է պահանջում:** write · repair · quarantine-move · migrate · delete · merge · promote-to-spine · release-spine · change-authority · cross-project memory · **push** · lock · build։ **Stale-Bro:** stale → քննարկում՝ warning-ով; **write/build/lock BLOCKED**։ **Push (§8A):** PUSH = critical action այս repo-ի համար; GAA delegation-ը **scoped exception** է։

## 16. Forbidden Actions / արգելված գործողություններ

**EN** — Absolute don'ts encoded into the roadmap (hold for the whole build until Gev explicitly lifts each):
- **No auto-build** — no phase runs without Gev's explicit command.
- **No project folder touch in the clean build** — EP/DB/GAA/IP untouched until rollout, behind palette + preview + YES.
- **No cross-project memory** — no reading/mixing/mentioning another project's memory (L8/B4).
- **No auto-push / no auto-release / no auto-promote** — each is Gev-gated.
- **No blind sync** — spine moves only via publish → pull → verify → stamp.
- **No fabricated timestamps/hashes** — script/hook-generated or `n/a`.
- **No log rewriting** — evidence logs append-only (edit/delete = Gev command only).
- **No self-granted authority** — BRO_HOME/authority change is a Gev-gated critical action.
- **No Discovery Bank movement** — physical promotion postponed/Gev-gated.

**HY** — Բացարձակ don't-եր roadmap-ում (պահվում են ամբողջ build-ի ընթացքում մինչ Գևը բացահայտ չվերցնի)․ **ոչ auto-build** · **ոչ project folder դիպչել մաքուր build-ում** (EP/DB/GAA/IP անձեռնմխելի մինչ rollout, palette+preview+YES-ի հետևում) · **ոչ cross-project memory** (L8/B4) · **ոչ auto-push/release/promote** (ամ. Gev-gated) · **ոչ կույր sync** (publish→pull→verify→stamp) · **ոչ fabricated timestamp/hash** (script-generated կամ `n/a`) · **ոչ log վերագրում** (append-only) · **ոչ ինքնաշնորհ authority** (BRO_HOME change = Gev-gated) · **ոչ Discovery Bank շարժում** (հետաձգված/Gev-gated)։

---

# PART F — Rollout & Sequencing / Տեղակայում ու հաջորդականություն

## 17. Future Project Bro Rollout Model / ապագա Project Bro rollout մոդել

**EN** — How EP/DB/GAA/IP get Bros **LATER** — designed now (Q8=A), executed never in the clean build.
**Flow (all behind palette + preview + explicit YES + Gev authority):**
```txt
1) REGISTER PROJECT       → write registry entry only (no project files)        [preview→YES]
2) INSTALL PROJECT BRO    → create X/bro skeleton from template (§7) + pull spine release [preview→YES]
3) UPDATE PROJECT BRO SPINE → pull approved release → verify hashes → stamp spine_version [preview→YES]
4) RUN DOCTOR / RUN PROJECT AUDIT → read-only health + boundary checks               [read-only]
5) RELEASE SPINE          → SuperBro cuts approved release (Gev-gated)               [preview→YES]
6) PROMOTE SKILL          → project lesson → Promotion Gate → spine (Gev-gated)      [preview→YES]
7) CROSS-PROJECT AUDIT    → Gev-opened, read-only, scoped, exit-logged              [Gev-gated]
```
**Rule:** projects are installed **one at a time**, each its own preview→YES; first install also **proves project-to-project isolation** (a forbidden cross-memory read is demonstrated blocked).
**Clean-build scope:** the commands, inputs, previews, and order are **specified + palette-wired**; **no install/migration/registration is executed.**

**HY** — Ոնց են EP/DB/GAA/IP-ն Bro ստանում **ՀԵՏՈ** — հիմա նախագծվում (Q8=A), մաքուր build-ում երբեք չկատարվող։ Flow-ը (ամենքը palette+preview+բացահայտ YES+Gev authority-ի հետևում)՝ վերևում (REGISTER → INSTALL → UPDATE SPINE → DOCTOR/AUDIT → RELEASE SPINE → PROMOTE SKILL → CROSS-PROJECT AUDIT)։ **Կանոն:** project-ները install են **մեկ առ մեկ**, ամ. մեկն իր preview→YES-ով; առաջին install-ը նաև **ապացուցում է project-to-project isolation-ը**։ **Մաքուր-build scope:** command-ները, input-ները, preview-ները, հերթը **սահմանված + palette-wired** են; **ոչ install/migration/registration չի կատարվում։**

## 18. Risks & Open Decisions / ռիսկեր ու բաց որոշումներ

**EN** — Collected so nothing slips into build unresolved. Each needs Gev before the phase it touches.

**Open decisions (need Gev):**
- **OD-1 Spec reconciliation** — apply the §2 correction into canonical spec §17/D6/§19#5 (separate Gev-gated edit). *Recommend: yes, after this roadmap is accepted.*
- **OD-2 SuperBro path/name** — keep `Desktop\Bro` (spec §16 preference) or introduce `Desktop\SuperBro` later? *Recommend: keep `Desktop\Bro` for stability; rename only if Gev decides.*
- **OD-3 First-run authority status** — `bro.home.json` + verifier already exist locally; confirm whether Phase 0 re-verifies or treats authority as `current`. *Recommend: doctor verifies on Phase 0 start; no re-bootstrap unless missing.*
- **OD-4 Palette runtime form** — Bro-session-driven menu (Bro presents/asks) vs a standalone script/TUI. *Recommend: Bro-session menu backed by real scripts for side-effect actions; finalize form in the palette phase.*
- **OD-5 Baseline spine release** — cut a `v1.0.0` baseline release in the clean build, or defer until a Project Bro needs to pull? *Recommend: define the release system now; cut `v1.0.0` only when first install needs it.*

**Risks (manage during build):**
- **R-1 Hook false-trips** — Claude Code guards can mis-fire (known: Remove-Item guard trips near `/` or `*`). *Mitigate: test hooks in isolation; use safe path patterns.*
- **R-2 Authority split via sync** — portable BRO_HOME + Syncthing/Tailscale can break authority. *Mitigate: explicit `bro.home.json`; authority change is Gev-gated + logged.*
- **R-3 Scope creep into projects** — accidental project touch. *Mitigate: forbidden-path hook + zero-touch rule + §16.*
- **R-4 Over-design before proof** — building project-scoped features before Phase-0 proof. *Mitigate: phase gates; prove enforcement first.*

**HY** — Հավաքված, որ ոչինչ չմտնի build՝ չլուծված։ **Բաց որոշումներ (Գև է պետք):** OD-1 spec հաշտեցում (հետո, roadmap-ի ընդունումից) · OD-2 path/name (խորհուրդ՝ պահել `Desktop\Bro`) · OD-3 first-run authority (խորհուրդ՝ doctor verify, ոչ re-bootstrap) · OD-4 palette runtime (խորհուրդ՝ Bro-session menu + real script side-effect-ի համար) · OD-5 baseline release (խորհուրդ՝ system հիմա, `v1.0.0` երբ առաջin install-ին պետք գա)։ **Ռիսկեր:** R-1 hook false-trip (test isolation-ում) · R-2 authority split sync-ից (explicit `bro.home.json`) · R-3 scope creep project-ներ (forbidden-path hook + zero-touch) · R-4 over-design proof-ից առաջ (phase gate-եր, նախ enforcement proof)։

## 19. Final Build Phases / վերջնական build phase-եր

**EN** — The gated execution sequence. **No phase runs without Gev's explicit command; no phase auto-advances.** Each phase: scope · deliverables · success criteria (PROVEN) · Gev gate.

**Phase 0 — Foundation & Authority (clean SuperBro skeleton).**
- *Scope:* create the SuperBro `_own`/`supermemory`(empty)/`_quarantine`/`tools`/`spine/RELEASES`/`change-requests`/`_before`/`logs` skeleton (§6); SuperBro `bro.manifest.json`; verify §15 authority.
- *Deliverables:* skeleton + manifest + authority `current` + first log entries.
- *Success (PROVEN):* doctor GREEN on skeleton · manifest real & validated · `_own` holds registry/logs only (drift = zero project content) · **no project folder touched.**
- *Gate:* Gev reviews → command to proceed to Phase 1.

**Phase 1 — Guided Command / Command Palette + Command Library.**
- *Scope:* palette runner + command library catalog (§4/§5); read-only commands live; critical/future commands defined + preview-wired (execution gated).
- *Deliverables:* working palette; library entries for the starter set; drafted previews.
- *Success:* Gev runs SHOW REGISTRY/HEALTH/DOCTOR/AUDIT via palette · a critical command shows preview and **refuses without YES** · a vague command never triggers a critical action.
- *Gate:* Gev → Phase 2.

**Phase 2 — Enforcement + Evidence + Doctor/Audit (PROVEN).**
- *Scope:* install the five hook contracts (§13); append-only evidence logs (§11); doctor/audit/health/spine-check scripts (§12).
- *Deliverables:* hooks live; logs accruing; scripts returning exit codes.
- *Success (PROVEN):* a forbidden write is **demonstrated blocked** (exit code) · a log Edit/delete is blocked · SessionStart pre-flight prints · audit reports **without writing** · timestamps script-generated.
- *Gate:* Gev → Phase 3. **This is the keystone proof phase (D5).**

**Phase 3 — Registry + Project Bro Template + Rollout Commands (design/dry, no install).**
- *Scope:* registry system live (§8); Project Bro template specified (§7); rollout commands wired with preview→YES in **dry/preview mode** (§17) — **no project installed.**
- *Deliverables:* empty registry + schema; template; REGISTER/INSTALL/UPDATE previews that execute nothing.
- *Success:* registry validated by doctor · REGISTER PROJECT preview works in dry mode · INSTALL PROJECT BRO preview shows the plan but **executes nothing** · drift confirms `_own` has no project content.
- *Gate:* Gev → Phase 4.

**Phase 4 — Spine Release / Update System + Promotion Gate.**
- *Scope:* spine release publish + pull/verify/stamp procedure + promotion gate workflow (§9/§10).
- *Deliverables:* `RELEASES/` + release manifest schema + RELEASE SPINE flow + promotion-gate workflow + release-log.
- *Success:* a release can be cut (Gev-gated, logged) · the pull/verify/stamp procedure is specified & testable · promotion gate **blocks** unapproved spine entry · (OD-5) baseline release cut only if commanded.
- *Gate:* Gev declares **clean SuperBro GREEN** → clean build complete.

**Postponed — explicitly NOT in the clean build (later phases, separate Gev commands):**
- Project Bro installs (EP/DB/GAA/IP) · Discovery Bank physical promotion · cross-project mode activation · spine v2 content · project memory migration.

**HY** — Gated կատարման հաջորդականություն։ **Ոչ մի phase չի աշխատում առանց Գևի բացահայտ հրամանի; ոչ մի phase ինքն իրեն չի առաջ գնում։** Ամ. phase՝ scope · deliverable · success (ԱՊԱՑՈՒՑՎԱԾ) · Gev gate։
- **Phase 0 — Foundation & Authority:** SuperBro skeleton + manifest + authority (§6/§15)։ Success՝ doctor GREEN, manifest real, `_own` = միայն registry/logs, **ոչ project դիպած**։
- **Phase 1 — Command Palette + Library:** palette + catalog (§4/§5)։ Success՝ read-only command-ները palette-ով, critical-ը preview ցույց + **YES-ից առանց մերժում**։
- **Phase 2 — Enforcement + Evidence + Doctor/Audit (ԱՊԱՑՈՒՑՎԱԾ):** 5 hook + append-only log + script-եր (§13/§11/§12)։ Success՝ արգելված write **ապացուցված block**, log edit block, SessionStart pre-flight, audit առանց write։ **Keystone proof phase (D5)։**
- **Phase 3 — Registry + Template + Rollout (dry):** registry live, template spec, rollout preview-ներ՝ **ոչ install** (§8/§7/§17)։ Success՝ registry validated, REGISTER/INSTALL preview **ոչինչ չկատարող**։
- **Phase 4 — Spine Release + Promotion Gate:** publish + pull/verify/stamp + promotion gate (§9/§10)։ Success՝ release կտրվող (Gev-gated), promotion gate **block** անող unapproved-ը։ Gate՝ Գևը հայտարարում է **clean SuperBro GREEN**։
- **Հետաձգված (ՈՉ մաքուր build-ում):** Project Bro install-եր · Discovery Bank promotion · cross-project mode · spine v2 · memory migration։

---

## 20. Acceptance Checklist (Gev × GPT × Bro) / ընդունման ստուգաթերթ

**EN** — Tick before this roadmap is "accepted to build from." Review is 3-way (Gev × GPT × Bro).
```txt
[ ] D0/L0 Gev Root Authority stated first and honored throughout.
[ ] Clean-Build Correction present & clear (first build = clean SuperBro only; not EP pilot).
[ ] Spec reconciliation proposed (not executed) for canonical §17/D6/§19#5.
[ ] Command Palette included as MANDATORY PRE-BUILD scope (§4).
[ ] Command Library: schema + starter commands + interaction/preview wording drafted (§5).
[ ] SuperBro core build defined (skeleton + manifest + authority) (§6).
[ ] Project Bro template defined (not installed) (§7).
[ ] Project registry system defined; registry empty in clean build (§8).
[ ] Spine release/update system defined (Flow 2; pull/verify/stamp) (§9).
[ ] Memory boundary system defined (B2/B4/L8) (§10).
[ ] Logs/evidence system defined (append-only, script-timestamps, git-split) (§11).
[ ] Doctor/audit system defined (real scripts, exit codes, flags only) (§12).
[ ] Hooks/enforcement plan defined (contracts only) + Phase-0 PROOF requirement (§13).
[ ] Discovery Bank: handling/decision described, physical promotion POSTPONED (§14).
[ ] Approval gates listed (Gev-gated critical actions) (§15).
[ ] Forbidden actions listed (§16).
[ ] Future Project Bro rollout commands designed (not executed) (§17).
[ ] Risks & open decisions captured with recommendations (§18).
[ ] Final build phases: gated, with PROVEN success criteria (§19).
[ ] Depth = build-ready, NO code, NO build in this document (Q1/Q6).
[ ] Document type = phased plan + per-component spec (Q2).
[ ] No project folder touched · no hooks installed · no push by writing this roadmap.
[ ] Bilingual (EN + HY) throughout (L0).
[ ] Final LOCK requires Gev "BUILD".
```

**HY** — Նշիր նախքan այս roadmap-ը «build-ից ընդունված» համարելը։ Review-ն 3-way է (Gev × GPT × Bro)։ Ստուգաթերթը՝ վերևի անգլերեն block-ում (նույն կետերը)․ D0/L0 առաջին · Clean-Build Correction · spec reconciliation առաջարկ · Command Palette mandatory · Command Library full · SuperBro core · Project Bro template · registry · spine release · memory boundary · logs/evidence · doctor/audit · hooks + Phase-0 proof · Discovery Bank հետաձգված · approval gates · forbidden actions · rollout designed · risks/open decisions · build phases gated · build-ready ոչ-կոդ · bilingual · final LOCK = Գևի «BUILD»։

## 21. Final Formula / վերջնական բանաձև

```txt
Clean SuperBro first → prove the factory + the gates + the operator control layer on empty ground →
then, one at a time, behind preview → YES, install the Project Bros.
No build, no project touch, no push — until Gev says so.
```
```txt
Մաքուր SuperBro առաջինը → ապացուցիր factory-ն + gate-երը + operator-ի control շերտը դատարկ հողի վրա →
հետո, մեկ առ մեկ, preview → YES-ի հետևում, install արա Project Bro-ները։
Ոչ build, ոչ project դիպչել, ոչ push — մինչ Գևը չասի։
```

---

**LOCK STATUS — 🌱 PROPOSED ROADMAP · drafted by Bro 2026-06-29 · hybrid (phased + per-component spec) · build-ready depth · NO code · NO build · NO project folder touched · awaiting Gev × GPT × Bro review and Gev's explicit "BUILD".**
*LOCK STATUS — 🌱 ԱՌԱՋԱՐԿՎԱԾ ROADMAP · կազմված Bro-ի կողմից 2026-06-29 · hybrid · build-ready · ՈՉ կոդ · ՈՉ build · ՈՉ project folder դիպած · սպասում է Gev × GPT × Bro review-ին ու Գևի բացահայտ «BUILD»-ին։*
