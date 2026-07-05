# Telecom, ISP, and Network Operations patterns

## English

These are canonical telecom/ISP/network-operations moves. Each is a mechanism for one of the domain's artifacts (outage triage, change MOP, route-risk review, PON budget sheet, BNG diagnosis, SLA report). Choose the move that changes the next decision, not the nicest label.

### 1. Layered outage triage

- **Trigger:** Customers report broad connectivity loss and the cause is not obvious.
- **Mechanism:** Fix blast radius (how many, where, which shared element) and the last change first. Then descend the OSI stack in order: physical (optical Rx/Tx, power, OLT alarms, fiber) → link (errors, CRC, flap, VLAN/MPLS) → IP reachability → routing adjacency/route presence → DNS/app. Stop at the lowest alarming layer and fix there.
- **Do not use when:** A single customer is affected with no shared-element correlation — that is a CPE/last-mile fault, triage it as a single-subscriber case, not a network outage.
- **Failure repair:** If the team is debugging DNS/app while a physical alarm is red, re-anchor at the lowest alarming layer and read the optical levels before going up.

### 2. BGP change MOP (leak/blackhole-safe)

- **Trigger:** A routing-policy change is planned (new peer, new announcement, policy edit).
- **Mechanism:** Write prefix filters by intent (customer/peer/transit), max-prefix per session, communities and local-pref/MED intent, the **expected post-change route-count**, validation commands, monitoring, a named rollback trigger with a tested rollback command, and customer/peer comms. Capture current state in pre-check; validate by comparing live route-count and reachability to the expected post-state.
- **Do not use when:** The action is emergency traffic isolation during a live incident — that runs under incident command with its own authority, not a scheduled MOP.
- **Failure repair:** If validation has no expected route-count, leak/blackhole risk is undetectable; add the route-count and next-hop-reachability checks before the change ships.

### 3. PON optical-budget & degradation sheet

- **Trigger:** Fiber customers report intermittent or total loss, especially several on one OLT/PON.
- **Mechanism:** Read OLT alarms and per-ONU Rx power first. Build the loss budget per element — splitter insertion loss (1:32 ≈ 17–18 dB, 1:64 ≈ 20–21 dB) + fiber attenuation (~0.3–0.35 dB/km) + connectors + splices — and compare to the **class budget (B+ = 28 dB)**. Correlated low Rx across many ONUs = shared plant (splitter/feeder/connector/OLT port); one low ONU = that drop/ONT. Check for a rogue ONU before swapping anything.
- **Do not use when:** The symptom is IP/routing with healthy optical levels — go up the stack; the PON is not the fault.
- **Failure repair:** If a truck is swapping ONTs while many ONUs on the PON are low, halt and inspect shared plant; if the design runs a 1:128 split on B+ optics, re-class to C+ or add a reach extender.

### 4. BNG/subscriber session diagnosis

- **Trigger:** Subscribers cannot get online or a cohort drops sessions.
- **Mechanism:** Identify the model — PPPoE (LCP → auth → IPCP) or IPoE (DHCP/option-82) — then trace the RADIUS exchange: Access-Request → Accept/Reject (read the reject reason), and the accounting Start/Interim/Stop gap. For a live policy change (rate, walled-garden, forced logout) use **CoA/Disconnect**, not a re-auth or a reboot. For wholesale, confirm whether the session is L2TP'd to a retail-ISP LNS that owns the auth.
- **Do not use when:** The fault is in the underlay/core path (the whole region is down) — that is a triage/routing case, not a per-subscriber session diagnosis.
- **Failure repair:** If the team is rebooting core routers for an auth problem, stop; read the Access-Reject reason or accounting gap, and fix the session/RADIUS path instead.

### 5. TR-069/TR-369 staged firmware campaign

- **Trigger:** A CPE fleet needs a firmware or config change.
- **Mechanism:** Through the ACS, validate the image, push to a **canary cohort**, watch the post-apply Inform and the return/failure rate, expand by rings, and **halt-on-failure** with a known-good rollback image. Use the parameter model for config (Get/SetParameterValues). TR-369 (USP) uses controller/agent and pluggable transports but the same staged discipline.
- **Do not use when:** A single device needs a one-off fix — use a targeted Set/Download, not a campaign.
- **Failure repair:** If a mass push went out with no canary and a cohort bricked, halt the campaign, roll the affected ring back to the known-good image, and re-stage with a failure threshold armed.

