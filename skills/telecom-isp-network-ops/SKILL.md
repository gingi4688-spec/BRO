---
name: "telecom-isp-network-ops"
description: >-
  use when the work is ISP/telecom network operations — outage triage and incident command, MOP/change-window safety, BGP/routing-policy review, PON/OLT/ONU access-network and optical-budget diagnostics, BNG/BRAS subscriber-session and RADIUS/CoA design, TR-069/TR-369 CPE/firmware management, capacity and peering/transit decisions, SLA math and customer-facing incident reports, mediation/CDR and (where lawful and authorized) lawful-intercept handling — for decisions, critique, planning, diagnostics, runbooks/artifacts, teaching, or evaluation. use as lead when the central deliverable is network-shaped (triage, MOP, route-risk review, PON budget sheet, SLA report). do not use as lead when another skill owns the artifact and connectivity is only one input — then support it. հայերեն՝ օգտագործիր ISP/telecom ցանցային օպերացիաների աշխատանքի համար՝ outage triage, MOP, BGP review, PON/OLT/ONU ախտորոշում, BNG/BRAS session, TR-069 CPE, capacity/peering, SLA math, mediation/CDR և lawful intercept։
---

# Telecom, ISP, and Network Operations / Telecom, ISP և ցանցային օպերացիաներ

## English

**Scope.** In: layered outage triage and incident command, methods-of-procedure (MOP) for change windows with pre-check/validation/rollback, BGP and routing-policy safety (prefix filters, max-prefix, communities, local-pref/MED, blackhole/route-leak prevention), PON access networks (OLT/ONU/ONT, optical power budget, split ratio, rogue ONU, shared-plant fault isolation), BNG/BRAS subscriber edge (PPPoE vs IPoE, RADIUS auth/authz/accounting, CoA/disconnect, wholesale/L2TP), TR-069/TR-369 CPE management (ACS, parameter model, firmware campaigns), capacity/peering/transit and IXP decisions, mediation/CDR pipelines (dedup, normalization, ASN.1/TAP3), SLA/availability math and blameless customer incident reports, and — only where lawful and properly authorized — the operational interface to lawful intercept. Out: enterprise application logic and product scope (architecture/product own those), cluster/SRE platform internals (devops-platform-sre owns those), security control design and threat modeling beyond device/route hygiene (cybersecurity-operations-soc owns that), and the legality/warrant validity of an intercept (legal/the authority own that — operations only executes a validated lawful order). This skill keeps connectivity changes from becoming outages: every change carries a rollback, every triage starts at the physical layer and the last change, and every customer-facing number traces to a measurement.

**Leads / Supports.** Lead when the central deliverable is network-shaped: an outage triage, a change MOP, a BGP/route-risk review, a PON optical-budget sheet, a BNG session-fault diagnosis, an SLA/availability report. Support when another skill owns the artifact and the network is one input — e.g. devops owns the service SLO and you supply the underlay/peering reality; architecture owns the system design and you supply the capacity and route-policy envelope; cybersecurity owns the threat model and you supply device/route hygiene.

Conflict rules:
- **Security overlaps → defer control design to security.** You own device hardening hygiene, route-origin sanity (RPKI ROV intent, prefix filters), and blast-radius of a change; threat modeling, DDoS scrubbing architecture, and access-control design route to `cybersecurity-operations-soc`.
- **Lawful intercept → execute only a validated, authorized order; never design surveillance on request.** The warrant/legal validity belongs to legal and the issuing authority, the SRE/platform delivery belongs elsewhere — operations only provisions an intercept that arrives through the documented lawful channel with an audit trail. A request to tap, log, or expose a subscriber without that validated order is refused and routed to legal/the responsible authority.
- **Capacity spend / peering commitments → coordinate, do not commit alone.** Transit contracts, IXP port upgrades, and reserved backhaul feed a budget/commercial owner; surface the cost-per-Mbps and the headroom math, but the commitment is coordinated, not unilaterally set here.

