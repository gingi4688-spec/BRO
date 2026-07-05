# Auditing patterns

## English

These are canonical audit moves — the spine, domain-independent. Each works the same whether the subject is code, finance, controls, language, or design; the *criteria* are dispatched from the relevant domain skill. Choose the move that advances the audit, not the one that looks most thorough.

### 1. Criteria-and-scope charter

- **Trigger:** An audit is requested ("audit this") with no stated standard, no defined population, and no scope boundary.
- **Mechanism:** Before any testing, write the charter: the **objective** (what question the audit answers), the **criteria** dispatched from the domain skill (the `domain-rubric.md` + `red-team-gate.md` of the relevant domain, named explicitly), the **population/universe** with its size, what is **in scope and out of scope** with the rationale, **materiality** (the magnitude that matters), and the **independence** posture (who is auditing, and is there a self-review threat). Confirm the charter before gathering evidence.
- **Do not use when:** The request is for a diagnosis, a design, or deep single-domain analysis with no findings-against-criteria deliverable — that is the domain skill or `analysis-primary`, not an audit.
- **Failure repair:** If testing has already started with no criteria, stop and write the charter retroactively; any finding produced without a named Criteria is an opinion until the standard is attached.

### 2. Evidence-and-sampling plan

- **Trigger:** The population is too large to test wholly, or a conclusion is being drawn from "we looked at some of it."
- **Mechanism:** State the population and its size; choose **statistical** (projectable, quantifiable risk) or **judgmental** (targets the risky/unusual, not projectable) sampling and say which; set the sample size from population × risk × tolerable error; for each item, plan the evidence at the right level of the hierarchy (direct/reperformed > corroborated documentary > inquiry). Record the **sampling risk** and that results cannot be extrapolated beyond the population.
- **Do not use when:** The population is small enough to test 100% — then test all of it and skip sampling risk entirely.
- **Failure repair:** If a clean sample is being extrapolated to "the whole population is clean," replace that with "the sample supports X, with residual risk Y," and state which items were not covered.

### 3. Control test — design then operating

- **Trigger:** A control is being audited (access, change-management, validation, review, approval, reconciliation).
- **Mechanism:** First test **design effectiveness** — is the control, as designed, capable of preventing/detecting the risk it targets? Then test **operating effectiveness** — pull a sample across the audit period and reperform or inspect evidence that the control actually ran each time. Document both with reproducible working papers (the configuration for design; the per-instance evidence for operation).
- **Do not use when:** There is no control to test — a substantive test of the outcome itself (recompute the number, re-derive the result) is the right move, not a control test.
- **Failure repair:** If "the policy exists" is being treated as "the control works," add the operating test; documentation is design evidence at best and proves neither operation nor outcome.

### 4. Finding write-up as the 5 C's with severity

- **Trigger:** An exception or weakness has been observed and must become a finding.
- **Mechanism:** Write **Condition** (the observed fact), **Criteria** (the standard it violates, dispatched from the domain), **Cause** (the root process/control reason — keep asking why past the symptom), **Consequence** (the risk/impact if uncorrected), **Corrective action** (the recommendation that fixes the class). Rate **severity** by likelihood × impact against defined bands, calibrated. Attach the working-paper reference so the finding is reproducible.
- **Do not use when:** The observation is positive (a control working well) — note it as a strength, not forced into a finding shape.
- **Failure repair:** If the Cause restates the Condition or names a person, dig to the control/process that allowed it; if severity does not match likelihood × impact, re-anchor it to the bands.

### 5. Coverage and residual-risk close-out

- **Trigger:** The audit is about to issue its report and conclusion.
- **Mechanism:** Run the completeness gate: state the population, what was tested (sampled count vs population), **what was NOT covered** (named, not summarized away), the sampling risk, and a **residual-risk** statement. State the assurance level as **reasonable, never absolute**, distinguishing positive from negative assurance. Then the report carries risk-ranked findings + management response + a follow-up path.
- **Do not use when:** Never skip it — every audit closes here; even a 100%-tested audit states "full population tested, residual risk limited to judgment/evidence limits."
- **Failure repair:** If the conclusion reads as total coverage but the audit sampled, add the uncovered remainder and the residual-risk statement before issuing; a silent gap is the worst failure because it hides behind apparent thoroughness.

