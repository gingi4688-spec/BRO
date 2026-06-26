# BRO SKILLS — GOD-LEVEL BUILD STYLE GUIDE (v7_6) — LOCKED

> EN: This is the single binding contract for rebuilding every skill to god-level. Bro is the builder + final owner now (no external builder). Each skill is upgraded IN PLACE on its v7_6 copy. Preserve the strong cores; rebuild the thin/templated shell; add the missing domain depth. Quality bar = top-level, no filler, real domain depth, native bilingual EN+HY, honest facts, no project scars. Every downstream build agent MUST follow this exactly.
>
> HY: Սա ամեն skill-ը god-level սարքելու միակ պարտադիր պայմանագիրն է։ Bro-ն builder-ն ու վերջնական տերն է հիմա։ Ամեն skill-ը upgrade-վում է իր v7_6 copy-ի վրա՝ տեղում։ Ուժեղ միջուկը պահի՛ր, բարակ/template կեղևը վերակառուցի՛ր, պակասող domain-խորությունն ավելացրու՛։ Որակի նշաձող՝ թոփ, ոչ լցոնում, իրական domain-խորություն, native երկլեզու EN+HY, ազնիվ փաստեր, ոչ project-scar։

---

## 0. THE 6 SYSTEMATIC FIXES (apply to EVERY skill, every file)

1. **Thicken SKILL.md** — it is currently a thin 6-step "Operating sequence" + file list. Replace with a domain-DENSE file (see §1.1): 8–15 real decision rules, 8–12 domain-sharp failure modes, domain acceptance criteria, a domain quality bar. ~120–220 lines of real bilingual content.
2. **Kill the broken "Operating principle" run-on** in manual.md. Today it splices truncated mechanism fragments mid-sentence (e.g. `"Severity = impact × confidence, not."`, `"Metrics,,"`, `"A PRD should define problem, users,."`). Rewrite as real native prose in BOTH languages.
3. **De-shell worked-example.md** — replace the generic "Why this passes" noun-swap shell ("It builds a <Domain> artifact rather than stopping at advice…") with a rationale tied to THIS answer's actual moves, numbers, and decisions. Keep/strengthen the senior answer body.
4. **De-shell red-team-gate.md** — replace the generic "Reviewer questions" noun-swap shell with domain-specific reviewer probes that test this skill's real failure modes.
5. **Domain-shape output-templates.md** — replace the byte-identical generic "Mechanism-first artifact / Critique" form with 2–3 templates built from THIS skill's real artifacts and fields.
6. **Reconcile EN ↔ HY + expand evals** — manual decision rules currently diverge between EN and HY (different content). Pick the sharper version and mirror BOTH ways to equal load (L0). Expand tests/eval-prompts.md from 3 to 8–10, each with correct per-prompt checks.

PLUS add the two missing files per skill: **OWNER_NOTES.md** and **tests/red-team-prompts.md**. PLUS fill every required §4.11 domain topic for that skill (supplied per skill).

---

## 1. THE TARGET 9+2 FILE SHAPE (per skill folder)

Keep the clean flat shape. Every skill folder has exactly these files, all at god-level:

### 1.1 `SKILL.md` (domain-DENSE, always-loaded)
Frontmatter: `name`, `description` (full EN routing trigger + one-line HY summary — the description field is L0-exempt per OPERATING_PROTOCOL §5). Then body, bilingual `## English` / `## Հայերեն`, equal load:
- `# <Skill Name> / <Հայերեն անունը>`
- **Scope / Շրջանակ** — one specific bilingual line (what's in, what's out).
- **Leads / Supports / Առաջատար / Աջակից** — when lead vs support + the cross-skill conflict rules involving this skill (e.g. pricing → coordinate with finance).
- One-line pointer: apply `../../shared/OPERATING_PROTOCOL.md` before answering.
- **Decision rules / Որոշման կանոններ** — **8–15** fast, concrete, bilingual "when X → do Y" rules, pulled up from the manual so they are always in context.
- **Failure modes to prevent / Ձախողման ձևեր** — **8–12** DOMAIN-SHARP, bilingual, each a real named trap with the tell (not generic).
- **Acceptance criteria / Ընդունման չափանիշ** — domain-specific, testable, bilingual; include a verify-in-the-running-system gate where relevant.
- **Domain quality bar / Որակի նշաձող** — the 3–5 dimensions this skill's output is scored on (mirror domain-rubric.md).
- **Deep dive & assets** — pointers to manual.md, patterns.md, domain-rubric.md, output-templates.md, red-team-gate.md, worked-example.md, tests/, OWNER_NOTES.md.
- **Dual-use / safety skills**: inline the refuse/authorization (or human-review routing) gate + a worked refusal/routing example INSIDE SKILL.md (offensive-security, people-org, legal). red-team-gate.md only extends it.

### 1.2 `manual.md` (the deep operating manual)
- `## English` then `## Հայերեն`, equal-load native.
- Fix the broken **Operating principle** into real prose.
- **Mechanism reference** — KEEP (it is the verified-strong core); extend with any required §4.11 mechanism.
- **Decision rules** — 8–15, domain-real, IDENTICAL content EN and HY.
- **Failure-repair playbook** — 8–12 domain-specific repairs (not the generic 3-line shell). EN and HY identical content.
- Add all required §4.11 domain sections.
- Armenian native: correct `․` (միջակետ for enumeration/explanation) vs `։` (verjaket full stop), `«»`, `-ը/-ն`, no homoglyphs; keep true tech tokens in English.

