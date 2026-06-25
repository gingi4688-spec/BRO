---
name: "auditing"
description: >-
  use when the deliverable is an AUDIT — an independent, evidence-based assessment of something against DEFINED CRITERIA that produces findings and a report: code audit, security audit / pentest review, financial / forensic-fraud audit, IT-controls (SOC 1/2, ISO 27001) audit, compliance audit, data-quality audit, language/content/translation audit, design/accessibility audit, process/operational audit, or AI/model/source-fact audit. use as lead when the central deliverable IS the audit (independent, against criteria, findings + report). this skill OWNS the universal audit method (criteria-first, independence, risk + materiality, sufficient + appropriate evidence, sampling, design-vs-operating effectiveness, 5 C's findings, calibrated severity, root cause, reasonable-not-absolute assurance, and the completeness law that nothing slips through uncovered) and DISPATCHES to the relevant domain skill for the criteria of "good". do not use as lead for deep single-domain analysis with no audit ceremony (that domain skill or analysis-primary) or for a legal/regulatory compliance opinion (legal-compliance-contracts). հայերեն՝ օգտագործիր, երբ deliverable-ը audit է՝ անկախ, evidence-ի վրա հիմնված գնահատում սահմանված criteria-ի դեմ, որ արտադրում է findings և report. այս skill-ը տիրում է ունիվերսալ audit-ի մեթոդին և dispatch է անում ոլորտի skill-ին՝ criteria-ի համար։
---

# Auditing / Աուդիտ

## English

**Scope.** In: the universal audit method applied to any subject — defining the criteria first, scoping the population, planning by risk and materiality, gathering sufficient and appropriate evidence, sampling honestly, testing both design and operating effectiveness, writing findings as the 5 C's with calibrated severity and root cause, issuing a report with reasonable-not-absolute assurance, and tracking remediation — across every audit type (code, security/pentest review, financial/forensic, IT-controls/SOC/ISO, compliance, data-quality, language/content, design/accessibility, process/operational, AI/model/source-fact). Out: the *domain knowledge* of what "good" looks like (that is the relevant domain skill's `domain-rubric.md` + `red-team-gate.md`, dispatched as the criteria), the *fixing* of what the audit finds (the auditor does not become the remediation owner mid-audit — that breaks independence), and a *legal/regulatory compliance opinion* (that routes to `legal-compliance-contracts` under the UPL gate). This skill is the conductor: it owns the method that makes an audit an audit, and it borrows the criteria from the domain.

**The two layers.** An audit is a giant umbrella — a code audit is not a financial audit is not a language audit. This skill stays deep without going shallow or duplicating every domain by separating two layers:

- **Layer 1 — the universal audit spine (this skill OWNS it).** The method is identical across every domain: criteria first, independence and professional skepticism, risk-based planning, materiality, sufficient and appropriate evidence, sampling and sampling risk, design vs operating effectiveness, 5 C's findings, calibrated severity, root cause, the audit report, follow-up, working papers, reasonable-not-absolute assurance, and the **completeness law** (nothing slips through the hands uncovered or silently).
- **Layer 2 — the domain teeth (this skill DISPATCHES; it never re-teaches the domain).** The *criteria* for "good" come from the relevant domain skill. Every skill in this pack already ships its audit checklist as `domain-rubric.md` (1/3/5 scoring) and `red-team-gate.md` (reviewer probes). So `auditing` picks the audit type, loads that domain skill's rubric + red-team-gate as the criteria, runs the spine, and produces findings + report.

**Audit-type → criteria-source dispatch.** Pick the type, load the named skill(s) as the criteria; the spine is the same.

| Audit type | Criteria source skill(s) — the "good" definition |
|---|---|
| Code audit | `software-systems-architecture` + `security-privacy-engineering` + `testing-quality-engineering` |
| Security audit / pentest review | `security-privacy-engineering` · `cybersecurity-operations-soc` · `offensive-security-pentesting` |
| Financial audit / forensic-fraud | `finance-unit-economics` (+ `legal-compliance-contracts`) |
| IT-controls (SOC 1/2, ISO 27001) | `security-privacy-engineering` + `legal-compliance-contracts` |
| Compliance audit | `legal-compliance-contracts` |
| Data-quality audit | `data-architecture-leadership` + `data-science-analytics` |
| Language / content / translation audit | `language-mastery` |
| Design / accessibility audit | `frontend-ux-product-design` + `ui-page-structure-design` |
| Process / operational audit | `business-strategy-operations` |
| AI / model / source-fact audit | `ai-ml-engineering-llmops` + `research-knowledge-synthesis` |