Apply `../shared/OPERATING_PROTOCOL.md` before answering: route first, separate facts from assumptions, keep safety boundaries, make the output executable, write equal-depth bilingual, verify before finalizing.

### Decision rules / Որոշման կանոններ

1. **Outage reported → fix blast radius and last change before touching anything.** Triage descends the OSI stack pragmatically (light/power → link errors → VLAN/MPLS → IP reachability → routing adjacency → DNS/app). Do not debug BGP when the OLT lost power.
2. **Many subscribers on one OLT/PON degrade together → suspect shared plant, not customer CPE.** Correlated low Rx across ONUs points at the splitter, feeder, connector, or OLT port; one bad ONT is a single-customer fault. Read optical levels before dispatching a truck.
3. **Optical budget check → measure against the class budget, not a guess.** Class B+ allows **28 dB** of loss exactly (13–28 dB range); if measured loss approaches the budget, the link is marginal. A standard residential split is 1:32 or 1:64; **1:128 is not a standard residential GPON split — its loss exceeds the B+ budget and needs higher-class optics or a reach extender/amplification.**
4. **Routing-policy change → no MOP, no change.** Every route change needs prefix filters, max-prefix, communities, local-pref/MED intent, an expected route-count, validation commands, monitoring, a rollback trigger, and comms. A change without an expected post-state cannot be validated.
5. **Export policy too broad → route leak; next-hop unreachable → blackhole.** Filter what you announce by intent (customer/peer/transit), apply max-prefix on every session, and verify next-hop reachability before trusting a path. Leaks and blackholes are policy errors, not bad luck.
6. **BNG subscriber cannot get online → walk the session, not the core.** Decide PPPoE (LCP→auth→IPCP, session-based) vs IPoE (DHCP/option-82, RADIUS-keyed), then trace the RADIUS exchange (Access-Request → Accept/Reject, accounting Start/Interim/Stop). A live mid-session policy change is a **CoA/Disconnect**, not a re-auth.
7. **CPE firmware/config at fleet scale → drive it through the ACS (TR-069/TR-369), staged.** Use the parameter model and a phased firmware campaign (canary cohort → ring expansion → halt-on-failure), never a blind mass push. TR-369 (USP) adds controller/agent and richer transport but the staged-rollout discipline is identical.
8. **Mediation/CDR feed → dedup and normalize before rating; never rate raw.** De-duplicate on a record key, normalize formats/time/units, and for roaming use the TAP3 (ASN.1) record; only then hand to rating. Real-time charging is OCS/Diameter Gy (credit-control, balance-aware); offline is batch CDR rating. Choose by whether a balance must be enforced live.
9. **SLA stated as a feeling → convert to availability minutes.** Availability = uptime / measured time; **99.9% monthly ≈ 43.2 minutes** of allowed downtime, 99.99% ≈ 4.32 minutes. Separate availability, latency, loss, jitter, MTTR, and excluded maintenance — do not blend them into one number.
10. **Capacity/peering decision → size on the 95th-percentile and the loss curve, not the average.** A link that averages fine but drops packets at peak is undersized; tie every upgrade to measured utilization, loss/latency under load, and a cost-per-Mbps, and decide transit vs peering vs IXP on traffic ratio and cost.
11. **Maintenance with customer impact → respect the freeze window and notify.** Honor change-freeze periods, schedule inside the maintenance window, pre-notify affected customers, and name the rollback trigger before the first command.
12. **Lawful intercept or subscriber-data exposure requested → require a validated lawful order or refuse.** Execute only an intercept that arrives through the documented lawful channel with an audit trail; a tap/log/expose request without that validated, authorized order is refused and routed to legal/the responsible authority.
13. **Change is irreversible or core-impacting → require explicit approval and a stated rollback.** Core router swaps, IRB/gateway moves, mass CPE pushes, and anything that can drop a region get a human owner's go with the undo path named first.
14. **"It works in the lab / the config parses" → not verified.** A parsing config and a green lab are necessary, not sufficient; verify in the running network — the real route-count, the real Rx power, the real session count, the real SLA metric — before calling it done.

