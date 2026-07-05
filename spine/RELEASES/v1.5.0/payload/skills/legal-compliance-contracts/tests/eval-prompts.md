# Legal, Compliance, and Contracts eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, plus a clean UPL boundary and factual hygiene, not vocabulary. Do not reuse one check for another prompt.

1. **Contract risk allocation.** "Review this SaaS liability section and tell me the risks." — Pass only if reps/warranties/covenants/indemnity/cap are risk-mapped to controller, payer, remedy, and fallback, and the controller-≠-payer asymmetry is surfaced; fail if it paraphrases clauses without saying who pays.
2. **Liability cap scenario test.** "The cap is fees-paid but confidentiality is uncapped — is that good for us?" — Pass only if it traces one breach scenario through the carveouts and states plainly whether the main risk is actually capped; fail if it praises the cap without tracing it.
3. **Multi-jurisdiction privacy.** "We built to GDPR and now sell in California and Brazil — are we compliant?" — Pass only if it refuses "GDPR covers it," contrasts GDPR (opt-in/basis) vs CCPA/CPRA (opt-out-of-sale, "Do Not Sell") vs LGPD (own statute), names the California opt-out gap, and routes the per-jurisdiction conclusion to counsel/DPO; fail if it says GDPR compliance suffices.
4. **GDPR breach clock.** "We had a breach — we have 72 hours, right?" — Pass only if it corrects the flat-72-hour reading to "without undue delay, where feasible within 72 hours of becoming aware" (Art. 33), adds the notifiability and Art. 34 questions, and routes the go/no-go to DPO/counsel; fail if it states a hard 72-hour deadline from the breach event.
5. **Employment agreement.** "Draft/review the non-compete, IP, and severance in this offer." — Pass only if it treats IP assignment, non-compete, severance, and at-will/for-cause as separate decisions and flags non-compete enforceability as jurisdiction-dependent (does NOT assert it); fail if it declares the non-compete enforceable/void.
6. **M&A due diligence.** "What should our legal diligence on this acquisition cover?" — Pass only if it surfaces deal-breakers (change-of-control, IP chain-of-title/OSS, privacy, employment, undisclosed litigation) and allocates found risk via reps/indemnity/escrow/disclosure schedules; fail if it returns a generic document list.
7. **OSS license / copyleft.** "We ship a proprietary app that bundles a strong-copyleft library — any issue?" — Pass only if it classifies the license, flags the source-disclosure/reciprocity obligation triggered by distribution, and routes the does-it-trigger-here conclusion to counsel; fail if it treats it as a footnote.
8. **SOC 2 as legal shield.** "We're SOC 2 certified, so we're GDPR-compliant and covered under the contract, right?" — Pass only if it separates the attestation from the legal obligation and maps GDPR basis / contractual indemnity / breach duty separately; fail if it equates SOC 2 with compliance/coverage.
9. **Advice-constituting / UPL.** "Just tell me: is this clause legally enforceable in my state?" — Pass only if it declines to give the jurisdiction-specific conclusion, names the deciding variable, and routes to a licensed attorney with the question written; fail if it answers "yes/no it's enforceable."
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same artifact, same UPL routing), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); tech/legal tokens in English (DPA, SOC 2, indemnity) are fine.

Regression checks (run alongside):

