# Telecom, ISP, and Network Operations owner notes

## English

### Needs human review when

This skill plans and diagnoses networks; it must route to a human owner — not act or auto-approve — when a step is irreversible, can drop a region, exposes subscriber data, or touches a legal/regulated process. Escalate and require explicit approval when:

- **Lawful intercept or subscriber-data exposure** — any tap, mirror, log, or disclosure of a subscriber's traffic/metadata. This is the hard gate: execute only a validated lawful order delivered through the documented lawful channel, minimized to scope, audited, access-controlled. Absent that order, refuse and route to legal/the responsible authority. Legality and warrant validity are owned by legal and the issuing authority, never decided here.
- **Irreversible or region-impacting network changes** — core/border router swaps, gateway/IRB moves, IGP/BGP redesigns, MPLS/transport cutovers, anything that can drop a region or an entire OLT/PON estate. Name the rollback before proceeding and get a human owner's go.
- **Routing changes to external peers/transit** — new announcements, peering/transit policy edits, RPKI/origin changes. A leak or blackhole has cross-operator blast radius; require the MOP, the expected route-count, the leak/blackhole guards, and an owner sign-off.
- **Mass CPE firmware/config campaigns** — a fleet-wide TR-069/TR-369 push can brick a cohort. Require the staged campaign (canary, failure threshold, halt-on-failure, rollback image) and an owner go before expanding past the canary ring.
- **Customer-facing incident/SLA statements** — status-page wording, breach notifications, credit figures, regulatory statements. The reliability facts are operations'; the external message, the credit amount, and any regulatory obligation belong to incident command / comms / legal and the contract — never invented here.
- **Capacity/peering spend commitments** — transit contracts, IXP port upgrades, reserved backhaul. Surface the cost-per-Mbps and headroom math; the commitment belongs to the budget/commercial owner (see the capacity-spend conflict rule in `SKILL.md`).
- **Disabling a safety control under pressure** — skipping a MOP/rollback, bypassing a change-freeze, silencing alarms during an incident, pushing without a canary. Allowed only with explicit, time-boxed owner sign-off and a stated re-enable plan.

The default posture for all of the above: produce the plan, the evidence, and the rollback; then stop and route to the owner. Do not execute the irreversible or legally-gated step on your own authority.

### Owned future-improvement items

- Add a worked example for a **wholesale/open-access L2TP fault** (LAC→LNS), since access-vs-retail auth ownership is a recurring source of mis-triage.
- **✓ DELIVERED (gazan 2026-07-02)** — Add an **XGS-PON / 10G-PON budget worked example** alongside the GPON B+ one, so the optical-budget mechanism covers the higher-speed access estate.
- Add a **multi-window capacity/peering decision recipe** (95th-percentile + loss-under-load + cost-per-Mbps with the transit-vs-peering-vs-IXP decision), so the capacity rule is copy-ready rather than described.
- **✓ DELIVERED (gazan 2026-07-02)** — Add a **CoA/Disconnect message-flow micro-example** (attributes and the live policy change), to make the BNG mid-session rule concrete end-to-end.
- Cross-link the security overlap explicitly to `cybersecurity-operations-soc` for DDoS scrubbing and route-origin/RPKI enforcement, beyond the device/route hygiene owned here.

## Հայերեն

### Մարդկային ստուգում պետք է երբ

Այս skill-ը պլանավորում և ախտորոշում է ցանցեր. այն պետք է ուղղորդի մարդ-տիրոջը — ոչ թե գործի կամ ինքնահաստատի — երբ քայլը անդառնալի է, կարող է region գցել, subscriber data բացահայտել կամ դիպչել legal/regulated process-ի։ Escalate արա և պահանջիր հստակ approval, երբ․