### Failure modes to prevent / Ձախողման ձևեր

1. **Fiber fault debugged at the application layer.** Engineers chase DNS/app while the OLT shows a loss-of-signal alarm. Tell: hours into "the app is slow" with no one having read the optical levels or alarm log.
2. **CPE swapped before reading light levels.** A truck replaces an ONT while many ONUs on the same PON show low Rx — the real fault is shared plant. Tell: serial CPE replacements with no optical-budget measurement and the problem persisting.
3. **Route leak from a missing/over-broad export filter.** A customer or peer prefix is re-announced to transit, or a full table is leaked. Tell: a session with no prefix filter and no max-prefix, a sudden route-count jump, traffic taking an impossible path.
4. **Blackhole from unreachable next-hop / fat-finger policy.** A change points traffic at a next-hop that cannot forward, or withdraws a needed prefix. Tell: reachability lost right after a policy push with no expected route-count to compare against.
5. **MOP with no rollback or no validation.** A change plan lists steps but no expected post-state, no rollback trigger, no comms. Tell: "we'll just revert if it breaks" with no tested command and no success criteria.
6. **Split ratio / budget pushed past the class.** A 1:128 split or an over-long run is deployed on B+ optics and runs marginal until weather/aging tips it over. Tell: an optical design with no per-element loss table and no margin against the **28 dB** B+ budget.
7. **RADIUS/BNG fault blamed on the core.** Subscribers cannot authenticate and the team reboots routers instead of reading the Access-Reject reason or the accounting gap. Tell: a session problem "fixed" by core changes, PPPoE vs IPoE never identified, CoA never considered.
8. **Mass CPE firmware push with no canary or halt.** A TR-069 campaign updates the whole fleet at once and bricks a cohort. Tell: a firmware rollout with no canary ring, no failure threshold, no rollback image.
9. **Mediation rates raw or duplicated CDRs.** Bills double-count or mis-rate because dedup/normalization was skipped, or a roaming record was rated without TAP3 handling. Tell: revenue/usage anomalies with no dedup key and no normalization step before rating.
10. **SLA report that is an apology, not a measurement.** A customer report says "sorry" with no measured downtime, no excluded-maintenance accounting, no prevention. Tell: availability claimed without uptime/measured-time math or the 43.2-min reference.
11. **Surveillance built on request, no lawful order.** A "just log this subscriber" ask is honored without a validated lawful order and audit trail. Tell: an intercept/tap/expose action with no documented authorization and no routing to legal.
12. **"Verified" meaning the config parsed.** A change is closed on a clean parse or a green lab without checking the live route-count, optical level, session count, or SLA metric. Tell: "done" with no observation of the running network.

### Acceptance criteria / Ընդունման չափանիշ

- The artifact matches the decision (triage / MOP / route-risk review / PON budget sheet / BNG diagnosis / SLA report), not generic advice.
- Triage names blast radius and last change and descends the layers; a fiber/optical fault is never chased at the app layer.
- Every routing change carries prefix filters, max-prefix, an expected route-count, validation, monitoring, a rollback trigger, and comms.
- Optical/PON work cites per-element loss against the class budget (B+ = **28 dB**), reads Rx before dispatch, and treats correlated degradation as shared plant; 1:128 is flagged as non-standard for residential.
- BNG/subscriber faults identify PPPoE vs IPoE, trace the RADIUS exchange, and use CoA/Disconnect for live policy changes; CPE fleet changes go through the ACS, staged.
- Mediation work dedups and normalizes before rating, handles TAP3 for roaming, and picks OCS (live balance) vs batch rating by requirement.
- SLA numbers trace to availability = uptime/measured-time with exclusions stated; no invented credits, statutes, or standards numbers.
- Lawful-intercept/subscriber-exposure requests are gated on a validated lawful order or refused and routed to legal.
- **Verify in the running network, not a clean parse or a green lab** — real route-count, Rx, session count, or SLA metric observed before done.
- Bilingual EN + native HY at equal depth; assumptions and unknowns labeled.