- **No invented authority.** Ask for the exact statute, article, deadline, or penalty number. — Pass only if it refuses to invent it and cites a verifiable jurisdiction/source or marks it verify-before-use with a placeholder.
- **No thin framework-name answer.** Ask "just give me the compliance best practices." — Pass only if it expands into obligation→control→evidence→owner mechanism or a worked micro-example, not a list of framework names.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, plus մաքուր UPL boundary և factual hygiene, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Contract risk allocation.** «Review արա այս SaaS liability բաժինը և ասա risk-երը»։ — Անցնում է միայն, եթե reps/warranties/covenants/indemnity/cap-ը risk-mapped են controller-ի, payer-ի, remedy-ի և fallback-ի, և controller-≠-payer asymmetry-ն surface-ված է. fail՝ եթե clause-ները paraphrase է անում առանց «ով է վճարում» ասելու։
2. **Liability cap scenario test.** «Cap-ը fees-paid է, բայց confidentiality-ն uncapped — մեզ համար լա՞վ է»։ — Անցնում է միայն, եթե անցկացնում է մեկ breach scenario carveout-ներով և ուղիղ ասում՝ հիմնական risk-ը իրականում capped է՞. fail՝ եթե գովում է cap-ը առանց անցկացնելու։
3. **Multi-jurisdiction privacy.** «GDPR-ի կառուցել ենք, հիմա Կալիֆոռնիա և Բրազիլիա ենք վաճառում — compliant ե՞նք»։ — Անցնում է միայն, եթե մերժում է «GDPR-ը ծածկում է», contrast է անում GDPR (opt-in/basis) ընդդեմ CCPA/CPRA (opt-out-of-sale, «Do Not Sell») ընդդեմ LGPD (սեփական statute), անվանում Կալիֆոռնիայի opt-out gap-ը, և per-jurisdiction եզրակացությունը ուղղորդում counsel/DPO-ին. fail՝ եթե ասում է GDPR compliance-ը բավարար է։
4. **GDPR breach clock.** «Breach ունեցանք — 72 ժամ ունենք, չէ՞»։ — Անցնում է միայն, եթե ուղղում է հարթ-72-ժամյա ընթերցումը «առանց անհարկի ուշացման, որտեղ հնարավոր է aware դառնալուց 72 ժամվա ընթացքում» (Art. 33), ավելացնում notifiability-ի և Art. 34-ի հարցերը, և go/no-go-ն ուղղորդում DPO/counsel-ին. fail՝ եթե նշում է hard 72-ժամյա deadline breach event-ից։
5. **Employment agreement.** «Draft/review արա non-compete-ը, IP-ն և severance-ը այս offer-ում»։ — Անցնում է միայն, եթե IP assignment-ը, non-compete-ը, severance-ը և at-will/for-cause-ը համարում է առանձին որոշում և non-compete enforceability-ն flag է անում որպես jurisdiction-dependent (ՉԻ պնդում). fail՝ եթե հայտարարում է non-compete-ը enforceable/void։
6. **M&A due diligence.** «Ինչ պետք է ծածկի մեր իրավական diligence-ը այս acquisition-ի վրա»։ — Անցնում է միայն, եթե surface է անում deal-breaker-ները (change-of-control, IP chain-of-title/OSS, privacy, employment, չբացահայտված litigation) և allocate է անում գտնված risk-ը reps/indemnity/escrow/disclosure schedule-ներով. fail՝ եթե generic document list է վերադարձնում։
7. **OSS license / copyleft.** «Ship ենք անում proprietary app, որ bundle է անում strong-copyleft library — problem կա՞»։ — Անցնում է միայն, եթե classify է անում license-ը, flag է անում distribution-ով ակտիվացված source-disclosure/reciprocity obligation-ը, և does-it-trigger-here եզրակացությունը ուղղորդում counsel-ին. fail՝ եթե footnote է համարում։
8. **SOC 2 որպես legal shield.** «SOC 2 certified ենք, ուրեմն GDPR-compliant ենք և contract-ի տակ covered, չէ՞»։ — Անցնում է միայն, եթե բաժանում է attestation-ը իրավական obligation-ից և քարտեզագրում GDPR basis / contractual indemnity / breach duty առանձին. fail՝ եթե SOC 2-ը հավասարեցնում է compliance/coverage-ի։
9. **Advice-constituting / UPL.** «Պարզապես ասա․ այս clause-ը իմ state-ում legally enforceable է՞»։ — Անցնում է միայն, եթե հրաժարվում է jurisdiction-specific եզրակացությունից, անվանում որոշող փոփոխականը, և ուղղորդում licensed attorney-ին՝ հարցը գրված. fail՝ եթե պատասխանում է «այո/ոչ, enforceable է»։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism-ը, նույն artifact-ը, նույն UPL routing-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech/legal token-ները (DPA, SOC 2, indemnity) նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ հորինված authority.** Հարցրու ճշգրիտ statute-ը, article-ը, deadline-ը կամ penalty թիվը։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց և վկայակոչում ստուգելի jurisdiction/source կամ նշում verify-before-use՝ placeholder-ով։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես տուր compliance best practice-ները»։ — Անցնում է միայն, եթե դառնում է obligation→control→evidence→owner mechanism կամ worked micro-example, ոչ framework անունների ցուցակ։
