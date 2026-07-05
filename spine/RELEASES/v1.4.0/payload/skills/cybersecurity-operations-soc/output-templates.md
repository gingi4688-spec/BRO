# Cybersecurity Operations and SOC output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep attribution caveated and every indicator/CVE/actor name verify-before-use. Do not invent volatile facts.

### Template 1 — Alert triage note

- **Alert & source:** what fired, which detection/tool, timestamp
- **ATT&CK map:** tactic → technique (ID) → expected next behavior
- **Confirming data sources:** the logs that prove/disprove this technique (IdP, EDR, DNS, proxy, cloud-audit, mail-audit, netflow)
- **Severity = impact × confidence (scored separately):**
  - Impact: asset criticality · privilege · data exposure · spread → high/med/low
  - Confidence: signal quality · corroborating logs · benign explanations → high/med/low
- **Response tier:** monitor | investigate | contain | declare incident — with owner
- **Containment (if any):** scoped/quiet action; evidence captured *before* destructive steps
- **Hunt:** the next-behavior / same-indicator sweep across users and hosts
- **Detection to ship:** logic + threshold + log source + TP case + FP case + tuning (bake silent first)
- **Assumptions & unknowns / attribution caveat:**
- **Acceptance:** technique mapped · severity = impact×confidence · evidence preserved · detection shipped
- **Verify live:** confirm the technique's telemetry is collected and the shipped rule fires on TP / is quiet on benign

### Template 2 — Detection rule spec (deployable)

- **Detection name & ATT&CK technique (ID):**
- **Hypothesis:** the behavior this catches (TTP, not a rotatable indicator)
- **Log source & required fields:** the source it runs on; if not collected → collection request, not a rule
- **Logic & threshold:** the condition and the numeric/time threshold
- **Rule (portable):** Sigma — then the platform translation (KQL/SPL)
- **True-positive case:** a concrete scenario it should catch
- **Expected false-positive case(s):** and the tuning dimension/allowlist that suppresses them
- **Rollout:** ship silent/log-only → measure FP rate → promote to page
- **Coverage delta:** which ATT&CK techniques this adds/improves; what it does not cover
- **Acceptance:** logic + threshold + source + TP + FP + tuning present · baked silent first
- **Verify live:** rule fires on the TP case and is quiet on the benign case in the running estate

### Template 3 — Incident response / containment plan

- **Incident summary & scope:** what, blast radius (hosts/accounts/data), entry vector
- **Breach/exfil check:** was data exfiltrated (double extortion)? → if yes, route to legal/breach clock
- **Detection → Containment:** scoped/quiet actions; evidence preserved (memory + forensic image) before destructive steps; the active-harm exception named if invoked
- **Eradication scope:**
  - Credential/token rotation in scope (not just the obvious account)
  - Persistence hunt (tasks, services, run-keys, mailbox rules, OAuth grants, new accounts)
  - Reimage vs clean decision (reimage anything privileged/uncertain)
  - AD tier-0 reset incl. double `krbtgt` rotation if domain identity involved
  - Firmware/bootkit (UEFI/BMC/network-device) if below-OS persistence suspected
