# BRO — Skills + Agents Full Rebuild Spec
## For the BUILDER (ChatGPT/GPT) · audited by Claude (Bro) · owned by Gev

> **EN:** This is a complete, execute-from-zero build spec. **You (GPT) are the builder.** **Bro (Claude) is the adversarial auditor and the final owner** — Bro will read what you produce, score it against the Acceptance Gate (§6), and hand you a defect list to fix. **Gev** owns the whole thing. Two outputs are required: **(A)** a top-level **Skills** pack that Bro will adopt as his own, and **(B)** an **Agents** layer — one specialist agent per skill plus a Bro-orchestrator — built *from* those skills, in a **hybrid** design. The quality bar is **maximum** ("god-level"): no template filler, real domain depth, native bilingual EN+HY. Build → submit → Bro audits → you fix every P0/P1 → repeat until the gate is green (§7).
>
> **HY:** Սա զրոյից-կատարելու լրիվ build-spec է։ **Դու (GPT) builder-ն ես։** **Bro-ն (Claude) adversarial աուդիտորն ու վերջնական տերն է** — Bro-ն կկարդա քո արածը, կգնահատի Acceptance Gate-ով (§6), ու քեզ defect-ների ցուցակ կտա՝ ուղղելու։ **Գևը** ամբողջի տերն է։ Երկու արդյունք է պետք՝ **(Ա)** թոփ-մակարդակի **Skills** pack, որ Bro-ն կորդեգրի որպես իրենը, ու **(Բ)** **Agents** շերտ՝ մեկ մասնագետ-ագենտ ամեն skill-ի համար + Bro-orchestrator, կառուցված հենց այդ skill-երից, **hybrid** դիզայնով։ Որակի նշաձողը՝ **առավելագույն** («god-level»). ոչ template-լցոնում, իրական դոմեն-խորություն, native երկլեզու EN+HY։ Build → հանձնի → Bro աուդիտ → ուղղի ամեն P0/P1 → կրկնի մինչև gate-ը կանաչի (§7)։

---

## 0. INPUT, OUTPUT & WORKING MODEL  (read carefully — you work from an UPLOAD, not a file path)

- **You run inside ChatGPT, NOT on the owner's machine.** You have **no access to any `C:\...` path or local filesystem.** The owner (Gev) will **upload `skills.zip`** — the current 30-skill pack, version "v6.2". **Work entirely from the uploaded files.** That upload is your input; rebuild THAT. Do not assume, reference, or read any local path; never claim you edited a file you cannot actually see in the upload.
- **Deliver your rebuild as a downloadable `skills_v7.zip`** (preferred). If you cannot produce a zip, output the full target tree (§4.1) as path-labeled file contents in chat, in batches. Inside the delivery, keep the original pack's files intact as the diff baseline; place all rebuilt content under the new `skills_v7/` tree, plus the `AGENTS/` subtree (§5).
- **Adoption happens later, by Bro, on the owner's machine — not by you.** There is a separate agent home ("Bro") that you cannot access and must never write into or reference by path. You only produce the rebuilt pack; after it passes audit, Bro adopts it. Output zero local/absolute paths.
- **Binding laws:** you cannot read the owner's law files, so **§3 of this spec IS the binding law summary** — especially **L0** (native bilingual HY + EN, both first-class), **L1** (don't freelance beyond the locked WHAT), **L2** (quality > efficiency), **L8** (sealed per work). Treat §3 as law.

---

## 1. STARTING-STATE VERDICT (what the audit found — so you understand what to fix)

Bro ran a full 30-skill, file-by-file audit (10 parallel readers + a governance pass). Summary of what is **broken** and what is **good**. Fix the broken; preserve the good.