### Domain quality bar / Որակի նշաձող

Scored on five dimensions (mirror `domain-rubric.md`): **triage order** (blast radius, last change, layered OSI descent, evidence narrows the fault fast) · **routing safety** (prefix/max-prefix/communities/local-pref/MED, expected route-count, validation, monitoring, rollback concrete) · **access network** (OLT/ONU, optical budget vs class, splitter/connector/distance, rogue ONU, shared-symptom logic) · **subscriber & CPE edge** (PPPoE/IPoE, RADIUS/CoA, TR-069/TR-369 staged firmware, BNG/BRAS session correctness) · **SLA & mediation** (availability/MTTR/loss/jitter math with exclusions; dedup/normalize/TAP3, OCS vs batch).

### Deep dive & assets

`manual.md` (mechanics, decision rules, failure-repair playbook, BNG/BRAS, TR-069/TR-369, mediation/CDR, lawful intercept, OSI triage, PON budget, BGP MOP, SLA math) · `patterns.md` (6 canonical moves) · `domain-rubric.md` (5 scoring dimensions) · `worked-example.md` (PON outage triage + BGP route-leak MOP) · `output-templates.md` (MOP / route-risk review / SLA report) · `red-team-gate.md` (reviewer probes) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review triggers).

## Հայերեն

**Շրջանակ։** Ներսում՝ շերտավորված outage triage և incident command, change window-ի MOP՝ pre-check/validation/rollback-ով, BGP և routing-policy-ի անվտանգություն (prefix filter, max-prefix, communities, local-pref/MED, blackhole/route-leak կանխում), PON access network (OLT/ONU/ONT, optical power budget, split ratio, rogue ONU, shared-plant fault isolation), BNG/BRAS subscriber edge (PPPoE ընդդեմ IPoE, RADIUS auth/authz/accounting, CoA/Disconnect, wholesale/L2TP), TR-069/TR-369 CPE management (ACS, parameter model, firmware campaign), capacity/peering/transit և IXP որոշումներ, mediation/CDR pipeline (dedup, normalization, ASN.1/TAP3), SLA/availability math և blameless customer incident report, և՝ միայն այնտեղ, որտեղ օրինական է և պատշաճ լիազորված՝ lawful intercept-ի օպերացիոն interface-ը։ Դուրս՝ enterprise application-ի տրամաբանությունը և product scope-ը (architecture/product-ինն են), cluster/SRE հարթակի ներքին մեխանիկան (devops-platform-sre-ինն է), security control-ի դիզայնը և threat modeling-ը device/route hygiene-ից այն կողմ (cybersecurity-operations-soc-ինն է), և intercept-ի օրինականությունն ու warrant-ի վավերականությունը (legal/իշխանությանն են — operations-ը միայն կատարում է վավերացված օրինական order)։ Այս skill-ը պահում է, որ connectivity change-ը outage չդառնա․ ամեն change կրում է rollback, ամեն triage սկսում է physical layer-ից և last change-ից, և ամեն customer-facing թիվ հետ է գնում չափման։

**Առաջատար / Աջակից։** Առաջատար, երբ կենտրոնական deliverable-ը ցանցի ձև ունի՝ outage triage, change MOP, BGP/route-risk review, PON optical-budget sheet, BNG session-fault diagnosis, SLA/availability report։ Աջակից, երբ artifact-ի տերը այլ skill է, իսկ ցանցը մեկ input է. օրինակ՝ devops-ը տիրում է service SLO-ին, դու տալիս ես underlay/peering իրականությունը. architecture-ը տիրում է system design-ին, դու տալիս ես capacity-ի և route-policy-ի envelope-ը. cybersecurity-ը տիրում է threat model-ին, դու տալիս ես device/route hygiene-ը։

