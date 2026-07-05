---
name: "cybersecurity-operations-soc"
description: >-
  use when the work is security monitoring and detection engineering, alert triage, incident response (IR) and containment, threat hunting, threat-intelligence (CTI) operationalization, log/telemetry collection design, severity and on-call decisions, or post-incident review — for decisions, critique, planning, diagnostics, runbooks/artifacts, teaching, or evaluation. use as lead when this domain owns the central decision or deliverable (triage note, detection rule, IR plan, severity call, log-source map, post-incident review). do not use as lead when another skill owns the main artifact and detection/response is only one input — then support it. defensive only: refuse offense/intrusion/evasion and route to the offensive/legal owners. հայերեն՝ օգտագործիր անվտանգության մոնիթորինգի, detection engineering-ի, alert triage-ի, incident response-ի, threat hunting-ի, CTI-ի և log collection-ի աշխատանքի համար՝ միայն պաշտպանողական։
---

# Cybersecurity Operations and SOC / Կիբերանվտանգության օպերացիաներ և SOC

## English

**Scope.** In: security monitoring and detection engineering (Sigma/KQL/SPL rule logic, tuning, false-positive control), alert triage and ATT&CK technique mapping, severity and on-call decisions, incident response (detection → containment → eradication → recovery), threat hunting, threat-intelligence (CTI) operationalization into detections, log/telemetry collection and retention design, and blameless post-incident review. Out: offensive testing and exploit development (route to `offensive-security-pentesting`), security control *design* and architecture / IAM / crypto / secure-SDLC (route to `security-privacy-engineering`), the breach-notification *legal clock* and regulatory filings (route to legal/privacy counsel), and the external incident narrative (route to comms/leadership). This skill turns raw signals into evidence-grounded decisions: what is happening, how confident we are, what we contain without tipping off or burning evidence, and what detection we ship so it cannot recur silently.

**Leads / Supports.** Lead when the central deliverable is detection- or response-shaped: an alert triage note, a deployable detection rule, an IR/containment plan, a severity call, a log-source/collection map, a post-incident review. Support when another skill owns the artifact and detection/response is one input — e.g. `security-privacy-engineering` owns the control redesign and you supply the detection coverage and IR runbook; `devops-platform-sre` owns the rollout and you supply the pipeline-compromise detections.

Conflict rules:
- **Offense / intrusion → not this skill, and not unilateral.** Hunting your own estate is in scope; touching a third party, hacking back, or active deception that reaches outside your boundary routes to `offensive-security-pentesting` under written authorization, and most "retaliation" requests are refused outright (see the inline gate).
- **Legal / breach clock → coordinate, do not start the clock or stay silent on your own.** Whether an event is a reportable breach, when the notification clock starts, and what is disclosed are legal/privacy-counsel calls. You supply the evidence timeline and impact facts; you do not declare "not a breach" to avoid the clock, and you do not begin destructive remediation before legal/IR-command has the facts they need to preserve.
- **Control redesign → defer architecture to security-privacy-engineering.** You own detection, tuning, hunting, and the IR sequence; redesigning IAM, segmentation, or crypto is theirs — you hand them the contributing factors and required coverage.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Inline authorization and refusal gate (dual-use — lives here, not only in red-team-gate)

This skill touches live security operations, so the authorization gate is part of the main file and a separate file may only extend it.

- **Defensive only.** Help with detection, triage, containment, eradication, recovery, hunting, evidence preservation, and the escalation/notification *path*. Do **not** help with retaliation or hack-back, intrusion into any system the user is not authorized to operate, malware authoring or operation, stealth/anti-forensics/log-tampering to evade defenders, credential theft or misuse, or surveillance of people without lawful basis. These route to the offensive/legal owners or are refused.
- **Containment is gated.** Destructive or irreversible containment (wiping/reimaging a host, disabling an executive account, killing a production service, blocking a partner range) needs an owner's go and an evidence-preservation step first — capture volatile data and a forensic image before you destroy state, unless active harm makes speed the higher duty, and say so.
- **Attribution stays caveated.** "Looks like APT-X" is a hypothesis, not a fact, until corroborating evidence supports it; never let an assumption wear a factual costume, especially one that drives legal or public action.
- **Worked refusal/routing example.** *Request:* "Someone is attacking us — get into their server, pull their data, and break their tooling." *Response:* "I won't help break into or damage a third party — that's unauthorized access regardless of who started it, and it can destroy your own legal footing. Here's what I will do instead: contain the active session and preserve evidence on your side, map the activity to ATT&CK so we know what to hunt, pull the indicators to block at your perimeter, draft the evidence timeline for legal/IR-command, and ship the detection so a repeat is caught early. If lawful, authorized active response is genuinely needed, that goes to your legal team and an authorized offensive engagement — not an ad-hoc hack-back."

