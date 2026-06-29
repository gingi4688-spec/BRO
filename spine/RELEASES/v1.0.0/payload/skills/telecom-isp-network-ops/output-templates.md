# Telecom, ISP, and Network Operations output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every number traceable to a measurement (route-count, Rx, availability), not a guess. Do not invent prices, SLA credits, or standards numbers.

### Template 1 — Change MOP (method of procedure)

- **Change & blast radius:** what changes, which element, who/what is exposed if it goes wrong
- **Change-freeze / window:** is there a freeze? scheduled inside the maintenance window? customer pre-notification sent?
- **Pre-check (capture current state):** the counts/levels/sessions to record now so validation can compare (e.g. advertised route-count, per-ONU Rx, BNG session count)
- **Change steps:** ordered commands/actions
- **Expected post-state:** the exact number to validate against (route-count, reachability, Rx within budget, session count)
- **Validation:** commands/observations that compare live state to the expected post-state in the running network
- **Monitoring & bake:** what to watch and for how long before declaring success
- **Rollback trigger + command:** the named condition AND the tested rollback command/revision
- **Comms:** NOC / peer / customer notifications and who owns them
- **Owner & approval:** who approves; irreversible/core-impacting steps gated to a human
- **Acceptance:** rollback trigger named · expected post-state defined · validated live, not on a clean parse

### Template 2 — BGP / route-risk review

- **Change intent:** new peer/transit, new announcement, policy edit — and the path intent (primary/backup, prefer/avoid)
- **Leak guard (export):** which prefixes are permitted out, by intent (customer/peer/transit); confirm no peer/other-transit routes are re-announced
- **Flood guard (import):** max-prefix cap per session, sized to the expected table
- **Path intent:** communities, local-pref, MED — and the resulting best-path
- **Blackhole guard:** next-hop reachability verified before trusting any received path
- **RPKI / origin:** does ROV inform the policy (which AS may originate)?
- **Expected route-count:** advertised count out, received count in — the numbers validation compares against
- **Validation & monitoring:** route-count match, no impossible paths, no reachability loss, through the bake window
- **Rollback:** named trigger (count exceeds intended / max-prefix trips / reachability drops) + tested shut/withdraw command
- **Acceptance:** leak + blackhole designed out · expected route-count present · rollback condition + command stated

### Template 3 — SLA / incident report (customer-facing, blameless)

- **Impact & affected services:** what failed, for whom, how many; severity by user impact
- **Downtime window (measured):** start/end timestamps; total measured downtime
- **Availability math:** availability = uptime / measured time, with contractual maintenance exclusions stated (e.g. 99.9% budget = 43.2 min/month — is it breached?)
- **Other SLA metrics (separate):** latency, packet loss, jitter, MTTR — kept distinct from availability
- **Root cause (contributing factors, not a name):** what made it possible · what slowed detection · what slowed recovery
- **Remediation:** what restored service
- **Prevention (controls):** the change/check/automation that stops the class of failure (e.g. a post-maintenance Rx check in the MOP)
- **Credits / obligations:** state the breach; route any credit figure or regulatory obligation to the contract/source — do not invent it
- **Acceptance:** downtime measured · availability computed with exclusions · prevention control shipped · no invented credit/statute

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն թիվ պահիր հետագծելի չափման (route-count, Rx, availability), ոչ գուշակության։ Մի՛ հորինիր price, SLA credit կամ standards թիվ։

### Template 1 — Change MOP (method of procedure)

- **Change & blast radius․** ինչ է փոխվում, որ element, ով/ինչ է exposed, եթե սխալ գնա
- **Change-freeze / window․** freeze կա՞. ժամանակացրված maintenance window-ի ներսո՞ւմ. customer pre-notification ուղարկվա՞ծ
- **Pre-check (capture current state)․** count/level/session, որ պետք է գրանցել հիմա, որ validation-ը կարողանա համեմատել (օր.՝ advertised route-count, per-ONU Rx, BNG session count)
- **Change step-եր․** ordered command/action
- **Expected post-state․** ճշգրիտ թիվը, որի դեմ validate անել (route-count, reachability, Rx՝ budget-ի ներսում, session count)
- **Validation․** command/observation, որ համեմատում է live state-ը expected post-state-ի հետ running network-ում
- **Monitoring & bake․** ինչ դիտել և որքան, մինչև success հայտարարելը
- **Rollback trigger + command․** անվանված պայման ԵՎ ստուգված rollback command/revision
- **Comms․** NOC / peer / customer notification և ով է տիրում
- **Owner & approval․** ով է approve անում. անդառնալի/core-impacting step-երը gated մարդուն
- **Acceptance․** rollback trigger անվանված · expected post-state սահմանված · validated live, ոչ մաքուր parse-ի վրա

### Template 2 — BGP / route-risk review

- **Change intent․** նոր peer/transit, նոր announcement, policy edit — և path intent-ը (primary/backup, prefer/avoid)
- **Leak guard (export)․** որ prefix-ներն են թույլատրված դուրս, ըստ intent-ի (customer/peer/transit). հաստատիր, որ ոչ մի peer/այլ-transit route չի re-announce-վում
- **Flood guard (import)․** max-prefix cap ամեն session-ի, size-ված սպասվող table-ին
- **Path intent․** communities, local-pref, MED — և արդյունքային best-path-ը
- **Blackhole guard․** next-hop reachability ստուգված մինչև որևէ received path-ի վստահելը
- **RPKI / origin․** ROV-ն տեղեկացնո՞ւմ է policy-ն (որ AS-ը կարող է originate անել)
- **Expected route-count․** advertised count դուրս, received count ներս — թվերը, որոնց դեմ validation համեմատում է
- **Validation & monitoring․** route-count match, ոչ անհնար path, ոչ reachability loss, bake window-ի ընթացքում
- **Rollback․** անվանված trigger (count գերազանցում է մտադրվածը / max-prefix trip / reachability ընկնում) + ստուգված shut/withdraw command
- **Acceptance․** leak + blackhole design-out արված · expected route-count կա · rollback condition + command նշված

### Template 3 — SLA / incident report (customer-facing, blameless)

- **Impact & affected services․** ինչ fail եղավ, ում համար, քանիսը. severity ըստ user impact-ի
- **Downtime window (measured)․** start/end timestamp. ընդհանուր չափված downtime
- **Availability math․** availability = uptime / measured time, contractual maintenance exclusion-ները նշված (օր.՝ 99.9% budget = 43.2 min/month — խախտվա՞ծ է)
- **Այլ SLA metric-ներ (առանձին)․** latency, packet loss, jitter, MTTR — availability-ից տարբերակված
- **Root cause (contributing factors, ոչ անուն)․** ինչը հնարավոր դարձրեց · ինչը դանդաղեցրեց detection-ը · ինչը դանդաղեցրեց recovery-ն
- **Remediation․** ինչը վերականգնեց service-ը
- **Prevention (control-ներ)․** change/check/ավտոմատացում, որ կանգնեցնում է failure-ի դասը (օր.՝ post-maintenance Rx check MOP-ում)
- **Credit / obligation․** նշիր breach-ը. ցանկացած credit թիվ կամ regulatory obligation ուղղորդիր contract/source-ին — մի՛ հորինիր
- **Acceptance․** downtime չափված · availability հաշված exclusion-ներով · prevention control ship-ված · ոչ հորինված credit/statute