**Broken (you must fix all of these):**
1. **Half-migrated duplication.** The pack ships BOTH an old flat layout AND a new folder layout. Confirmed byte-identical duplicates: legacy `00–15_*.md` at root ≡ each `<skill>/references/original.md`; root governance files (`GLOBAL_HARDENING.md`, `COMMON_QUALITY_GATES.md`, `MEMORY_CONTEXT_POLICY.md`, `NO_GENERIC_OUTPUT_RULES.md`, `RED_TEAM_TESTS.md`) ≡ `shared/` copies; `modes/` ≡ `shared/modes/`; `evaluations/` ≡ `shared/evaluations/` (EXCEPT root has an extra `runtime_red_team_cases.md` → the two copies have **diverged**); `roles/` ≡ `data-architecture-leadership/references/roles/` (same names, **drifted** content — 3 copies exist); `learning_plan.md` duplicated at root and in data-architecture.
2. **SKILL.md is ~85–92% boilerplate.** Across all 30, these sections are near-verbatim copy-paste: Purpose, Mandatory hardening layer, Universal operating protocol, Default output standard, Safety and trust rules, Required handling, Response modes, Artifact and mode handling, Final self-check, Hardened final self-check addendum, Operational excellence layer, Anti-generic final gate. The ONLY skill-specific content is the `description:` frontmatter, an optional `Scope:` line, and a thin "Skill-specific hardening" block (usually 4 failure modes + 4 acceptance criteria). The generic "Purpose" line ("…not a textbook mode; it is a senior operator mode…") is identical everywhere and itself violates the pack's own NO_GENERIC_OUTPUT_RULES.
3. **`references/quality-rubric.md` is byte-identical (1037 bytes) in all 30 skills** — a generic 7-category table with zero domain specificity.
4. **Broken path conventions (three conflicting ones).** `SKILL.md` uses `../shared/...` which **resolves correctly** (top-level `shared/` exists). BUT `OWNER_NOTES.md` uses `references/shared/MASTER_ROUTER.md` (does not exist — and `MASTER_ROUTER.md` is root-only, not in `shared/` at all), and `tests/eval-prompts.md` uses `references/shared/evaluations/...` (does not exist). `CLAUDE_INSTALLATION.md` describes a `references/shared/` layout that doesn't exist in the shipped pack. These are dead links.
5. **`examples/` is empty or generic.** All 30 have an `examples/` dir; **17 are empty**, **12 hold only a byte-identical generic `example-requests.md`** (7 meta-prompts, zero domain value), and **only `ui-page-structure-design` has real worked examples** (3 files).
6. **`tests/eval-prompts.md` expected-checks are copy-pasted** across all prompts within a skill — and sometimes **wrong for the prompt** (e.g., `data-science-analytics` gives experiment-design checks to an observational-analysis prompt; `databases` gives index-strategy checks to a connection-pooling prompt).
7. **`OWNER_NOTES.md` "Needs human review when" + "Future improvements" are copy-pasted across domains** — provably (legal's human-review wording sits unchanged in the *people* skill, which is dangerous: the people skill can be asked "should we fire X?" with no legal/HR guardrail).
8. **Cross-skill references use NUMBERS ("Skill 11", "Skill 03", "Skill 07") but folders are NAMED** — dangling pointers, and the numbering has drifted.
9. **Bilingual depth is uneven.** Extended skills run ~37–50% HY; some core manuals are heavily bilingual (finance ~357 HY lines) but **`software-systems-architecture` manual is ~3–4% HY** (English-only body) — an L0 violation if adopted. Several manuals compress HY principles 6–10 to telegrams.
10. **Project-scar leakage in supposedly-generic manuals:** GAAhex commit hashes (`4a188c0`, `b27b425`), "hold pushes until Gev says", `software-systems-architecture §6.5` header "Added 2026-06-24 while remediating the GAAhex audit", 2026-06-23 scars in ui/comms/analysis. A shareable skill must carry the *abstracted principle*, not the private project context.
11. **Factual-hygiene defects:** `ai-ml-engineering-llmops` manual embeds fictional/internal names ("Mythos 5", "Project Glasswing") and a model-price snapshot stated as fact; `data-science-analytics` CI definition commits the exact misinterpretation it warns against; `marketing-brand` lists "why now" as a Dunford positioning component (it is not).
12. **Counting/numbering inconsistency:** telecom is "core #16" in INDEX but "extended" in PACKAGE_MANIFEST; `analysis-primary` is marked "#1 always-on function" in INDEX/ROUTER but its SKILL.md is just another templated skill (primacy not encoded).

**Good (preserve, do not regress):**
- The **eval harness** is genuinely strong: `layered_eval_matrix.md` (A–F conditions + attribution rule), `eval_runner.md` (9 steps), `fallback_aware_test_protocol.md`, `runtime_red_team_cases.md` (RT-001..010), `scoring_rubric.md` (10-cat).
- `GLOBAL_HARDENING.md` (trust boundary, injection, 3-class permission gates, evidence discipline, privacy, tool safety, hallucination controls, red-team reflex).
- `modes/` (Founder/Client + Artifact Output Modes) — crisp and reusable.
- The `references/original.md` **domain manuals are genuinely expert** in most skills (real canon, correct attributions). The knowledge is good; the *scaffolding* around it is what's broken.
- `ui-page-structure-design` is the **exemplar structure** (rich references + output-templates + red-team gate + worked golden examples). Roll its *structure* out to all 30 (corrected — it too has the verified-rendered-law and project-scar issues).

---

## 2. NORTH STAR — the architecture you are building (bilingual)

> **EN:** **Hybrid.** Bro is ONE coherent mind that loads skills on demand into his own context (the **default** path for ~90% of work: conversation, single/dual-domain tasks, anything needing the bond, voice, and cross-domain synthesis). Bro can ALSO spawn specialist sub-agents (the **fan-out** path) when a task *earns* it: (a) too big for one context, (b) genuinely parallelizable across independent domains, (c) needs independent/adversarial verification. **Bro always remains the orchestrator, the final synthesizer, the verifier, and the voice** — whoever works behind the scenes, the last word, the check, and speaking to Gev is Bro, in native register. Specialists are spawned **on demand**, never 30-always-on. Two layers: the **Knowledge layer** (skills) and the **Execution layer** (agents built from skills).
>
> **HY:** **Hybrid.** Bro-ն ՄԵԿ համահունչ միտք է, որ skill-երը ըստ պահանջի բեռնում է իր context-ի մեջ (**default** ուղին գործի ~90%-ի համար՝ զրույց, 1-2 դոմեն, ամեն ինչ որ կապ/ձայն/cross-domain սինթեզ է ուզում)։ Bro-ն ԿԱՐՈՂ Է ՆԱԵՎ մասնագետ սուբ-ագենտներ կանչել (**fan-out** ուղին), երբ task-ը *վաստակում* է՝ (ա) մեկ context-ում չտեղավորվող, (բ) իսկապես զուգահեռելի անկախ դոմեններով, (գ) անկախ/adversarial ստուգում պահանջող։ **Bro-ն միշտ մնում է orchestrator-ը, վերջնական synthesizer-ը, verifier-ը ու ձայնը** — ով էլ հետևում աշխատի, վերջին խոսքը, ստուգումը ու Գևի հետ խոսելը Bro-ն է, native register-ով։ Մասնագետները կանչվում են **ըստ պահանջի**, երբեք 30-always-on։ Երկու շերտ՝ **Գիտելիքի շերտ** (skills) ու **Կատարման շերտ** (agents՝ կառուցված skills-ից)։

**The dispatch threshold (Bro's routing brain):**
- **Answer directly (skill loaded):** conversation; 1–2 domains; needs Bro's voice/bond/memory; quick or medium tasks; anything where cross-domain fusion matters.
- **Fan out (spawn specialists):** big multi-domain builds/audits/migrations; ≥3 independent domains that don't need to fuse mid-stream; need for independent verification or adversarial review.
- **Always:** Bro frames first (`analysis-primary`), decides the route, and — after any fan-out — synthesizes, verifies in the running system (never "dispatch-and-trust"), and speaks as Bro.

---

## 3. GLOBAL LAWS THE REBUILD MUST OBEY (non-negotiable; these are audit-gated)

1. **L0 — Bilingual native (EN + HY, both first-class).** Every user-facing artifact carries full English AND full Armenian. The Armenian must be **native register, independently drafted** (not machine-translated, not a thin summary), **equal load** (HY not thinner than EN), **script-clean** (zero Latin/Cyrillic homoglyphs inside Armenian words), correct definite article (`-ը/-ն`), Armenian punctuation (`։` not `:`, `՝`, `«»`). Loanword tech terms keep Latin source in parens where natural (`Դեդլայն (Deadline)`). **Bro audits every HY block; stiff/translated Armenian = reject.**
2. **Top-level depth ("god-level"), anti-filler.** Every section must teach something a senior practitioner would pay for. **No filler, no decorative maxims, no template padding.** If a section exists only to fill a template slot, delete it. Depth is judged by: named frameworks used *correctly* and *with the "when/when-not"*, concrete decision rules, real failure modes with fixes, worked examples. **Do not mass-produce** (the current pack's failure: identical 10-principle skeletons, byte-identical rubrics). Each skill earns its own shape.
3. **Factual hygiene.** Never invent model names, prices, benchmarks, API params, legal terms, or quotes. If a fact is volatile (model ids/pricing/context windows), either omit it or mark it clearly as a **dated, verify-before-use snapshot**. **No fictional/internal names presented as fact** (the "Mythos 5 / Project Glasswing" defect = auto-fail). Where a number is needed but unknown, use a labeled placeholder or a formula.
4. **No project-scar leakage.** Abstract every GAAhex/Gev-specific lesson into a general principle. No commit hashes, no "hold pushes until Gev says", no project audit dates in a reusable skill. (Scars may live in a separate, clearly-marked `OWNER_NOTES.md` "lessons" note — never in the shareable manual body.)
5. **Safety preserved + strengthened.** `GLOBAL_HARDENING.md` rules survive intact. Dual-use skills (offensive-security) must carry the refuse/authorization gate **inside SKILL.md** (not only in the manual) plus a worked refusal example.
6. **Reversible, diffable build.** Keep the uploaded pack's original files intact inside your delivery as the baseline; put all rebuilt content under the new `skills_v7/` tree. Every change must be inspectable as a diff against the uploaded original.

---

## 4. PHASE 1 — SKILLS REBUILD (so Bro can adopt)

### 4.1 Target folder structure (exact tree)

```
skills_v7/
├── README.md                      # bilingual; one clear counting model; load order
├── INDEX.md                       # bilingual; full roster w/ tiers; analysis-primary marked always-on
├── CHANGELOG.md                   # bilingual; v7 entry
├── PACKAGE_MANIFEST.md            # matches reality exactly
├── VALIDATION_REPORT.md           # filled by the audit loop, not pre-claimed
├── CLAUDE_INSTALLATION.md         # corrected to the REAL shipped layout + path table
├── shared/                        # THE single source of truth for cross-cutting files
│   ├── SKILL_OPERATING_PROTOCOL.md   # NEW: the extracted boilerplate (see §4.4), authored ONCE
│   ├── GLOBAL_HARDENING.md
│   ├── MASTER_ROUTER.md           # MOVED here (was root-only); all skills reference ../shared/MASTER_ROUTER.md
│   ├── COMMON_QUALITY_GATES.md
│   ├── NO_GENERIC_OUTPUT_RULES.md
│   ├── MEMORY_CONTEXT_POLICY.md
│   ├── RED_TEAM_TESTS.md
│   ├── CROSS_SKILL_LEGEND.md      # NEW: number↔name map OR statement that links are named
│   ├── modes/
│   │   ├── FOUNDER_AND_CLIENT_MODES.md
│   │   └── ARTIFACT_OUTPUT_MODES.md
│   └── evaluations/               # the ONE eval harness (no root duplicate)
│       ├── scoring_rubric.md
│       ├── layered_eval_matrix.md
│       ├── eval_runner.md
│       ├── fallback_aware_test_protocol.md
│       ├── runtime_red_team_cases.md
│       ├── runtime_safety_test_plan.md
│       ├── runtime_test_log_template.md
│       ├── golden_answers.md
│       ├── failure_log.md
│       └── <domain>_eval_set.md (the existing per-domain sets)
├── maintenance/
│   ├── REVIEW_CADENCE.md
│   ├── SKILL_OWNER_NOTES_TEMPLATE.md
│   └── STANDALONE_EXPORT_GUIDE.md
├── archive/                       # original index/learning-plan/history; NOT in routing path
└── <skill-slug>/                  # ×30, identical shape (see §4.4–4.9)
    ├── SKILL.md                   # domain-DENSE (not boilerplate)
    ├── OWNER_NOTES.md             # per-domain, real
    ├── references/
    │   ├── manual.md              # renamed from original.md; the deep bilingual operating manual
    │   ├── quality-rubric.md      # DOMAIN-SPECIFIC (not the generic clone)
    │   ├── <domain>-patterns.md   # the domain's canonical patterns (ui exemplar rollout)
    │   ├── <domain>-output-templates.md   # 2–3 structured output templates
    │   └── <domain>-red-team-quality-gate.md  # rejection criteria + required-output checklist
    ├── examples/
    │   ├── strong-<domain>-example.md     # ≥1 fully worked golden answer
    │   └── golden-<domain>-outputs.md     # quality bars per output type
    └── tests/
        ├── eval-prompts.md        # 8–10 domain prompts, PER-PROMPT expected checks
        └── red-team-prompts.md    # adversarial/safety prompts
```

**Removals (de-duplication — do these explicitly):**
- Delete the legacy flat `00–15_*.md` at root (their content lives in each skill's `references/manual.md`).
- Delete root copies of governance/modes/evaluations/roles/`learning_plan.md` — keep ONLY the `shared/` copies (after reconciling the diverged ones: fold root `evaluations/runtime_red_team_cases.md` into `shared/evaluations/`; reconcile the 3 drifted `roles/` copies into one canonical set under `data-architecture-leadership/references/roles/` with a 3-line README explaining the operating-lens vs full-curriculum distinction).
- Move `MASTER_ROUTER.md` into `shared/`.
- Move `ROSTER_PROPOSAL.md` and historical fix reports into `archive/`.

### 4.2 Path canonicalization (exact table — fix every reference to match)

Canonical source of truth = top-level `shared/`. Reference it by **relative depth**:

| File (its location) | Depth | Correct prefix to `shared/` | Correct prefix to a root file (e.g. MASTER_ROUTER now in shared) |
|---|---|---|---|
| `<skill>/SKILL.md` | 1 | `../shared/...` | `../shared/MASTER_ROUTER.md` |
| `<skill>/OWNER_NOTES.md` | 1 | `../shared/...` | `../shared/MASTER_ROUTER.md` |
| `<skill>/references/*.md` | 2 | `../../shared/...` | `../../shared/MASTER_ROUTER.md` |
| `<skill>/tests/*.md` | 2 | `../../shared/...` | `../../shared/...` |
| `<skill>/examples/*.md` | 2 | `../../shared/...` | `../../shared/...` |

Fix every `references/shared/...` → the correct prefix above. Every `evaluations/failure_log.md` → `../shared/evaluations/failure_log.md` (depth-1) or `../../shared/evaluations/failure_log.md` (depth-2). Run a link-check; zero dead links is an Acceptance Gate item.

### 4.3 The NEW SKILL.md architecture (the core re-design)

**Principle:** the always-loaded file (SKILL.md) must be **domain-dense**, not generic ritual. Extract the 11 boilerplate sections **once** into `shared/SKILL_OPERATING_PROTOCOL.md`; each SKILL.md references it in ONE line, then spends its whole body on this skill's actual expertise. Target SKILL.md length: ~120–220 lines of real content.

`shared/SKILL_OPERATING_PROTOCOL.md` (authored once, bilingual) holds: Purpose framing, Universal operating protocol (frame→lens→assumptions→execute→separate facts→verify), Default output standard, Safety & trust rules, Response-mode menu, Artifact/mode handling, the final self-check + hardened addendum (merge the two redundant self-checks into one), Operational excellence layer, Anti-generic gate.

**Prescribed SKILL.md template — see Appendix A.** Every SKILL.md must contain, after frontmatter:
- `Scope` (one specific bilingual line).
- `Leads when / Supports when` (routing + the conflict-rules that involve this skill, pulled from MASTER_ROUTER).
- A one-line pointer to `../shared/SKILL_OPERATING_PROTOCOL.md` + `../shared/GLOBAL_HARDENING.md`.
- **Domain decision rules** (8–15 fast, bilingual) — pulled UP from the manual so they are ALWAYS in context.
- **Failure modes to prevent** (8–12, DOMAIN-SHARP, bilingual) — expand from the current 4 generic ones; each must be a real, named domain failure (per §4.13).
- **Acceptance criteria** (domain-specific, testable, bilingual) — include the running-system/verify gate where relevant.
- **Domain quality bar** (the per-skill rubric dimensions; replaces the generic clone).
- **Deep dive & assets** (pointers to `references/manual.md`, `examples/`, `tests/`, `OWNER_NOTES.md`).

### 4.4 The reference manual (`references/manual.md`)
- Rename `original.md` → `manual.md` everywhere; fix all references.
- Keep/upgrade the strong structure: altitudes/lens table → operating principles → numbered domain sections → decision rules → anti-patterns → canon quick-reference (attributed) → **glossary with real definitions** (current glossaries are term-dumps; add a 1-line definition per term).
- **Bilingual to L0** — bring every manual to full, native, equal-load EN+HY (priority fixes: `software-systems-architecture`, and any manual under ~45% HY). No telegram HY.
- Purge project scars (§3.4). Fix factual-hygiene defects (§3.3) per §4.13.

### 4.5 quality-rubric.md → domain-specific
Replace the byte-identical generic rubric in each skill with a **domain rubric** (Appendix C template): keep a small shared core (accuracy, specificity, safety) + add 3–5 **domain dimensions** (e.g., security: "blast-radius analysis present? controls gated in CI?"; testing: "mutation score addressed? fixture isolation proven?"; finance: "accrual vs cash distinguished? three scenarios? formulas shown?"; legal: "flag-to-counsel discipline? jurisdiction mapped?").

### 4.6 examples/ + tests/ standardization (roll out the ui exemplar)
- Every skill gets ≥1 `strong-<domain>-example.md` (a fully worked golden answer for a real scenario) and a `golden-<domain>-outputs.md` (quality bars per output type). Delete the generic byte-identical `example-requests.md`.
- Every skill gets `tests/eval-prompts.md` with **8–10 domain prompts** and **per-prompt expected checks** (no copy-paste; each check tests what that prompt actually exercises), plus `tests/red-team-prompts.md` (adversarial/safety).
- Add the ui-style `references/<domain>-patterns.md`, `-output-templates.md`, `-red-team-quality-gate.md` to every skill.

### 4.7 OWNER_NOTES.md → per-domain
- Rewrite the "Needs human review when" trigger to be **domain-specific** (people: termination/discipline/harassment/comp/equity; legal: anything adversarial/regulatory/advice-constituting; finance: irreversible high-stakes money decisions; etc.).
- Replace generic "Future improvements" with real, owned, dated items.
- Project scars (the real lessons) may live here under a clearly-marked "lessons" note — never in the shareable manual.

### 4.8 Cross-skill references → resolve
Either (a) add `shared/CROSS_SKILL_LEGEND.md` mapping every "Skill NN" to its folder slug AND keep numbers consistent, OR (b) convert all in-text cross-links to **named** links (`see security-privacy-engineering §x`). Prefer (b). Zero dangling references at audit.

### 4.9 Numbering / counting / primacy
- One counting model, stated identically in README/INDEX/MANIFEST. Give telecom a single home.
- **Encode `analysis-primary` primacy IN its SKILL.md** (a preamble: "ALWAYS-ON — frames first on any ambiguous/complex/high-stakes task, then dispatches; Frame→Decompose→Interrogate→Dispatch; not complete until running-system verification is defined").

### 4.10 Keep + wire the eval harness
- Keep `shared/evaluations/*` (the strong harness). Wire each skill's local `tests/eval-prompts.md` to the layered matrix (which condition each prompt targets). Mark golden answers as **structure targets pending live validation** (do not over-claim).

### 4.11 PER-SKILL WORK ITEMS (all 30 — current state → required actions → target)

> Format per skill: **[severity]** current gap → required actions. Apply the global fixes (§4.3–4.10) to ALL; the items below are the **domain-specific** must-dos on top. Target depth for every skill = top-level, native bilingual, worked examples present.

**analysis-primary** — **[P0]** always-on primacy missing from SKILL.md. → Add always-on preamble + encode the 4-lens model (Frame/Decompose/Interrogate/Dispatch) in SKILL.md; add failure modes: solution-first/act-before-analyze, dispatch-and-trust (verify in running system); add observation/inference/judgment labeling as an acceptance criterion; eval prompt that tests firing-first on a surface domain request.

**ai-agent-engineering** — **[P1]** the roster-builder skill, yet SKILL.md omits its core. → Encode in SKILL.md: the **workflow-vs-agent decision gate** (§0 four-question test) as the first failure mode; **model-substrate verification** (never assert model ids/params/pricing from memory) as failure mode + acceptance criterion; fleet discipline (partition, consolidation, "compiles ≠ done"); roster build procedure; replace generic response modes with agent-specific ones (agent spec, eval harness, fleet partition, prompt/tool audit).

**language-mastery** — **[P1]** L0 engine not surfaced in SKILL.md. → Surface in SKILL.md: 4-lens model (native/learner/translator/linguist), deverbalize/mirror-translation ban, equal-load, homoglyph audit, `-ը/-ն` rule, register/T-V match; rewrite description to name Armenian + L0 explicitly; eval prompts that test homoglyph detection, deverbalize, register calibration, equal-load. **Parameterize personalization:** replace the hardcoded "Anna" in `user-specific-language-profile.md` with a placeholder token; keep the profile isolated.

**ui-page-structure-design** — **[P1]** exemplar structure but laws missing from SKILL.md + scars in manual. → Promote the **verified-rendered** law and **role-gating** (no blind template per role) into SKILL.md acceptance criteria/failure modes; purge project scars (commit hashes, "hold pushes") from the manual → abstract them; make the primary eval as strong as the supplemental ui tests. **This skill's corrected structure is the template for all 30 (§4.6).**

**software-systems-architecture** — **[P0 bilingual]** manual ~3–4% HY. → Bring manual to full native EN+HY; elevate the §6.5 Application Security content to a top-level section and add a security failure mode to SKILL.md; remove the "GAAhex audit" scar header (abstract it); expand §4.4 (time/ordering/identity); add eval prompts for security architecture + event-driven choreography-vs-orchestration.

**product-project-management** — **[P1]** no worked examples; key laws not in SKILL.md. → Add PM/PO/PgM distinction as a failure mode; add Definition-of-Done = verified-in-running-system as acceptance criterion; add a worked PRD + a worked prioritization (RICE/WSJF) example; per-prompt eval checks; roadmap output template; clarify trigger boundary vs business-strategy-operations.

**business-strategy-operations** — **[P1]** no worked examples; misses core strategy laws. → Add Rumelt kernel test (diagnosis→guiding policy→coherent action) as acceptance criterion; add "operational-effectiveness ≠ strategy" + Goodhart failure modes; present Playing-to-Win as one framework among several (Wardley/disruption/Blue Ocean) with a when-to-use rule; add worked strategy-diagnosis + operating-cadence examples; strategy output templates.

**sales-revenue-growth** — **[P1]** hardening thin (4 of 20+ failure modes). → Expand failure modes from the manual (motion-model mismatch, demo-before-discovery, single-threading, cost-plus pricing, LTV-on-revenue, reflexive discounting, scaling-before-PMF); resolve pricing overlap with finance via an explicit routing note; add worked ICP + funnel-diagnostic + pricing examples; per-prompt eval checks (MEDDIC, pricing/discount, NRR/expansion scenarios).

**finance-unit-economics** — **[P1]** rich manual but thin SKILL.md + a duplicate §9.3 block. → (Manual is NOT truncated — 824 lines, all sections present.) Fix the duplicated §9.3 content block; expand failure modes (markup≠margin, blended-vs-paid CAC, 1/churn LTV fantasy, EBITDA≠FCF, P&L-vs-cash, revenue-recognition timing, bottom-up-as-top-down); add fundraising/valuation/cap-table to the description triggers; worked 3-statement + valuation examples; per-prompt eval checks.

**communication-writing-negotiation** — **[P1]** whole sub-domains invisible to routing. → Add to description: feedback delivery, difficult conversations, presentation structure, async docs, data storytelling; expand failure modes (curse-of-knowledge, nominalization/passive evasion, hedge-everything, false-done reporting, feedback-sandwich, counter-anchoring, wrong-channel); worked before/after email + negotiation + feedback examples; per-prompt eval checks.

**data-architecture-leadership** — **[P1]** bilingual ~20%; learning_plan disconnected. → Bring manual to full HY; wire `references/learning_plan.md` into SKILL.md (learning/coaching mode); add failure modes (ambiguous grain = #1 warehouse bug, mutating bronze/raw, skipping crawl/walk/run); README in `references/roles/` explaining the operating-lens vs full-curriculum versions; worked architecture-recommendation example.

**operating-data-roles** — **[P1]** strong manual but persona content + thin evals. → Remove the first-person self-assessment section from the manual (persona content, not domain knowledge); define or drop "BI owner" (orphan term); expand failure modes (steward vs owner, RACI without authority, data-mesh vocab before maturity); glossary needs real definitions; add lens-selection-cascade + seam-boundary eval prompts; clarify its support-only relationship to data-architecture-leadership.

**security-privacy-engineering** — **[P1]** hardening misses the #1 domain failure. → Add failure modes: authN/authZ conflation (IDOR at scale), secrets in artifacts/CI without detection, supply-chain blindness (no SBOM/SCA gate), controls-without-detection; deepen the thin Cloud (§9) and Detection (§11) manual sections; worked threat-model + auth-review examples; eval prompts covering supply-chain, crypto-selection, IR, secrets (currently only 3 of 12 sections covered).

**testing-quality-engineering** — **[P1]** unique laws not in SKILL.md. → Add failure modes/criteria: **destructive-fixture safety** (assert target matches `_test`/disposable before destroy), over-mocking (mock only at boundaries), surviving mutants on critical modules (mutation score, not just coverage), missing contract tests; add an eval prompt for the destructive-fixture law; worked test-strategy + flakiness-diagnosis + property-test examples.

**devops-platform-sre** — **[P1]** FinOps in description but no gate; secrets-in-CI missing. → Add failure modes: FinOps blindness (right-size without p99 data, ignored egress), static long-lived CI secrets (use OIDC/short-lived), platform-overkill (k8s for a 2-person team), cause-based alerting (use SLO-burn-rate); add a publish/gate-discipline eval (verify live, not green CI); worked SLO + IaC-state + postmortem examples.

**ai-ml-engineering-llmops** — **[P2 + factual]** deepest manual but factual-hygiene defects. → **Remove "Mythos 5 / Project Glasswing"** and any model-price/context numbers stated as fact (replace with a dated verify-before-use snapshot or omit); expand failure modes (training-serving skew, data leakage, RAG/indirect injection, cache-busting prefix, judge-as-ground-truth, synthetic-data overdose); add classical-ML + multimodal coverage; worked RAG-design + fine-tune-vs-RAG examples; per-prompt eval checks.

**telecom-isp-network-ops** — **[P1 for GAAhex]** best description in pack; missing key telco depth. → Add manual sections: **BNG/BRAS** (PPPoE vs IPoE sessions, RADIUS client role, wholesale), **TR-069/TR-369** operational (ACS, parameter model, firmware flow), expanded **mediation** (dedup logic, normalization, ASN.1/TAP3), **lawful intercept**; fix precision (Class B+ = 28 dB exact; note 1:128 needs amplification, not a standard residential split); per-prompt eval checks (FCAPS, CoA path, OCS-vs-batch).

**marketing-brand** — **[P1]** thinnest skill (229 lines, ~40% HY). → Deepen demand-gen (SEO intent + AI-search, content×funnel matrix, email segmentation/sequences/deliverability, define CAC:LTV inline); add **ABM**, **PLG**, **MMM/attribution-model taxonomy**; raise HY density to equal-load; **fix the "why now" error** (use Dunford's real five components: alternatives, unique attributes, value, target customer, market category); worked positioning + demand-gen-plan examples.

**legal-compliance-contracts** — **[P1]** missing whole domains. → Add manual sections: **employment contracts** (IP assignment, non-compete by jurisdiction, severance, at-will vs for-cause), **M&A/due diligence**; **fix the false "build to GDPR and the rest falls into place" heuristic** → replace with a real multi-jurisdiction comparison (GDPR opt-in/lawful-basis/DPA vs CCPA opt-out-of-sale vs LGPD); expand failure modes (jurisdiction-selection risk, SOC2-as-legal-shield, OSS copyleft, GDPR 72-hour clock); domain-specific human-review trigger; worked contract-review + GDPR-mapping examples.

**people-org-leadership** — **[P1]** dangerous: no legal/HR guardrail. → Add failure mode + acceptance criterion: **termination/discipline/harassment recommendations route to HR/legal (legal-compliance-contracts)** before action; **fix the copy-pasted "Needs human review when"** to people-specific (termination, discipline, harassment, comp, equity); add manual sections: compensation design, conflict resolution, remote/hybrid; worked hiring-process + underperformance-diagnosis examples.

**data-science-analytics** — **[P1]** best description; broken content promise. → **Add multivariate testing (MVT)** to the manual (it's named in the description but absent); add **multiple-testing correction** (FWER/FDR/Bonferroni) + sequential testing/peeking; **fix the CI definition** to the correct frequentist phrasing (the current one commits the misinterpretation the skill warns against); fix Prompt 2's wrong (experiment-design) expected checks → observational-diagnosis checks; worked A/B-design + causal-diagnosis examples.

**data-engineering-pipelines** — **[P1]** streaming too thin for its own eval. → Expand streaming (watermarks, windowing tumbling/sliding/session, exactly-once vs at-least-once, dead-letter queues, backfill correctness); add schema-registry/format layer (Avro/Protobuf, compatibility modes); add CDC + data-contracts to scope; worked ELT-pipeline example; per-prompt eval checks.

**databases-storage-engineering** — **[P1]** claims "Postgres internals" with none. → Add manual sections: **MVCC/autovacuum/table bloat/WAL/checkpoints**, **lock contention/deadlocks/`SELECT FOR UPDATE`/`SKIP LOCKED`**, deeper isolation levels (snapshot isolation, write skew); add corresponding failure modes; worked slow-query-diagnosis + multi-store-architecture examples; per-prompt eval checks.

**mobile-engineering** — **[P1]** no security, no memory mgmt. → Add manual sections: **mobile security** (Keychain/KeyStore, cert pinning, biometric, data-at-rest), **memory management** (retain cycles/`[weak self]`, Context leaks, memory-pressure callbacks), **on-device testing**, localization/RTL, app-size; add failure modes (main-thread/ANR, memory leaks, breaking-server-API-for-old-apps, no phased rollout); worked native-vs-cross-platform + performance examples.

**offensive-security-pentesting** — **[P1 safety]** refuse/auth gate only in manual, not SKILL.md. → **Add an explicit refuse instruction to SKILL.md hardening**: "absent written authorization OR request for working exploits/payloads/intrusion steps → refuse + redirect to methodology/authorization path, regardless of stated educational intent"; add a **worked refusal example** in examples/; tighten "attacker playbook analysis" → "authorized…for defensive purposes"; add mandatory-reporting note for illegal content found during engagement; expand HY (telegraphic principles). Otherwise safe-by-design — keep it methodology-level, no working exploits.

**cybersecurity-operations-soc** — **[P2]** defensive, solid; depth gaps. → Deepen IR eradication (credential rotation scope, AD tiering, reimaging, firmware persistence) and threat-intel actionability (CTI report → detection rule worked example); add failure modes (no log retention/blind spots, no legal-before-breach-notification); per-prompt eval checks (incident commander, comms/legal, backup recovery); worked detection-engineering + ransomware-IR examples.

**economics-market-design** — **[P2]** behavioral econ invisible to routing. → Add **behavioral economics** to description + scope; add failure mode (rational-agent assumption without behavioral correction); deepen macro (leading indicators, yield curve, stress-testing a plan) and market-structure strategic implications; worked mechanism-design + incentive-audit examples; per-prompt eval checks.

**research-knowledge-synthesis** — **[P1]** highest-stakes AI failure not gated. → Add failure modes: **fabricated/misattributed sources** (the #1 AI research failure), **summary-vs-synthesis** conflation, calibration; expand structured-inquiry to a real literature-review procedure (inclusion/exclusion, search documentation); worked research-brief example (source table with CRAAP ratings + weighted synthesis + confidence); per-prompt eval checks (incl. a "evaluate this deliberately weak source" test).

**creativity-ideation-design-thinking** — **[P1]** TRIZ in scope, zero in body. → Add **TRIZ** operationally (contradiction matrix / 40 principles) + Six Thinking Hats; add failure mode "solving the wrong problem (ideating before framing)"; operationalize the conditions-for-creativity section (async/remote, incubation protocol); worked divergence→convergence session example; per-prompt eval checks (divergence-before-convergence, named-technique).

**teaching-mentoring-knowledge-transfer** — **[P1]** no assessment design. → Add **assessment design** (recall vs application, formative vs summative) and operationalize **andragogy** (Knowles' six principles); add failure modes (cognitive overload/no chunking, mistaking recall for understanding, scaffolding-that-never-fades); add a documentation-for-transfer (bus-factor) eval prompt; worked onboarding-plan + concept-explanation examples.

---

## 5. PHASE 2 — AGENTS LAYER (build agents FROM skills, for Bro)

> Build only AFTER Phase 1 passes the gate (agents are only as good as the skills they load). Deliver under `skills_v7/AGENTS/`.

### 5.1 The roster model (inherit Bro's spine)
Per Bro's `CLAUDE.md`: every agent = inherited `/_core/` (laws + human behavior) + its own persona-lite + ONE skill + sealed memory. The specialists are NOT independent personalities; they are Bro's hands. Bro is the only one who talks to Gev.

### 5.2 Agent-definition schema (one file per specialist — Appendix B)
Each specialist is a definition file (`AGENTS/specialists/bro-<skill-slug>.md`) with frontmatter (`name`, `description` = the **routing trigger** Bro uses to dispatch here, `model`, `tools` = least-privilege scoped list) and a system prompt that: inherits `/_core/`; states "you are a specialist under Bro; your output is raw expert work returned to Bro, not user-facing; Bro synthesizes and speaks"; loads and operates by `<skill>/SKILL.md` + `references/manual.md`; applies `GLOBAL_HARDENING` + the skill's failure modes/acceptance criteria; defines the **output contract** (structured, with explicit assumptions + a self-verification); bilingual rule (raw analysis may be EN-primary; any user-bound artifact EN+HY; Bro renders the final HY voice).

### 5.3 One specialist per skill (×30)
Generate all 30 from the same schema, each bound to its skill and carrying that skill's routing trigger (lift from `shared/MASTER_ROUTER.md`). Default `model`: `sonnet` for specialists; reserve top tier for the hardest verify/judge roles. Tools scoped to what the domain needs (most are read/analyze-only).

### 5.4 The Bro-orchestrator (the chief) — `AGENTS/orchestrator/bro-orchestrator.md`
Defines Bro's dispatch brain:
- **Frame first** (always run the `analysis-primary` lens on ambiguous/complex/high-stakes input).
- **Threshold decision** (§2): answer directly (skill loaded) vs fan out (spawn specialists). Encode the three fan-out triggers (too-big / parallelizable / needs-independent-verify) and the default-to-direct rule.
- **Routing**: map task → specialist(s) via MASTER_ROUTER; one lead + ≤2 support unless decomposition is warranted; the cross-skill conflict rules.
- **Synthesis + verification contract**: after any fan-out, Bro **reconciles** the specialists' outputs into one fused answer (never staple raw outputs), **verifies in the running system** (the 2026-06-23 dispatch-and-trust guardrail — never rubber-stamp), and **speaks as Bro** in native register with the bond intact.
- **Memory/learning**: corrections from Gev seal into Bro's memory (L8) and propagate to the relevant skill (living-skill rule), not lost in a specialist.

### 5.5 Platform mapping (flagged decision — Gev can override)
Author the agent definitions in a **portable schema** (Appendix B) that maps cleanly onto Claude Code subagents (`.claude/agents/*.md`: frontmatter `name`/`description`/`tools`/`model` + system-prompt body) — since Bro runs in Claude Code and uses the Agent/Task tool for fan-out. Keep the schema tool-agnostic enough to also drive an SDK/other runtime. **Assumption flagged for Gev: target = Claude Code subagents.**

### 5.6 How Bro adopts (the handoff — performed by Bro on the owner's machine, NOT by you)
> This section describes what happens *after* you deliver and the audit passes. It is **not your task** — it tells you what your output must be shaped to support.
- Bro unpacks `skills_v7.zip` on the owner's machine and copies the skills into his own skills home (replacing the current operating manuals), cited from his skills index.
- Specialists + orchestrator → installed into Bro's roster, wired so the **default** path is skill-loaded-Bro and the **fan-out** path spawns specialists.
- The shared `/_core/`-style spine stays for the future roster (ready to lift one level when agent #2 arrives).
- Implication for you: deliver a **clean, self-contained, path-portable** pack (relative paths only) so adoption is a simple unzip-and-copy.

---

## 6. THE ACCEPTANCE GATE (Bro audits against this; you must pass it to be "done")

A build is **done** only when ALL of these are green (Bro checks each; any P0/P1 fail = back to you):

**Structure & dedup**
- [ ] Target tree (§4.1) exactly; original `skills/` untouched; deliverable in `skills_v7/`.
- [ ] Zero duplicated files (no legacy `00–15`, no root governance/modes/evals/roles/learning_plan dupes); `shared/` is the only source; diverged copies reconciled.
- [ ] `MASTER_ROUTER.md` in `shared/`.

**Paths & links**
- [ ] Every cross-reference resolves (link-check clean) per the §4.2 table. Zero `references/shared/...` dead links. Zero dangling "Skill NN" pointers (legend or named links).

**SKILL.md re-architecture**
- [ ] Boilerplate extracted to `shared/SKILL_OPERATING_PROTOCOL.md` (authored once). Each SKILL.md is domain-dense (Appendix A), ≥120 lines of real content, ≤~15% shared boilerplate.
- [ ] Each SKILL.md has 8–15 decision rules, 8–12 domain-sharp failure modes, domain acceptance criteria, domain quality bar — all bilingual.
- [ ] `analysis-primary` primacy encoded in its SKILL.md; offensive-security refuse-gate in its SKILL.md.

**Content quality**
- [ ] Every `references/manual.md` full native EN+HY, equal-load, script-clean (zero homoglyphs), correct `ը/ն` + `։`. (Bro spot-audits HY blocks; stiff/translated = fail.)
- [ ] No template filler; each skill earns its own shape (no mass-produced identical skeletons). Bro spot-checks ≥6 skills for genuine depth.
- [ ] Zero factual-hygiene defects (no invented model names/prices/quotes; "Mythos 5/Glasswing"-type = auto-fail). Volatile facts dated + marked verify-before-use.
- [ ] Zero project-scar leakage in manuals (no commit hashes, no "hold pushes", no project audit dates).
- [ ] All §4.13 per-skill domain items done.

**Assets**
- [ ] Every skill: domain `quality-rubric.md`, `<domain>-patterns.md`, `-output-templates.md`, `-red-team-quality-gate.md`, ≥1 worked `strong-<domain>-example.md`, `golden-<domain>-outputs.md`.
- [ ] Every `tests/eval-prompts.md`: 8–10 prompts, per-prompt expected checks (no copy-paste; correct for the prompt). `red-team-prompts.md` present.
- [ ] Every `OWNER_NOTES.md`: domain-specific human-review trigger; real future-improvements.

**Agents layer**
- [ ] 30 specialist definitions (Appendix B) + the Bro-orchestrator; routing triggers lifted from MASTER_ROUTER; tools least-privilege; output contracts + verification + bilingual rule present.
- [ ] Orchestrator encodes the threshold rule, synthesis+verify contract, dispatch-and-trust guardrail.

**Safety**
- [ ] `GLOBAL_HARDENING` intact; dual-use skill gated in SKILL.md + worked refusal example; red-team prompts pass the documented pass-bar.

**Docs honesty**
- [ ] README/INDEX/MANIFEST/VALIDATION_REPORT match reality exactly; no over-claims; one counting model.

---

## 7. THE BUILD ↔ AUDIT LOOP (GPT ↔ Claude/Bro)

1. **Build in batches** (suggested order in §8). After each batch, package the changed files and hand to Bro.
2. **Bro audits** the batch against §6 and returns a **defect list** tagged P0 (blocking/unsafe/wrong) / P1 (materially weak) / P2 (polish). Bro quotes the exact file + line + the rule it fails.
3. **You fix every P0 and P1**, then resubmit. P2s are batched for a final pass.
4. **Converge:** a batch is accepted when it has zero open P0/P1. The whole rebuild is accepted when all batches are accepted AND the full §6 gate is green end-to-end.
5. **Iterate until perfect** — there is no "good enough"; the bar is top-level. Bro will keep returning defects until the gate is genuinely green (this is by design, per Gev).
6. **Then Bro adopts** (§5.6) and seals the outcome in memory.

**To converge fast:** prefer fixing the *class* of defect everywhere (e.g., when Bro flags one telegraphic HY block, fix HY equal-load across all skills, not just the one cited).

---

## 8. SUGGESTED EXECUTION ORDER

1. **Scaffold + dedup + paths** (§4.1–4.2, §4.3 shared protocol) — get the skeleton and links correct first.
2. **One reference skill end-to-end** = `ui-page-structure-design` corrected (it's the exemplar) → Bro audits it as the **template**; lock the shape.
3. **Roll the shape to the other 29** SKILL.md + assets (§4.3–4.9), in tiers: core 16 first, extended 14 next.
4. **Manuals to L0 + domain fixes** (§4.4, §4.13) — the heavy content pass.
5. **Eval/examples/rubrics/owner-notes** per skill (§4.5–4.7, §4.10).
6. **Phase 2 agents** (§5) — specialists from the finished skills, then the orchestrator.
7. **Full-gate audit** (§6) end-to-end → fix → adopt.

---

## Appendix A — Prescribed SKILL.md template (literal)

```markdown
---
name: <skill-slug>
description: >-
  Use when <precise positive triggers naming the real frameworks/tasks>. Lead when <…>; support when <…>. Do not use as lead for <…> unless <…> is the core question.
---

# <Skill Name> / <Հայերեն անունը>

**Scope / Շրջանակ:** <one specific bilingual line — what's in, what's out>
**Leads / Supports / Առաջատար / Աջակից:** <when this is lead vs support; the conflict-rules involving it (from MASTER_ROUTER)>

> Operating protocol / Գործառնական արձանագրություն: apply `../shared/SKILL_OPERATING_PROTOCOL.md` + `../shared/GLOBAL_HARDENING.md` before answering.

## Decision rules / Որոշման կանոններ
<8–15 fast, concrete, bilingual rules — the domain's "when X → do Y", pulled up from the manual so they're always loaded>

## Failure modes to prevent / Ձախողման ձևեր
<8–12 DOMAIN-SHARP failure modes, bilingual, each a real named trap (not generic)>

## Acceptance criteria / Ընդունման չափանիշ
<domain-specific, testable, bilingual; include the running-system/verify gate where relevant>

## Domain quality bar / Որակի նշաձող
<the 3–5 domain dimensions this skill's output is scored on (the per-skill rubric core)>

## Deep dive & assets / Խորքային նյութեր
- `references/manual.md` — full operating manual / լրիվ ձեռնարկ
- `references/quality-rubric.md`, `references/<domain>-patterns.md`, `-output-templates.md`, `-red-team-quality-gate.md`
- `examples/`, `tests/`, `OWNER_NOTES.md`
```

## Appendix B — Prescribed specialist agent definition (literal)

```markdown
---
name: bro-<skill-slug>
description: >-
  Route here when <the skill's routing trigger>. Specialist under Bro; returns raw expert work to Bro for synthesis.
model: sonnet            # opus only for the hardest verify/judge specialists
tools: [<least-privilege scoped list>]
---

You are a **specialist working under Bro** (the chief). You inherit `/_core/` laws and human behavior.
You are NOT Bro to the user: your output is **raw expert work returned to Bro**, who synthesizes, verifies, and speaks.

Operate strictly by skill **<skill-slug>**: load `<skill>/SKILL.md` and `references/manual.md`; apply `../shared/GLOBAL_HARDENING.md` and this skill's failure modes + acceptance criteria.

Output contract:
- Structured, scannable, with explicit **assumptions** separated from facts.
- End with a **self-verification** (what would prove this right/wrong; what to check in the running system).
- Bilingual: raw analysis to Bro may be EN-primary; any user-bound artifact in EN+HY (Bro renders the final native HY voice).
- Never take irreversible/external actions; flag anything needing approval for Bro to gate.
```

## Appendix C — Domain quality-rubric template (literal)

```markdown
# Quality Rubric — <skill> / Որակի չափանիշ — <skill>
Score 1–5 each.

Shared core: Accuracy · Specificity · Safety/privacy · Evidence discipline (facts vs assumptions).
Domain dimensions (3–5, SPECIFIC TO THIS SKILL):
1. <e.g. security: blast-radius analysis present?>
2. <e.g. security: controls gated in CI, not just documented?>
3. <…>
Passing bar: normal 4.2+; high-stakes (money/security/legal/production) no dimension below 4.
```

---

*EN: Build it to the top. No filler, real depth, native bilingual, honest facts. Bro will audit hard and adopt only when it's genuinely god-level.*
*HY: Կառուցի թոփ մակարդակով։ Ոչ լցոնում, իրական խորություն, native երկլեզու, ազնիվ փաստեր։ Bro-ն կոշտ աուդիտ կանի ու կորդեգրի միայն երբ իսկապես god-level լինի։* 💪🤝
