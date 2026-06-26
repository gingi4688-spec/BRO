# Legal, Compliance, and Contracts red-team gate

## English

This gate extends the skill's final gate for the domain's artifacts (contract redline / risk-allocation memo, compliance control map, privacy mapping, employment review, diligence checklist, OSS-license map). It extends but never replaces the inline human-review / UPL gate in `SKILL.md` and the safety boundaries in `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Fabricated authority** — a statute, article, case, deadline, or numeric threshold stated as fact with no verifiable jurisdiction/source. Strip it; replace with a source citation or a verify-before-use placeholder.
- **Unauthorized legal conclusion (UPL)** — "this is enforceable/unenforceable," "you are compliant," "this is legal here," delivered as the answer. Reframe to issue + deciding variable + route to counsel.
- **Cap defeated by its own carveout** — a liability cap praised as protective without one breach scenario traced through the carveouts. Trace it; if the main risk is uncapped, say so.
- **Risk controller ≠ payer, unflagged** — an indemnity/cap summary with no "who controls vs who pays" line. Surface the asymmetry and turn it into a redline.
- **Attestation used as a legal shield** — a SOC 2 / ISO certificate treated as proof of GDPR compliance, satisfaction of an indemnity, or an answer to a breach duty. Map the actual obligation separately.
- **Jurisdiction-selection risk ignored** — a confident answer with no "which jurisdiction governs / where are the data subjects" question, when non-compete legality, privacy regime, or breach duty turns on it.
- **"Build to GDPR and the rest follows"** — one privacy design claimed as multi-regime compliant with no per-regime contrast (opt-in vs opt-out-of-sale, "Do Not Sell," LGPD's own statute).
- **GDPR breach clock misread** — "72 hours from the breach" stated as the rule, with no "without undue delay / from becoming aware" framing, no notifiability gate, no Art. 34 question.
- **Copyleft contamination shipped silently** — a dependency list with no license classification and no distribution-trigger question for any strong/network-copyleft component in a distributed proprietary product.
- **Protection-dodging draft** — a clause or structure whose purpose is to misclassify a worker, backdate, hide a defect, or mislead a regulator. Refuse; offer the lawful, disclosed alternative.
- **Compliance checklist with no evidence/owner** — controls "in place" with nothing audit-pullable and nobody accountable. Add the evidence artifact, owner, and cadence.

### Reviewer probes (ask these of any answer)

- Does any number, deadline, statute, article, or case appear as fact? Show the jurisdiction and the source, or mark it verify-before-use — otherwise it is invented authority.
- Is there a jurisdiction-specific legal **conclusion** stated as the answer ("enforceable," "compliant," "legal here")? If so, what is the deciding variable, and is the conclusion routed to a licensed attorney?
- For each material clause: who controls the risk, who pays when it materializes, and is the asymmetry named? Where the two diverge, where is the redline that fixes it?
- Was the liability cap scenario-tested — one breach traced through excluded damages → cap → carveouts → indemnity → defense → insurance — and is the main risk actually capped, or does a carveout swallow it?
- Is a SOC 2 / ISO attestation being leaned on as a legal shield? Which specific legal obligation does it NOT answer, and where is that obligation mapped?
- For privacy: which regime(s) actually apply, and is there a real per-regime contrast (GDPR opt-in/basis, CCPA-CPRA opt-out-of-sale, LGPD's own statute), or is one design claimed to cover them all?
- Is the GDPR breach answer "without undue delay, where feasible within 72 hours of becoming aware," gated by notifiability and the Art. 34 question — or is it the flat-72-hour myth, and is the go/no-go routed to DPO/counsel?
- For employment: are IP assignment, non-compete, severance, and at-will/for-cause handled as four separate decisions, with non-compete enforceability flagged as jurisdiction-dependent and routed out — and is any clause structured to dodge a mandatory protection?
- For OSS: is every dependency's license classified, and is any strong/network-copyleft component in a distributed proprietary product raised as a distribution-trigger counsel question?
- Is the Armenian equal-depth and punctuation-clean (correct `․`/`։`/«», no homoglyphs), with tech/legal tokens (DPA, SOC 2, indemnity) kept in English where correct?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (contract redline / risk-allocation memo, compliance control map, privacy mapping, employment review, diligence checklist, OSS-license map)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի inline մարդկային-review / UPL gate-ը և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Հորինված authority** — statute, article, case, deadline կամ numeric threshold՝ նշված որպես փաստ առանց ստուգելի jurisdiction/source-ի։ Հանիր. փոխարինիր source citation-ով կամ verify-before-use placeholder-ով։
- **Unauthorized legal եզրակացություն (UPL)** — «սա enforceable/unenforceable է», «դու compliant ես», «սա այստեղ օրինակական է»՝ տրված որպես պատասխան։ Վերաձևակերպիր issue + որոշող փոփոխական + ուղղորդիր counsel-ին։
- **Cap, որ պարտվում է իր carveout-ով** — liability cap, գովված որպես protective՝ առանց մեկ breach scenario-ի carveout-ներով անցկացման։ Անցկացրու. եթե հիմնական risk-ը uncapped է, ասա։
- **Risk controller ≠ payer, չ-flag-ված** — indemnity/cap summary՝ առանց «ով է control անում ընդդեմ ով է վճարում» տողի։ Surface արա asymmetry-ն և դարձրու redline։
- **Attestation՝ որպես legal shield** — SOC 2 / ISO certificate, համարված GDPR compliance-ի ապացույց, indemnity-ի բավարարում կամ breach duty-ի պատասխան։ Քարտեզագրիր իրական obligation-ը առանձին։
- **Jurisdiction-selection risk անտեսված** — վստահ պատասխան՝ առանց «որ jurisdiction-ն է governing / որտեղ են data subject-ները» հարցի, երբ non-compete legality-ն, privacy regime-ը կամ breach duty-ն դրա վրա է։
- **«Կառուցիր GDPR-ի և մնացածը հետևում է»** — մեկ privacy design՝ պնդված որպես multi-regime compliant՝ առանց per-regime contrast-ի (opt-in ընդդեմ opt-out-of-sale-ի, «Do Not Sell», LGPD-ի սեփական statute-ի)։
- **GDPR breach clock-ը սխալ կարդացված** — «breach-ից 72 ժամ»՝ նշված որպես կանոն, առանց «առանց անհարկի ուշացման / aware դառնալուց» framing-ի, առանց notifiability gate-ի, առանց Art. 34 հարցի։
- **Copyleft contamination՝ լուռ ship-ված** — dependency list՝ առանց license classification-ի և distribution-trigger հարցի ցանկացած strong/network-copyleft component-ի համար distributed proprietary product-ում։
- **Protection-dodging draft** — clause կամ structure, որի նպատակը worker-ին misclassify անելն է, backdate անելը, defect թաքցնելը կամ regulator-ին մոլորեցնելը։ Մերժիր. առաջարկիր օրինական, բացահայտված այլընտրանքը։
- **Compliance checklist՝ առանց evidence/owner-ի** — «in place» control-ներ՝ առանց audit-pullable որևէ բանի և առանց պատասխանատուի։ Ավելացրու evidence artifact-ը, owner-ը և cadence-ը։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Որևէ թիվ, deadline, statute, article կամ case հայտնվու՞մ է որպես փաստ։ Ցույց տուր jurisdiction-ը և source-ը, կամ նշիր verify-before-use — այլապես հորինված authority է։
- Կա՞ jurisdiction-specific իրավական **եզրակացություն**, նշված որպես պատասխան («enforceable», «compliant», «այստեղ օրինակական»)։ Եթե այո, ո՞րն է որոշող փոփոխականը, և եզրակացությունը ուղղորդվա՞ծ է licensed attorney-ին։
- Ամեն material clause-ի համար․ ով է control անում risk-ը, ով է վճարում, երբ materialize է լինում, և asymmetry-ն անվանվա՞ծ է։ Որտեղ երկուսը շեղվում են, որտե՞ղ է redline-ը, որ ուղղում է այն։
- Liability cap-ը scenario-tested է՞ — մեկ breach անցկացված excluded damages → cap → carveout → indemnity → defense → insurance-ով — և հիմնական risk-ը իրականում capped է՞, թե carveout-ը կուլ է տալիս այն։
- SOC 2 / ISO attestation-ի՞ վրա է հենվում որպես legal shield։ Որ կոնկրետ իրավական obligation-ին այն ՉԻ պատասխանում, և որտե՞ղ է այդ obligation-ը քարտեզագրված։
- Privacy-ի համար․ որ regime(ներ)-ն են իրականում կիրառվում, և կա՞ իրական per-regime contrast (GDPR opt-in/basis, CCPA-CPRA opt-out-of-sale, LGPD-ի սեփական statute), թե մեկ design է պնդված, որ ծածկում է բոլորը։
- GDPR breach պատասխանը «առանց անհարկի ուշացման, որտեղ հնարավոր է aware դառնալուց 72 ժամվա ընթացքում» է՞, gated notifiability-ով և Art. 34 հարցով — թե հարթ-72-ժամյա առասպելը, և go/no-go-ն ուղղորդվա՞ծ է DPO/counsel-ին։
- Employment-ի համար․ IP assignment-ը, non-compete-ը, severance-ը և at-will/for-cause-ը մշակվա՞ծ են որպես չորս առանձին որոշում, non-compete enforceability-ն flag-ված որպես jurisdiction-dependent և ուղղորդված դուրս — և որևէ clause կառուցվա՞ծ է պարտադիր protection-ից խուսափելու համար։
- OSS-ի համար․ ամեն dependency-ի license-ը classify-ված է՞, և ցանկացած strong/network-copyleft component distributed proprietary product-ում բարձրացվա՞ծ է որպես distribution-trigger counsel հարց։
- Հայերենը equal-depth և punctuation-clean է՞ (ճիշտ `․`/`։`/«», առանց homoglyph-ի), tech/legal token-ները (DPA, SOC 2, indemnity) պահված անգլերեն, որտեղ ճիշտ է։