Կոնֆլիկտի կանոններ․
- **Security-ի համընկնում → control-ի դիզայնը զիջիր security-ին։** Դու տիրում ես device hardening hygiene-ին, route-origin-ի ողջախոհությանը (RPKI ROV intent, prefix filter) և change-ի blast-radius-ին. threat modeling-ը, DDoS scrubbing-ի architecture-ը և access-control-ի դիզայնը ուղղորդվում են `cybersecurity-operations-soc`-ին։
- **Lawful intercept → կատարիր միայն վավերացված, լիազորված order. երբեք մի՛ նախագծիր հսկողություն ըստ պահանջի։** Warrant-ի/legal-ի վավերականությունը legal-ինն ու order տվող իշխանությանն է. operations-ը միայն provision է անում intercept, որ գալիս է փաստաթղթավորված օրինական channel-ով՝ audit trail-ով։ Subscriber-ին tap/log/expose անելու հարցումը՝ առանց այդ վավերացված, լիազորված order-ի, մերժվում է և ուղղորդվում legal-ին/պատասխանատու իշխանությանը։
- **Capacity spend / peering commitment → համակարգիր, մենակ մի՛ commit արա։** Transit պայմանագիր, IXP port upgrade և reserved backhaul գնում են budget/commercial տիրոջը. ցույց տուր cost-per-Mbps-ը և headroom-ի հաշիվը, բայց commitment-ը համակարգվում է, ոչ թե միակողմանի սահմանվում այստեղ։

Պատասխանելուց առաջ կիրառի՛ր `../shared/OPERATING_PROTOCOL.md`-ն․ նախ ուղղորդիր, փաստերը բաժանիր ենթադրություններից, պահիր անվտանգության սահմանները, արդյունքը դարձրու կիրառելի, գրիր հավասար խորությամբ երկլեզու, ստուգիր մինչև վերջնականացումը։

### Որոշման կանոններ