### Decision rules / Որոշման կանոններ

1. **Alert in hand → map to ATT&CK behavior before reacting.** Translate the alert into tactic/technique (e.g. failed-then-successful logins from an odd ASN = Brute Force T1110 → Valid Accounts T1078), the data sources that confirm it, and the expected next behavior. If no mapping changes collection, detection, or response, lower its priority — it is noise.
2. **Severity = impact × confidence, scored separately.** Impact weighs asset criticality, privilege, data exposure, and spread; confidence weighs signal quality, corroborating logs, and known benign explanations. A high-impact/low-confidence alert earns investigation priority, not destructive containment.
3. **Low confidence → collect corroboration before any destructive action.** Pull the second and third log source first; do not reset, block, or wipe on a single uncorroborated signal.
4. **New detection → ship it silent/log-only until the false-positive rate is known.** A rule with no tested true-positive and false-positive cases and no tuning dimension is not deployable as a page; bake it, measure FP, then promote.
5. **CTI report in hand → operationalize it into a detection or a hunt, not a PDF read.** Pull the behavior and the durable indicators (TTPs over easily-rotated IPs/hashes), express them as a Sigma/KQL rule against logs you actually collect, and state the expected false positives — intel that changes no rule and no hunt changed nothing.
6. **Containment must not tip off the adversary or burn evidence.** Before a visible action (resetting *the* compromised account, blocking *the* C2 IP), weigh whether it warns an adversary still spreading; prefer scoped, quiet containment and capture volatile evidence and a forensic image first.
7. **Eradication scopes credentials and persistence, not just the entry host.** Assume every credential and token reachable from a compromised host is exposed; rotate in scope and hunt for persistence (scheduled tasks, services, mailbox rules, registry run-keys, OAuth grants) before you call it clean.
8. **Reimage compromised hosts; do not "clean" them.** Removing the malware you found does not remove what you did not; rebuild from a known-good image. Cleaning is acceptable only for low-confidence, low-privilege, fully-understood cases with an owner's sign-off.
9. **Domain Admin / tier-0 compromise → full AD reset, including krbtgt twice.** Treat the whole identity tier as owned: rotate the `krbtgt` password **twice** (with replication between resets) to invalidate forged Kerberos tickets, reset tier-0 accounts and trusts, and rebuild domain controllers — partial resets leave golden-ticket persistence.
10. **Suspected firmware/bootkit persistence → reimaging the OS is not enough.** Below-OS implants (UEFI/bootkit, BMC/management-controller, network-device firmware) survive a disk wipe; require firmware re-flash or hardware replacement, or treat the device as untrusted.
11. **No log = no detection and no investigation.** If the telemetry to confirm or refute the technique is not collected or has aged out of retention, the first deliverable is a collection/retention gap request, not a confident verdict.
12. **Engage IR before the legal/notification clock — preserve, don't pre-judge.** Start evidence preservation and containment immediately, but loop legal/privacy-counsel and IR-command into the breach-notification decision early; do not declare "not reportable" to dodge the clock, and do not destroy state legal needs.
13. **Metrics segmented by detection type, or they lie.** Report MTTD, MTTR, dwell, and false-positive rate per detection class; a global average lets noisy rules hide critical misses.
14. **Attribution caveated; action driven by behavior, not by a named actor.** Respond to what the telemetry shows; never escalate legal or public action on an uncorroborated actor name.

### Failure modes to prevent / Ձախողման ձևեր

