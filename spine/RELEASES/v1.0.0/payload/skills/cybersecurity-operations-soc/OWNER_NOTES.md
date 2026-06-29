# Cybersecurity Operations and SOC owner notes

## English

### Needs human review when

This skill reasons about live defensive operations; it must route to a human owner — not act or auto-approve — when a step is irreversible, can destroy evidence, changes the security posture, or carries legal weight. Escalate and require explicit approval when:

- **Irreversible or destructive containment** — wiping/reimaging a host, disabling an executive or service account, killing a production service, blocking a partner/upstream range, or any action that destroys evidence or breaks a dependency. Require evidence capture first (or the stated active-harm exception) and an owner's go.
- **Active-response or anything touching a third party** — hunting your own estate is in scope, but blocking outside your boundary, deception that reaches a third party, or any "retaliation" routes to legal and an authorized offensive engagement (`offensive-security-pentesting`). Most hack-back requests are refused outright per the inline gate in `SKILL.md`.
- **Breach-notification clock and disclosure** — whether an event is reportable, when the notification clock starts, and what is disclosed are legal/privacy-counsel calls. Supply the evidence timeline and impact facts; never declare "not a breach" to dodge the clock, and never destroy state legal must preserve.
- **External incident communications** — status-page wording, customer/regulator notifications, and the public narrative belong to incident command / comms / leadership. Reliability and impact facts are the SOC's input, not the message.
- **Ransom-payment decisions** — never a SOC call. Route to leadership with legal counsel (sanctions-screening, legal exposure). Continue containment/eradication/recovery regardless of the payment decision.
- **AD tier-0 / domain-wide recovery and firmware actions** — a `krbtgt` double reset, DC rebuild, trust changes, or a firmware re-flash/hardware replacement are high-blast-radius and easy to mis-sequence. Require an owner, a tested sequence, and a rollback/recovery window.
- **Promoting a new detection to a page** — a noisy rule pushed straight to paging causes alert fatigue and masks real incidents. Require a silent/log-only bake with a measured false-positive rate before it pages.

The default posture for all of the above: produce the diagnosis, the evidence, the plan, and the rollback; then stop and route to the owner. Do not execute the irreversible step, start the legal clock, or speak externally on your own authority.

### Owned future-improvement items

- Add a worked **detection-engineering lifecycle** example end to end (hypothesis → rule → silent bake → FP measurement → promotion → decommission), so the silent-first discipline is copy-ready, not only described.
- Add a **threat-hunting** worked example (hypothesis-driven hunt over collected telemetry, with the ATT&CK coverage delta it produces) to complement the reactive triage examples.
- Add a **purple-team feedback loop** note: how an authorized offensive engagement's findings convert into detections and a coverage map, with the boundary to `offensive-security-pentesting` made explicit.
- Add a **log-source / collection maturity map** template (per source: collected? parsed? retained how long? which techniques it covers) so collection blind spots become a standing artifact, not an incident-time surprise.
- Cross-link the control-redesign handoff explicitly to `security-privacy-engineering` (IAM, segmentation, secure-SDLC) and the offensive boundary to `offensive-security-pentesting`, beyond the conflict rules in `SKILL.md`.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը դատում է live defensive operations-ի մասին. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ քայլը անդառնալի է, կարող է ապացույց ոչնչացնել, փոխում է security posture-ը կամ իրավական կշիռ ունի։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Անդառնալի կամ destructive containment** — host-ի wipe/reimage, executive կամ service account-ի անջատում, production service-ի սպանում, partner/upstream range-ի block, կամ ցանկացած action, որ ապացույց է ոչնչացնում կամ dependency է կոտրում։ Պահանջիր ապացույցի capture նախ (կամ նշված active-harm բացառությունը) և owner-ի go։
- **Active-response կամ երրորդ կողմին դիպչող ամեն ինչ** — սեփական estate-ը hunt անելը շրջանակում է, բայց սահմանից դուրս block-ը, երրորդ կողմ հասնող deception-ը կամ ցանկացած «retaliation» ուղղորդվում է legal-ին և authorized offensive engagement-ին (`offensive-security-pentesting`)։ Hack-back-ի խնդրանքների մեծ մասը ուղղակի մերժվում է՝ ըստ `SKILL.md`-ի inline gate-ի։
- **Breach-notification ժամացույց և disclosure** — արդյո՞ք event-ը reportable է, ե՞րբ է մեկնարկում ժամացույցը և ի՞նչ է բացահայտվում՝ legal/privacy-counsel-ի որոշումներ են։ Տուր ապացույցի timeline-ը և impact-ի փաստերը. երբեք «breach չէ» մի՛ հայտարարիր ժամացույցը խույս տալու, և երբեք մի՛ ոչնչացրու state, որ legal-ը պետք է պահպանի։
- **Incident-ի արտաքին communication-ներ** — status-page-ի ձևակերպումը, customer/regulator notification-ները և public narrative-ը incident command-ի / comms-ի / leadership-ի սեփականությունն են։ Reliability-ի և impact-ի փաստերը SOC-ի input-ն են, ոչ message-ը։
- **Ransom-payment որոշումներ** — երբեք SOC call չէ։ Ուղղորդիր leadership-ին legal counsel-ի հետ (sanctions-screening, legal exposure)։ Շարունակիր containment/eradication/recovery՝ անկախ payment-ի որոշումից։
- **AD tier-0 / domain-wide recovery և firmware action-ներ** — `krbtgt` double reset, DC rebuild, trust փոփոխություն, կամ firmware re-flash/hardware-ի փոխարինում՝ high-blast-radius են և հեշտ mis-sequence-վող։ Պահանջիր owner, ստուգված հերթականություն և rollback/recovery window։
- **Նոր detection-ը page-ի promote անելը** — noisy rule, ուղիղ paging push-ված, alert fatigue է առաջացնում և թաքցնում իրական incident-ները։ Պահանջիր silent/log-only bake չափված false-positive rate-ով՝ մինչ page-ելը։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր diagnosis-ը, evidence-ը, plan-ը և rollback-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Անդառնալի քայլը մի՛ կատարիր, legal ժամացույցը մի՛ գործարկիր, և արտաքին մի՛ խոսիր սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու worked **detection-engineering lifecycle** օրինակ ծայրից ծայր (hypothesis → rule → silent bake → FP measurement → promotion → decommission), որ silent-first discipline-ը copy-ready լինի, ոչ միայն նկարագրված։
- Ավելացրու **threat-hunting** worked example (hypothesis-driven hunt հավաքված telemetry-ի վրա, և այն ATT&CK coverage delta-ով, որ արտադրում է)՝ reactive triage օրինակները լրացնելու համար։
- Ավելացրու **purple-team feedback loop** note․ ինչպես authorized offensive engagement-ի finding-ները վերածվում են detection-ների և coverage map-ի, `offensive-security-pentesting`-ի հետ սահմանը բացահայտ։
- Ավելացրու **log-source / collection maturity map** template (ամեն source-ի համար․ հավաքվա՞ծ է, parse-վա՞ծ է, որքա՞ն է retain-ված, որ technique-ներն է ծածկում), որ collection blind spot-երը դառնան standing artifact, ոչ incident-time անակնկալ։
- Cross-link արա control-redesign handoff-ը բացահայտ `security-privacy-engineering`-ին (IAM, segmentation, secure-SDLC) և offensive սահմանը `offensive-security-pentesting`-ին՝ `SKILL.md`-ի կոնֆլիկտի կանոններից այն կողմ։
