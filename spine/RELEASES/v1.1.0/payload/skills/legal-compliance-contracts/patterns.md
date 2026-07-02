# Legal, Compliance, and Contracts patterns

## English

These are canonical Legal, Compliance, and Contracts moves. Each is a mechanism for one of the domain's artifacts (contract redline / risk-allocation memo, compliance control map, privacy mapping, employment review, diligence checklist, OSS-license map). Choose the move that changes the next decision, not the nicest label. Every move stops at the UPL boundary: it spots issues and frames options; it routes jurisdiction-specific conclusions to a licensed attorney.

### 1. Risk-allocation clause map

- **Trigger:** A contract feels risky but unspecific, or a review is drifting into a clause-by-clause paraphrase.
- **Mechanism:** For each material clause, map five fields: controlled-by (who can prevent the risk), paid-by (who bears it when it materializes), remedy, fallback wording, and business-acceptability. Surface every place the controller and payer diverge — that asymmetry is the negotiation ask.
- **Do not use when:** The user wants a jurisdiction-specific enforceability conclusion — that routes to counsel; this map structures the negotiation, it does not rule on law.
- **Failure repair:** If the risk owner differs from the payer and the review is silent, escalate the asymmetry and turn it into a redline (re-allocate, cap, or indemnify).

### 2. Liability-stack scenario test

- **Trigger:** Cap or indemnity language is confusing, or a cap is being treated as protective without proof.
- **Mechanism:** Trace one concrete breach scenario through the whole stack — excluded/consequential damages → direct damages → cap amount → super-cap/uncapped carveouts → indemnity scope → defense control → insurance. Show where the scenario lands and what is actually recoverable.
- **Do not use when:** The user asks whether the cap is enforceable in a specific jurisdiction — flag jurisdiction as the deciding variable and route that conclusion to counsel.
- **Failure repair:** If the main risk (confidentiality, IP, data breach) is uncapped or the carveout swallows the cap, say plainly: for that scenario there is effectively no cap, and name the super-cap or insurance fallback.

### 3. Compliance control-evidence map

- **Trigger:** A compliance request names a framework (SOC 2, ISO 27001, a privacy regime) or claims "we're certified."
- **Mechanism:** Map each obligation to a control, an evidence artifact (the thing pulled at audit), a named owner, a test cadence, and an exception path. Treat the framework as a control system, not a badge.
- **Do not use when:** Someone wants the attestation used as a legal shield — a SOC 2 report does not prove GDPR basis, satisfy an indemnity, or answer a breach duty; map those obligations separately.
- **Failure repair:** If a control has no evidence artifact or no owner, it is not audit-ready — add the artifact, the owner, the cadence, and the exception path before claiming the control is "in place."

### 4. Multi-jurisdiction privacy contrast map

- **Trigger:** A product touches data subjects in more than one regime, or someone proposes "build to GDPR and the rest follows."
- **Mechanism:** Build a per-regime obligation map across GDPR (lawful basis, opt-in consent, DPA, transfer mechanism), CCPA/CPRA (opt-out of sale/share, "Do Not Sell"), and LGPD (its own bases/authority). Key it to which regime applies, the consent/opt-out mechanic each demands, the contractual requirements, and the transfer rules.
- **Do not use when:** The user wants a "we are compliant in X" certification — that conclusion routes to counsel/DPO; this map shows the obligations and the gaps.
- **Failure repair:** If one design is claimed as multi-regime compliant, split it per regime, call out the opt-in vs opt-out-of-sale divergence, and mark thresholds and current transfer mechanisms verify-before-use.

### 5. Employment-agreement four-lever review

- **Trigger:** An offer letter or employment agreement needs review, or one clause (IP, non-compete, severance, at-will) is being negotiated.
- **Mechanism:** Review four separate levers — present-assign IP (with jurisdiction carve-outs), non-compete/non-solicit (consideration, scope, governing jurisdiction), severance (tied to termination basis, with release), and at-will vs for-cause (with "cause" defined if for-cause). Check the four are internally consistent.
- **Do not use when:** The user asks "is this non-compete enforceable here?" — never assert it; flag the governing jurisdiction as the deciding variable and route to counsel.
- **Failure repair:** If a draft is structured to dodge a mandatory protection (misclassification, no severance where required, backdated assignment), refuse that framing and offer the lawful, disclosed alternative.