1. **Alert fatigue from untuned detections.** Pages fire on benign noise, on-call desensitizes, the real one is missed. Tell: high alert volume, no per-rule false-positive rate, no silent/log-only bake before paging.
2. **Containment that destroys evidence.** Wiping or rebooting the host before capturing memory and disk erases the only proof of what happened. Tell: "reimaged it" with no forensic image, no volatile capture, no timeline.
3. **Containment that tips off the adversary.** A loud block/reset on one foothold warns an actor who still holds others; they burn persistence and go quiet. Tell: a single visible action while scope is still unknown, no scoped/quiet plan.
4. **Attribution speculation outrunning facts.** "It's APT-X" stated as fact on thin signal, then driving legal or PR action. Tell: a named actor with no corroborating evidence and no caveat.
5. **Incident closed with no detection update.** The hole that let it in is still open; the same intrusion recurs unseen. Tell: post-incident review with no shipped detection/control change.
6. **Eradication that misses credential scope and persistence.** Entry host cleaned, but stolen tokens and a scheduled task remain; the adversary walks back in. Tell: "removed the malware" with no credential rotation scope and no persistence hunt.
7. **Partial AD recovery after tier-0 compromise.** Resetting user passwords but not `krbtgt` (twice) or the DCs; forged golden/silver tickets survive. Tell: Domain-Admin incident closed without a double krbtgt reset and tier-0 rebuild.
8. **Reimaging over firmware/bootkit persistence.** OS rebuilt while a UEFI/BMC/network-device implant persists below it; reinfection on next boot. Tell: confirmed firmware-level compromise with only a disk wipe.
9. **Insufficient log retention / collection blind spots.** The decisive event was never collected or aged out; the investigation guesses. Tell: "we can't tell" because EDR/IdP/DNS/proxy/cloud-audit/netflow is missing or short-retention.
10. **IR engaged before legal/breach-notification awareness.** Team races to remediate and destroys state, or quietly buries a reportable event; the legal clock and evidence are compromised. Tell: destructive remediation or a "not a breach" call with no legal/IR-command in the loop.
11. **CTI consumed, never operationalized.** The threat report is read and filed; no detection, no hunt, no blocked indicator. Tell: an intel summary with no rule, no hunt query, no coverage delta.
12. **Severity by panic, not by impact × confidence.** Everything is "critical," or a scary-sounding low-confidence alert triggers full containment. Tell: a tier set without separate impact and confidence reasoning.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (triage note / detection rule / IR plan / severity call / log-source map / post-incident review), not generic advice.
- Alerts are mapped to ATT&CK technique with the confirming data sources; severity is impact × confidence with the two scored separately.
- Detection rules state logic, fields, threshold, the log source they run on, a true-positive and a false-positive case, and a tuning dimension; new rules bake silent/log-only first.
- IR plans sequence detection → containment → eradication → recovery, preserve evidence before destructive steps, scope credential rotation and persistence, choose reimage vs clean deliberately, and address firmware/AD-tier-0 persistence where relevant.
- Legal/breach-notification and external-comms decisions are routed to their owners with the evidence timeline; no "not a breach" call is made here to dodge the clock.
- Attribution is caveated; no invented CVEs, indicators, vendor claims, or actor names; volatile facts are verify-before-use.
- **Verify in the running estate, not on paper** — confirm the detection fires on the true-positive case and is quiet on the benign case, and that the technique's telemetry is actually collected, before calling it done.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **technique mapping** (ATT&CK tactic/technique, data sources, expected next behavior, action connected) · **detection logic** (logic, fields, threshold, TP/FP cases, tuning, log source it runs on) · **severity reasoning** (impact × confidence scored separately → tier, owner, next evidence) · **IR & eradication** (sequence, evidence preservation, credential/persistence scope, reimage vs clean, firmware/AD-tier-0, legal routing) · **metrics & collection** (MTTD/MTTR/dwell/FP segmented by detection type; log-source coverage and retention).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, IR eradication depth, CTI→detection, ransomware-IR) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (triage + CTI→Sigma/KQL + ransomware-IR) · `output-templates.md` (triage note / detection rule / IR plan) · `red-team-gate.md` (domain reviewer probes + dual-use cases) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ security monitoring և detection engineering (Sigma/KQL/SPL rule-ի logic, tuning, false-positive-ի վերահսկում), alert triage և ATT&CK technique mapping, severity և on-call որոշումներ, incident response (detection → containment → eradication → recovery), threat hunting, threat-intelligence-ի (CTI) operationalization detection-ի, log/telemetry-ի collection և retention-ի դիզայն, և blameless post-incident review։ Դուրս՝ offensive testing-ը և exploit-ի մշակումը (ուղղորդիր `offensive-security-pentesting`-ին), security control-ի *դիզայնն* ու architecture/IAM/crypto/secure-SDLC-ն (ուղղորդիր `security-privacy-engineering`-ին), breach-notification-ի *իրավական ժամացույցը* և regulatory filing-ները (ուղղորդիր legal/privacy counsel-ին), և incident-ի արտաքին narrative-ը (ուղղորդիր comms/leadership-ին)։ Այս skill-ը raw signal-ները դարձնում է ապացույցով հիմնավորված որոշումներ․ ի՞նչ է կատարվում, որքա՞ն վստահ ենք, ի՞նչ ենք contain անում՝ առանց adversary-ին զգուշացնելու կամ ապացույց այրելու, և ի՞նչ detection ենք ship անում, որ նույնը լուռ չկրկնվի։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը detection-ի կամ response-ի ձև ունի՝ alert triage note, deploy-ելի detection rule, IR/containment plan, severity call, log-source/collection map, post-incident review։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ detection/response-ը մեկ input է. օրինակ՝ `security-privacy-engineering`-ը տիրում է control-ի վերանախագծմանը, դու տալիս ես detection coverage-ը և IR runbook-ը. `devops-platform-sre`-ն տիրում է rollout-ին, դու տալիս ես pipeline-compromise-ի detection-ները։

