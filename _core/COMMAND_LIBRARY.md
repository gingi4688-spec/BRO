# COMMAND LIBRARY — Guided Command Palette catalog / Հրամանների գրադարան

> **EN:** The maintained catalog behind SuperBro's Guided Command Palette (§6B / D10; roadmap §4–§5). This `.md`
> is the human-readable SSOT; `tools/command-library.json` is its machine mirror that `tools/bro-palette.ps1`
> reads. **READ-ONLY commands are live in the clean build; CRITICAL/FUTURE commands are preview-wired but
> execution-gated.** Behavior contract: **menu → collect inputs → preview → explicit `YES` → run**; default
> read-only; critical never runs from a vague command; recommend the next safe command; STOP if scope is ambiguous (D0).
>
> **HY:** SuperBro-ի Guided Command Palette-ի հետևի պահվող catalog-ը (§6B / D10; roadmap §4–§5)։ Այս `.md`-ն
> human-readable SSOT է; `tools/command-library.json`-ը machine mirror, որ կարդում է `tools/bro-palette.ps1`-ը։
> **READ-ONLY-ները live են մաքուր build-ում; CRITICAL/FUTURE-ները preview-wired են բայց execution-gated։**
> Վարք՝ **menu → input → preview → բացահայտ `YES` → run**; default read-only; critical-ը երբեք vague command-ից;
> առաջարկիր հաջորդ ապահով command-ը; STOP երբ scope-ը երկիմաստ է (D0)։

---

## Entry schema / Entry-ի schema

```txt
name · purpose · category(READ-ONLY|CRITICAL) · required_inputs · safe_default · criticality(LOW|MED|HIGH|CRITICAL) ·
requires_gev(YES|NO) · mode(READ|WRITE) · files_affected · preview_shown · rollback_backup · report_format ·
availability(CLEAN-BUILD | PHASE-N | LIVE | ROLLOUT-GATED | RUNTIME | FUTURE) · backing(script/hook — contract only)
```

**Availability legend / availability-ի բացատրություն:** `CLEAN-BUILD` = live read-only since the clean build · `PHASE-N` = live since that phase (all phases shipped → live now) · `LIVE` = read-only, live now, operates on an INSTALLED project · `ROLLOUT-GATED` = critical, live; real execution needs `-Execute -Yes BRO_GEV_APPROVED=1`, the palette previews/DRY only · `RUNTIME` = finished-SuperBro command · `FUTURE` = designed, default OFF, opens only by explicit Gev command։

---

## Command table / Command-ների աղյուսակ

| name | category | requires_gev | mode | availability | purpose (EN / HY) |
|---|---|---|---|---|---|
| **HELP / SHOW COMMANDS** | READ-ONLY | NO | READ | CLEAN-BUILD | list commands + what's safe / թվարկել command-ները |
| **SHOW REGISTRY** | READ-ONLY | NO | READ | CLEAN-BUILD | show registered projects (none yet) / ցույց տալ registry-ն |
| **SHOW HEALTH** | READ-ONLY | NO | READ | CLEAN-BUILD | print last health snapshot / health snapshot-ը |
| **RUN DOCTOR** | READ-ONLY | NO | READ | CLEAN-BUILD | skeleton/manifest/authority self-check / self-check |
| **RUN AUDIT** | CRITICAL | NO | READ | PHASE-2 | read-only audit + topist seal, flags only / read-only audit |
| **REVIEW QUARANTINE** | CRITICAL | NO | READ | PHASE-2 | list quarantine candidates (flags) / candidate-ները |
| **RUN PROJECT AUDIT** | CRITICAL | NO | READ | LIVE | audit one INSTALLED project (read-only) / project audit |
| **VERIFY PROJECT BRO** | CRITICAL | NO | READ | LIVE | fail-closed project doctor + no-self-evolution (L10) / verify |
| **RELEASE SPINE** | CRITICAL | YES | WRITE | PHASE-4 | publish a spine release (v1.0.0 cut) / spine release |
| **START BUILD** | CRITICAL | YES | WRITE | RUNTIME | begin an approved build phase / approved build |
| **REGISTER PROJECT** | CRITICAL | YES | WRITE | ROLLOUT-GATED | register a project (metadata only) / register |
| **INSTALL PROJECT BRO** | CRITICAL | YES | WRITE | ROLLOUT-GATED | install X/bro from template / install |
| **UPDATE PROJECT BRO SPINE** | CRITICAL | YES | WRITE | ROLLOUT-GATED | pull approved release into X/bro / spine update |
| **ROLLBACK PROJECT BRO** | CRITICAL | YES | WRITE | ROLLOUT-GATED | undo a failed install (removes X\bro only) / rollback |
| **RETIRE PROJECT** | CRITICAL | YES | WRITE | ROLLOUT-GATED | status → RETIRED (metadata only) / retire |
| **PROMOTE SKILL** | CRITICAL | YES | WRITE | PHASE-4 | promote a lesson to spine (Promotion Gate) / promote |
| **CROSS-PROJECT AUDIT** | CRITICAL | YES | READ | FUTURE | Gev-opened read-only cross-project review / cross-project |
| **EXIT** | READ-ONLY | NO | READ | CLEAN-BUILD | leave the palette / դուրս գալ |