### 1.3 `patterns.md`
- 4–6 canonical domain patterns (keep the strong 3, add to cover the domain). Each: **Trigger / Mechanism / Do-not-use-when / Failure-repair**. Bilingual equal-load.

### 1.4 `domain-rubric.md`
- 5 domain dimensions, concrete 1/3/5 anchors, bilingual. (Most are already good — keep/upgrade, do not regress.)

### 1.5 `worked-example.md`
- Senior answer body with real numbers/specifics (keep/strengthen). Add a SECOND worked example where §4.11 requires one.
- Replace generic "Why this passes" with a DOMAIN-SPECIFIC rationale tied to this answer's moves. Bilingual.

### 1.6 `output-templates.md`
- 2–3 DOMAIN-SHAPED templates using this skill's real artifacts/fields (e.g. devops: SLO sheet / canary plan / postmortem; finance: 3-statement / valuation; legal: redline table / control-map). Bilingual.

### 1.7 `red-team-gate.md`
- Real domain failure/refusal cases (keep + extend). Replace generic "Reviewer questions" with domain-specific reviewer probes. Bilingual.

### 1.8 `tests/eval-prompts.md`
- **8–10** domain prompts, each with CORRECT per-prompt expected checks (no copy-paste; each tests what that prompt exercises). Include the §4.11-required eval prompts + a safety/refusal eval where relevant + one Armenian equal-depth check. Bilingual.

### 1.9 `tests/red-team-prompts.md` (NEW)
- 5–8 adversarial/safety prompts with the documented pass-bar (refuse / route-to-human / verify-before-use). Bilingual.

### 1.10 `OWNER_NOTES.md` (NEW)
- **Needs human review when / Մարդկային ստուգում պետք է երբ** — DOMAIN-SPECIFIC escalation trigger (people: termination/discipline/harassment/comp/equity; legal: adversarial/regulatory/advice-constituting; finance: irreversible high-stakes money; security/offensive: production/dual-use). Real, not copy-pasted across domains.
- Real, owned future-improvement items. Bilingual.

### 1.11 `agents/claude.md`
- Thin specialist wrapper — keep; only polish for consistency. Fine as-is unless broken.

---

## 2. QUALITY LAWS (non-negotiable, audited)

- **L0 bilingual** — every file full EN + full native HY, equal load. Native Armenian register (independently authored, not machine-translated), `․`/`։`/`«»`/`-ը-ն` correct, zero Latin/Cyrillic homoglyphs in Armenian words. Tech tokens (p-value, LoRA, SLO, BGP, RACI) stay English — correct, not a defect.
- **No template filler / no noun-swap shells.** Every section must teach something a senior practitioner would pay for. Each skill earns its own shape.
- **Factual hygiene.** No invented model names/prices/benchmarks/quotes/statutes. Volatile facts dated + verify-before-use, or use a formula/placeholder. No fictional internal names as fact.
- **No project scars.** No commit hashes, no "hold pushes", no GAAhex/Gev/project audit dates in shareable files. (Pack is currently scar-clean — keep it.)
- **Safety preserved + strengthened.** Dual-use / high-stakes skills carry the gate INSIDE SKILL.md + a worked refusal/routing example. people-org termination/discipline/harassment → HR/legal is a hard gate. offensive-security keeps methodology-level only + mandatory-reporting clause. research gates fabricated/misattributed sources as the #1 failure.

---

## 3. DEFINITION OF DONE (per skill — the acceptance gate Bro verifies)

- [ ] SKILL.md domain-dense: ≥8 decision rules, ≥8 domain-sharp failure modes, acceptance criteria, quality bar — all bilingual.
- [ ] manual.md: Operating principle is real prose (no broken merge); Mechanism reference intact; 8+ decision rules + 8+ failure-repairs; EN ≡ HY content; all required §4.11 sections present.
- [ ] patterns.md 4–6 real patterns · domain-rubric.md 5 real dimensions.
- [ ] worked-example.md: real body + domain-specific "why it passes" + 2nd example where required.
- [ ] output-templates.md domain-shaped (no generic form).
- [ ] red-team-gate.md domain reviewer probes (no shell).
- [ ] tests/eval-prompts.md 8–10 with correct per-prompt checks · tests/red-team-prompts.md present.
- [ ] OWNER_NOTES.md present with domain-specific human-review trigger.
- [ ] Every §4.11 required domain topic for this skill PRESENT (proof per item).
- [ ] L0 equal-load, native HY, no homoglyphs · factual hygiene clean · no scars.
- [ ] No generic noun-swap shell remains anywhere in the skill.

## 4. PROCESS

- Build on the v7_6 copy (`scratchpad/v7_6/skills_v7/skills/<skill>/`). Overwrite the upgraded files; add OWNER_NOTES.md + tests/red-team-prompts.md.
- Preserve and reuse the strong cores (Mechanism reference, patterns, rubric, worked bodies) — do not regress them.
- One careful agent per skill (deep, not spread thin) — anchored to this guide + that skill's §4.11 list + the locked exemplar. Then adversarial verify per skill. Bro spot-checks + packages.
- Exemplar locked first: `devops-platform-sre` (see `_EXEMPLAR_devops.md` once built) is the literal shape reference for all 29.