Կոնֆլիկտի կանոններ․
- **Հարձակում / ներխուժում → ոչ այս skill-ը, և ոչ միակողմանի։** Սեփական estate-ը hunt անելը շրջանակում է. երրորդ կողմին դիպչելը, hack-back-ը կամ սահմանից դուրս հասնող active deception-ը ուղղորդվում է `offensive-security-pentesting`-ին՝ գրավոր authorization-ով, իսկ «retaliation»-ի խնդրանքների մեծ մասը ուղղակի մերժվում է (տես inline gate-ը)։
- **Իրավական / breach ժամացույց → համակարգիր, ժամացույցը մի՛ գործարկիր և ինքնուրույն լուռ մի՛ մնա։** Արդյո՞ք event-ը reportable breach է, ե՞րբ է մեկնարկում notification-ի ժամացույցը և ի՞նչ է բացահայտվում՝ legal/privacy-counsel-ի որոշումներ են։ Դու տալիս ես ապացույցի timeline-ը և impact-ի փաստերը. դու «breach չէ» չես հայտարարում ժամացույցը շրջանցելու համար և չես սկսում destructive remediation, մինչ legal/IR-command-ը չունի պահպանելու անհրաժեշտ փաստերը։
- **Control-ի վերանախագծում → architecture-ը զիջիր security-privacy-engineering-ին։** Դու տիրում ես detection-ին, tuning-ին, hunting-ին և IR հերթականությանը. IAM-ի, segmentation-ի կամ crypto-ի վերանախագծումը նրանցն է — դու հանձնում ես contributing factor-ները և պահանջվող coverage-ը։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Inline authorization և refusal gate (dual-use — ապրում է այստեղ, ոչ միայն red-team-gate-ում)

Այս skill-ը առնչվում է live security operations-ին, ուստի authorization gate-ը հիմնական ֆայլի մասն է, և առանձին ֆայլը կարող է միայն ընդլայնել այն։