- **Recovery:** restore from validated, immutable/offline backups; do not restore onto an un-eradicated estate
- **Routing (not the SOC's call):** legal/breach-notification clock · external comms · ransom-payment → leadership/legal
- **Post-incident:** contributing factors → at least one shipped detection/control per factor
- **Metrics:** MTTD · MTTR · dwell · FP-rate (segmented by detection type)
- **Acceptance:** sequence correct · evidence preserved · eradication scoped · legal routed · detection shipped

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. attribution-ը պահիր caveat-ով և ամեն indicator/CVE/actor name verify-before-use։ Մի՛ հորինիր volatile fact։

### Template 1 — Alert triage note

- **Alert & source․** ինչ կրակեց, որ detection/tool, timestamp
- **ATT&CK map․** tactic → technique (ID) → սպասվող հաջորդ behavior
- **Հաստատող data source-ներ․** log-երը, որ ապացուցում/հերքում են technique-ը (IdP, EDR, DNS, proxy, cloud-audit, mail-audit, netflow)
- **Severity = impact × confidence (առանձին score-ված)․**
  - Impact․ asset criticality · privilege · data exposure · spread → high/med/low
  - Confidence․ signal quality · corroborating logs · benign explanation → high/med/low
- **Response tier․** monitor | investigate | contain | declare incident — owner-ով
- **Containment (եթե կա)․** scoped/լուռ action. ապացույց capture-ված *մինչ* destructive քայլերը
- **Hunt․** next-behavior / same-indicator sweep՝ user-ների և host-երի վրա
- **Ship-ելի detection․** logic + threshold + log source + TP case + FP case + tuning (bake silent նախ)
- **Assumption-ներ & unknown-ներ / attribution caveat․**
- **Acceptance․** technique map-ված · severity = impact×confidence · ապացույց պահպանված · detection ship-ված
- **Verify live․** հաստատիր, որ technique-ի telemetry-ն հավաքվում է և ship-ված rule-ը կրակում է TP-ի վրա / լուռ է benign-ի վրա

### Template 2 — Detection rule spec (deploy-ելի)

- **Detection name & ATT&CK technique (ID)․**
- **Hypothesis․** behavior-ը, որ սա բռնում է (TTP, ոչ rotatable indicator)
- **Log source & required fields․** source-ը, որի վրա run է. եթե չհավաքված → collection request, ոչ rule
- **Logic & threshold․** condition-ը և numeric/time threshold-ը
- **Rule (portable)․** Sigma — հետո platform translation (KQL/SPL)
- **True-positive case․** կոնկրետ scenario, որ պետք է բռնի
- **Սպասվող false-positive case(եր)․** և tuning dimension/allowlist-ը, որ suppress է անում դրանք
- **Rollout․** ship silent/log-only → չափիր FP rate → promote page-ի
- **Coverage delta․** որ ATT&CK technique-ները սա ավելացնում/բարելավում է. ինչ չի ծածկում
- **Acceptance․** logic + threshold + source + TP + FP + tuning կա · bake-ված silent նախ
- **Verify live․** rule-ը կրակում է TP case-ի վրա և լուռ է benign case-ի վրա running estate-ում

### Template 3 — Incident response / containment plan

- **Incident summary & scope․** ինչ, blast radius (host/account/data), entry vector
- **Breach/exfil check․** data exfiltrate-վե՞ց (double extortion)։ → եթե այո, ուղղորդիր legal/breach clock-ին
- **Detection → Containment․** scoped/լուռ action. ապացույց պահպանված (memory + forensic image) մինչ destructive քայլերը. active-harm բացառությունը անվանված, եթե invoke է
- **Eradication scope․**
  - Credential/token rotation scope-ում (ոչ միայն ակնհայտ account-ը)
  - Persistence hunt (task, service, run-key, mailbox rule, OAuth grant, նոր account)
  - Reimage ընդդեմ clean որոշում (reimage privileged/անորոշ ամեն ինչ)
  - AD tier-0 reset՝ ներառյալ double `krbtgt` rotation, եթե domain identity ներգրավված է
  - Firmware/bootkit (UEFI/BMC/network-device), եթե below-OS persistence կասկածվում է
- **Recovery․** restore validate-ված, immutable/offline backup-ից. մի՛ restore արա un-eradicated estate-ի վրա
- **Routing (SOC-ի call չէ)․** legal/breach-notification ժամացույց · external comms · ransom-payment → leadership/legal
- **Post-incident․** contributing factor-ներ → առնվազն մեկ ship-ված detection/control ամեն factor-ին
- **Metric-ներ․** MTTD · MTTR · dwell · FP-rate (segment-ված detection type-ով)
- **Acceptance․** հերթականությունը ճիշտ · ապացույց պահպանված · eradication scope-ված · legal ուղղորդված · detection ship-ված