### 6. SLA / availability report (measured, not apology)

- **Trigger:** An outage is over and the customer is owed a report, or an SLA claim must be settled.
- **Mechanism:** Compute availability = uptime / measured time with contractual maintenance exclusions stated; reference the budget (99.9% ≈ 43.2 min/month, 99.99% ≈ 4.32 min). Keep availability, latency, loss, jitter, and MTTR separate. Report the measured downtime window, affected services, root cause as contributing factors, remediation, and prevention.
- **Do not use when:** The downtime is still ongoing — stabilize and restore first; report after recovery.
- **Failure repair:** If the report is an apology with no measured downtime, add the availability math and the exclusion accounting; never invent a credit amount or a regulatory obligation — require the contract/source.

## Հայերեն

Սրանք canonical telecom/ISP/network-operations move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (outage triage, change MOP, route-risk review, PON budget sheet, BNG diagnosis, SLA report)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Շերտավորված outage triage

- **Երբ է պետք․** Customer-ները broad connectivity loss են report անում, և պատճառը ակնհայտ չէ։
- **Մեխանիզմը․** Ֆիքսիր blast radius-ը (քանիսը, որտեղ, որ shared element) և last change-ը նախ։ Հետո իջիր OSI stack-ով հերթով․ physical (optical Rx/Tx, power, OLT alarm, fiber) → link (error, CRC, flap, VLAN/MPLS) → IP reachability → routing adjacency/route presence → DNS/app։ Կանգնիր ամենացածր alarm-ող շերտում և ֆիքսիր այնտեղ։
- **Երբ չօգտագործել․** Երբ մեկ customer է ազդակիր՝ առանց shared-element correlation-ի — դա CPE/last-mile fault է, triage արա որպես single-subscriber case, ոչ network outage։
- **Ուղղում․** Եթե team-ը DNS/app է debug անում, մինչ physical alarm-ը red է, re-anchor արա ամենացածր alarm-ող շերտում և կարդա optical level-ները մինչև վեր գնալը։

### 2. BGP change MOP (leak/blackhole-safe)

- **Երբ է պետք․** Routing-policy change է պլանավորված (նոր peer, նոր announcement, policy edit)։
- **Մեխանիզմը․** Գրիր prefix filter ըստ intent-ի (customer/peer/transit), max-prefix ամեն session-ի, communities և local-pref/MED intent, **սպասվող post-change route-count**, validation command, monitoring, անվանված rollback trigger՝ ստուգված rollback command-ով, և customer/peer comms։ Pre-check-ում capture արա current state-ը. validate արա live route-count-ը և reachability-ն expected post-state-ի հետ համեմատելով։
- **Երբ չօգտագործել․** Երբ գործողությունը live incident-ի ժամանակ emergency traffic isolation է — այն աշխատում է incident command-ի տակ՝ իր լիազորությամբ, ոչ scheduled MOP-ով։
- **Ուղղում․** Եթե validation-ը expected route-count չունի, leak/blackhole risk-ը անհայտանալի է. ավելացրու route-count-ի և next-hop-reachability-ի check-երը մինչև change-ի ship-ը։

### 3. PON optical-budget & degradation sheet