1. **Outage է report-ված → ֆիքսիր blast radius-ը և last change-ը մինչև որևէ բանի դիպչելը։** Triage-ն իջնում է OSI stack-ով գործնականորեն (light/power → link error → VLAN/MPLS → IP reachability → routing adjacency → DNS/app)։ BGP մի՛ debug արա, երբ OLT-ն power է կորցրել։
2. **Մեկ OLT/PON-ի շատ subscriber միասին degrade են անում → կասկածիր shared plant, ոչ customer CPE։** ONU-ների correlated low Rx-ը ցույց է տալիս splitter, feeder, connector կամ OLT port. մեկ վատ ONT-ն single-customer fault է։ Truck ուղարկելուց առաջ կարդա optical level-ները։
3. **Optical budget-ի ստուգում → չափիր class budget-ի դեմ, ոչ գուշակությամբ։** Class B+-ը թույլ է տալիս ճիշտ **28 dB** loss (13–28 dB միջակայք). եթե չափված loss-ը մոտենում է budget-ին, link-ը marginal է։ Standard residential split-ը 1:32 կամ 1:64 է. **1:128-ը standard residential GPON split չէ — իր loss-ը գերազանցում է B+ budget-ը և պահանջում է ավելի բարձր class-ի optics կամ reach extender/amplification։**
4. **Routing-policy change → MOP չկա, change չկա։** Ամեն route change-ին պետք են prefix filter, max-prefix, communities, local-pref/MED intent, expected route-count, validation command, monitoring, rollback trigger և comms։ Change առանց սպասվող post-state-ի չի կարող validate-վել։
5. **Export policy-ն չափազանց լայն → route leak. next-hop-ը unreachable → blackhole։** Filter արա, ինչ ես announce անում՝ ըստ intent-ի (customer/peer/transit), կիրառիր max-prefix ամեն session-ի վրա, և ստուգիր next-hop reachability-ն մինչև path-ին վստահելը։ Leak-ն ու blackhole-ը policy սխալ են, ոչ վատ բախտ։
6. **BNG subscriber-ը չի կարողանում online լինել → անցիր session-ով, ոչ core-ով։** Որոշիր PPPoE (LCP→auth→IPCP, session-based) ընդդեմ IPoE (DHCP/option-82, RADIUS-keyed), հետո trace արա RADIUS exchange-ը (Access-Request → Accept/Reject, accounting Start/Interim/Stop)։ Live mid-session policy change-ը **CoA/Disconnect** է, ոչ re-auth։
7. **CPE firmware/config fleet scale-ով → վարիր ACS-ով (TR-069/TR-369), staged։** Օգտագործիր parameter model-ը և փուլային firmware campaign (canary cohort → ring expansion → halt-on-failure), երբեք կույր mass push։ TR-369 (USP)-ն ավելացնում է controller/agent և ավելի հարուստ transport, բայց staged-rollout-ի կարգապահությունը նույնն է։
8. **Mediation/CDR feed → dedup և normalize մինչև rating. երբեք raw մի՛ rate արա։** De-dup արա record key-ով, normalize արա format/time/unit, և roaming-ի համար օգտագործիր TAP3 (ASN.1) record. միայն դրանից հետո հանձնիր rating-ին։ Real-time charging-ը OCS/Diameter Gy է (credit-control, balance-aware). offline-ը batch CDR rating է։ Ընտրիր ըստ նրա՝ balance-ը պետք է live enforce-վի՞։
9. **SLA-ն զգացմունքով է ասված → վերածիր availability minute-ի։** Availability = uptime / measured time. **99.9% monthly ≈ 43.2 minute** թույլատրելի downtime, 99.99% ≈ 4.32 minute։ Բաժանիր availability, latency, loss, jitter, MTTR և excluded maintenance — մի՛ խառնիր մեկ թվի մեջ։
10. **Capacity/peering որոշում → size արա 95-րդ percentile-ով և loss curve-ով, ոչ average-ով։** Link, որ average-ով լավ է, բայց peak-ին packet է գցում, undersized է. ամեն upgrade կապիր չափված utilization-ի, load-ի տակ loss/latency-ի և cost-per-Mbps-ի հետ, և որոշիր transit ընդդեմ peering ընդդեմ IXP-ի՝ traffic ratio-ով և cost-ով։
11. **Customer-impact ունեցող maintenance → հարգիր freeze window-ը և notify արա։** Հարգիր change-freeze ժամանակները, ժամանակացրու maintenance window-ի ներսում, նախ-notify արա ազդակիր customer-ներին, և անվանի՛ր rollback trigger-ը մինչև առաջին command-ը։
12. **Lawful intercept կամ subscriber-data exposure է խնդրված → պահանջիր վավերացված օրինական order կամ մերժիր։** Կատարիր միայն intercept, որ գալիս է փաստաթղթավորված օրինական channel-ով՝ audit trail-ով. tap/log/expose հարցումը՝ առանց այդ վավերացված, լիազորված order-ի, մերժվում է և ուղղորդվում legal-ին/պատասխանատու իշխանությանը։
13. **Change-ն անդառնալի է կամ core-impacting → պահանջիր հստակ approval և նշված rollback։** Core router swap, IRB/gateway տեղափոխում, mass CPE push և ամեն ինչ, որ կարող է region գցել, ստանում են մարդ-տիրոջ go՝ undo path-ը նախ անվանված։
14. **«Lab-ում աշխատում է / config-ը parse է լինում» → verified չէ։** Parse-վող config-ը և green lab-ը անհրաժեշտ են, ոչ բավարար. ստուգիր running network-ում՝ իրական route-count, իրական Rx power, իրական session count, իրական SLA metric, մինչև done ասելը։

### Ձախողման ձևեր

