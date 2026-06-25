# Cybersecurity Operations and SOC red-team gate

## English

This gate extends the skill's final gate for the domain artifacts (triage note, detection rule, severity call, IR/containment plan, eradication runbook, log-source map, post-incident review). It extends but never replaces the inline authorization/refusal gate in `SKILL.md` and the boundaries in `../shared/OPERATING_PROTOCOL.md`.

### Domain failure & refusal cases (must be caught)

- **Offense disguised as defense** — refuse retaliation/hack-back, intrusion into systems the user is not authorized to operate, malware authoring/operation, stealth/anti-forensics to evade defenders, credential theft/misuse, or surveillance without lawful basis. Route lawful active response to legal + an authorized offensive engagement.
- **Containment that destroys evidence** — do not approve a wipe/reboot/reimage before volatile capture and a forensic image, unless active ongoing harm makes speed the higher duty and that trade is stated.
- **Containment that tips off the adversary** — do not approve a loud, single visible action while scope is unknown; require scoped/quiet containment and a hunt for other footholds.
- **Eradication that misses scope** — do not approve "removed the malware" without credential-rotation scope, a persistence hunt, and reimage-over-clean for privileged/uncertain hosts.
- **Partial AD recovery** — do not approve closing a tier-0/Domain-Admin incident without a double `krbtgt` rotation (replication between resets) and DC rebuild.
- **Firmware persistence ignored** — do not approve an OS-only reimage when below-OS (UEFI/BMC/network-device) persistence is suspected; require firmware re-flash or hardware replacement.
- **Legal clock pre-empted** — do not let the SOC declare "not a breach" to dodge notification, or destroy state legal must preserve, before legal/privacy-counsel and IR-command are looped in.
- **Detection not deployable** — do not approve a rule with no log source, threshold, TP/FP cases, or tuning, or one paged without a silent bake.
- **Collection blind spot** — do not let a confident verdict stand when the confirming telemetry was never collected or aged out of retention.
- **Attribution as fact** — do not approve a named actor driving legal/PR action without corroborating evidence and a caveat.
- **Invented facts** — do not approve invented CVEs, indicators, vendor/product claims, or actor names; volatile facts are verify-before-use.

### Reviewer probes (ask these of any answer)

- What is the ATT&CK technique, the data sources that confirm it, and the expected next behavior — does the map change collection/detection/response, or just decorate the note?
- Is severity computed as impact × confidence with the two scored *separately*, and does low confidence block destructive action?
- For any destructive containment: was volatile evidence and a forensic image captured first, and is the action scoped/quiet enough not to tip off an adversary still holding other footholds?
- Does eradication scope credential/token rotation beyond the obvious account, hunt persistence, and reimage rather than clean for privileged hosts? If tier-0 was hit, is there a *double* `krbtgt` rotation and DC rebuild? If firmware persistence is plausible, is reimage escalated to re-flash/replacement?
- Is the confirming telemetry actually collected and within retention — or is the honest deliverable a collection/retention gap request?
- Were the legal/breach-notification clock, external comms, and any ransom-payment decision routed to their owners with the evidence timeline, rather than decided here?
- For a detection rule: does it have logic, fields, threshold, the log source it runs on, a TP case, an FP case, and a tuning dimension — and is it baked silent/log-only before paging?
- For a CTI report: was it operationalized into a rule/hunt against collected logs (TTPs over rotatable indicators), with a coverage delta — or just read and filed?
- Are metrics (MTTD/MTTR/dwell/FP) segmented by detection type, and does the post-incident review ship at least one detection/control change per contributing factor?
- Is attribution caveated, are all indicators/CVEs/actor names verify-before-use, and is the Armenian equal-depth and punctuation-clean (correct `․`/`։`/«», no homoglyphs)?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (triage note, detection rule, severity call, IR/containment plan, eradication runbook, log-source map, post-incident review)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի inline authorization/refusal gate-ը և `../shared/OPERATING_PROTOCOL.md`-ի սահմանները։

### Ոլորտային failure & refusal case-եր (պետք է բռնվեն)

