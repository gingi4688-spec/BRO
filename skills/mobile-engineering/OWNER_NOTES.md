# Mobile Engineering owner notes

## English

### Needs human review when

This skill plans and reasons about mobile clients; it must route to a human owner — not act or auto-approve — when a step ships a binary you cannot recall, can destroy a user's data, locks users out, or changes the security posture on the device. Escalate and require explicit approval when:

- **A production release to a percentage of real users** — promoting a staged rollout, widening the percentage, or going to 100%. The binary cannot be instantly recalled (store rollback is slow), so the crash-free/ANR guardrails must be observed on the real fleet and an owner accepts widening before each step.
- **A change that can destroy a user's offline data** — a conflict-resolution rule that discards local edits, a "take server, drop local" default, a migration that rewrites the local store. Require a conflict policy fit to data risk and, for high-value data, a reviewer/manual path rather than a silent overwrite.
- **A breaking server-contract change with installed clients in the field** — anything that could crash or silently corrupt data on an old app version. Name the oldest installed client and require backward-compatibility or a gated forced upgrade; the broken client has no server rollback.
- **A forced-upgrade gate that can lock users out** — a hard minimum-version wall blocks every user on an older build, including those who cannot update (old OS, low storage). Require an owner decision, a clear in-app path, and a fallback for users who genuinely cannot upgrade.
- **Security and credential changes on the device** — rotating or changing where secrets live (Keychain/KeyStore), changing or removing certificate pinning, or changing the biometric/auth flow. A mis-sequenced change can lock out the app or weaken its posture; require an owner and a tested rollback, and route key-management/threat-model questions to `security-privacy-engineering`.
- **Collecting or sending new personal data, or new runtime permissions** — a new permission prompt (location, contacts, camera), new analytics/telemetry, or sending PII off device. These carry privacy, consent, and store-policy weight; the data-collection decision is the owner's / privacy's, not made unilaterally here.

The default posture for all of the above: produce the plan, the evidence (on-device measurements, the oldest-client check, the guardrail thresholds), and the rollback/kill-switch path; then stop and route to the owner. Do not ship the irreversible step on your own authority.

### Owned future-improvement items

- Add a fourth worked example for a **breaking-API migration with an expand/contract server contract** plus a client force-upgrade gate, since it is the recurring high-stakes mobile compatibility case.
- Add a **device-tier matrix template** (representative low/mid/high tiers + oldest-supported OS) so the "verify on real hardware" gate is concrete and copy-ready.
- Add a **multi-burn / guardrail recipe for staged rollout** with explicit crash-free and ANR halt thresholds per step, so the release plan is copy-ready rather than described.
- Add a worked **secure-storage + pinning + biometric** example end to end (keystore accessibility class, SPKI + backup pin, key-gated biometric with fallback) to make the security section concrete.
- Cross-link the on-device security boundary explicitly to `security-privacy-engineering` for key-management policy, threat modeling, and server-side authz, beyond the client hygiene owned here.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը պլանավորում և դատում է բջջային client-ների մասին. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ քայլը ship է անում binary, որ չես կարող հետ կանչել, կարող է user-ի data ոչնչացնել, կողպել user-ներին, կամ փոխել device-ի security դիրքը։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Production release իրական user-ների percentage-ին** — staged rollout-ի promote, percentage-ի լայնացում, կամ 100%-ի անցում։ Binary-ն չի կարող ակնթարթ հետ կանչվել (store rollback-ը դանդաղ է), ուստի crash-free/ANR guardrail-ները պետք է դիտվեն իրական fleet-ի վրա, և owner-ը ընդունի լայնացումը ամեն step-ից առաջ։
- **Փոփոխություն, որ կարող է user-ի offline data ոչնչացնել** — conflict-resolution rule, որ դեն է նետում local edit-երը, «take server, drop local» default, migration, որ վերագրում է local store-ը։ Պահանջիր data risk-ին համապատասխան conflict policy և, high-value data-ի համար, reviewer/manual path՝ լուռ overwrite-ի փոխարեն։
- **Breaking server-contract փոփոխություն դաշտում տեղադրված client-ներով** — ամեն ինչ, որ կարող է crash կամ լուռ corrupt անել data հին app version-ի վրա։ Անվանի՛ր ամենահին տեղադրված client-ը և պահանջիր backward-compatibility կամ gated forced upgrade. կոտրված client-ը server rollback չունի։
- **Forced-upgrade gate, որ կարող է user-ներին կողպել** — կոշտ minimum-version պատը block է անում ամեն user հին build-ի վրա, ներառյալ նրանց, ով չի կարող update անել (հին OS, քիչ storage)։ Պահանջիր owner-ի որոշում, հստակ in-app path, և fallback այն user-ների համար, ով իսկապես չի կարող upgrade անել։
- **Security և credential փոփոխություն device-ի վրա** — secret-ների rotation կամ դրանց տեղի (Keychain/KeyStore) փոփոխություն, certificate pinning-ի փոփոխություն կամ հեռացում, կամ biometric/auth flow-ի փոփոխություն։ Սխալ հերթականության փոփոխությունը կարող է app-ը կողպել կամ թուլացնել նրա դիրքը. պահանջիր owner և ստուգված rollback, և key-management/threat-model հարցերը ուղղորդիր `security-privacy-engineering`-ին։
- **Նոր անձնական data-ի հավաք կամ ուղարկում, կամ նոր runtime permission** — նոր permission prompt (location, contact, camera), նոր analytics/telemetry, կամ PII-ի ուղարկում device-ից դուրս։ Սրանք կրում են privacy, consent և store-policy կշիռ. data-collection-ի որոշումը owner-ի / privacy-ինն է, ոչ թե այստեղ միակողմանի կայացված։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր պլանը, evidence-ը (on-device measurement, oldest-client ստուգում, guardrail threshold-ներ) և rollback/kill-switch path-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Անդառնալի քայլը մի՛ ship արա սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու չորրորդ worked example **breaking-API migration**-ի համար՝ expand/contract server contract-ով plus client force-upgrade gate-ով, քանի որ դա կրկնվող high-stakes բջջային compatibility դեպքն է։
- Ավելացրու **device-tier matrix template** (representative low/mid/high tier + ամենահին-supported OS), որ «verify on real hardware» gate-ը կոնկրետ և copy-ready լինի։
- Ավելացրու **multi-burn / guardrail recipe** staged rollout-ի համար՝ բացահայտ crash-free և ANR halt threshold-ներով ամեն step-ին, որ release plan-ը copy-ready լինի, ոչ նկարագրված։
- Ավելացրու worked **secure-storage + pinning + biometric** օրինակ ծայրից ծայր (keystore accessibility class, SPKI + backup pin, key-gated biometric fallback-ով), որ security բաժինը կոնկրետ լինի։
- Cross-link արա on-device security սահմանը բացահայտ `security-privacy-engineering`-ին՝ key-management policy-ի, threat modeling-ի և server-side authz-ի համար, այստեղ տիրվող client hygiene-ից այն կողմ։