> **Live read-only set / live read-only հավաքածու:** `HELP · SHOW REGISTRY · SHOW HEALTH · RUN DOCTOR · RUN AUDIT · REVIEW QUARANTINE · RUN PROJECT AUDIT · VERIFY PROJECT BRO · EXIT` run from the menu (read-only).
> **WRITE/critical commands** show a **preview**; `ROLLOUT-GATED` ones run a **DRY** backing in the menu (execute nothing) — real execution requires `-Execute -Yes BRO_GEV_APPROVED=1` outside the menu; others are gated. **The palette NEVER bypasses a gate.** /
> READ-live-ները run են; WRITE/critical-ները preview; `ROLLOUT-GATED`-ները menu-ում DRY (real = explicit Gev-flags); palette-ը ԵՐԲԵՔ gate չի bypass անում։

---

## Behavior contract (every guided command) / վարքի contract

**EN:** default read-only · critical always needs full preview + `YES` · no critical action from a vague command ·
preview → `YES` → run (cancel on anything else) · recommend the next safe command · explain consequences in plain
language · **STOP if scope is ambiguous** (D0 emergency STOP) · every run → a log entry (§13A); every critical write →
snapshot + change-request.

**HY:** default read-only · critical-ը միշտ՝ լրիվ preview + `YES` · ոչ մի critical action vague command-ից ·
preview → `YES` → run (cancel ամ. ուրիշ բանից) · առաջարկիր հաջորդ ապահով command-ը · բացատրիր հետևանքները ·
**STOP երբ scope-ը երկիմաստ է** (D0) · ամ. run → log entry (§13A); ամ. critical write → snapshot + change-request։

---

## Fully-expanded examples / Լրիվ բացված օրինակներ

```txt
RUN DOCTOR   (live, read-only)
  purpose: verify SuperBro skeleton + manifest + verify-only authority + spine integrity
  category: READ-ONLY · criticality: LOW · requires_gev: NO · mode: READ · availability: CLEAN-BUILD
  required_inputs: none (safe_default = check SuperBro self)
  files_affected: reads bro.home.json, bro.manifest.json, memory/_own/*, spine/ ; writes none
  preview_shown: "Doctor will READ skeleton + manifest, write nothing. Continue?"
  rollback_backup: n/a (read-only)
  report_format: GREEN/YELLOW/RED/CRITICAL + per-check line + exit code
  backing: tools/bro-doctor.ps1

REGISTER PROJECT   (ROLLOUT-GATED — live; palette previews/DRY, real execution is Gev-gated)
  purpose: add a project to the registry so a Project Bro can later be installed
  category: CRITICAL · criticality: HIGH · requires_gev: YES · mode: WRITE · availability: ROLLOUT-GATED
  required_inputs: project_id, project_path, memory_scope, authority (prompted + validated)
  safe_default: none (must be explicit) · refuses a path inside another project's memory (B4) AND a duplicate id
  files_affected: writes memory/_own/registry.json (metadata only) after a _before snapshot; touches NO project content
  preview_shown: project_id · path · scope · authority · "DRY in the menu; real needs -Execute -Yes BRO_GEV_APPROVED=1"
  rollback_backup: registry snapshot _before/registry-<ts>.json (taken on every real write)
  report_format: previewed plan + DRY/real result + next safe command
  backing: tools/bro-register.ps1 (palette runs DRY; real execution = Gev-gated flags; -Retire is the retire lifecycle)

VERIFY PROJECT BRO   (LIVE — read-only; runs from the menu for an installed project)
  purpose: fail-closed verification of one INSTALLED Project Bro against registry + pulled spine release
  category: CRITICAL · criticality: MED · requires_gev: NO · mode: READ · availability: LIVE
  files_affected: reads project metadata + manifest + spine hashes + hook inventory; NEVER sealed memory content
  report_format: GREEN/YELLOW/RED + 392/392 hash verify + isolation + no-self-evolution (L10) assertion
  backing: tools/bro-project-doctor.ps1
```

---

*EN: Gev picks from the menu; SuperBro previews; nothing critical runs without an explicit `YES` and Gev's authority.*
*HY: Գևն ընտրում է menu-ից; SuperBro-ն preview անում; ոչ մի critical բան չի վազում առանց բացահայտ `YES`-ի ու Գևի authority-ի։*