- **Երբ է պետք․** Fiber customer-ները intermittent կամ total loss են report անում, հատկապես մի քանիսը մեկ OLT/PON-ի վրա։
- **Մեխանիզմը․** Կարդա OLT alarm-ները և per-ONU Rx power-ը նախ։ Կառուցիր loss budget-ը ըստ element-ի — splitter insertion loss (1:32 ≈ 17–18 dB, 1:64 ≈ 20–21 dB) + fiber attenuation (~0.3–0.35 dB/km) + connector + splice — և համեմատիր **class budget-ի (B+ = 28 dB)** հետ։ Correlated low Rx շատ ONU-ների վրա = shared plant (splitter/feeder/connector/OLT port). մեկ low ONU = այդ drop/ONT-ը։ Ստուգիր rogue ONU՝ որևէ բան փոխելուց առաջ։
- **Երբ չօգտագործել․** Երբ symptom-ը IP/routing է՝ առողջ optical level-ներով — բարձրացիր stack-ով. PON-ը fault չէ։
- **Ուղղում․** Եթե truck-ը ONT է փոխում, մինչ PON-ի շատ ONU low են, կանգնիր և ստուգիր shared plant-ը. եթե design-ը 1:128 split է աշխատեցնում B+ optics-ի վրա, re-class արա C+ կամ ավելացրու reach extender։

### 4. BNG/subscriber session diagnosis

- **Երբ է պետք․** Subscriber-ները չեն կարողանում online լինել, կամ cohort-ը session է գցում։
- **Մեխանիզմը․** Նույնականացրու model-ը — PPPoE (LCP → auth → IPCP) կամ IPoE (DHCP/option-82) — հետո trace արա RADIUS exchange-ը․ Access-Request → Accept/Reject (կարդա reject reason-ը), և accounting Start/Interim/Stop gap-ը։ Live policy change-ի համար (rate, walled-garden, force logout) օգտագործիր **CoA/Disconnect**, ոչ re-auth կամ reboot։ Wholesale-ի համար հաստատիր՝ session-ը L2TP-ո՞վ է retail-ISP LNS-ին, որ տիրում է auth-ին։
- **Երբ չօգտագործել․** Երբ fault-ը underlay/core path-ում է (ողջ region down է) — դա triage/routing case է, ոչ per-subscriber session diagnosis։
- **Ուղղում․** Եթե team-ը core router է reboot անում auth խնդրի համար, կանգնիր. կարդա Access-Reject reason-ը կամ accounting gap-ը, և ֆիքսիր session/RADIUS path-ը փոխարենը։

### 5. TR-069/TR-369 staged firmware campaign

- **Երբ է պետք․** CPE fleet-ին պետք է firmware կամ config change։
- **Մեխանիզմը․** ACS-ով validate արա image-ը, push արա **canary cohort**-ին, հետևիր post-apply Inform-ին և return/failure rate-ին, ընդլայնիր ring-երով, և **halt-on-failure** արա known-good rollback image-ով։ Օգտագործիր parameter model-ը config-ի համար (Get/SetParameterValues)։ TR-369 (USP)-ն օգտագործում է controller/agent և pluggable transport, բայց նույն staged կարգապահությունը։
- **Երբ չօգտագործել․** Երբ մեկ device-ի պետք է one-off fix — օգտագործիր targeted Set/Download, ոչ campaign։
- **Ուղղում․** Եթե mass push դուրս եկավ առանց canary-ի և cohort bric-եց, կանգնեցրու campaign-ը, roll արա ազդակիր ring-ը հետ known-good image-ին, և re-stage արա failure threshold-ը զինված։

### 6. SLA / availability report (measured, ոչ apology)

- **Երբ է պետք․** Outage-ն ավարտվել է, և customer-ը report է պարտք, կամ SLA claim պետք է settle-վի։
- **Մեխանիզմը․** Հաշվիր availability = uptime / measured time՝ contractual maintenance exclusion-ները նշված. reference արա budget-ը (99.9% ≈ 43.2 min/month, 99.99% ≈ 4.32 min)։ Պահիր availability, latency, loss, jitter և MTTR առանձին։ Report արա չափված downtime window-ը, ազդակիր service-ները, root cause-ը որպես contributing factor, remediation-ը և prevention-ը։
- **Երբ չօգտագործել․** Երբ downtime-ը դեռ ընթացքի մեջ է — նախ stabilize և restore արա. report արա recovery-ից հետո։
- **Ուղղում․** Եթե report-ը apology է՝ առանց չափված downtime-ի, ավելացրու availability math-ը և exclusion հաշվառումը. երբեք մի՛ հորինիր credit amount կամ regulatory obligation — պահանջիր contract/source։
