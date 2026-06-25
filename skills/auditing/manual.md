# Auditing manual

## English

### Operating principle

An audit is not "a careful look." It is an independent, evidence-based assessment of a subject against criteria defined in advance, producing findings and a report whose every conclusion traces to reproducible evidence. The word that separates an audit from an opinion is *criteria*: you cannot audit against vibes, because without a named standard there is nothing to be right or wrong against. So the first move on every audit, in every domain, is to define and dispatch the criteria — the standard, SST, policy, spec, or rubric — and only then plan, gather evidence, sample, test, and conclude. The second principle is that the method is universal and the criteria are not. A code audit and a financial audit and a language audit share one spine (criteria-first, independence, evidence, sampling, design-vs-operating, the 5 C's, calibrated severity, reasonable assurance, completeness) and differ only in what "good" means — and that the domain skill owns. So this skill is a conductor: it owns the spine and dispatches the criteria. The third principle, the one that fails most audits quietly, is completeness: an audit reads as "we checked everything" even when it sampled a fraction, so anything not covered must be named, or the report is a lie of omission. Nothing slips through the hands silently.

### Mechanism reference

- **The universal audit spine.** Every audit, regardless of domain, runs the same method: (1) **define the criteria** — the standard you assess against; (2) **plan by risk** — objectives, scope, the population, in/out of scope, and **materiality** (what magnitude matters); (3) **gather evidence** that is sufficient (quantity) and appropriate (relevance + reliability); (4) **sample** honestly when you cannot test the whole population; (5) **test** design effectiveness and operating effectiveness; (6) **write findings** as the 5 C's with root cause and calibrated severity; (7) **report** with reasonable-not-absolute assurance, a management response, and a coverage statement; (8) **follow up** to verified remediation. The criteria change by domain; steps 1–8 do not.

- **Criteria first, dispatched.** An audit assesses against a defined standard. The standard is the domain's, not the auditor's: dispatch to the relevant domain skill, load its `domain-rubric.md` (the 1/3/5 definition of "good") and `red-team-gate.md` (the reviewer probes), and use those as the criteria. `auditing` never re-teaches what "secure" or "native Armenian" or "accessible" means — it borrows that and supplies the method around it.

- **Independence, objectivity, professional skepticism, and the self-review threat.** An audit's value is that it is *independent* — assessed by someone with no stake in the outcome and no authorship of the subject. **Professional skepticism** is the default posture: assume nothing is fine until evidence shows it is; a plausible explanation is not evidence. The **self-review threat** is the most common breach: you cannot independently audit work you produced, because you will not see your own blind spots and you have a stake in passing it. If you must review your own work, run it explicitly as a self-check and label it so — never as an "independent audit."

- **Risk-based planning, scope, population, materiality.** You cannot test everything, so aim effort by risk: where would a failure hurt most, where is the control weakest, where is the highest-value population. State the **objectives** (what the audit answers), the **scope** (what is in and out, explicitly), the **population/universe** (every item that could be tested, with its size), and **materiality** (the magnitude of error or weakness that actually matters for this purpose). Materiality keeps the audit from drowning in trivia and from missing the one issue that matters.

- **Sufficient and appropriate evidence; the evidence hierarchy.** *Sufficiency* is quantity — enough evidence to support the conclusion. *Appropriateness* is quality — relevance (does it bear on the criterion) and reliability (how trustworthy is the source). Climb the **evidence hierarchy**: direct observation and reperformance (you re-ran it yourself) are strongest; corroborated documentary evidence (independent records that agree) is next; **inquiry alone** ("they told me it works") is weakest and is rarely sufficient by itself. Reliability rises with independence from the audited party, with documentary over verbal, and with original over copy.

- **Audit sampling and sampling risk.** When the population is too large to test wholly, sample. **Statistical sampling** uses probability so you can quantify the sampling risk and project results; **judgmental sampling** targets the risky or unusual but cannot be statistically projected. Sample size rises with **population size, higher risk, and lower tolerable error**. **Sampling risk** is the chance the sample is not representative — that the part you tested differs from the part you did not. You therefore **cannot extrapolate beyond the population**, and a clean sample never proves "the whole population is clean"; it supports a conclusion with a stated residual risk.

- **Test of design vs test of operating effectiveness.** A control has two ways to fail. **Design effectiveness**: is the control, as designed, capable of preventing or detecting the risk? (A door lock that opens from both sides is badly designed.) **Operating effectiveness**: did the control actually operate as designed, consistently, across the audit period? (A well-designed lock that nobody locked is not operating.) Both must be tested. "The policy exists" tests neither; documentation is design evidence at best, and design without operation is a control on paper only.

- **Findings as the 5 C's; root cause not symptom.** Every finding is structured: **Condition** (what is — the fact observed), **Criteria** (what should be — the standard), **Cause** (the root reason for the gap — a process or control, not a person and not a restatement of the condition), **Consequence** (the risk or impact if uncorrected), **Corrective action** (the recommendation that fixes the class, not the instance). The discipline is root cause: keep asking why until you reach the control or process that allowed the condition; a corrective action aimed at a symptom leaves the class of failure intact.

- **Severity / risk rating, calibrated.** Rate each finding by **likelihood × impact** against defined bands (e.g. critical / high / medium / low), anchored to consequence and pervasiveness — neither **inflated** (trivia dressed as critical, which burns the report's credibility) nor **deflated** (a real critical softened for politics or comfort, which betrays the audit). Calibration means a second auditor, given the same evidence, lands on the same severity.

- **The audit report, management response, follow-up.** The report states the criteria, scope, what was tested, the risk-ranked findings (each as 5 C's + severity), the **coverage / what-was-not-covered** statement, and the overall conclusion with its assurance level. The audited party gives a **management response** (accept / remediate / accept-the-risk, with owners and dates). The loop closes at **follow-up**: remediation is re-tested and verified, not taken on trust.

- **Working papers / audit trail.** Every conclusion must be reproducible: a second auditor, given the working papers, reaches the same finding from the same evidence. Reference the file and line, the transaction, the screenshot, the re-run, the sample item. A conclusion that cannot be re-derived is an opinion wearing an audit's costume.

- **Assurance honesty: reasonable, never absolute.** An audit gives **reasonable assurance** — it materially reduces, but never eliminates, the risk of an undetected issue, because of sampling, judgment, and the limits of evidence. **Positive assurance** is an affirmative opinion ("in our opinion, X is fairly stated / the controls operated effectively"); **negative assurance** is the weaker form ("nothing came to our attention to suggest X is misstated"). Always state **residual risk**. "100% secure," "fully compliant," "guaranteed" are false on their face and must be refused.

- **The dispatch model and the audit-types taxonomy.** The audit type determines which domain skill supplies the criteria; the spine is identical. Code audit → `software-systems-architecture` + `security-privacy-engineering` + `testing-quality-engineering`. Security audit / pentest review → `security-privacy-engineering` · `cybersecurity-operations-soc` · `offensive-security-pentesting`. Financial / forensic-fraud → `finance-unit-economics` (+ `legal-compliance-contracts`). IT-controls (SOC 1/2, ISO 27001) → `security-privacy-engineering` + `legal-compliance-contracts`. Compliance → `legal-compliance-contracts`. Data-quality → `data-architecture-leadership` + `data-science-analytics`. Language / content / translation → `language-mastery`. Design / accessibility → `frontend-ux-product-design` + `ui-page-structure-design`. Process / operational → `business-strategy-operations`. AI / model / source-fact → `ai-ml-engineering-llmops` + `research-knowledge-synthesis`.

- **The real standards to anchor (cite only these; never invent numbers).** **ISO 19011** — guidelines for auditing management systems; the cleanest universal-audit anchor (principles, the audit programme, planning, conducting, competence). **IIA IPPF** and the **Three Lines model** — internal-audit framework; the Three Lines separate (1) operational management who own and manage risk, (2) risk/compliance functions that oversee, and (3) internal audit which provides *independent* assurance to the governing body. **GAAS / ISA** — generally accepted / international standards on auditing for financial statements (sufficient appropriate evidence, materiality, sampling, the audit opinion). **SOC 1 / SOC 2** with the **Trust Services Criteria** (security, availability, processing integrity, confidentiality, privacy); SOC 2 **Type I** tests design at a point in time, **Type II** tests operating effectiveness over a period — the canonical design-vs-operating distinction. **ISO 27001 / ITGC** — information-security management system and IT general controls (access, change management, operations). **COBIT** — governance and management framework for enterprise IT. Use these by name, with a when / when-not; do not invent statute numbers, control IDs, CVEs, prices, or benchmark figures — volatile specifics are verify-before-use or expressed as a formula.

### Decision rules

1. No defined criteria → it is not an audit yet; define and dispatch the criteria (standard/SST/policy/spec/rubric) from the domain skill before assessing anything.
2. Auditing your own work → declare the self-review threat and either bring an independent reviewer or run it explicitly as a labeled self-check, never as an independent audit.
3. Plan by risk: state objectives, scope, the full population, and in/out of scope explicitly; aim effort at the high-risk material area, not the easy 10%.
4. Set materiality before testing so the audit neither drowns in trivia nor lets a material issue hide under "minor."
5. Require evidence that is sufficient (quantity) and appropriate (relevance + reliability); climb the hierarchy (direct/reperformed > corroborated > inquiry); inquiry alone is rarely sufficient.
6. When sampling, state statistical vs judgmental, what drove the size (population, risk, tolerable error), and the sampling risk; never extrapolate a clean sample to the whole population.
7. Test both design effectiveness and operating effectiveness for any control; "the policy exists" is design evidence at best and proves neither operation nor outcome.
8. Write every finding as the 5 C's (Condition, Criteria, Cause, Consequence, Corrective action) with root cause, not symptom; fix the class, not the instance.
9. Rate severity by likelihood × impact against defined bands, calibrated — neither inflated nor deflated, and stable under pressure.
10. State assurance as reasonable, never absolute; distinguish positive from negative assurance and always name the residual risk; refuse "100% / fully / guaranteed."
11. Apply the completeness law: define the population, make scope explicit, log what was not covered, acknowledge sampling risk, and end with a coverage / residual-risk statement.
12. Dispatch to the domain skill for the criteria and never re-teach the domain; `auditing` owns the method, the domain owns the bar.
13. Make every conclusion traceable to reproducible working papers; a finding a second auditor cannot re-derive is an opinion, not a finding.
14. Issue the report, capture the management response (owner + date), and follow up to verified remediation by re-test, not by trust.
15. Never become the fixer mid-audit; report the finding and the corrective action, let a separate pass remediate, and re-audit to verify — fixing what you audit destroys independence.

### Failure-repair playbook

1. **No criteria — auditing against vibes** → stop; name the standard and dispatch to the domain skill for the rubric; rewrite each finding with an explicit Criteria field before continuing.
2. **Opinion presented as evidence** → demand the working paper; if the conclusion cannot be re-derived from a reproducible artifact, downgrade it from "finding" to "observation to investigate," and gather direct/corroborated evidence.
3. **Design tested but not operating effectiveness** → add operating tests: pull a sample across the period and reperform or inspect evidence that the control actually ran each time, not just that it exists.
4. **Symptom, not root cause** → keep asking why until you reach the control or process that allowed the condition; rewrite the Cause and re-aim the Corrective action at the class, not the one instance.
5. **Sampling bias / over-extrapolation** → state the population and the sampling basis; if the sample targeted the easy/recent, redraw it to cover the risk; replace "the population is clean" with "the sample supports X, with residual risk Y."
6. **Severity inflated** → re-anchor to likelihood × impact bands; a finding with low impact and low likelihood is not "critical," and crying critical on trivia burns the whole report.
7. **Severity deflated under pressure** → re-anchor to the same bands and refuse to soften a real critical for politics; record the management response separately rather than changing the rating.
8. **Independence / self-review breach** → recuse, or bring an independent reviewer, or relabel the deliverable a self-check; an audit graded by its author or a stakeholder is not assurance.
9. **Scope creep / drift** → return to the written objectives and scope; pull out-of-scope findings into a separate "additional observations" note, or formally expand scope — do not let drift starve the in-scope population of depth.
10. **Silent coverage gap** → add the population size, the sampled count, the explicitly uncovered remainder, the sampling risk, and a residual-risk statement; never let a partial check read as total coverage.
11. **Checklist theater** → for each ticked box, attach the evidence and (for controls) the reperformance; a box with no evidence reference is undone, not done.
12. **Unreproducible evidence** → recapture it as a working paper (file/line, transaction, screenshot, re-run) so a second auditor reaches the same conclusion; if it cannot be recaptured, it cannot support a finding.
13. **Claiming absolute assurance** → rewrite to reasonable assurance with the residual risk named; refuse "100% / fully / guaranteed," and route any compliance *opinion* to `legal-compliance-contracts`.
14. **Auditor became the fixer** → separate the roles: keep the finding and the recommended action, hand remediation to an owner, and verify by an independent re-audit; do not sign off your own fix.

### Completeness gate (nothing slips through the hands)

Run this before issuing any audit report. The audit fails the gate — regardless of how good the findings are — if any answer is missing:

1. **What is the population?** Every item that could have been audited, with its size (e.g. 412 access grants, 1,840 source strings, 96 controls). If you cannot state it, you have not scoped the audit.
2. **What was in scope and out of scope, and why?** Explicit boundaries, with the rationale (risk, materiality, mandate).
3. **What was actually tested?** The sampled or covered count against the population (e.g. 60 of 412), and the basis for that selection.
4. **What was NOT covered?** The remainder, named — not summarized away. No silent truncation: the 352 grants not reviewed are stated, not implied as "checked."
5. **What is the sampling risk?** The acknowledgment that the untested remainder could differ from the tested part, and that results cannot be extrapolated beyond the population.
6. **What is the residual risk?** A closing statement of what could still be wrong despite the audit, so the reader knows the assurance is reasonable, not absolute.

A gap that isn't named is the audit's worst failure, because it hides behind apparent thoroughness — the reader assumes total coverage and acts on a false sense of safety.

### Independence gate (the self-review threat and objectivity)

Run this before calling any deliverable an audit:

1. **Did the auditor produce the subject?** If yes, this is a self-review threat — it is a self-check, not an independent audit, and must be labeled so. Independent assurance requires a reviewer with no authorship.
2. **Does the auditor have a stake in the outcome?** Compensation, reputation, ownership, or pressure tied to a "pass" compromises objectivity; declare it and recuse or mitigate (independent reviewer, oversight).
3. **Is professional skepticism applied?** The default is "not fine until evidence shows it"; a plausible management explanation is not evidence, and "looks fine to me" is not a test.
4. **Is the auditor about to fix what they audit?** If yes, stop — fixing the subject mid-audit destroys independence and creates a self-review threat on the very thing about to be passed. Report and hand off; verify by re-audit.
5. **Where does the line to legal sit?** An audit reports facts against criteria ("control X did not operate against criterion Y"). A legal/regulatory *opinion* ("the entity is compliant / not liable") is not the auditor's to give and routes to `legal-compliance-contracts` under the UPL gate.

## Հայերեն

### Գործառնական սկզբունք

Audit-ը «ուշադիր նայել» չէ։ Այն subject-ի անկախ, evidence-ի վրա հիմնված գնահատում է նախապես սահմանված criteria-ի դեմ, որ արտադրում է findings և report, որի ամեն conclusion հետ է գնում reproducible evidence-ի։ Այն բառը, որ audit-ը opinion-ից բաժանում է, *criteria*-ն է․ vibes-ի դեմ չես կարող audit անել, որովհետև առանց անվանված standard-ի ոչնչի դեմ չկա, որի դեմ ճիշտ կամ սխալ լինես։ Ուստի ամեն audit-ի առաջին քայլը, ամեն ոլորտում, criteria-ն սահմանելն ու dispatch անելն է — standard-ը, SST-ն, policy-ն, spec-ը կամ rubric-ը — և միայն հետո պլանավորել, evidence հավաքել, sample անել, թեստավորել և եզրակացնել։ Երկրորդ սկզբունքը՝ մեթոդը ունիվերսալ է, criteria-ն՝ ոչ։ Code audit-ը, ֆինանսական audit-ը և լեզվական audit-ը կիսում են մեկ ողնաշար (նախ criteria, independence, evidence, sampling, design ընդդեմ operating, 5 C, calibrated severity, reasonable assurance, completeness) և տարբերվում են միայն նրանով, թե ինչ է «լավը» նշանակում — և դա ոլորտի skill-ինն է։ Ուստի այս skill-ը conductor է․ տիրում է ողնաշարին և dispatch է անում criteria-ն։ Երրորդ սկզբունքը, որ ամենից շատ audit-ներ լուռ ձախողում է, completeness-ն է․ audit-ը կարդացվում է որպես «ամեն ինչ ստուգեցինք», նույնիսկ երբ մի մաս է sample արել, ուստի ինչ որ չի ծածկվել, պետք է անվանվի, այլապես report-ը բացթողման ստություն է։ Ոչինչ լուռ ձեռքերի միջից չի սահում։

### Մեխանիզմների տեղեկագիր

- **Ունիվերսալ audit-ի ողնաշարը։** Ամեն audit, ոլորտից անկախ, գործարկում է նույն մեթոդը․ (1) **սահմանի՛ր criteria-ն** — standard-ը, որի դեմ գնահատում ես. (2) **պլանավորիր ըստ ռիսկի** — objective-ներ, scope, population, in/out of scope, և **materiality** (ինչ magnitude է կարևոր). (3) **հավաքիր evidence**, որ բավարար է (քանակ) և համապատասխան (relevance + reliability). (4) **sample արա** ազնիվ, երբ չես կարող ամբողջ population-ը թեստավորել. (5) **թեստավորիր** design effectiveness-ը և operating effectiveness-ը. (6) **գրիր findings** որպես 5 C՝ root cause-ով և calibrated severity-ով. (7) **report արա** reasonable-ոչ-absolute assurance-ով, management response-ով և coverage statement-ով. (8) **follow up արա** մինչև verified remediation։ Criteria-ն փոխվում է ըստ ոլորտի. 1–8 քայլերը՝ ոչ։

- **Նախ criteria, dispatch-ված։** Audit-ը գնահատում է սահմանված standard-ի դեմ։ Standard-ը ոլորտինն է, ոչ auditor-ինը․ dispatch արա համապատասխան ոլորտի skill-ին, բեռնիր նրա `domain-rubric.md`-ն («լավի» 1/3/5 սահմանումը) և `red-team-gate.md`-ն (reviewer probe-երը), և օգտագործիր դրանք որպես criteria։ `auditing`-ը երբեք չի վերաուսուցանում, թե ինչ է «secure» կամ «native հայերեն» կամ «accessible» նշանակում — փոխ է առնում դա և շուրջը տալիս մեթոդը։

- **Independence, objectivity, professional skepticism և self-review threat։** Audit-ի արժեքն այն է, որ *անկախ* է — գնահատված մեկի կողմից, ով արդյունքում stake չունի և subject-ի author չէ։ **Professional skepticism**-ը լռելյայն դիրքն է․ ենթադրի՛ր, որ ոչինչ լավ չէ, մինչև evidence-ը ցույց տա, որ լավ է. plausible բացատրությունը evidence չէ։ **Self-review threat**-ը ամենատարածված խախտումն է․ չես կարող independently audit անել քո արտադրած աշխատանքը, որովհետև չես տեսնի սեփական blind spot-ները և stake ունես այն pass անելու։ Եթե պետք է review անես սեփական աշխատանքդ, գործարկիր այն բացահայտ որպես self-check և label արա այդպես — երբեք որպես «independent audit»։

- **Ըստ ռիսկի պլանավորում, scope, population, materiality։** Չես կարող ամեն ինչ թեստավորել, ուստի ուղղիր ջանքն ըստ ռիսկի․ որտեղ ձախողումը ամենաշատը կվնասի, որտեղ control-ը ամենաթույլն է, որտեղ ամենաարժեքավոր population-ն է։ Նշի՛ր **objective**-ները (ինչին է audit-ը պատասխանում), **scope**-ը (ինչ է ներսում և դուրս՝ բացահայտ), **population/universe**-ը (ամեն item, որ կարող էր թեստավորվել, իր չափով), և **materiality**-ն (error-ի կամ թուլության magnitude-ը, որ իրականում կարևոր է այս նպատակի համար)։ Materiality-ն audit-ին պահում է trivia-ում խեղդվելուց և կարևոր մեկ issue-ն բաց թողնելուց։

- **Բավարար և համապատասխան evidence. evidence-ի հիերարխիան։** *Sufficiency*-ն քանակ է — բավարար evidence conclusion-ը հենելու։ *Appropriateness*-ը որակ է — relevance (արդյո՞ք վերաբերում է criterion-ին) և reliability (որքա՞ն վստահելի է աղբյուրը)։ Բարձրացի՛ր **evidence-ի հիերարխիայով**․ direct observation-ը և reperformance-ը (ինքդ վերագործարկեցիր) ամենաուժեղն են. corroborated documentary evidence-ը (անկախ records, որ համընկնում են) հաջորդն է. **inquiry միայնակ** («ասացին՝ աշխատում է») ամենաթույլն է և հազվադեպ ինքնին բավարար։ Reliability-ն բարձրանում է audit-վող կողմից independence-ով, documentary > verbal-ով, և original > copy-ով։

- **Audit sampling և sampling risk։** Երբ population-ն ամբողջությամբ թեստավորելու չափ մեծ է, sample արա։ **Statistical sampling**-ը probability է օգտագործում, որ կարողանաս quantify անել sampling risk-ը և project անել արդյունքները. **judgmental sampling**-ը թիրախավորում է risky-ն կամ անսովորը, բայց չի կարող statistically project-վել։ Sample size-ը բարձրանում է **population-ի չափով, ավելի բարձր ռիսկով և ավելի ցածր tolerable error-ով**։ **Sampling risk**-ը այն հավանականությունն է, որ sample-ը representative չէ — որ թեստավորած մասը տարբերվում է չթեստավորածից։ Ուստի **չես կարող extrapolate անել population-ից այն կողմ**, և մաքուր sample-ը երբեք չի ապացուցում «ամբողջ population-ը մաքուր է». այն հենում է conclusion-ը նշված residual risk-ով։

- **Design ընդդեմ operating effectiveness-ի թեստ։** Control-ը ձախողվելու երկու ճանապարհ ունի։ **Design effectiveness**․ արդյո՞ք control-ը, ինչպես նախագծված է, ունակ է կանխելու կամ հայտնաբերելու ռիսկը։ (Դուռ, որ երկու կողմից էլ բացվում է, վատ նախագծված է)։ **Operating effectiveness**․ արդյո՞ք control-ը իրականում operate է արել ինչպես նախագծված է, հետևողականորեն, ողջ audit-ի ժամանակահատվածում։ (Լավ նախագծված կողպեք, որ ոչ ոք չի կողպել, չի operate անում)։ Երկուսն էլ պետք է թեստավորվեն։ «Policy-ն կա»-ն ոչ մեկը չի թեստավորում. փաստաթուղթը լավագույն դեպքում design evidence է, և design առանց operation-ի թղթի վրա control է միայն։

- **Findings որպես 5 C. root cause ոչ symptom։** Ամեն finding կառուցված է․ **Condition** (ինչ է — դիտված փաստը), **Criteria** (ինչ պետք է լիներ — standard-ը), **Cause** (gap-ի root պատճառը — process կամ control, ոչ մարդ և ոչ condition-ի կրկնություն), **Consequence** (ռիսկը կամ impact-ը, եթե չ-ուղղվի), **Corrective action** (recommendation-ը, որ ուղղում է class-ը, ոչ instance-ը)։ Կարգապահությունը root cause է․ շարունակիր հարցնել ինչու, մինչև հասնես control-ին կամ process-ին, որ թույլ տվեց condition-ը. symptom-ին ուղղված corrective action-ը ձախողման class-ը անձեռնմխելի է թողնում։

- **Severity / risk rating, calibrated։** Rate արա ամեն finding-ը **likelihood × impact**-ով սահմանված band-երի դեմ (օր.՝ critical / high / medium / low), anchor-ված consequence-ին և pervasiveness-ին — ոչ **inflated** (trivia-ն critical հագցրած, որ այրում է report-ի credibility-ն), ոչ **deflated** (իրական critical-ը քաղաքականության կամ հարմարության համար մեղմացրած, որ դավաճանում է audit-ին)։ Calibration նշանակում է, որ երկրորդ auditor-ը, նույն evidence-ով, նույն severity-ին է հասնում։

- **Audit report-ը, management response-ը, follow-up-ը։** Report-ը նշում է criteria-ն, scope-ը, ինչ է թեստավորվել, risk-ranked findings-ը (ամեն մեկը՝ 5 C + severity), **coverage / ինչ-չի-ծածկվել** statement-ը, և ընդհանուր conclusion-ը իր assurance level-ով։ Audit-վող կողմը տալիս է **management response** (accept / remediate / accept-the-risk, owner-ներով և ամսաթվերով)։ Loop-ը փակվում է **follow-up**-ին․ remediation-ը re-test-վում և verify-վում է, ոչ վստահության վրա է վերցվում։

- **Working paper-ներ / audit trail։** Ամեն conclusion պետք է reproducible լինի․ երկրորդ auditor-ը, working paper-ներով, նույն finding-ին է հասնում նույն evidence-ից։ Reference արա ֆայլն ու line-ը, transaction-ը, screenshot-ը, re-run-ը, sample item-ը։ Conclusion, որ չի կարող վերածնվել, opinion է՝ audit-ի հագուստով։

- **Assurance-ի ազնվություն․ reasonable, երբեք absolute։** Audit-ը տալիս է **reasonable assurance** — այն material կերպով նվազեցնում է, բայց երբեք չի վերացնում չ-հայտնաբերված issue-ի ռիսկը, sampling-ի, judgment-ի և evidence-ի սահմանների պատճառով։ **Positive assurance**-ը հաստատական opinion է («մեր կարծիքով X-ը fairly stated է / control-ները effectively operate են արել»). **negative assurance**-ը ավելի թույլ ձևն է («ոչինչ ուշադրությանս չհասավ, որ ենթադրեր, թե X-ը misstated է»)։ Միշտ նշի՛ր **residual risk**-ը։ «100% secure», «fully compliant», «guaranteed»-ը երեսին կեղծ են և պետք է մերժվեն։

- **Dispatch model-ը և audit-types taxonomy-ն։** Audit-ի տեսակը որոշում է, որ ոլորտի skill-ն է criteria-ն տալիս. ողնաշարը նույնն է։ Code audit → `software-systems-architecture` + `security-privacy-engineering` + `testing-quality-engineering`։ Security audit / pentest review → `security-privacy-engineering` · `cybersecurity-operations-soc` · `offensive-security-pentesting`։ Financial / forensic-fraud → `finance-unit-economics` (+ `legal-compliance-contracts`)։ IT-controls (SOC 1/2, ISO 27001) → `security-privacy-engineering` + `legal-compliance-contracts`։ Compliance → `legal-compliance-contracts`։ Data-quality → `data-architecture-leadership` + `data-science-analytics`։ Language / content / translation → `language-mastery`։ Design / accessibility → `frontend-ux-product-design` + `ui-page-structure-design`։ Process / operational → `business-strategy-operations`։ AI / model / source-fact → `ai-ml-engineering-llmops` + `research-knowledge-synthesis`։

- **Իրական standard-ները՝ anchor (միայն սրանք. երբեք մի՛ հորինիր թիվ)։** **ISO 19011** — management system-երի audit-ի ուղեցույց. ամենամաքուր ունիվերսալ-audit anchor-ը (սկզբունքներ, audit programme, planning, conducting, competence)։ **IIA IPPF** և **Three Lines model**-ը — internal-audit framework. Three Lines-ը բաժանում է (1) operational management-ը, որ ռիսկը տիրում և կառավարում է, (2) risk/compliance function-ները, որ oversee են անում, և (3) internal audit-ը, որ *independent* assurance է տալիս governing body-ին։ **GAAS / ISA** — generally accepted / international standards on auditing ֆինանսական statement-ների համար (sufficient appropriate evidence, materiality, sampling, audit opinion-ը)։ **SOC 1 / SOC 2** **Trust Services Criteria**-ով (security, availability, processing integrity, confidentiality, privacy). SOC 2 **Type I**-ը թեստավորում է design-ը մեկ կետում, **Type II**-ը՝ operating effectiveness-ը ժամանակահատվածում — canonical design-ընդդեմ-operating տարբերությունը։ **ISO 27001 / ITGC** — information-security management system և IT general control-ներ (access, change management, operations)։ **COBIT** — enterprise IT-ի governance և management framework։ Օգտագործիր սրանք անունով, when / when-not-ով. մի՛ հորինիր statute number, control ID, CVE, price կամ benchmark figure — volatile specific-ները verify-before-use են կամ formula-ով արտահայտված։

### Որոշման կանոններ

1. Սահմանված criteria չկա → սա դեռ audit չէ. սահմանի՛ր և dispatch արա criteria-ն (standard/SST/policy/spec/rubric) ոլորտի skill-ից նախքան որևէ բան գնահատելը։
2. Քո սեփական աշխատանքն ես audit անում → հայտարարի՛ր self-review threat-ը և կա՛մ բեր independent reviewer, կա՛մ գործարկիր այն բացահայտ որպես label-ված self-check, երբեք որպես independent audit։
3. Պլանավորիր ըստ ռիսկի․ նշի՛ր objective-ները, scope-ը, ամբողջ population-ը և in/out of scope-ը բացահայտ. ուղղիր ջանքը high-risk material տարածքին, ոչ հեշտ 10%-ին։
4. Materiality սահմանի՛ր նախքան թեստավորելը, որ audit-ը ոչ trivia-ում խեղդվի, ոչ material issue-ն թողնի «minor»-ի տակ թաքնվել։
5. Պահանջիր evidence, որ բավարար է (քանակ) և համապատասխան (relevance + reliability). բարձրացիր հիերարխիայով (direct/reperformed > corroborated > inquiry). inquiry-ն միայնակ հազվադեպ բավարար է։
6. Sampling անելիս նշի՛ր statistical ընդդեմ judgmental, ինչն է վարել size-ը (population, ռիսկ, tolerable error), և sampling risk-ը. երբեք մի՛ extrapolate արա մաքուր sample-ը ամբողջ population-ին։
7. Թեստավորիր design effectiveness-ը ԵՎ operating effectiveness-ը ցանկացած control-ի համար. «policy-ն կա»-ն լավագույն դեպքում design evidence է և ոչ operation, ոչ outcome չի ապացուցում։
8. Ամեն finding գրի՛ր որպես 5 C (Condition, Criteria, Cause, Consequence, Corrective action)՝ root cause-ով, ոչ symptom. ուղղիր class-ը, ոչ instance-ը։
9. Severity-ն rate արա likelihood × impact-ով սահմանված band-երի դեմ, calibrated — ոչ inflated, ոչ deflated, և ճնշման տակ կայուն։
10. Assurance-ը ասա reasonable, երբեք absolute. տարբերի՛ր positive-ը negative-ից և միշտ անվանի՛ր residual risk-ը. մերժի՛ր «100% / fully / guaranteed»-ը։
11. Կիրառի՛ր completeness law-ը․ սահմանի՛ր population-ը, scope-ը դարձրու բացահայտ, log արա, ինչ չի ծածկվել, ընդունիր sampling risk-ը, և ավարտիր coverage / residual-risk statement-ով։
12. Dispatch արա ոլորտի skill-ին criteria-ի համար և երբեք մի՛ վերաուսուցանիր ոլորտը. `auditing`-ը տիրում է մեթոդին, ոլորտը՝ նշաձողին։
13. Ամեն conclusion դարձրու traceable reproducible working paper-ի. finding, որ երկրորդ auditor-ը չի կարող վերածնել, opinion է, ոչ finding։
14. Թողարկիր report-ը, capture արա management response-ը (owner + ամսաթիվ), և follow up արա մինչև verified remediation՝ re-test-ով, ոչ վստահությամբ։
15. Երբեք audit-ի ընթացքում fixer մի՛ դարձիր. report արա finding-ը և corrective action-ը, թող առանձին pass-ը remediate անի, և re-audit արա ստուգելու — այն, ինչ audit ես անում, ուղղելը ոչնչացնում է independence-ը։

### Վերականգնման խաղագիրք

1. **Criteria չկա — vibes-ի դեմ audit** → կանգնի՛ր. անվանի՛ր standard-ը և dispatch արա ոլորտի skill-ին rubric-ի համար. վերագրիր ամեն finding բացահայտ Criteria field-ով նախքան շարունակելը։
2. **Opinion՝ ներկայացված որպես evidence** → պահանջի՛ր working paper-ը. եթե conclusion-ը չի կարող վերածնվել reproducible artifact-ից, downgrade արա այն «finding»-ից «observation to investigate»-ի, և հավաքիր direct/corroborated evidence։
3. **Design թեստավորված, operating effectiveness՝ ոչ** → ավելացրու operating test. քաշիր sample ողջ ժամանակահատվածով և reperform արա կամ inspect արա evidence, որ control-ն իրականում run է արել ամեն անգամ, ոչ թե միայն գոյություն ունի։
4. **Symptom, ոչ root cause** → շարունակիր հարցնել ինչու, մինչև հասնես control-ին կամ process-ին, որ թույլ տվեց condition-ը. վերագրիր Cause-ը և վերաուղղիր Corrective action-ը class-ին, ոչ մեկ instance-ին։
5. **Sampling bias / over-extrapolation** → նշի՛ր population-ը և sampling հիմքը. եթե sample-ը թիրախավորել է հեշտը/վերջինը, վերագծիր այն՝ ռիսկը ծածկելու. փոխարինիր «population-ը մաքուր է»-ն «sample-ը հենում է X-ը, residual risk Y-ով»-ով։
6. **Severity inflated** → re-anchor արա likelihood × impact band-երին. finding low impact-ով և low likelihood-ով «critical» չէ, և trivia-ի վրա critical գոռալը այրում է ողջ report-ը։
7. **Severity deflated ճնշման տակ** → re-anchor արա նույն band-երին և մերժիր իրական critical-ը քաղաքականության համար մեղմացնելը. record արա management response-ը առանձին, ոչ թե rating-ը փոխիր։
8. **Independence / self-review խախտում** → recuse արա, կամ բեր independent reviewer, կամ relabel արա deliverable-ը self-check. audit, որ իր author-ի կամ stakeholder-ի կողմից է grade-ված, assurance չէ։
9. **Scope creep / drift** → վերադարձիր գրված objective-ներին և scope-ին. դուրս-scope findings-ը հանիր առանձին «additional observations» note-ի մեջ, կամ ֆորմալ ընդլայնիր scope-ը — մի՛ թող, որ drift-ը in-scope population-ին խորություն չթողնի։
10. **Լուռ coverage gap** → ավելացրու population-ի չափը, sample արված count-ը, բացահայտ չծածկված մնացորդը, sampling risk-ը և residual-risk statement-ը. երբեք մի՛ թող, որ մասնակի ստուգումը կարդացվի որպես լրիվ coverage։
11. **Checklist theater** → ամեն նշված box-ի համար կցիր evidence-ը և (control-ների համար) reperformance-ը. box առանց evidence reference-ի undone է, ոչ done։
12. **Չվերարտադրվող evidence** → recapture արա այն որպես working paper (file/line, transaction, screenshot, re-run), որ երկրորդ auditor-ը նույն conclusion-ին հասնի. եթե չի կարող recapture-վել, չի կարող finding հենել։
13. **Absolute assurance պնդելը** → վերագրիր reasonable assurance-ի՝ residual risk-ը անվանված. մերժի՛ր «100% / fully / guaranteed»-ը, և ուղղորդիր ցանկացած compliance *opinion* `legal-compliance-contracts`-ին։
14. **Auditor-ը fixer դարձավ** → բաժանի՛ր role-երը. պահիր finding-ը և recommended action-ը, remediation-ը հանձնիր owner-ին, և verify արա independent re-audit-ով. քո սեփական fix-ը մի՛ sign off արա։

### Completeness gate (ոչինչ ձեռքերի միջից չի սահում)

Գործարկիր սա ցանկացած audit report թողարկելուց առաջ։ Audit-ը gate-ը fail է անում — որքան էլ findings-ը լավ լինեն — եթե որևէ պատասխան բացակայում է․

1. **Ինչ է population-ը։** Ամեն item, որ կարող էր audit-վել, իր չափով (օր.՝ 412 access grant, 1,840 source string, 96 control)։ Եթե չես կարող ասել, audit-ը scope չես արել։
2. **Ինչ էր in scope և out of scope, և ինչու։** Բացահայտ սահմաններ, rationale-ով (ռիսկ, materiality, mandate)։
3. **Ինչ էր իրականում թեստավորված։** Sample արված կամ ծածկված count-ը population-ի դեմ (օր.՝ 412-ից 60), և այդ ընտրության հիմքը։
4. **Ինչ ՉԻ ծածկվել։** Մնացորդը՝ անվանված, ոչ ամփոփումով անհետացրած։ Ոչ մի լուռ truncation․ չ-review-ված 352 grant-ը նշվում է, ոչ թե ենթադրվում որպես «ստուգված»։
5. **Ինչ է sampling risk-ը։** Ընդունումը, որ չթեստավորած մնացորդը կարող է տարբերվել թեստավորած մասից, և որ արդյունքները չեն կարող extrapolate-վել population-ից այն կողմ։
6. **Ինչ է residual risk-ը։** Փակող statement այն մասին, ինչ կարող է դեռ սխալ լինել audit-ից չնայած, որ ընթերցողը իմանա՝ assurance-ը reasonable է, ոչ absolute։

Չանվանված gap-ը audit-ի ամենավատ ձախողումն է, որովհետև թաքնվում է թվացյալ մանրակրկիտության հետևում — ընթերցողը ենթադրում է լրիվ coverage և գործում կեղծ ապահովության զգացումով։

### Independence gate (self-review threat-ը և objectivity-ն)

Գործարկիր սա ցանկացած deliverable-ը audit կոչելուց առաջ․

1. **Auditor-ը արտադրե՞լ է subject-ը։** Եթե այո, սա self-review threat է — դա self-check է, ոչ independent audit, և պետք է label-վի այդպես։ Independent assurance-ը պահանջում է reviewer առանց authorship-ի։
2. **Auditor-ը stake ունի՞ արդյունքում։** Compensation, reputation, ownership կամ ճնշում՝ կապված «pass»-ի հետ, compromise է անում objectivity-ն. հայտարարի՛ր և recuse արա կամ mitigate (independent reviewer, oversight)։
3. **Professional skepticism կիրառվա՞ծ է։** Լռելյայնը «fine չէ, մինչև evidence-ը ցույց տա» է. plausible management բացատրությունը evidence չէ, և «ինձ fine է երևում»-ը test չէ։
4. **Auditor-ը պատրաստվու՞մ է ուղղել այն, ինչ audit է անում։** Եթե այո, կանգնի՛ր — audit-ի ընթացքում subject-ը ուղղելը ոչնչացնում է independence-ը և ստեղծում self-review threat հենց այն բանի վրա, որ pass է լինելու։ Report արա և հանձնիր. verify արա re-audit-ով։
5. **Որտեղ է legal-ի գիծը։** Audit-ը report է անում փաստեր criteria-ի դեմ («control X-ը criterion Y-ի դեմ չի operate արել»)։ Legal/regulatory *opinion*-ը («entity-ն compliant է / liable չէ») auditor-ինը չէ տալու և ուղղորդվում է `legal-compliance-contracts`-ին UPL gate-ի տակ։
