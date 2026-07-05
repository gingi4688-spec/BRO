# Telecom, ISP, and Network Operations red-team gate

## English

This gate extends the skill's final gate for the domain artifacts (outage triage, change MOP, route-risk review, PON budget sheet, BNG diagnosis, SLA report). It extends but never replaces the safety boundaries in `SKILL.md` (including the inline lawful-intercept hard gate) and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Fiber/optical fault chased at the app layer** — do not accept a triage that debugs DNS/app while the OLT alarms; require the physical layer and the per-ONU Rx to be read first.
- **CPE swapped on a shared-plant symptom** — do not approve truck rolls to replace ONTs when many ONUs on the PON read low Rx; require shared-plant inspection.
- **Optical budget asserted, not summed** — do not accept a PON design with no per-element loss table against the class budget (B+ = 28 dB); flag a 1:128 residential split as non-standard.
- **Routing change with no MOP / no expected route-count** — do not approve a route change without prefix filters, max-prefix, an expected route-count, validation, a rollback trigger, and comms.
- **Leak/blackhole guard missing** — do not approve an export that can leak peer/transit routes, an import with no max-prefix, or a path trusted without next-hop reachability.
- **BNG/session fault blamed on the core** — do not accept a core reboot for an auth problem; require PPPoE/IPoE identification, the RADIUS exchange, and CoA/Disconnect for live policy.
- **Mass CPE push with no canary/halt** — do not approve a fleet firmware campaign without a canary cohort, a failure threshold, and a rollback image.
- **Mediation rating raw/duplicated CDRs** — do not accept rating without dedup + normalization, or roaming rated without TAP3 handling.
- **SLA report that is an apology** — do not accept a customer report with no measured downtime, no availability math, no exclusions, and no prevention.
- **Surveillance built on request** — do not accept a tap/log/expose action without a validated lawful order and audit trail; refuse and route to legal.
- **"Verified" on a clean parse / green lab** — do not let a parsing config stand in for observing the running network's real counts/levels.

### Reviewer probes (ask these of any answer)