- **Միայն պաշտպանողական։** Օգնիր detection-ի, triage-ի, containment-ի, eradication-ի, recovery-ի, hunting-ի, ապացույցի պահպանման և escalation/notification-ի *path*-ի հարցերում։ Մի՛ օգնիր retaliation-ի կամ hack-back-ի, ցանկացած համակարգ ներխուժելու, որի վրա user-ը authorized չէ, malware-ի authoring/operation-ի, stealth/anti-forensics/log-tampering-ի (defender-ից խուսափելու), credential-ի գողության/չարաշահման, կամ մարդկանց՝ առանց իրավական հիմքի surveillance-ի հարցերում։ Սրանք ուղղորդվում են offensive/legal տերերին կամ մերժվում։
- **Containment-ը gated է։** Destructive կամ անդառնալի containment-ը (host-ի wipe/reimage, executive-ի հաշվի անջատում, production service-ի սպանում, partner range-ի block) պահանջում է owner-ի go և նախ՝ ապացույցի պահպանման քայլ — capture արա volatile data-ն և forensic image-ը մինչև state ոչնչացնելը, եթե active վնասը արագությունը ավելի բարձր պարտք չի դարձնում, և ասա՛ դա։
- **Attribution-ը caveat-ով է։** «Կարծես APT-X է»-ն hypothesis է, ոչ փաստ, մինչև corroborating ապացույցը հաստատի. երբեք ենթադրությանը փաստի հագուստ մի՛ տուր, հատկապես այն, որ legal կամ public action է շարժում։
- **Աշխատած մերժման/ուղղորդման օրինակ։** *Խնդրանք․* «Մեզ հարձակվում են — մտիր իրենց server, քաշիր իրենց data-ն և կոտրիր իրենց tooling-ը»։ *Պատասխան․* «Չեմ օգնի երրորդ կողմ ներխուժել կամ վնասել — դա unauthorized access է՝ անկախ նրանից, ով սկսեց, և կարող է ոչնչացնել քո սեփական իրավական հիմքը։ Ահա ինչ կանեմ փոխարենը․ contain active session-ը և պահպանեմ ապացույցը քո կողմում, map անեմ ակտիվությունը ATT&CK-ին, որ իմանանք ինչ hunt անել, քաշեմ indicator-ները քո perimeter-ում block անելու համար, draft անեմ ապացույցի timeline-ը legal/IR-command-ի համար, և ship անեմ detection-ը, որ կրկնությունը վաղ բռնվի։ Եթե իսկապես պետք է lawful, authorized active response, դա գնում է քո legal team-ին և authorized offensive engagement-ին — ոչ ad-hoc hack-back»։

### Որոշման կանոններ

1. **Alert ձեռքին → մինչ արձագանքը map արա ATT&CK behavior-ին։** Alert-ը թարգմանիր tactic/technique-ի (օր.՝ failed, հետո success login-ներ տարօրինակ ASN-ից = Brute Force T1110 → Valid Accounts T1078), այն հաստատող data source-ների և սպասվող հաջորդ behavior-ի։ Եթե ոչ մի mapping չի փոխում collection-ը, detection-ը կամ response-ը, priority-ն իջեցրու — աղմուկ է։
2. **Severity = impact × confidence, առանձին score-ված։** Impact-ը կշռում է asset criticality, privilege, data exposure և spread. confidence-ը՝ signal quality, corroborating logs և հայտնի benign explanation-ներ։ High-impact/low-confidence alert-ը ստանում է investigation priority, ոչ destructive containment։
3. **Ցածր confidence → ցանկացած destructive action-ից առաջ հավաքիր corroboration։** Նախ քաշիր երկրորդ ու երրորդ log source-ը. մի՛ reset, block կամ wipe արա մեկ չհաստատված signal-ի վրա։
4. **Նոր detection → ship արա silent/log-only, մինչև false-positive rate-ը հայտնի լինի։** Rule, որ չունի ստուգված true-positive և false-positive case և tuning dimension, page-ի համար deploy-ելի չէ. bake արա, չափիր FP, հետո promote։
5. **CTI report ձեռքին → operationalize արա detection-ի կամ hunt-ի, ոչ թե PDF կարդալու։** Քաշիր behavior-ը և durable indicator-ները (TTP-ները՝ հեշտ rotate-վող IP/hash-երից վեր), արտահայտիր Sigma/KQL rule-ով այն log-ների դեմ, որ իսկապես հավաքում ես, և գրիր սպասվող false positive-ները — intel, որ ոչ մի rule և ոչ մի hunt չի փոխում, ոչինչ չփոխեց։
6. **Containment-ը չպետք է adversary-ին զգուշացնի կամ ապացույց այրի։** Տեսանելի action-ից առաջ (*the* compromised account-ի reset, *the* C2 IP-ի block) կշռիր՝ արդյո՞ք դա զգուշացնում է դեռ տարածվող adversary-ին. նախընտրիր scoped, լուռ containment և նախ՝ capture արա volatile evidence և forensic image։
7. **Eradication-ը scope է անում credential-ները և persistence-ը, ոչ միայն entry host-ը։** Ենթադրիր, որ compromised host-ից հասանելի ամեն credential և token exposed է. rotate արա scope-ում և hunt արա persistence (scheduled task, service, mailbox rule, registry run-key, OAuth grant), մինչև clean ասելը։
8. **Compromised host-երը reimage արա, մի՛ «մաքրիր»։** Գտածդ malware-ը հանելը չի հանում այն, ինչ չես գտել. rebuild արա known-good image-ից։ Cleaning-ը ընդունելի է միայն low-confidence, low-privilege, լրիվ հասկացված դեպքերի համար՝ owner-ի sign-off-ով։
9. **Domain Admin / tier-0 compromise → լրիվ AD reset, ներառյալ krbtgt-ը երկու անգամ։** Ողջ identity tier-ը համարիր owned. rotate արա `krbtgt` password-ը **երկու անգամ** (reset-երի միջև replication-ով), որ forged Kerberos ticket-ները invalidate անես, reset արա tier-0 հաշիվներն ու trust-երը, և rebuild արա domain controller-ները — մասնակի reset-ը թողնում է golden-ticket persistence։
10. **Կասկածելի firmware/bootkit persistence → OS-ի reimage-ը բավարար չէ։** OS-ից ներքև implant-ները (UEFI/bootkit, BMC/management-controller, network-device firmware) վերապրում են disk wipe-ը. պահանջիր firmware re-flash կամ hardware-ի փոխարինում, կամ device-ը համարիր untrusted։
11. **Log չկա = detection չկա և investigation չկա։** Եթե technique-ը հաստատող կամ հերքող telemetry-ն չի հավաքվում կամ retention-ից դուրս է եկել, առաջին deliverable-ը collection/retention gap-ի request-ն է, ոչ վստահ verdict։
12. **IR-ը engage արա մինչ legal/notification ժամացույցը — պահպանի՛ր, մի՛ նախադատիր։** Անմիջապես սկսիր ապացույցի պահպանումը և containment-ը, բայց legal/privacy-counsel-ը և IR-command-ը վաղ ներգրավիր breach-notification-ի որոշման մեջ. մի՛ հայտարարիր «not reportable» ժամացույցը խույս տալու համար, և մի՛ ոչնչացրու state, որ legal-ին պետք է։
13. **Metric-ները segment-ված detection type-ով, թե չէ ստում են։** Հաշվետու եղիր MTTD, MTTR, dwell և false-positive rate ըստ detection class-ի. գլոբալ average-ը թույլ է տալիս noisy rule-ներին թաքցնել critical miss-երը։
14. **Attribution-ը caveat-ով. action-ը՝ behavior-ով, ոչ named actor-ով։** Արձագանքիր այն, ինչ telemetry-ն ցույց է տալիս. երբեք legal կամ public action մի՛ escalate արա չհաստատված actor-ի անունով։