- **Հարձակում՝ պաշտպանության կեղծ տեսքով** — մերժիր retaliation/hack-back, համակարգ ներխուժում, որի վրա user-ը authorized չէ, malware authoring/operation, stealth/anti-forensics defender-ից խուսափելու, credential-ի գողություն/չարաշահում, կամ surveillance առանց իրավական հիմքի։ Lawful active response-ը ուղղորդիր legal-ին + authorized offensive engagement-ին։
- **Containment, որ ոչնչացնում է ապացույց** — մի՛ approve արա wipe/reboot/reimage մինչ volatile capture-ը և forensic image-ը, եթե active ընթացիկ վնասը արագությունը ավելի բարձր պարտք չի դարձնում, և այդ trade-ն նշված է։
- **Containment, որ զգուշացնում է adversary-ին** — մի՛ approve արա բարձր, մեկ տեսանելի action, մինչ scope-ը անհայտ է. պահանջիր scoped/լուռ containment և hunt մյուս foothold-ների համար։
- **Eradication, որ բաց է թողնում scope-ը** — մի՛ approve արա «malware-ը հանեցինք»՝ առանց credential-rotation scope-ի, persistence hunt-ի և reimage-over-clean-ի privileged/անորոշ host-երի համար։
- **Մասնակի AD recovery** — մի՛ approve արա tier-0/Domain-Admin incident-ի փակումը՝ առանց double `krbtgt` rotation-ի (replication reset-երի միջև) և DC rebuild-ի։
- **Firmware persistence անտեսված** — մի՛ approve արա OS-only reimage, երբ below-OS (UEFI/BMC/network-device) persistence-ը կասկածվում է. պահանջիր firmware re-flash կամ hardware-ի փոխարինում։
- **Legal ժամացույց՝ կանխորոշված** — մի՛ թող, որ SOC-ը հայտարարի «breach չէ» notification-ը խույս տալու, կամ ոչնչացնի state, որ legal-ը պետք է պահպանի, մինչ legal/privacy-counsel-ը և IR-command-ը loop-ում լինեն։
- **Detection-ը deploy-ելի չէ** — մի՛ approve արա rule՝ առանց log source-ի, threshold-ի, TP/FP case-երի կամ tuning-ի, կամ page-ված առանց silent bake-ի։
- **Collection blind spot** — մի՛ թող, որ վստահ verdict մնա, երբ հաստատող telemetry-ն երբեք չհավաքվեց կամ retention-ից դուրս եկավ։
- **Attribution՝ որպես փաստ** — մի՛ approve արա named actor, որ legal/PR action է շարժում՝ առանց corroborating ապացույցի և caveat-ի։
- **Հորինված fact-եր** — մի՛ approve արա հորինված CVE, indicator, vendor/product claim կամ actor name. volatile fact-երը verify-before-use են։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Ի՞նչ է ATT&CK technique-ը, այն հաստատող data source-ները և սպասվող հաջորդ behavior-ը — map-ը փոխո՞ւմ է collection/detection/response, թե միայն դեկորում note-ը։
- Severity-ն հաշվվա՞ծ է որպես impact × confidence՝ երկուսը *առանձին* score-ված, և ցածր confidence-ը block է անո՞ւմ destructive action-ը։
- Ցանկացած destructive containment-ի համար․ volatile evidence-ը և forensic image-ը նախ capture-վե՞ց, և action-ը scoped/լուռ է՞ բավական, որ չզգուշացնի դեռ ուրիշ foothold ունեցող adversary-ին։
- Eradication-ը scope է անո՞ւմ credential/token rotation-ը ակնհայտ account-ից վեր, hunt է անո՞ւմ persistence, և reimage է անո՞ւմ՝ ոչ clean, privileged host-երի համար։ Եթե tier-0-ն հարվածվեց, կա՞ *double* `krbtgt` rotation և DC rebuild։ Եթե firmware persistence-ը հավանական է, reimage-ը escalate-վա՞ծ է re-flash/replacement-ի։
- Հաստատող telemetry-ն իսկապես հավաքվա՞ծ է և retention-ի մեջ — թե ազնիվ deliverable-ը collection/retention gap-ի request է։
- Legal/breach-notification ժամացույցը, external comms-ը և ցանկացած ransom-payment որոշում ուղղորդվե՞ց իրենց տերերին ապացույցի timeline-ով, ոչ թե այստեղ որոշվեց։
- Detection rule-ի համար․ ունի՞ logic, fields, threshold, log source-ը, որի վրա run է, TP case, FP case և tuning dimension — և bake-վա՞ծ է silent/log-only մինչ paging-ը։
- CTI report-ի համար․ operationalize-վե՞ց rule-ի/hunt-ի՝ հավաքված log-ների դեմ (TTP՝ rotatable indicator-ից վեր), coverage delta-ով — թե միայն կարդացվեց ու file-վեց։
- Metric-ները (MTTD/MTTR/dwell/FP) segment-վա՞ծ են detection type-ով, և post-incident review-ն ship է անո՞ւմ առնվազն մեկ detection/control փոփոխություն ամեն contributing factor-ին։
- Attribution-ը caveat-ով է՞, բոլոր indicator/CVE/actor name-երը verify-before-use են՞, և հայերենը equal-depth ու punctuation-clean է՞ (ճիշտ `․`/`։`/«», առանց homoglyph-ի)։