### 6. M&A due-diligence deal-breaker checklist

- **Trigger:** A transaction needs legal diligence, or found risk needs to be allocated into the deal.
- **Mechanism:** Walk the deal-breaker areas — change-of-control/anti-assignment, IP chain-of-title and OSS contamination, data-privacy liabilities, employment/IP gaps, undisclosed litigation — and for each ask "does this kill, delay, or reprice the deal?" Allocate found risk through reps & warranties, indemnity (cap/basket/survival), escrow/holdback, and disclosure schedules.
- **Do not use when:** The user wants a legal opinion on whether a finding is a "violation" — map and price it; route the violation/enforceability conclusion to deal counsel.
- **Failure repair:** If diligence produces findings with no home, allocate each one into a deal mechanic (rep, indemnity, escrow, price adjustment, or condition to close); a finding with no allocation is not diligence done.

## Հայերեն

Սրանք canonical Legal, Compliance, and Contracts move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (contract redline / risk-allocation memo, compliance control map, privacy mapping, employment review, diligence checklist, OSS-license map)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։ Ամեն move կանգնում է UPL boundary-ին․ այն spot է անում issue-ները և framework է անում option-ները. jurisdiction-specific եզրակացությունները ուղղորդում է licensed attorney-ին։

### 1. Risk-allocation clause map

- **Երբ է պետք․** Contract-ը risky է թվում, բայց vague, կամ review-ն շեղվում է clause-by-clause paraphrase-ի։
- **Մեխանիզմը․** Ամեն material clause-ի համար քարտեզագրիր հինգ field․ controlled-by (ով կարող է կանխել risk-ը), paid-by (ով է կրում, երբ materialize է լինում), remedy, fallback wording և business-acceptability։ Surface արա ամեն տեղ, որտեղ controller-ը և payer-ը շեղվում են — այդ asymmetry-ն negotiation ask է։
- **Երբ չօգտագործել․** Երբ user-ը jurisdiction-specific enforceability եզրակացություն է ուզում — դա ուղղորդվում է counsel-ին. այս map-ը structure է անում negotiation-ը, օրենքի վրա չի վճռում։
- **Ուղղում․** Եթե risk owner-ը և payer-ը տարբեր են, և review-ն լուռ է, escalate արա asymmetry-ն և դարձրու redline (re-allocate, cap, կամ indemnify)։

### 2. Liability-stack scenario test

- **Երբ է պետք․** Cap կամ indemnity language-ը խառն է, կամ cap-ը համարվում է protective՝ առանց ապացույցի։
- **Մեխանիզմը․** Անցկացրու մեկ կոնկրետ breach scenario ամբողջ stack-ով — excluded/consequential damages → direct damages → cap amount → super-cap/uncapped carveout → indemnity scope → defense control → insurance։ Ցույց տուր, որտեղ է scenario-ն վայրէջք կատարում և ինչ է իրականում recoverable։
- **Երբ չօգտագործել․** Երբ user-ը հարցնում է՝ cap-ը կոնկրետ jurisdiction-ում enforceable է՞ — flag արա jurisdiction-ը որպես որոշող փոփոխական և այդ եզրակացությունը ուղղորդիր counsel-ին։
- **Ուղղում․** Եթե հիմնական risk-ը (confidentiality, IP, data breach) uncapped է, կամ carveout-ը կուլ է տալիս cap-ը, ուղիղ ասա․ այդ scenario-ի համար cap գործնականում չկա, և անվանի՛ր super-cap-ը կամ insurance fallback-ը։

### 3. Compliance control-evidence map

- **Երբ է պետք․** Compliance request-ը framework է անվանում (SOC 2, ISO 27001, privacy regime) կամ պնդում է «certified ենք»։
- **Մեխանիզմը․** Ամեն obligation քարտեզագրիր control-ի, evidence artifact-ի (այն, ինչ pull-վում է audit-ին), անվանված owner-ի, test cadence-ի և exception path-ի։ Framework-ը համարիր control system, ոչ badge։
- **Երբ չօգտագործել․** Երբ ինչ-որ մեկը ուզում է attestation-ը legal shield-ի օգտագործել — SOC 2 report-ը չի ապացուցում GDPR basis, չի բավարարում indemnity, և չի պատասխանում breach duty-ին. այդ obligation-ները քարտեզագրիր առանձին։
- **Ուղղում․** Եթե control-ը evidence artifact կամ owner չունի, audit-ready չէ — ավելացրու artifact-ը, owner-ը, cadence-ը և exception path-ը նախքան control-ը «in place» անվանելը։

