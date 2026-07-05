# Auditing output templates

## English

Four domain-shaped audit deliverables. Fill the real fields; keep every conclusion traceable to a working paper; dispatch the criteria from the relevant domain skill; never invent standards numbers, statutes, CVEs, prices, or benchmarks. The coverage section is mandatory on every report — no silent gaps.

### Template 1 — Audit charter (scope & criteria)

- **Audit type & subject:** (code / security / financial / IT-controls / compliance / data-quality / language / design / process / AI) and what is being audited
- **Objective:** the precise question the audit answers
- **Criteria (dispatched):** the standard of "good" + the source skill it comes from (e.g. access-control criteria ← `security-privacy-engineering`; SOC 2 framing ← `legal-compliance-contracts`). Name the real standard anchor (ISO 19011 / SOC 2 / ISO 27001 / GAAS-ISA / IIA IPPF / COBIT) where one applies — do not invent control IDs.
- **Population / universe:** every item that could be tested, with its size
- **In scope / out of scope:** explicit boundaries + rationale (risk, materiality, mandate)
- **Materiality:** the magnitude of error/weakness that matters for this purpose
- **Independence:** who is auditing; is there a self-review threat or stake; if yes, declared and mitigated (independent reviewer) or labeled a self-check
- **Acceptance:** criteria defined before testing · population sized · independence posture stated

### Template 2 — Evidence & sampling plan

- **Population & size:** the universe being sampled from
- **Sampling approach:** statistical (projectable) or judgmental (risk-targeted, not projectable) — and why
- **Sample size & basis:** driven by population × risk × tolerable error (and any 100%-tested high-risk sub-population)
- **Evidence per item (hierarchy):** direct observation / reperformance > corroborated documentary > inquiry — plan the highest feasible level; inquiry alone is not sufficient
- **Working-paper reference scheme:** how each conclusion will be traced (file/line, transaction id, screenshot, re-run)
- **Sampling risk:** stated — results cannot be extrapolated beyond the population
- **Acceptance:** sampling type and size justified · evidence climbs the hierarchy · every conclusion reproducible

### Template 3 — Finding (5 C's + severity)

- **Title & severity:** finding name + Critical/High/Medium/Low (by likelihood × impact, calibrated to bands)
- **Condition:** what is — the observed fact, with the working-paper reference
- **Criteria:** what should be — the standard violated (dispatched from the domain skill)
- **Cause:** the root process/control reason (not a person, not a restatement of the condition)
- **Consequence:** the risk/impact if uncorrected
- **Corrective action:** the recommendation that fixes the class, not the instance
- **Management response:** accept-and-remediate (owner + date) / accept-the-risk (owner) / dispute
- **Acceptance:** Criteria named · Cause is root not symptom · severity matches likelihood × impact · evidence reproducible

### Template 4 — Audit report (with coverage / what-was-NOT-covered section)

- **Audit objective & criteria:** the question + the dispatched standard
- **Scope, period & population:** what, when, and the universe size
- **Approach:** sampling method + evidence basis + design/operating tests run
- **Findings (risk-ranked):** each as 5 C's + severity, highest first
- **Coverage / what was NOT covered (MANDATORY):** population tested vs total (e.g. 60 of 412); the named uncovered remainder; what was out of scope; the **sampling risk**; the **residual risk**
- **Overall conclusion & assurance:** the conclusion against criteria, stated as **reasonable, not absolute** assurance; positive vs negative assurance distinguished; no "100% / fully / guaranteed"
- **Management responses:** per finding, with owners and dates
- **Follow-up plan:** how and when remediation will be re-tested (re-audit, not trust); independence preserved (fixer ≠ verifier)
- **Boundary note:** any legal/regulatory *opinion* or compliance certification is out of scope and routes to `legal-compliance-contracts`
- **Acceptance:** criteria-first · evidence reproducible · design+operating tested · 5 C's findings · coverage section present · reasonable-not-absolute assurance · follow-up defined

## Հայերեն

Չորս domain-ձև audit deliverable։ Լրացրու իրական field-երը. ամեն conclusion պահիր traceable working paper-ի. criteria-ն dispatch արա համապատասխան ոլորտի skill-ից. երբեք մի՛ հորինիր standard-ի թիվ, statute, CVE, price կամ benchmark։ Coverage section-ը պարտադիր է ամեն report-ի վրա — ոչ մի լուռ gap։

### Template 1 — Audit charter (scope & criteria)

