# Cybersecurity Operations and SOC patterns

## English

These are canonical SOC and incident-response moves. Each is a mechanism for one of the domain's artifacts (alert triage note, detection rule, severity call, containment/IR plan, eradication runbook, CTI-driven detection). Choose the move that changes the next decision, not the nicest label.

### 1. Alert-to-technique map

- **Trigger:** An alert is noisy and tool-specific ("suspicious login", "EDR detection").
- **Mechanism:** Translate it into ATT&CK tactic/technique, the data sources that confirm it, the expected next behavior, and the response action. If no mapping changes collection, detection, or response, lower its priority — it is noise, not a lead.
- **Do not use when:** It is a routine health/ops signal with no security behavior — that is monitoring, not triage.
- **Failure repair:** If the map stops at "suspicious login," add the technique (T1110 → T1078 …) and the log evidence that distinguishes true from benign.

### 2. Detection-rule test (deploy silent first)

- **Trigger:** A detection is proposed or a CTI behavior needs to become a rule.
- **Mechanism:** Write logic, threshold, the source log it runs on, a true-positive case, an expected false-positive case, and a tuning dimension. Test against at least one benign scenario, ship **silent/log-only**, measure the false-positive rate against the real estate, then promote to a page.
- **Do not use when:** The required fields are not collected — the output is a collection gap request, not a rule the logs cannot feed.
- **Failure repair:** If the false positives are unknown, keep it log-only and tune; do not page on an unmeasured rule.

### 3. Severity matrix (impact × confidence)

- **Trigger:** Teams disagree on an incident's urgency, or fear is inflating a verdict.
- **Mechanism:** Score impact (asset criticality, privilege, data exposure, spread) and confidence (signal quality, corroboration, benign explanations) **separately**, then choose a response tier — monitor, investigate, contain, or declare incident — with an owner and the next evidence to collect.
- **Do not use when:** Active exfiltration or encryption is already confirmed — do not use the matrix to delay containment that is stopping ongoing harm.
- **Failure repair:** If confidence is low, collect corroborating logs before any destructive action; investigation priority is not destructive containment.

### 4. Containment with evidence preservation

- **Trigger:** A host or account is confirmed compromised and must be contained.
- **Mechanism:** Prefer **scoped, quiet** containment (network-isolate the host, disable the specific session) over loud actions that warn an adversary still holding other footholds. Capture volatile evidence (memory, connections, processes) and a forensic image **before** any wipe or reboot. State the one exception explicitly: active ongoing harm (live exfil, encryption) where stopping the bleeding outranks the full image.
- **Do not use when:** A loud, immediate block is the only way to stop active harm — then act, but still preserve what you can and say why.
- **Failure repair:** If the host was wiped before capture, reconstruct the timeline from remaining logs, fix the collection gap, and capture-before-wipe on the next host.

### 5. Eradication and persistence sweep

- **Trigger:** The adversary is contained and you are deciding whether it is "clean."
- **Mechanism:** Rotate every credential/token reachable from the compromised host (in scope, not just the obvious account); hunt persistence (scheduled tasks/cron, services, registry run-keys, WMI, mailbox rules, OAuth grants, new accounts); **reimage** rather than clean for anything privileged or uncertain. On tier-0/Domain-Admin compromise, do a full AD reset including a **double `krbtgt` rotation** (replication between resets) and DC rebuild. On suspected firmware/bootkit persistence, require firmware re-flash or hardware replacement — an OS reimage does not reach below the OS.
- **Do not use when:** It is a low-privilege, low-confidence, fully-understood case with owner sign-off — a documented clean may be proportionate; reimage anything privileged.
- **Failure repair:** If eradication cleaned only the entry host, widen to credential scope + persistence hunt + (where relevant) krbtgt double reset and firmware, before declaring recovery.

### 6. CTI-to-detection operationalization

- **Trigger:** A threat-intel report or feed arrives and someone is about to read-and-file it.
- **Mechanism:** Extract behavior and TTPs (not just rotatable IPs/hashes); check them against your collection; express them as a Sigma rule and translate to your platform (KQL/SPL); bake silent/log-only and tune against your real estate; block durable indicators at the perimeter; promote the tuned rule; record the ATT&CK coverage delta so the intel's value is measurable.
- **Do not use when:** The behavior cannot be seen in any collected log — then the deliverable is a collection/retention request, not a detection.
- **Failure repair:** If the report changed no rule, no hunt, and no block, it changed nothing — go back and produce the rule or the coverage-gap request.

## Հայերեն

Սրանք canonical SOC և incident-response move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (alert triage note, detection rule, severity call, containment/IR plan, eradication runbook, CTI-driven detection)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Alert-ից technique map

- **Երբ է պետք․** Alert-ը noisy է և tool-specific («suspicious login», «EDR detection»)։
- **Մեխանիզմը․** Թարգմանիր այն ATT&CK tactic/technique-ի, այն հաստատող data source-ների, սպասվող հաջորդ behavior-ի և response action-ի։ Եթե ոչ մի mapping չի փոխում collection-ը, detection-ը կամ response-ը, priority-ն իջեցրու — աղմուկ է, ոչ lead։
- **Երբ չօգտագործել․** Երբ routine health/ops signal է՝ առանց security behavior-ի — դա monitoring է, ոչ triage։
- **Ուղղում․** Եթե map-ը կանգնում է «suspicious login»-ի վրա, ավելացրու technique-ը (T1110 → T1078 …) և log evidence-ը, որ true-ն benign-ից տարբերում է։

### 2. Detection-rule test (նախ silent deploy)