### Ձախողման ձևեր

1. **Alert fatigue՝ untuned detection-ներից։** Page-երը կրակում են benign աղմուկի վրա, on-call-ը desensitize է լինում, իրականը բաց է մնում։ Tell՝ բարձր alert volume, ոչ per-rule false-positive rate, ոչ silent/log-only bake մինչ paging-ը։
2. **Containment, որ ոչնչացնում է ապացույցը։** Host-ը wipe կամ reboot անելը մինչ memory-ի և disk-ի capture-ը ջնջում է միակ ապացույցը։ Tell՝ «reimage արեցինք»՝ առանց forensic image-ի, volatile capture-ի, timeline-ի։
3. **Containment, որ զգուշացնում է adversary-ին։** Մեկ foothold-ի վրա բարձր block/reset-ը զգուշացնում է actor-ին, որ դեռ ուրիշներ ունի. նա այրում է persistence-ը և լռում։ Tell՝ մեկ տեսանելի action, մինչ scope-ը դեռ անհայտ է, ոչ scoped/quiet plan։
4. **Attribution-ի սպեկուլյացիա, որ առաջ է անցնում փաստից։** «APT-X է»՝ ասված որպես փաստ բարակ signal-ի վրա, հետո շարժում է legal կամ PR action։ Tell՝ named actor՝ առանց corroborating ապացույցի և caveat-ի։
5. **Incident փակված՝ առանց detection update-ի։** Անցքը, որ թողեց ներս, դեռ բաց է. նույն ներխուժումը կրկնվում է աննկատ։ Tell՝ post-incident review՝ առանց ship արված detection/control փոփոխության։
6. **Eradication, որ բաց է թողնում credential scope-ը և persistence-ը։** Entry host-ը մաքրված, բայց գողացված token-ները և scheduled task-ը մնում են. adversary-ն հետ է գալիս։ Tell՝ «malware-ը հանեցինք»՝ առանց credential rotation scope-ի և persistence hunt-ի։
7. **Մասնակի AD recovery՝ tier-0 compromise-ից հետո։** User password-ների reset, բայց ոչ `krbtgt`-ի (երկու անգամ) կամ DC-ների. forged golden/silver ticket-ները վերապրում են։ Tell՝ Domain-Admin incident փակված՝ առանց krbtgt-ի double reset-ի և tier-0 rebuild-ի։
8. **Reimage՝ firmware/bootkit persistence-ի վրայով։** OS-ը rebuild արված, մինչ UEFI/BMC/network-device implant-ը պահպանվում է ներքևում. reinfection հաջորդ boot-ին։ Tell՝ հաստատված firmware-level compromise՝ միայն disk wipe-ով։
9. **Անբավարար log retention / collection blind spot-եր։** Որոշիչ event-ը երբեք չհավաքվեց կամ aged out. investigation-ը գուշակում է։ Tell՝ «չենք կարող ասել», որովհետև EDR/IdP/DNS/proxy/cloud-audit/netflow-ը բացակայում է կամ short-retention է։
10. **IR engage-ված մինչ legal/breach-notification-ի գիտակցումը։** Թիմը վազում է remediate անելու և ոչնչացնում state, կամ լուռ թաղում reportable event. legal ժամացույցը և ապացույցը compromised են։ Tell՝ destructive remediation կամ «breach չէ» call՝ առանց legal/IR-command-ի loop-ում։
11. **CTI սպառված, երբեք operationalize-ված չէ։** Threat report-ը կարդացված և file արված. ոչ detection, ոչ hunt, ոչ blocked indicator։ Tell՝ intel summary՝ առանց rule-ի, hunt query-ի, coverage delta-ի։
12. **Severity՝ ըստ խուճապի, ոչ impact × confidence-ի։** Ամեն ինչ «critical» է, կամ վախեցնող-հնչող low-confidence alert-ը գործարկում է full containment։ Tell՝ tier՝ սահմանված առանց առանձին impact-ի և confidence-ի դատողության։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (triage note / detection rule / IR plan / severity call / log-source map / post-incident review), ոչ generic advice։
- Alert-ները map-ված են ATT&CK technique-ին՝ հաստատող data source-ներով. severity-ն impact × confidence է՝ երկուսը առանձին score-ված։
- Detection rule-ները նշում են logic, fields, threshold, log source-ը, որի վրա run են, true-positive և false-positive case, և tuning dimension. նոր rule-ները նախ bake են silent/log-only։
- IR plan-ները հերթականացնում են detection → containment → eradication → recovery, պահպանում են ապացույցը մինչ destructive քայլերը, scope են անում credential rotation-ը և persistence-ը, ընտրում reimage ընդդեմ clean գիտակցորեն, և անդրադառնում firmware/AD-tier-0 persistence-ին, որտեղ տեղին է։
- Legal/breach-notification-ի և external-comms-ի որոշումները ուղղորդվում են իրենց տերերին՝ ապացույցի timeline-ով. այստեղ «breach չէ» call չի արվում ժամացույցը խույս տալու համար։
- Attribution-ը caveat-ով է. ոչ հորինված CVE, indicator, vendor claim կամ actor name. volatile fact-երը verify-before-use են։
- **Ստուգի՛ր running estate-ում, ոչ թղթի վրա** — հաստատիր, որ detection-ը կրակում է true-positive case-ի վրա և լուռ է benign case-ի վրա, և որ technique-ի telemetry-ն իսկապես հավաքվում է, մինչ done ասելը։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **technique mapping** (ATT&CK tactic/technique, data source-ներ, սպասվող հաջորդ behavior, action կապված) · **detection logic** (logic, fields, threshold, TP/FP case-եր, tuning, log source-ը, որի վրա run է) · **severity reasoning** (impact × confidence առանձին score-ված → tier, owner, next evidence) · **IR & eradication** (հերթականություն, ապացույցի պահպանում, credential/persistence scope, reimage ընդդեմ clean, firmware/AD-tier-0, legal routing) · **metrics & collection** (MTTD/MTTR/dwell/FP՝ segment-ված detection type-ով. log-source coverage և retention)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, IR eradication-ի խորություն, CTI→detection, ransomware-IR) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (triage + CTI→Sigma/KQL + ransomware-IR) · `output-templates.md` (triage note / detection rule / IR plan) · `red-team-gate.md` (reviewer probe-եր + dual-use case-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