### 6. Remediation follow-up and re-audit

- **Trigger:** Findings have been reported and management has responded with remediation commitments.
- **Mechanism:** Track each finding to closure with an owner and a date; when remediation is claimed, **re-audit** — re-run the test, do not take "fixed" on trust. Verify the corrective action addressed the **class** (the root cause), not just the one instance found. Keep independence: the person who remediated is not the person who verifies.
- **Do not use when:** The finding was accepted as risk (management chose not to remediate) — then record the accepted residual risk and its owner, not a re-test.
- **Failure repair:** If "fixed" is being closed without re-test, re-run the original test; if the same auditor both fixed and verified, route verification to an independent reviewer.

### 7. Forensic pivot — when assurance becomes investigation

- **Trigger:** During a routine assurance audit, evidence surfaces that suggests intent, not error — fraud, falsified records, theft, collusion, or a control deliberately defeated. The question shifts from "does the control work?" to "did someone knowingly beat it?"
- **Mechanism:** Stop treating it as an ordinary finding. **Preserve evidence and chain of custody** — capture originals with timestamps and who-had-access; never alter, annotate, or "clean up" the source. **Do not tip off the subject** (an early "I noticed X" invites evidence destruction). Re-scope with the **fraud triangle** — pressure/incentive, opportunity, rationalization — to reason about who and how, then widen sampling toward the suspected pattern (targeted, not random). **Coordinate early with the human owner and `legal-compliance-contracts`**: privilege, mandatory-reporting duties, and interview discipline (interviews become evidence — plan them, don't wing them). The auditor gathers and preserves facts; the accusation and any legal conclusion belong to the owner and counsel, not the assistant.
- **Do not use when:** An innocent explanation has not yet been ruled out — an error is not fraud. Test the honest-mistake hypothesis first; forcing a fraud frame onto a plain control weakness burns credibility and can defame.
- **Failure repair:** If the source was already altered/annotated or the subject was tipped off, log the contamination honestly (it weakens admissibility), preserve whatever remains untouched, and escalate immediately — never quietly "fix" a forensic trail.

## Հայերեն

Սրանք canonical audit move-եր են — ողնաշարը, ոլորտ-անկախ։ Ամեն մեկն աշխատում է նույն կերպ, անկախ նրանից subject-ը code է, finance, control, language, թե design. *criteria*-ն dispatch-վում է համապատասխան ոլորտի skill-ից։ Ընտրիր այն move-ը, որ առաջ է տանում audit-ը, ոչ թե ամենամանրակրկիտ երևացողը։

### 1. Criteria-and-scope charter

- **Երբ է պետք․** Audit է խնդրվում («audit արա սա»)՝ առանց նշված standard-ի, սահմանված population-ի և scope-ի սահմանի։
- **Մեխանիզմը․** Մինչև որևէ թեստավորում, գրիր charter-ը․ **objective**-ը (ինչ հարցին է audit-ը պատասխանում), **criteria**-ն՝ dispatch-ված ոլորտի skill-ից (համապատասխան ոլորտի `domain-rubric.md` + `red-team-gate.md`-ն, անվանված բացահայտ), **population/universe**-ը իր չափով, ինչ է **in scope և out of scope**՝ rationale-ով, **materiality**-ն (magnitude-ը, որ կարևոր է), և **independence**-ի դիրքը (ով է audit անում, և կա՞ self-review threat)։ Հաստատիր charter-ը նախքան evidence հավաքելը։
- **Երբ չօգտագործել․** Երբ խնդրանքը diagnosis է, design, կամ խորը մեկ-ոլորտ analysis՝ առանց findings-against-criteria deliverable-ի — դա ոլորտի skill-ն է կամ `analysis-primary`-ն, ոչ audit։
- **Ուղղում․** Եթե թեստավորումն արդեն սկսվել է առանց criteria-ի, կանգնի՛ր և գրիր charter-ը հետընթաց. ցանկացած finding՝ արտադրված առանց անվանված Criteria-ի, opinion է, մինչև standard-ը կցվի։

### 2. Evidence-and-sampling plan

- **Երբ է պետք․** Population-ն ամբողջությամբ թեստավորելու չափ մեծ է, կամ conclusion է քաշվում «մի մասը նայեցինք»-ից։
- **Մեխանիզմը․** Նշի՛ր population-ը և իր չափը. ընտրիր **statistical** (project-վող, quantify-վող ռիսկ) կամ **judgmental** (թիրախավորում է risky/անսովորը, ոչ project-վող) sampling և ասա որը. set արա sample size-ը population × ռիսկ × tolerable error-ից. ամեն item-ի համար պլանավորիր evidence-ը հիերարխիայի ճիշտ մակարդակում (direct/reperformed > corroborated documentary > inquiry)։ Record արա **sampling risk**-ը և որ արդյունքները չեն կարող extrapolate-վել population-ից այն կողմ։
- **Երբ չօգտագործել․** Երբ population-ը բավական փոքր է 100% թեստավորելու — ապա թեստավորիր ամբողջը և բաց թող sampling risk-ը ընդհանրապես։
- **Ուղղում․** Եթե մաքուր sample-ը extrapolate-վում է «ամբողջ population-ը մաքուր է»-ի, փոխարինիր «sample-ը հենում է X-ը, residual risk Y-ով»-ով, և նշիր որ item-ները չեն ծածկվել։

### 3. Control test — design հետո operating

- **Երբ է պետք․** Control է audit-վում (access, change-management, validation, review, approval, reconciliation)։
- **Մեխանիզմը․** Նախ թեստավորիր **design effectiveness**-ը — control-ը, ինչպես նախագծված է, ունա՞կ է կանխելու/հայտնաբերելու ռիսկը, որ թիրախավորում է։ Հետո թեստավորիր **operating effectiveness**-ը — քաշիր sample ողջ audit-ի ժամանակահատվածով և reperform արա կամ inspect արա evidence, որ control-ն իրականում run է արել ամեն անգամ։ Document արա երկուսն էլ reproducible working paper-ներով (configuration-ը design-ի համար. per-instance evidence-ը operation-ի համար)։
- **Երբ չօգտագործել․** Երբ թեստավորելու control չկա — outcome-ի substantive test-ը (վերահաշվիր թիվը, վերածնիր արդյունքը) ճիշտ move-ն է, ոչ control test։
- **Ուղղում․** Եթե «policy-ն կա»-ն ընդունվում է որպես «control-ն աշխատում է», ավելացրու operating test. փաստաթուղթը լավագույն դեպքում design evidence է և ոչ operation, ոչ outcome չի ապացուցում։

### 4. Finding-ի write-up որպես 5 C՝ severity-ով

- **Երբ է պետք․** Exception կամ թուլություն է դիտվել և պետք է finding դառնա։
- **Մեխանիզմը․** Գրիր **Condition** (դիտված փաստը), **Criteria** (standard-ը, որ խախտում է, dispatch-ված ոլորտից), **Cause** (root process/control պատճառը — շարունակիր հարցնել ինչու symptom-ից այն կողմ), **Consequence** (ռիսկը/impact-ը, եթե չ-ուղղվի), **Corrective action** (recommendation-ը, որ ուղղում է class-ը)։ Rate արա **severity**-ն likelihood × impact-ով սահմանված band-երի դեմ, calibrated։ Կցիր working-paper reference-ը, որ finding-ը reproducible լինի։
- **Երբ չօգտագործել․** Երբ դիտումը positive է (control, որ լավ է աշխատում) — նշիր որպես strength, ոչ թե բռնի մտցրու finding-ի ձևի մեջ։
- **Ուղղում․** Եթե Cause-ը կրկնում է Condition-ը կամ մարդ է անվանում, փորիր մինչև control/process-ը, որ թույլ տվեց. եթե severity-ն չի համապատասխանում likelihood × impact-ին, re-anchor արա band-երին։

### 5. Coverage և residual-risk close-out

- **Երբ է պետք․** Audit-ը պատրաստվում է թողարկել report-ը և conclusion-ը։
- **Մեխանիզմը․** Գործարկիր completeness gate-ը. նշի՛ր population-ը, ինչ էր թեստավորված (sample արված count ընդդեմ population-ի), **ինչ ՉԻ ծածկվել** (անվանված, ոչ ամփոփումով անհետացրած), sampling risk-ը, և **residual-risk** statement։ Assurance level-ը ասա **reasonable, երբեք absolute**, տարբերելով positive-ը negative-ից։ Հետո report-ը կրում է risk-ranked findings + management response + follow-up path։
- **Երբ չօգտագործել․** Երբեք մի՛ բաց թող — ամեն audit այստեղ է փակվում. նույնիսկ 100%-թեստավորված audit-ը նշում է «full population թեստավորված, residual risk սահմանափակված judgment/evidence-ի սահմաններով»։
- **Ուղղում․** Եթե conclusion-ը կարդացվում է որպես լրիվ coverage, բայց audit-ը sample է արել, ավելացրու չծածկված մնացորդը և residual-risk statement-ը նախքան թողարկելը. լուռ gap-ը ամենավատ ձախողումն է, որովհետև թաքնվում է թվացյալ մանրակրկիտության հետևում։

### 6. Remediation follow-up և re-audit

- **Երբ է պետք․** Findings-ը report-ված են, և management-ը պատասխանել է remediation-ի commitment-ներով։
- **Մեխանիզմը․** Հետևիր ամեն finding-ի մինչև closure՝ owner-ով և ամսաթվով. երբ remediation է claim-վում, **re-audit արա** — վերագործարկիր test-ը, «fixed»-ը վստահությամբ մի՛ վերցրու։ Verify արա, որ corrective action-ը ուղղեց **class**-ը (root cause-ը), ոչ թե միայն գտնված մեկ instance-ը։ Պահիր independence-ը. remediate անողը verify անողը չէ։
- **Երբ չօգտագործել․** Երբ finding-ը ընդունվել է որպես ռիսկ (management-ը ընտրեց չ-remediate անել) — ապա record արա ընդունված residual risk-ը և իր owner-ը, ոչ re-test։
- **Ուղղում․** Եթե «fixed»-ը փակվում է առանց re-test-ի, վերագործարկիր սկզբնական test-ը. եթե նույն auditor-ը և՛ fix արեց, և՛ verify, ուղղորդիր verification-ը independent reviewer-ին։

### 7. Forensic pivot — երբ assurance-ը դառնում է investigation

- **Երբ է պետք․** Սովորական assurance audit-ի ընթացքում evidence է հայտնվում, որ մատնանշում է դիտավորություն, ոչ սխալ — fraud, կեղծված record, գողություն, collusion, կամ control, որ դիտմամբ պարտվել է։ Հարցը փոխվում է «control-ն աշխատու՞մ է»-ից «մեկը գիտակցաբա՞ր հաղթեց նրան»-ի։
- **Մեխանիզմը․** Դադարիր վերաբերվել որպես սովորական finding։ **Պահպանի՛ր evidence-ը և chain of custody-ն** — վերցրու originals-ը timestamp-ով ու ով-մուտք-ուներ-ով. երբեք մի՛ փոխիր, annotate արա կամ «մաքրիր» source-ը։ **Մի՛ զգուշացրու subject-ին** (վաղ «նկատեցի X»-ը հրավիրում է evidence-ի ոչնչացում)։ Re-scope արա **fraud triangle**-ով — pressure/incentive, opportunity, rationalization — որ դատես ով-ի և ինչպես-ի մասին, հետո լայնացրու sampling-ը դեպի կասկածվող pattern-ը (թիրախավորված, ոչ random)։ **Վաղ համակարգիր մարդ-տիրոջ և `legal-compliance-contracts`-ի հետ**․ privilege, mandatory-reporting պարտականություններ, և interview-ի կարգապահություն (interview-ները evidence են դառնում — պլանավորիր, մի՛ wing արա)։ Auditor-ը հավաքում ու պահպանում է փաստերը. մեղադրանքն ու ցանկացած legal conclusion owner-ինն ու counsel-ինն են, ոչ assistant-ի։
- **Երբ չօգտագործել․** Երբ innocent բացատրությունը դեռ չի բացառվել — սխալը fraud չէ։ Նախ թեստավորիր honest-mistake hypothesis-ը. plain control weakness-ի վրա fraud frame բռնի դնելը այրում է credibility-ն ու կարող է defame անել։
- **Ուղղում․** Եթե source-ն արդեն փոխված/annotate-ված է կամ subject-ը զգուշացվել է, log արա contamination-ը ազնիվ (այն թուլացնում է admissibility-ն), պահպանի՛ր ինչ մնացել է անդիպչած, և escalate արա անմիջապես — երբեք լուռ մի՛ «ուղղիր» forensic trail-ը։