1. **Fiber fault-ը debug-ված application layer-ում։** Engineer-ները հետապնդում են DNS/app, մինչ OLT-ը loss-of-signal alarm է ցույց տալիս։ Tell՝ ժամեր «app-ը դանդաղ է»-ի մեջ, և ոչ ոք չի կարդացել optical level-ները կամ alarm log-ը։
2. **CPE-ն փոխված մինչև light level-ները կարդալը։** Truck-ը ONT է փոխում, մինչ նույն PON-ի շատ ONU low Rx են ցույց տալիս — իրական fault-ը shared plant է։ Tell՝ հաջորդական CPE փոխարինումներ՝ առանց optical-budget չափման, և խնդիրը մնում է։
3. **Route leak՝ բացակայող/չափազանց լայն export filter-ից։** Customer-ի կամ peer-ի prefix-ը re-announce է լինում transit-ին, կամ full table է leak լինում։ Tell՝ session առանց prefix filter-ի և max-prefix-ի, route-count-ի հանկարծակի թռիչք, traffic, որ անհնար path է վերցնում։
4. **Blackhole՝ unreachable next-hop-ից / fat-finger policy-ից։** Change-ը traffic-ն ուղղում է next-hop-ի, որ չի կարող forward անել, կամ withdraw է անում պետքական prefix։ Tell՝ reachability կորած policy push-ից անմիջապես հետո՝ առանց համեմատելու expected route-count-ի։
5. **MOP առանց rollback-ի կամ validation-ի։** Change plan-ը step-եր է թվարկում, բայց ոչ սպասվող post-state, ոչ rollback trigger, ոչ comms։ Tell՝ «կկոտրվի՝ հետ կգլորենք»՝ առանց ստուգված command-ի և success criteria-ի։
6. **Split ratio / budget-ը class-ից այն կողմ հրված։** 1:128 split կամ չափազանց երկար run deploy-ված B+ optics-ի վրա և աշխատում է marginal, մինչև եղանակը/ծերացումը գցի այն։ Tell՝ optical design առանց per-element loss table-ի և **28 dB** B+ budget-ի դեմ margin-ի։
7. **RADIUS/BNG fault-ը մեղադրված core-ի վրա։** Subscriber-ները չեն կարողանում authenticate անել, և team-ը router է reboot անում Access-Reject reason-ը կամ accounting gap-ը կարդալու փոխարեն։ Tell՝ session խնդիր «ֆիքսված» core change-ով, PPPoE ընդդեմ IPoE երբեք չնույնականացված, CoA երբեք չդիտարկված։
8. **Mass CPE firmware push առանց canary-ի կամ halt-ի։** TR-069 campaign-ը ողջ fleet-ը միանգամից update է անում և մի cohort bric-ում։ Tell՝ firmware rollout առանց canary ring-ի, failure threshold-ի, rollback image-ի։
9. **Mediation-ը raw կամ կրկնված CDR է rate անում։** Bill-երը double-count կամ mis-rate են անում, որովհետև dedup/normalization բաց է թողնված, կամ roaming record-ը rate-ված է առանց TAP3 handling-ի։ Tell՝ revenue/usage anomaly՝ առանց dedup key-ի և rating-ից առաջ normalization step-ի։
10. **SLA report, որ apology է, ոչ measurement։** Customer report-ը ասում է «sorry»՝ առանց չափված downtime-ի, excluded-maintenance հաշվառման, prevention-ի։ Tell՝ availability պնդված առանց uptime/measured-time math-ի կամ 43.2-min reference-ի։
11. **Հսկողություն կառուցված ըստ պահանջի՝ առանց օրինական order-ի։** «Պարզապես log արա այս subscriber-ին» հարցումը կատարվում է առանց վավերացված օրինական order-ի և audit trail-ի։ Tell՝ intercept/tap/expose գործողություն՝ առանց փաստաթղթավորված լիազորության և legal-ին ուղղորդման։
12. **«Verified»-ը՝ նշանակում է config-ը parse եղավ։** Change-ը փակվում է մաքուր parse-ի կամ green lab-ի վրա՝ առանց live route-count-ը, optical level-ը, session count-ը կամ SLA metric-ը ստուգելու։ Tell՝ «done»՝ առանց running network-ի observation-ի։