**Leads / Supports.** Lead when the deliverable IS an audit — independent, evidence-based, against defined criteria, producing risk-ranked findings and a report with an explicit coverage statement. Support when another skill owns the artifact and the audit method is one input — e.g. a domain skill builds the thing and you supply the evidence-and-sampling plan or the findings structure.

Conflict rules:
- **Criteria definition → defer to the domain skill, never re-teach it.** `auditing` owns *how* you assess (independence, evidence, sampling, the 5 C's); the domain skill owns *what* "secure" / "correct" / "native Armenian" / "accessible" means. Load its `domain-rubric.md` + `red-team-gate.md` as the criteria; do not invent the standard yourself.
- **Legal/regulatory opinion or compliance certification → defer to `legal-compliance-contracts`.** An audit can report "control X is not operating against criterion Y"; it cannot give a legal *opinion* that the entity "is compliant" or "is not liable." A regulatory sign-off, a compliance certification, or anything constituting legal advice routes to legal under the UPL gate.
- **Deep single-domain analysis with no audit ceremony → that domain skill or `analysis-primary`.** If the user wants a diagnosis or a design, not an independent evidence-based assessment against criteria producing findings, this is not an audit; route there. The audit ceremony (criteria, independence, evidence, sampling, findings, report) is what this skill is for.
- **The auditor must not become the fixer mid-audit.** If you start remediating what you are auditing, you have destroyed independence and created a self-review threat. Report the finding and the recommended corrective action; a separate pass (or owner) implements it; a re-audit verifies it.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### The completeness law / «Nothing slips through the hands»

Make this a first-class, repeated theme, not a footnote. An audit reads as "we checked everything" even when it sampled a fraction — so silence about what was *not* covered is a lie of omission. Therefore, on every audit:

- **Define the full population / universe** up front (every file, every control, every page, every transaction, every string) and state its size.
- **State scope boundaries explicitly** — what is in and what is out, and why.
- **Log what was NOT covered** — no silent truncation. If you sampled 30 of 400, say 30 of 400 and which 370 you did not open.
- **Acknowledge sampling risk** — the part you did not test could differ from the part you did; you cannot extrapolate beyond the population.
- **Close every audit with an explicit "what we did NOT cover / residual risk" statement.** A gap that isn't named is the audit's worst failure — worse than a finding, because it hides behind apparent thoroughness.

### Decision rules / Որոշման կանոններ

1. **No defined criteria → it is not an audit yet. Define the criteria first.** You cannot audit against vibes. Name the standard / SST / policy / spec / rubric you are assessing against; dispatch to the domain skill for it. No criteria = stop and define them.
2. **Auditing your own work → declare the self-review threat or recuse.** You cannot be independent about something you produced. Either bring an independent reviewer, or run it explicitly as a self-check (not an "independent audit"), and label it as such. Professional skepticism: assume nothing is fine until evidence says so.
3. **Plan by risk, not by convenience.** State objectives, scope, the population, and what is in vs out of scope explicitly. Aim effort where a failure would hurt most; do not spend the budget on the easy, low-risk 10%.
4. **Set materiality before testing.** Decide what magnitude of error or weakness actually matters for this audit's purpose. Do not drown in trivia, and do not let a material issue hide under a "minor" label.
5. **Evidence must be sufficient AND appropriate.** Sufficiency = enough quantity; appropriateness = relevance + reliability. Climb the evidence hierarchy: direct observation / reperformance > corroborated documentary > inquiry alone. Inquiry by itself ("they told me it works") is the weakest evidence and rarely sufficient.
6. **Sampling → state statistical vs judgmental, what drives the size, and the sampling risk.** Bigger population, higher risk, lower tolerable error → larger sample. Never extrapolate a clean sample to "the whole population is clean"; report the population, the sample, and the residual risk.
7. **Test design effectiveness AND operating effectiveness — they are different.** A control can be well-designed on paper but never actually run (or run and fail). Confirm the design addresses the risk, then test that it operated across the period, with evidence for both.
8. **Write every finding as the 5 C's, root cause not symptom.** Condition (what is) · Criteria (what should be) · Cause (the root reason) · Consequence (the risk/impact) · Corrective action (the recommendation). If the "cause" is a symptom, dig until you reach the control or process that allowed it.
9. **Rate severity by likelihood × impact, calibrated — neither inflated nor deflated.** A trivial issue dressed as critical destroys the report's credibility; a critical issue softened for politics is a betrayal of the audit. Anchor severity to defined bands, not to feeling or pressure.
10. **State assurance honestly: reasonable, never absolute.** An audit gives *reasonable* assurance — it reduces, not eliminates, risk. Distinguish positive assurance ("in my opinion X is fair") from negative ("nothing came to my attention"). Always state residual risk. "100% secure / fully compliant / guaranteed" is a false claim — refuse it.
11. **Apply the completeness law — log what was NOT covered.** Define the population, make scope explicit, log the gaps, acknowledge sampling risk, and end with a residual-risk / coverage statement. Nothing slips through the hands silently.
12. **Dispatch to the domain skill for the criteria; never re-teach the domain.** Load the domain's `domain-rubric.md` + `red-team-gate.md` as the standard of "good." `auditing` supplies the method; the domain supplies the bar.
13. **Make every conclusion traceable to reproducible evidence (working papers / audit trail).** A conclusion no one can re-derive from the evidence is an opinion, not an audit finding. Reference the file, the line, the transaction, the screenshot, the re-run.
14. **Issue the report, capture the management response, and track remediation to closure.** An audit that ends at "here are the findings" with no management response and no follow-up is half an audit; the loop closes at verified remediation, by re-test, not by trust.

### Failure modes to prevent / Ձախողման ձևեր

1. **No criteria — auditing against vibes.** "This code is bad," "this looks risky" with no named standard to assess against. Tell: findings with a Condition and a Consequence but no Criteria; the word "should" with no source.
2. **Opinion presented as evidence.** A conclusion with no traceable, reproducible basis — inquiry alone ("the team said it's handled") treated as proof. Tell: a finding you cannot re-derive from any artifact; "I believe" doing the work of "I observed."
3. **Design tested, operating effectiveness not.** "The policy exists / the control is configured" accepted as "the control works." Tell: a clean report based only on documentation, with no evidence the control actually ran across the period.
4. **Symptom, not root cause.** The finding stops at the surface ("file X has a bug") and never reaches the process that allowed it. Tell: a Cause field that restates the Condition; a corrective action that fixes one instance, not the class.
5. **Sampling bias / over-extrapolation.** Sampling the easy or the recent, then claiming the whole population is clean. Tell: "we reviewed a sample and found nothing, so it's fine" with no population, no sampling basis, no residual-risk note.
6. **Severity inflation AND deflation.** Crying "critical" on trivia (credibility burns), or softening a real critical for politics/comfort (the audit fails its purpose). Tell: severity that does not match likelihood × impact, or that shifts under pressure.
7. **Missing independence / self-review threat.** The auditor reviews their own work, or someone with a stake grades the outcome, and calls it independent. Tell: the author is the reviewer; no skepticism; "looks fine to me" about one's own artifact.
8. **Scope creep / drift.** The audit silently expands or wanders off the stated objectives, so nothing gets the depth it needs and the population is never fully covered. Tell: findings outside the agreed scope, or a scope that was never written down.
9. **Silent coverage gap — the completeness law violated.** 30 of 400 items checked, reported as if all 400 were. Tell: a confident clean conclusion with no population size, no "what we did not cover," no residual-risk statement — the worst failure because it hides behind apparent thoroughness.
10. **Checklist theater.** Ticking boxes without testing whether each control actually works; the checklist is complete, the assurance is hollow. Tell: every box ticked, zero reperformance, zero evidence references.
11. **Unreproducible evidence.** A finding backed by a vanished screenshot, a verbal claim, or a number no one can re-derive. Tell: working papers that do not let a second auditor reach the same conclusion.
12. **Claiming absolute assurance.** "100% secure," "fully compliant," "guaranteed clean." Tell: any audit conclusion with no residual risk and no acknowledgment that assurance is reasonable, not absolute.
13. **The auditor became the fixer mid-audit.** The reviewer starts patching what they are auditing, destroying independence and creating a self-review threat on the very thing they will then "pass." Tell: the same person who found and fixed the issue signs it off as resolved with no separate verification.

### Acceptance criteria / Ընդունման չափանիշ

- The criteria are defined and named before any assessment, and dispatched from the relevant domain skill — not invented against vibes.
- Independence is real (or the self-review threat is declared and the work is labeled a self-check, not an independent audit); professional skepticism is applied throughout.
- Scope, objectives, the full population, and what is in vs out of scope are stated explicitly, with materiality set before testing.
- Evidence is sufficient and appropriate, climbs the hierarchy (direct/reperformed > corroborated > inquiry), and every conclusion is traceable to reproducible working papers.
- Sampling states statistical vs judgmental, what drove the size, and the sampling risk; no clean sample is extrapolated to the whole population.
- Both design and operating effectiveness are tested where controls are involved, with evidence for each.
- Findings are written as the 5 C's with root cause (not symptom) and severity calibrated to likelihood × impact (neither inflated nor deflated).
- Assurance is stated as reasonable, never absolute; residual risk is named.
- **The completeness law holds: the population is defined, gaps are logged, sampling risk is acknowledged, and the report ends with an explicit "what was NOT covered / residual risk" statement.** Nothing slips through the hands silently.
- The report carries risk-ranked findings, a management response, and a remediation/follow-up path to verified closure.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled; no invented standards, statutes, CVEs, prices, or benchmarks.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **criteria & scope rigor** (criteria defined first and dispatched, population and scope explicit, materiality set) · **evidence & sampling** (sufficient + appropriate, hierarchy climbed, sampling basis and risk stated, reproducible) · **testing depth** (both design and operating effectiveness tested, not checklist theater) · **findings, root cause & severity** (5 C's, root cause not symptom, calibrated severity) · **completeness, independence & reporting** (no silent gap, independence real, reasonable-not-absolute assurance, report + management response + follow-up).

### Deep dive & assets

`manual.md` (operating principle, the full spine + dispatch model + audit-types taxonomy + real standards, decision rules, failure-repair playbook, completeness gate, independence gate) · `patterns.md` (5+ canonical audit moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (a SOC 2-style IT-controls audit + a bilingual language/content audit — two different domains to prove the dispatch) · `output-templates.md` (audit charter / evidence-and-sampling plan / 5 C's finding / audit report with a coverage section) · `red-team-gate.md` (domain reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ ունիվերսալ audit-ի մեթոդը՝ կիրառված ցանկացած առարկայի վրա — նախ criteria-ն սահմանելը, population-ը scope անելը, ըստ ռիսկի և materiality-ի պլանավորելը, բավարար և համապատասխան evidence հավաքելը, ազնիվ sampling-ը, design-ի և operating effectiveness-ի երկուսն էլ թեստավորելը, findings-ը 5 C-ով գրելը՝ calibrated severity-ով և root cause-ով, report թողարկելը reasonable-ոչ-absolute assurance-ով և remediation-ը հետևելը — ամեն audit-ի տեսակով (code, security/pentest review, financial/forensic, IT-controls/SOC/ISO, compliance, data-quality, language/content, design/accessibility, process/operational, AI/model/source-fact)։ Դուրս՝ ոլորտի *գիտելիքը*, թե ինչ տեսք ունի «լավը» (դա համապատասխան ոլորտի skill-ի `domain-rubric.md` + `red-team-gate.md`-ն է, dispatch-ված որպես criteria), audit-ի գտածի *ուղղումը* (auditor-ը audit-ի ընթացքում remediation-ի տեր չի դառնում — դա կոտրում է independence-ը), և *legal/regulatory compliance opinion*-ը (դա ուղղորդվում է `legal-compliance-contracts`-ին՝ UPL gate-ի տակ)։ Այս skill-ը conductor-ն է. տիրում է այն մեթոդին, որ audit-ը audit է դարձնում, և criteria-ն փոխ է առնում ոլորտից։

**Երկու շերտը։** Audit-ը հսկա հովանոց է — code audit-ը ֆինանսական audit չէ, լեզվական audit չէ։ Այս skill-ը մնում է խորը՝ առանց մակերեսային դառնալու կամ ամեն ոլորտ կրկնելու, երկու շերտ բաժանելով․

- **Շերտ 1 — ունիվերսալ audit-ի ողնաշարը (այս skill-ը ՏԻՐՈՒՄ Է դրան)։** Մեթոդը նույնն է ամեն ոլորտում․ նախ criteria, independence և professional skepticism, ըստ ռիսկի պլանավորում, materiality, բավարար և համապատասխան evidence, sampling և sampling risk, design ընդդեմ operating effectiveness, 5 C-ով findings, calibrated severity, root cause, audit report, follow-up, working paper, reasonable-ոչ-absolute assurance, և **completeness law**-ը (ոչինչ լուռ կամ չծածկված ձեռքերի միջից չի սահում)։
- **Շերտ 2 — ոլորտի ատամները (այս skill-ը DISPATCH է անում. երբեք ոլորտը չի վերաուսուցանում)։** «Լավի» *criteria*-ն գալիս է համապատասխան ոլորտի skill-ից։ Այս pack-ի ամեն skill արդեն ship է անում իր audit-ի checklist-ը որպես `domain-rubric.md` (1/3/5 scoring) և `red-team-gate.md` (reviewer probe)։ Ուստի `auditing`-ը ընտրում է audit-ի տեսակը, բեռնում է այդ ոլորտի rubric + red-team-gate-ը որպես criteria, գործարկում է ողնաշարը և արտադրում findings + report։

**Audit-ի տեսակ → criteria-ի աղբյուրի dispatch։** Ընտրիր տեսակը, բեռնիր անվանված skill(եր)ը որպես criteria. ողնաշարը նույնն է։

| Audit-ի տեսակ | Criteria-ի աղբյուր skill(եր)՝ «լավի» սահմանումը |
|---|---|
| Code audit | `software-systems-architecture` + `security-privacy-engineering` + `testing-quality-engineering` |
| Security audit / pentest review | `security-privacy-engineering` · `cybersecurity-operations-soc` · `offensive-security-pentesting` |
| Financial audit / forensic-fraud | `finance-unit-economics` (+ `legal-compliance-contracts`) |
| IT-controls (SOC 1/2, ISO 27001) | `security-privacy-engineering` + `legal-compliance-contracts` |
| Compliance audit | `legal-compliance-contracts` |
| Data-quality audit | `data-architecture-leadership` + `data-science-analytics` |
| Language / content / translation audit | `language-mastery` |
| Design / accessibility audit | `frontend-ux-product-design` + `ui-page-structure-design` |
| Process / operational audit | `business-strategy-operations` |
| AI / model / source-fact audit | `ai-ml-engineering-llmops` + `research-knowledge-synthesis` |

**Առաջատար / Աջակից։** Առաջատար, երբ deliverable-ը ՀԵՆՑ audit է — անկախ, evidence-ի վրա հիմնված, սահմանված criteria-ի դեմ, որ արտադրում է risk-ranked findings և report՝ բացահայտ coverage statement-ով։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ audit-ի մեթոդը մեկ input է. օրինակ՝ ոլորտի skill-ը կառուցում է բանը, դու տալիս ես evidence-and-sampling plan-ը կամ findings-ի structure-ը։

Կոնֆլիկտի կանոններ․
- **Criteria-ի սահմանումը → զիջիր ոլորտի skill-ին, երբեք մի՛ վերաուսուցանիր այն։** `auditing`-ը տիրում է *ինչպես* ես գնահատում (independence, evidence, sampling, 5 C). ոլորտի skill-ը տիրում է, թե *ինչ* է նշանակում «secure» / «correct» / «native հայերեն» / «accessible»։ Բեռնիր նրա `domain-rubric.md` + `red-team-gate.md`-ն որպես criteria. ինքդ standard-ը մի՛ հորինիր։
- **Legal/regulatory opinion կամ compliance certification → զիջիր `legal-compliance-contracts`-ին։** Audit-ը կարող է report անել «control X-ը criterion Y-ի դեմ չի operate անում». չի կարող legal *opinion* տալ, թե entity-ն «compliant է» կամ «liable չէ»։ Regulatory sign-off, compliance certification, կամ ամեն ինչ, որ legal advice է, ուղղորդվում է legal-ին UPL gate-ի տակ։
- **Խորը մեկ-ոլորտ analysis առանց audit ceremony-ի → այդ ոլորտի skill-ը կամ `analysis-primary`-ն։** Եթե user-ը ուզում է diagnosis կամ design, ոչ թե անկախ evidence-ի վրա հիմնված գնահատում criteria-ի դեմ՝ findings արտադրող, սա audit չէ. ուղղորդիր այնտեղ։ Audit ceremony-ն (criteria, independence, evidence, sampling, findings, report) այն է, ինչի համար է այս skill-ը։
- **Auditor-ը audit-ի ընթացքում fixer չպետք է դառնա։** Եթե սկսում ես ուղղել այն, ինչ audit ես անում, ոչնչացրել ես independence-ը և ստեղծել self-review threat։ Report արա finding-ը և recommended corrective action-ը. առանձին pass (կամ owner) իրականացնում է այն. re-audit-ը ստուգում է։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Completeness law-ը / «Ոչինչ ձեռքերի միջից չի սահում»

Սա դարձրու առաջին կարգի, կրկնվող թեմա, ոչ ծանոթագրություն։ Audit-ը կարդացվում է որպես «ամեն ինչ ստուգեցինք», նույնիսկ երբ sample է արել մի մասը — ուստի լռությունն այն մասին, ինչ *չի* ծածկվել, բացթողման ստություն է։ Հետևաբար, ամեն audit-ի վրա․

- **Սահմանի՛ր ամբողջ population-ը / universe-ը** նախապես (ամեն ֆայլ, ամեն control, ամեն էջ, ամեն transaction, ամեն string) և նշիր նրա չափը։
- **Նշի՛ր scope-ի սահմանները բացահայտ** — ինչ է ներսում, ինչ՝ դուրս, և ինչու։
- **Log արա, ինչ ՉԻ ծածկվել** — ոչ մի լուռ truncation։ Եթե sample արել ես 400-ից 30, ասա՛ 400-ից 30, և որ 370-ը չես բացել։
- **Ընդունի՛ր sampling risk-ը** — այն մասը, որ չես թեստավորել, կարող է տարբերվել թեստավորածից. չես կարող extrapolate անել population-ից այն կողմ։
- **Փակի՛ր ամեն audit-ը բացահայտ «ինչ ՉԵՆՔ ծածկել / residual risk» statement-ով։** Չանվանված gap-ը audit-ի ամենավատ ձախողումն է — finding-ից վատ, որովհետև թաքնվում է թվացյալ մանրակրկիտության հետևում։

### Որոշման կանոններ

1. **Սահմանված criteria չկա → սա դեռ audit չէ։ Նախ սահմանի՛ր criteria-ն։** Vibes-ի դեմ չես կարող audit անել։ Անվանի՛ր standard-ը / SST-ն / policy-ն / spec-ը / rubric-ը, որի դեմ գնահատում ես. dispatch արա ոլորտի skill-ին դրա համար։ Criteria չկա = կանգնի՛ր և սահմանիր։
2. **Քո սեփական աշխատանքն ես audit անում → հայտարարի՛ր self-review threat-ը կամ recuse արա։** Չես կարող independent լինել քո ստեղծածի մասին։ Կա՛մ բեր independent reviewer, կա՛մ գործարկիր այն բացահայտ որպես self-check (ոչ «independent audit»), և label արա այդպես։ Professional skepticism․ ենթադրի՛ր, որ ոչինչ լավ չէ, մինչև evidence-ը ասի։
3. **Պլանավորիր ըստ ռիսկի, ոչ հարմարության։** Նշի՛ր objective-ները, scope-ը, population-ը և ինչ է ներսում ընդդեմ դուրսի՝ բացահայտ։ Ուղղիր ջանքն այնտեղ, որտեղ ձախողումը ամենաշատը կվնասի. budget-ը հեշտ, low-risk 10%-ի վրա մի՛ ծախսիր։
4. **Materiality սահմանի՛ր նախքան թեստավորելը։** Որոշիր, թե error-ի կամ թուլության ինչ magnitude է իրականում կարևոր այս audit-ի նպատակի համար։ Մի՛ խեղդվիր trivia-ում, և մի՛ թող, որ material issue-ն թաքնվի «minor» label-ի տակ։
5. **Evidence-ը պետք է բավարար ԵՎ համապատասխան լինի։** Sufficiency = բավարար քանակ. appropriateness = relevance + reliability։ Բարձրացիր evidence-ի հիերարխիայով․ direct observation / reperformance > corroborated documentary > inquiry միայնակ։ Միայն inquiry-ն («ասացին, որ աշխատում է») ամենաթույլ evidence-ն է և հազվադեպ բավարար։
6. **Sampling → նշի՛ր statistical ընդդեմ judgmental, ինչն է վարում size-ը, և sampling risk-ը։** Ավելի մեծ population, ավելի բարձր ռիսկ, ավելի ցածր tolerable error → ավելի մեծ sample։ Երբեք մի՛ extrapolate արա մաքուր sample-ը «ամբողջ population-ը մաքուր է»-ի. report արա population-ը, sample-ը և residual risk-ը։
7. **Թեստավորիր design effectiveness-ը ԵՎ operating effectiveness-ը — դրանք տարբեր են։** Control-ը կարող է թղթի վրա լավ նախագծված լինել, բայց երբեք իրականում չ-run լինել (կամ run լինել ու fail)։ Հաստատիր, որ design-ը ուղղում է ռիսկը, հետո թեստավորիր, որ այն operate է արել ողջ ժամանակահատվածում, երկուսի համար էլ evidence-ով։
8. **Ամեն finding գրի՛ր որպես 5 C, root cause ոչ symptom։** Condition (ինչ է) · Criteria (ինչ պետք է լիներ) · Cause (root պատճառը) · Consequence (ռիսկը/impact-ը) · Corrective action (recommendation-ը)։ Եթե «cause»-ը symptom է, փորիր մինչև հասնես control-ին կամ process-ին, որ թույլ տվեց դա։
9. **Severity-ն rate արա likelihood × impact-ով, calibrated — ոչ inflated, ոչ deflated։** Trivial issue-ն critical հագցրած ոչնչացնում է report-ի credibility-ն. critical issue-ն քաղաքականության համար մեղմացրած audit-ի դավաճանություն է։ Anchor արա severity-ն սահմանված band-երի, ոչ զգացմունքի կամ ճնշման։
10. **Assurance-ը ասա ազնիվ․ reasonable, երբեք absolute։** Audit-ը տալիս է *reasonable* assurance — այն նվազեցնում է ռիսկը, ոչ վերացնում։ Տարբերի՛ր positive assurance-ը («իմ կարծիքով X-ը fair է») negative-ից («ոչինչ ուշադրությանս չհասավ»)։ Միշտ նշի՛ր residual risk-ը։ «100% secure / fully compliant / guaranteed»-ը կեղծ պնդում է — մերժի՛ր այն։
11. **Կիրառի՛ր completeness law-ը — log արա, ինչ ՉԻ ծածկվել։** Սահմանի՛ր population-ը, scope-ը դարձրու բացահայտ, log արա gap-երը, ընդունիր sampling risk-ը, և ավարտիր residual-risk / coverage statement-ով։ Ոչինչ լուռ ձեռքերի միջից չի սահում։
12. **Dispatch արա ոլորտի skill-ին criteria-ի համար. երբեք մի՛ վերաուսուցանիր ոլորտը։** Բեռնիր ոլորտի `domain-rubric.md` + `red-team-gate.md`-ն որպես «լավի» standard։ `auditing`-ը տալիս է մեթոդը. ոլորտը տալիս է նշաձողը։
13. **Ամեն conclusion դարձրու traceable reproducible evidence-ի (working paper / audit trail)։** Conclusion, որ ոչ ոք չի կարող evidence-ից վերածնել, opinion է, ոչ audit finding։ Reference արա ֆայլը, line-ը, transaction-ը, screenshot-ը, re-run-ը։
14. **Թողարկիր report-ը, capture արա management response-ը և հետևիր remediation-ին մինչև closure։** Audit, որ ավարտվում է «ահա findings-ը»-ով՝ առանց management response-ի և follow-up-ի, կես audit է. loop-ը փակվում է verified remediation-ին՝ re-test-ով, ոչ վստահությամբ։

### Ձախողման ձևեր

1. **Criteria չկա — vibes-ի դեմ audit։** «Այս code-ը վատն է», «սա risky է երևում»՝ առանց անվանված standard-ի։ Tell՝ findings՝ Condition-ով և Consequence-ով, բայց առանց Criteria-ի. «should» բառն առանց աղբյուրի։
2. **Opinion՝ ներկայացված որպես evidence։** Conclusion առանց traceable, reproducible հիմքի — միայն inquiry-ն («team-ն ասաց՝ handled է») որպես ապացույց։ Tell՝ finding, որ չես կարող վերածնել որևէ artifact-ից. «I believe»-ն անում է «I observed»-ի գործը։
3. **Design թեստավորված, operating effectiveness՝ ոչ։** «Policy-ն կա / control-ը configured է»՝ ընդունված որպես «control-ն աշխատում է»։ Tell՝ մաքուր report՝ հիմնված միայն փաստաթղթի վրա, առանց evidence-ի, որ control-ն իրականում run է արել ողջ ժամանակահատվածում։
4. **Symptom, ոչ root cause։** Finding-ը կանգնում է մակերեսին («X ֆայլը bug ունի») և երբեք չի հասնում process-ին, որ թույլ տվեց։ Tell՝ Cause field, որ կրկնում է Condition-ը. corrective action, որ ուղղում է մեկ instance, ոչ class-ը։
5. **Sampling bias / over-extrapolation։** Sample անել հեշտը կամ վերջինը, հետո պնդել, որ ամբողջ population-ը մաքուր է։ Tell՝ «sample դիտեցինք, ոչինչ չգտանք, ուրեմն fine է»՝ առանց population-ի, sampling հիմքի, residual-risk note-ի։
6. **Severity inflation ԵՎ deflation։** Trivia-ի վրա «critical» գոռալ (credibility-ն այրվում է), կամ իրական critical-ը քաղաքականության/հարմարության համար մեղմացնել (audit-ը ձախողում է իր նպատակը)։ Tell՝ severity, որ չի համապատասխանում likelihood × impact-ին, կամ որ shift է անում ճնշման տակ։
7. **Բացակայող independence / self-review threat։** Auditor-ը review է անում իր սեփական աշխատանքը, կամ stake ունեցողը grade է անում արդյունքը, և կոչում independent։ Tell՝ author-ը reviewer-ն է. skepticism չկա. «ինձ fine է երևում» սեփական artifact-ի մասին։
8. **Scope creep / drift։** Audit-ը լուռ ընդլայնվում է կամ շեղվում նշված objective-ներից, ուստի ոչինչ չի ստանում պետք եղած խորությունը, և population-ը երբեք լրիվ չի ծածկվում։ Tell՝ findings համաձայնեցված scope-ից դուրս, կամ scope, որ երբեք չի գրվել։
9. **Լուռ coverage gap — completeness law-ը խախտված։** 400-ից 30 item ստուգված, report-ված այնպես, կարծես բոլոր 400-ը։ Tell՝ վստահ մաքուր conclusion՝ առանց population-ի չափի, առանց «ինչ չենք ծածկել», առանց residual-risk statement-ի — ամենավատ ձախողումը, որովհետև թաքնվում է թվացյալ մանրակրկիտության հետևում։
10. **Checklist theater։** Box-եր նշել՝ առանց թեստավորելու, թե ամեն control իրականում աշխատում է. checklist-ը լրիվ է, assurance-ը՝ խոռոչ։ Tell՝ ամեն box նշված, զրո reperformance, զրո evidence reference։
11. **Չվերարտադրվող evidence։** Finding՝ հենված անհետացած screenshot-ի, բանավոր claim-ի, կամ թվի վրա, որ ոչ ոք չի կարող վերածնել։ Tell՝ working paper, որ թույլ չի տալիս երկրորդ auditor-ին նույն conclusion-ին հասնել։
12. **Absolute assurance պնդելը։** «100% secure», «fully compliant», «guaranteed clean»։ Tell՝ ցանկացած audit conclusion՝ առանց residual risk-ի և առանց ընդունելու, որ assurance-ը reasonable է, ոչ absolute։
13. **Auditor-ը audit-ի ընթացքում fixer դարձավ։** Reviewer-ը սկսում է patch անել այն, ինչ audit է անում, ոչնչացնելով independence-ը և ստեղծելով self-review threat հենց այն բանի վրա, որ հետո «pass» կանի։ Tell՝ նույն մարդը, որ գտավ ու ուղղեց issue-ն, sign off է անում որպես resolved՝ առանց առանձին verification-ի։

### Ընդունման չափանիշ

- Criteria-ն սահմանված և անվանված է նախքան որևէ գնահատում, և dispatch-ված է համապատասխան ոլորտի skill-ից — ոչ vibes-ի դեմ հորինված։
- Independence-ը իրական է (կամ self-review threat-ը հայտարարված է, և աշխատանքը label-ված է որպես self-check, ոչ independent audit). professional skepticism-ը կիրառվում է ողջ ընթացքում։
- Scope-ը, objective-ները, ամբողջ population-ը և ինչ է ներսում ընդդեմ դուրսի՝ նշված են բացահայտ, materiality-ն սահմանված նախքան թեստավորելը։
- Evidence-ը բավարար և համապատասխան է, բարձրանում է հիերարխիայով (direct/reperformed > corroborated > inquiry), և ամեն conclusion traceable է reproducible working paper-ի։
- Sampling-ը նշում է statistical ընդդեմ judgmental, ինչն է վարել size-ը, և sampling risk-ը. ոչ մի մաքուր sample չի extrapolate-վում ամբողջ population-ին։
- Design-ի և operating effectiveness-ի երկուսն էլ թեստավորված են, որտեղ control-ներ կան, ամեն մեկի համար evidence-ով։
- Findings-ը գրված են որպես 5 C՝ root cause-ով (ոչ symptom) և severity-ով calibrated likelihood × impact-ին (ոչ inflated, ոչ deflated)։
- Assurance-ը ասված է որպես reasonable, երբեք absolute. residual risk-ը անվանված է։
- **Completeness law-ը պահվում է․ population-ը սահմանված է, gap-երը log-ված, sampling risk-ը ընդունված, և report-ը ավարտվում է բացահայտ «ինչ ՉԻ ծածկվել / residual risk» statement-ով։** Ոչինչ լուռ ձեռքերի միջից չի սահում։
- Report-ը կրում է risk-ranked findings, management response և remediation/follow-up path մինչև verified closure։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված. ոչ մի հորինված standard, statute, CVE, price կամ benchmark։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **criteria & scope rigor** (criteria-ն նախ սահմանված և dispatch-ված, population-ը և scope-ը բացահայտ, materiality սահմանված) · **evidence & sampling** (բավարար + համապատասխան, հիերարխիան բարձրացված, sampling հիմքը և ռիսկը նշված, reproducible) · **testing depth** (design-ի և operating effectiveness-ի երկուսն էլ թեստավորված, ոչ checklist theater) · **findings, root cause & severity** (5 C, root cause ոչ symptom, calibrated severity) · **completeness, independence & reporting** (լուռ gap չկա, independence-ը իրական, reasonable-ոչ-absolute assurance, report + management response + follow-up)։

### Խորացում և asset-եր

`manual.md` (գործառնական սկզբունք, ամբողջ ողնաշարը + dispatch model + audit-types taxonomy + իրական standard-ներ, որոշման կանոններ, failure-repair playbook, completeness gate, independence gate) · `patterns.md` (5+ canonical audit move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (SOC 2-ոճ IT-controls audit + bilingual language/content audit — երկու տարբեր ոլորտ՝ dispatch-ը ապացուցելու) · `output-templates.md` (audit charter / evidence-and-sampling plan / 5 C finding / audit report՝ coverage section-ով) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