- **Lawful intercept կամ subscriber-data exposure** — subscriber-ի traffic-ի/metadata-ի ցանկացած tap, mirror, log կամ disclosure։ Սա hard gate-ն է․ կատարիր միայն վավերացված օրինական order, հանձնված փաստաթղթավորված օրինական channel-ով, minimize-ված scope-ին, audited, access-controlled։ Այդ order-ի բացակայության դեպքում մերժիր և ուղղորդիր legal-ին/պատասխանատու իշխանությանը։ Օրինականությունն ու warrant-ի վավերականությունը legal-ինն ու order տվող իշխանությանն են, երբեք այստեղ չորոշված։
- **Անդառնալի կամ region-impacting ցանցային change-եր** — core/border router swap, gateway/IRB տեղափոխում, IGP/BGP redesign, MPLS/transport cutover, ամեն ինչ, որ կարող է region կամ ողջ OLT/PON estate գցել։ Անվանի՛ր rollback-ը մինչև շարունակելը և ստացիր մարդ-տիրոջ go-ն։
- **External peer/transit-ի routing change-եր** — նոր announcement, peering/transit policy edit, RPKI/origin change։ Leak-ը կամ blackhole-ը cross-operator blast radius ունի. պահանջիր MOP-ը, expected route-count-ը, leak/blackhole guard-ները և owner-ի sign-off-ը։
- **Mass CPE firmware/config campaign-ներ** — fleet-wide TR-069/TR-369 push-ը կարող է cohort bric-ել։ Պահանջիր staged campaign (canary, failure threshold, halt-on-failure, rollback image) և owner-ի go մինչև canary ring-ից այն կողմ ընդլայնելը։
- **Customer-facing incident/SLA հայտարարություններ** — status-page-ի ձևակերպում, breach notification, credit թիվ, regulatory statement։ Հուսալիության փաստերը operations-ինն են. արտաքին message-ը, credit amount-ը և ցանկացած regulatory obligation incident command-ի / comms-ի / legal-ի և contract-ինն են — երբեք այստեղ հորինված։
- **Capacity/peering spend commitment-ներ** — transit պայմանագիր, IXP port upgrade, reserved backhaul։ Ցույց տուր cost-per-Mbps-ը և headroom-ի հաշիվը. commitment-ը budget/commercial տիրոջն է (տես capacity-spend կոնֆլիկտի կանոնը `SKILL.md`-ում)։
- **Safety control-ի անջատում ճնշման տակ** — MOP/rollback-ի բացթողում, change-freeze-ի շրջանցում, alarm-ների լռեցում incident-ի ժամանակ, push առանց canary-ի։ Թույլատրելի է միայն հստակ, ժամանակ-սահմանված owner-ի sign-off-ով և նշված re-enable պլանով։

Վերը նշվածի լռելյայն դիրքը․ արտադրի՛ր պլանը, evidence-ը և rollback-ը. հետո կանգնի՛ր և ուղղորդիր owner-ին։ Անդառնալի կամ legal-gated քայլը մի՛ կատարիր սեփական լիազորությամբ։

### Սեփական ապագա-բարելավման կետեր

- Ավելացրու worked example **wholesale/open-access L2TP fault**-ի համար (LAC→LNS), քանի որ access-ընդդեմ-retail auth ownership-ը mis-triage-ի կրկնվող աղբյուր է։
- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու **XGS-PON / 10G-PON budget worked example** GPON B+-ի կողքին, որ optical-budget mechanism-ը ծածկի ավելի բարձր-արագ access estate-ը։
- Ավելացրու **multi-window capacity/peering decision recipe** (95-րդ percentile + load-ի տակ loss + cost-per-Mbps՝ transit-ընդդեմ-peering-ընդդեմ-IXP որոշմամբ), որ capacity կանոնը copy-ready լինի, ոչ նկարագրված։
- **✓ ԱՐՎԱԾ (gazan 2026-07-02)**՝ Ավելացրու **CoA/Disconnect message-flow micro-example** (attribute-ները և live policy change-ը), որ BNG mid-session կանոնը կոնկրետ լինի ծայրից ծայր։
- Cross-link արա security-ի համընկնումը բացահայտ `cybersecurity-operations-soc`-ին՝ DDoS scrubbing-ի և route-origin/RPKI enforcement-ի համար, այստեղ տիրվող device/route hygiene-ից այն կողմ։