- **Audit-ի տեսակ & subject․** (code / security / financial / IT-controls / compliance / data-quality / language / design / process / AI) և ինչ է audit-վում
- **Objective․** ճշգրիտ հարցը, որին audit-ը պատասխանում է
- **Criteria (dispatched)․** «լավի» standard-ը + source skill-ը, որից գալիս է (օր.՝ access-control criteria ← `security-privacy-engineering`. SOC 2 framing ← `legal-compliance-contracts`)։ Անվանի՛ր իրական standard anchor-ը (ISO 19011 / SOC 2 / ISO 27001 / GAAS-ISA / IIA IPPF / COBIT), որտեղ կիրառվում է — control ID մի՛ հորինիր։
- **Population / universe․** ամեն item, որ կարող էր թեստավորվել, իր չափով
- **In scope / out of scope․** բացահայտ սահմաններ + rationale (ռիսկ, materiality, mandate)
- **Materiality․** error/թուլության magnitude-ը, որ կարևոր է այս նպատակի համար
- **Independence․** ով է audit անում. կա՞ self-review threat կամ stake. եթե այո, հայտարարված և mitigate-ված (independent reviewer) կամ label-ված որպես self-check
- **Acceptance․** criteria-ն սահմանված նախքան թեստավորելը · population-ը չափված · independence-ի դիրքը նշված

### Template 2 — Evidence & sampling plan

- **Population & չափ․** universe-ը, որից sample-վում է
- **Sampling approach․** statistical (project-վող) կամ judgmental (risk-targeted, ոչ project-վող) — և ինչու
- **Sample size & հիմք․** վարված population × ռիսկ × tolerable error-ով (և ցանկացած 100%-թեստավորված high-risk sub-population)
- **Evidence ամեն item-ի (hierarchy)․** direct observation / reperformance > corroborated documentary > inquiry — պլանավորիր ամենաբարձր feasible մակարդակը. inquiry-ն միայնակ բավարար չէ
- **Working-paper reference scheme․** ինչպես է ամեն conclusion հետագծվելու (file/line, transaction id, screenshot, re-run)
- **Sampling risk․** նշված — արդյունքները չեն կարող extrapolate-վել population-ից այն կողմ
- **Acceptance․** sampling-ի տեսակը և size-ը արդարացված · evidence-ը բարձրանում է հիերարխիայով · ամեն conclusion reproducible

### Template 3 — Finding (5 C + severity)

- **Title & severity․** finding-ի անունը + Critical/High/Medium/Low (likelihood × impact-ով, calibrated band-երին)
- **Condition․** ինչ է — դիտված փաստը, working-paper reference-ով
- **Criteria․** ինչ պետք է լիներ — խախտված standard-ը (dispatch-ված ոլորտի skill-ից)
- **Cause․** root process/control պատճառը (ոչ մարդ, ոչ condition-ի կրկնություն)
- **Consequence․** ռիսկը/impact-ը, եթե չ-ուղղվի
- **Corrective action․** recommendation-ը, որ ուղղում է class-ը, ոչ instance-ը
- **Management response․** accept-and-remediate (owner + ամսաթիվ) / accept-the-risk (owner) / dispute
- **Acceptance․** Criteria-ն անվանված · Cause-ը root է, ոչ symptom · severity-ն համապատասխանում է likelihood × impact-ին · evidence-ը reproducible

### Template 4 — Audit report (coverage / ինչ-ՉԻ-ծածկվել section-ով)

- **Audit objective & criteria․** հարցը + dispatch-ված standard-ը
- **Scope, period & population․** ինչ, երբ, և universe-ի չափը
- **Approach․** sampling method + evidence հիմք + design/operating test-եր run արված
- **Findings (risk-ranked)․** ամեն մեկը՝ 5 C + severity, ամենաբարձրը առաջինը
- **Coverage / ինչ ՉԻ ծածկվել (ՊԱՐՏԱԴԻՐ)․** population թեստավորված ընդդեմ ընդհանուրի (օր.՝ 412-ից 60). անվանված չծածկված մնացորդը. ինչ էր out of scope. **sampling risk**-ը. **residual risk**-ը
- **Ընդհանուր conclusion & assurance․** conclusion-ը criteria-ի դեմ, ասված որպես **reasonable, ոչ absolute** assurance. positive ընդդեմ negative assurance տարբերված. ոչ «100% / fully / guaranteed»
- **Management response-ներ․** ամեն finding-ի, owner-ներով և ամսաթվերով
- **Follow-up plan․** ինչպես և երբ remediation-ը re-test-վելու է (re-audit, ոչ վստահություն). independence պահված (fixer ≠ verifier)
- **Boundary note․** ցանկացած legal/regulatory *opinion* կամ compliance certification out of scope է և ուղղորդվում է `legal-compliance-contracts`-ին
- **Acceptance․** criteria-first · evidence reproducible · design+operating թեստավորված · 5 C findings · coverage section առկա · reasonable-ոչ-absolute assurance · follow-up սահմանված