### 4. Multi-jurisdiction privacy contrast map

- **Երբ է պետք․** Product-ը մեկից ավելի regime-ի data subject-ների է դիպչում, կամ ինչ-որ մեկը առաջարկում է «կառուցիր GDPR-ի և մնացածը հետևում է»։
- **Մեխանիզմը․** Կառուցիր per-regime obligation map GDPR-ի (lawful basis, opt-in consent, DPA, transfer mechanism), CCPA/CPRA-ի (opt-out of sale/share, «Do Not Sell») և LGPD-ի (իր սեփական bases/authority) վրայով։ Key արա այն, թե որ regime-ն է կիրառվում, ինչ consent/opt-out mechanic է ամեն մեկը պահանջում, contractual պահանջները և transfer rules-ը։
- **Երբ չօգտագործել․** Երբ user-ը «X-ում compliant ենք» certification է ուզում — այդ եզրակացությունը ուղղորդվում է counsel/DPO-ին. այս map-ը ցույց է տալիս obligation-ները և gap-երը։
- **Ուղղում․** Եթե մեկ design պնդված է որպես multi-regime compliant, բաժանիր ըստ regime-ի, նշիր opt-in ընդդեմ opt-out-of-sale-ի շեղումը, և threshold-ները ու ընթացիկ transfer mechanism-ները նշիր verify-before-use։

### 5. Employment-agreement four-lever review

- **Երբ է պետք․** Offer letter կամ employment agreement review է պետք, կամ մեկ clause (IP, non-compete, severance, at-will) բանակցվում է։
- **Մեխանիզմը․** Review արա չորս առանձին lever — present-assign IP (jurisdiction carve-out-ներով), non-compete/non-solicit (consideration, scope, governing jurisdiction), severance (կապված termination basis-ի, release-ով) և at-will ընդդեմ for-cause-ի («cause» սահմանված, եթե for-cause է)։ Ստուգիր, որ չորսը ներքին consistent են։
- **Երբ չօգտագործել․** Երբ user-ը հարցնում է «այս non-compete-ը այստեղ enforceable է՞» — երբեք մի՛ պնդիր. flag արա governing jurisdiction-ը որպես որոշող փոփոխական և ուղղորդիր counsel-ին։
- **Ուղղում․** Եթե draft-ը կառուցված է պարտադիր protection-ից խուսափելու համար (misclassification, severance չկա, որտեղ պահանջվում է, backdated assignment), մերժիր այդ framing-ը և առաջարկիր օրինական, բացահայտված այլընտրանքը։

### 6. M&A due-diligence deal-breaker checklist

- **Երբ է պետք․** Transaction-ին իրավական diligence է պետք, կամ գտնված risk-ը պետք է allocate-վի deal-ի մեջ։
- **Մեխանիզմը․** Անցիր deal-breaker ոլորտները — change-of-control/anti-assignment, IP chain-of-title և OSS contamination, data-privacy liability-ներ, employment/IP gap-եր, չբացահայտված litigation — և ամեն մեկի համար հարցրու «սա սպանո՞ւմ, ուշացնո՞ւմ, թե reprice է անում deal-ը»։ Allocate արա գտնված risk-ը reps & warranties-ով, indemnity-ով (cap/basket/survival), escrow/holdback-ով և disclosure schedule-ներով։
- **Երբ չօգտագործել․** Երբ user-ը legal opinion է ուզում, թե finding-ը «violation» է՞ — քարտեզագրիր և գին դիր. violation/enforceability եզրակացությունը ուղղորդիր deal counsel-ին։
- **Ուղղում․** Եթե diligence-ը արտադրում է finding-ներ առանց տան, allocate արա ամեն մեկը deal mechanic-ի մեջ (rep, indemnity, escrow, price adjustment, կամ condition to close). finding առանց allocation-ի՝ diligence արված չէ։