- **Երբ է պետք․** Detection է առաջարկվում, կամ CTI behavior-ը պետք է rule դառնա։
- **Մեխանիզմը․** Գրիր logic, threshold, source log-ը, որի վրա run է, true-positive case, սպասվող false-positive case, և tuning dimension։ Test արա առնվազն մեկ benign scenario-ի դեմ, ship արա **silent/log-only**, չափիր false-positive rate-ը իրական estate-ի դեմ, հետո promote արա page-ի։
- **Երբ չօգտագործել․** Երբ պահանջվող field-երը չեն հավաքվում — output-ը collection gap-ի request է, ոչ rule, որ log-ները չեն կարող սնել։
- **Ուղղում․** Եթե false positive-ները անհայտ են, պահիր log-only և tune արա. մի՛ page արա չչափված rule-ի վրա։

### 3. Severity matrix (impact × confidence)

- **Երբ է պետք․** Թիմերը incident-ի urgency-ի շուրջ համաձայն չեն, կամ վախը ուռճացնում է verdict-ը։
- **Մեխանիզմը․** Score արա impact-ը (asset criticality, privilege, data exposure, spread) և confidence-ը (signal quality, corroboration, benign explanation) **առանձին**, հետո ընտրիր response tier — monitor, investigate, contain կամ declare incident — owner-ով և հավաքելու հաջորդ ապացույցով։
- **Երբ չօգտագործել․** Երբ active exfiltration կամ encryption-ը արդեն հաստատված է — matrix-ը մի՛ օգտագործիր ընթացիկ վնասը կանգնեցնող containment-ը ուշացնելու համար։
- **Ուղղում․** Եթե confidence-ը ցածր է, ցանկացած destructive action-ից առաջ հավաքիր corroborating log-եր. investigation priority-ն destructive containment չէ։

### 4. Containment՝ ապացույցի պահպանմամբ

- **Երբ է պետք․** Host կամ հաշիվ հաստատված compromised է և պետք է contain լինի։
- **Մեխանիզմը․** Նախընտրիր **scoped, լուռ** containment (host-ի network-isolate, կոնկրետ session-ի անջատում) բարձր action-ից, որ զգուշացնում է դեռ ուրիշ foothold ունեցող adversary-ին։ Capture արա volatile evidence-ը (memory, connection, process) և forensic image-ը **մինչ** ցանկացած wipe կամ reboot։ Ասա՛ միակ բացառությունը բացահայտ․ active ընթացիկ վնաս (live exfil, encryption), որտեղ արյունահոսությունը կանգնեցնելը գերակա է լրիվ image-ից։
- **Երբ չօգտագործել․** Երբ բարձր, անմիջական block-ը active վնասը կանգնեցնելու միակ ճանապարհն է — ապա գործիր, բայց դեռ պահպանիր, ինչ կարող ես, և ասա ինչու։
- **Ուղղում․** Եթե host-ը wipe- վեց մինչ capture-ը, timeline-ը reconstruct արա մնացած log-երից, ուղղիր collection gap-ը, և հաջորդ host-ին capture-արա-մինչ-wipe։

### 5. Eradication և persistence sweep

- **Երբ է պետք․** Adversary-ն contain-ված է, և որոշում ես՝ արդյո՞ք «clean» է։
- **Մեխանիզմը․** Rotate արա compromised host-ից հասանելի ամեն credential/token (scope-ում, ոչ միայն ակնհայտ հաշիվը). hunt արա persistence (scheduled task/cron, service, registry run-key, WMI, mailbox rule, OAuth grant, նոր հաշիվ). **reimage** արա՝ ոչ clean, privileged կամ անորոշ ամեն ինչի համար։ Tier-0/Domain-Admin compromise-ի դեպքում արա լրիվ AD reset՝ ներառյալ **double `krbtgt` rotation** (replication reset-երի միջև) և DC rebuild։ Կասկածելի firmware/bootkit persistence-ի դեպքում պահանջիր firmware re-flash կամ hardware-ի փոխարինում — OS-ի reimage-ը չի հասնում OS-ից ներքև։
- **Երբ չօգտագործել․** Երբ low-privilege, low-confidence, լրիվ հասկացված դեպք է owner-ի sign-off-ով — փաստաթղթավորված clean-ը կարող է համաչափ լինել. privileged ամեն ինչ reimage արա։
- **Ուղղում․** Եթե eradication-ը մաքրեց միայն entry host-ը, ընդլայնիր credential scope + persistence hunt + (որտեղ տեղին է) krbtgt double reset և firmware՝ մինչ recovery հայտարարելը։

### 6. CTI-ից detection operationalization

- **Երբ է պետք․** Threat-intel report կամ feed է գալիս, և ինչ-որ մեկը պատրաստվում է read-and-file անել։
- **Մեխանիզմը․** Քաշիր behavior-ը և TTP-ները (ոչ միայն rotatable IP/hash). ստուգիր քո collection-ի դեմ. արտահայտիր Sigma rule-ով և translate արա քո platform-ին (KQL/SPL). bake արա silent/log-only և tune քո իրական estate-ի դեմ. block արա durable indicator-ները perimeter-ում. promote արա tuned rule-ը. գրանցիր ATT&CK coverage delta-ն, որ intel-ի արժեքը չափելի լինի։
- **Երբ չօգտագործել․** Երբ behavior-ը ոչ մի հավաքված log-ում չի երևում — ապա deliverable-ը collection/retention request է, ոչ detection։
- **Ուղղում․** Եթե report-ը ոչ rule, ոչ hunt, ոչ block փոխեց, ոչինչ չփոխեց — վերադարձիր և արտադրիր rule-ը կամ coverage-gap-ի request-ը։