- Does the triage fix blast radius and the last change first, and descend the OSI stack — or does it jump to the app layer while the physical is alarming? Were the per-ONU Rx and OLT alarms read?
- For a PON fault: is the loss budget summed per element against the class budget (B+ = 28 dB), is correlated low-Rx treated as shared plant, and is Rx read before any truck is dispatched? Is a 1:128 residential split flagged as non-standard?
- For a routing change: are there intent-based prefix filters, max-prefix, an expected route-count to validate against, next-hop reachability for the blackhole guard, a named rollback trigger with a tested command, and comms? Is leak/blackhole designed out or hoped away?
- For a subscriber fault: is PPPoE vs IPoE identified, is the RADIUS exchange (Accept/Reject/accounting) traced, and is CoA/Disconnect used for a live policy change instead of a core reboot? For wholesale, is the L2TP/retail-LNS auth ownership correct?
- For a CPE fleet change: does it go through the ACS as a staged campaign (canary → rings → halt-on-failure with a rollback image), or is it a blind mass push?
- For mediation/billing: are CDRs deduped and normalized before rating, are partials correlated, is TAP3 handled for roaming, and is OCS-vs-batch chosen by whether a balance must be enforced live?
- For an SLA report: is availability computed as uptime/measured-time with exclusions stated (and the 43.2-min reference), are latency/loss/jitter/MTTR kept separate, and is any credit/obligation routed to the contract rather than invented?
- If lawful intercept or subscriber-data exposure is in scope: is there a validated lawful order with an audit trail, is the action minimized to the order's scope, and is anything without that order refused and routed to legal?
- Does the answer verify in the running network (route-count, Rx, session count, SLA metric) rather than on a clean parse or a green lab? And is the Armenian equal-depth and punctuation-clean (correct `․`/`։`/«», no homoglyphs)?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի artifact-ների համար (outage triage, change MOP, route-risk review, PON budget sheet, BNG diagnosis, SLA report)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի (ներառյալ inline lawful-intercept hard gate-ը) և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Fiber/optical fault-ը հետապնդված app layer-ում** — մի՛ ընդունիր triage, որ DNS/app է debug անում, մինչ OLT-ն alarm է. պահանջիր, որ physical layer-ը և per-ONU Rx-ը նախ կարդացվեն։
- **CPE-ն փոխված shared-plant symptom-ի վրա** — մի՛ approve արա truck roll ONT փոխելու, երբ PON-ի շատ ONU low Rx են. պահանջիր shared-plant ստուգում։
- **Optical budget-ը պնդված, ոչ գումարված** — մի՛ ընդունիր PON design առանց per-element loss table-ի class budget-ի դեմ (B+ = 28 dB). flag արա 1:128 residential split-ը որպես ոչ-standard։
- **Routing change առանց MOP-ի / expected route-count-ի** — մի՛ approve արա route change առանց prefix filter-ի, max-prefix-ի, expected route-count-ի, validation-ի, rollback trigger-ի և comms-ի։
- **Leak/blackhole guard-ը բացակայում է** — մի՛ approve արա export, որ կարող է peer/transit route leak անել, import առանց max-prefix-ի, կամ path, որին վստահում են առանց next-hop reachability-ի։
- **BNG/session fault-ը մեղադրված core-ի վրա** — մի՛ ընդունիր core reboot auth խնդրի համար. պահանջիր PPPoE/IPoE նույնականացում, RADIUS exchange և CoA/Disconnect live policy-ի համար։
- **Mass CPE push առանց canary/halt-ի** — մի՛ approve արա fleet firmware campaign առանց canary cohort-ի, failure threshold-ի և rollback image-ի։
- **Mediation-ը raw/կրկնված CDR է rate անում** — մի՛ ընդունիր rating առանց dedup + normalization-ի, կամ roaming rate-ված առանց TAP3 handling-ի։
- **SLA report, որ apology է** — մի՛ ընդունիր customer report առանց չափված downtime-ի, availability math-ի, exclusion-ների և prevention-ի։
- **Հսկողություն կառուցված ըստ պահանջի** — մի՛ ընդունիր tap/log/expose գործողություն առանց վավերացված օրինական order-ի և audit trail-ի. մերժիր և ուղղորդիր legal-ին։
- **«Verified» մաքուր parse-ի / green lab-ի վրա** — մի՛ թող, որ parse-վող config-ը փոխարինի running network-ի իրական count/level-ները դիտելուն։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Triage-ն ֆիքսո՞ւմ է blast radius-ը և last change-ը նախ, և իջնո՞ւմ OSI stack-ով — թե ցատկում է app layer, մինչ physical-ը alarm է։ Per-ONU Rx-ը և OLT alarm-ները կարդացվա՞ծ էին։
- PON fault-ի համար․ loss budget-ը գումարվա՞ծ է ըստ element-ի class budget-ի դեմ (B+ = 28 dB), correlated low-Rx-ը shared plant-ի՞ պես է դիտված, և Rx-ը կարդացվա՞ծ է truck ուղարկելուց առաջ։ 1:128 residential split-ը flag-վա՞ծ է որպես ոչ-standard։
- Routing change-ի համար․ կա՞ն intent-based prefix filter, max-prefix, expected route-count, որի դեմ validate անել, next-hop reachability՝ blackhole guard-ի համար, անվանված rollback trigger՝ ստուգված command-ով, և comms։ Leak/blackhole-ը design-out արվա՞ծ է, թե հույս է դրված։
- Subscriber fault-ի համար․ PPPoE ընդդեմ IPoE նույնականացվա՞ծ է, RADIUS exchange-ը (Accept/Reject/accounting) trace-վա՞ծ է, և CoA/Disconnect օգտագործվա՞ծ է live policy change-ի համար՝ core reboot-ի փոխարեն։ Wholesale-ի համար L2TP/retail-LNS auth ownership-ը ճի՞շտ է։
- CPE fleet change-ի համար․ անցնո՞ւմ է ACS-ով որպես staged campaign (canary → ring-եր → halt-on-failure՝ rollback image-ով), թե կույր mass push է։
- Mediation/billing-ի համար․ CDR-ները dedup և normalize-վա՞ծ են rating-ից առաջ, partial-ները correlate-վա՞ծ են, TAP3-ը handle-վա՞ծ է roaming-ի համար, և OCS-ընդդեմ-batch-ը ընտրվա՞ծ է ըստ նրա, balance-ը պետք է live enforce-վի՞։
- SLA report-ի համար․ availability-ն հաշվվա՞ծ է uptime/measured-time-ով՝ exclusion-ները նշված (և 43.2-min reference-ը), latency/loss/jitter/MTTR-ը առանձի՞ն են պահված, և ցանկացած credit/obligation ուղղորդվա՞ծ է contract-ին՝ հորինելու փոխարեն։
- Եթե lawful intercept կամ subscriber-data exposure scope-ում է․ կա՞ վավերացված օրինական order audit trail-ով, գործողությունը minimize-վա՞ծ է order-ի scope-ին, և առանց այդ order-ի որևէ բան մերժվա՞ծ ու legal-ին ուղղորդվա՞ծ է։
- Պատասխանը ստուգո՞ւմ է running network-ում (route-count, Rx, session count, SLA metric)՝ մաքուր parse-ի կամ green lab-ի փոխարեն։ Եվ հայերենը equal-depth ու punctuation-clean է՞ (ճիշտ `․`/`։`/«», առանց homoglyph-ի)։