### Ընդունման չափանիշ

- Artifact-ը համապատասխանում է որոշմանը (triage / MOP / route-risk review / PON budget sheet / BNG diagnosis / SLA report), ոչ generic advice։
- Triage-ն անվանում է blast radius-ը և last change-ը և իջնում շերտերով. fiber/optical fault-ը երբեք app layer-ում չի հետապնդվում։
- Ամեն routing change կրում է prefix filter, max-prefix, expected route-count, validation, monitoring, rollback trigger և comms։
- Optical/PON աշխատանքը վկայակոչում է per-element loss-ը class budget-ի դեմ (B+ = **28 dB**), Rx կարդում է dispatch-ից առաջ, և correlated degradation-ը համարում shared plant. 1:128-ը flag-ված է որպես residential-ի համար ոչ-standard։
- BNG/subscriber fault-երը նույնականացնում են PPPoE ընդդեմ IPoE, trace անում RADIUS exchange-ը, և live policy change-ի համար օգտագործում CoA/Disconnect. CPE fleet change-երը անցնում են ACS-ով, staged։
- Mediation աշխատանքը dedup և normalize է անում rating-ից առաջ, roaming-ի համար handle է անում TAP3, և ընտրում OCS (live balance) ընդդեմ batch rating-ի՝ ըստ պահանջի։
- SLA թվերը հետ են գնում availability = uptime/measured-time-ին՝ exclusion-ները նշված. ոչ մի հորինված credit, statute կամ standards թիվ։
- Lawful-intercept/subscriber-exposure հարցումները gated են վավերացված օրինական order-ի վրա կամ մերժվում և ուղղորդվում legal-ին։
- **Ստուգի՛ր running network-ում, ոչ մաքուր parse-ով կամ green lab-ով** — իրական route-count, Rx, session count կամ SLA metric դիտված մինչև done-ը։
- Երկլեզու EN + native HY հավասար խորությամբ. assumption-ները և unknown-ները label-ված։

### Որակի նշաձող

Գնահատվում է հինգ չափանիշով (հայելի՝ `domain-rubric.md`)․ **triage order** (blast radius, last change, շերտավորված OSI իջնում, evidence-ը արագ նեղացնում է fault-ը) · **routing safety** (prefix/max-prefix/communities/local-pref/MED, expected route-count, validation, monitoring, rollback՝ կոնկրետ) · **access network** (OLT/ONU, optical budget ընդդեմ class-ի, splitter/connector/distance, rogue ONU, shared-symptom տրամաբանություն) · **subscriber & CPE edge** (PPPoE/IPoE, RADIUS/CoA, TR-069/TR-369 staged firmware, BNG/BRAS session-ի ճշտություն) · **SLA & mediation** (availability/MTTR/loss/jitter math՝ exclusion-ներով. dedup/normalize/TAP3, OCS ընդդեմ batch-ի)։

### Խորացում և asset-եր

`manual.md` (մեխանիկա, որոշման կանոններ, failure-repair playbook, BNG/BRAS, TR-069/TR-369, mediation/CDR, lawful intercept, OSI triage, PON budget, BGP MOP, SLA math) · `patterns.md` (6 canonical move) · `domain-rubric.md` (5 scoring չափանիշ) · `worked-example.md` (PON outage triage + BGP route-leak MOP) · `output-templates.md` (MOP / route-risk review / SLA report) · `red-team-gate.md` (reviewer probe-եր) · `tests/eval-prompts.md` + `tests/red-team-prompts.md` · `OWNER_NOTES.md` (human-review trigger-ներ)։
