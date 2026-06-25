# Cybersecurity Operations and SOC worked examples

## English

### Example A — alert triage (impact × confidence + ATT&CK)

**Prompt.** Triage this: 42 failed logins then one success for a finance admin from an unfamiliar ASN, followed by a new mailbox-forwarding rule on that account.

**Senior answer.** **ATT&CK map:** Brute Force / password-spray (T1110) → Valid Accounts (T1078) → the new forwarding rule is Email Collection / persistence via inbox rules. **Data sources to confirm:** IdP/auth logs (the failure-then-success and source ASN), mail-audit logs (the forwarding rule and any auto-forward to an external address), EDR process events on the admin's endpoint (was the session interactive or token-replay?), and the VPN/egress baseline (is that ASN ever normal for this user?). **Severity = impact × confidence, scored separately:** impact is **high** (finance admin = privileged access to payment/financial data); confidence is **medium-high** (the success plus a same-window forwarding rule corroborate; it is not a lone failed-login spike). High-impact × medium-high-confidence → **contain now, but quietly.** **Response tier:** isolate the session and force re-auth on that account, delete the forwarding rule *after capturing it as evidence*, preserve IdP and mail-audit logs, and rotate that admin's credential plus any token reachable from the session. **Hunt:** the same source ASN across other users, and the same forwarding-rule pattern across the tenant — password-spray rarely targets one account. **Detection to ship:** ≥20 auth failures in 15 min followed by a success from a new ASN for that user, *and* a new external-forwarding inbox rule within 30 min → page. **Expected false positives:** a corporate VPN/egress change that moves the user's ASN, and a password-manager retry storm; bake the rule silent/log-only and tune those out before paging.

**Why this passes.** Severity is not a feeling: impact and confidence are scored *separately* and named (high × medium-high), so a scary alert cannot auto-trigger destructive action, and the corroboration (success + forwarding rule, not a lone failure spike) is what raises confidence. The response is **quiet and evidence-preserving** — capture the forwarding rule before deleting it, preserve logs, rotate token scope — exactly the containment-that-doesn't-burn-evidence-or-tip-off discipline. It maps to specific ATT&CK techniques *and* derives the confirming data sources and the next-behavior hunt (same ASN across users), so the map changes collection and response rather than decorating the note. The shipped detection has logic, threshold, log source, and a named false-positive set, and it bakes silent first — a deployable rule, not a wish.

### Example B — CTI report to deployable detection (Sigma + KQL)

**Prompt.** A threat-intel report says an actor gains initial access via phishing, then establishes persistence by registering a malicious scheduled task that runs a script from a user-writable directory, and lists three C2 IPs. Turn it into something deployable.

**Senior answer.** **Operationalize behavior over indicators.** The three C2 IPs are rotatable — block them at the perimeter, but they are not the detection. The durable TTP is **Scheduled Task/Job (T1053.005)** creating a task that executes from a user-writable path (e.g. a user profile / temp directory) — that behavior outlives any IP. **Check collection first:** do we ingest Windows Security 4698 (scheduled-task created) or Sysmon, and the task's action/command line? If not, the deliverable is a collection request, not a rule.

Express it as a portable **Sigma** rule, then translate to the SIEM:

```yaml
title: Scheduled Task Created Running From User-Writable Path
logsource: { product: windows, service: security }   # Event ID 4698 (task registered)
detection:
  selection:
    EventID: 4698
  task_path_user_writable:
    TaskContent|contains:
      - '\Users\'
      - '\AppData\'
      - '\Temp\'
  condition: selection and task_path_user_writable
falsepositives:
  - Legitimate installers/updaters that stage tasks from a user temp path
level: high
```

Translated to **KQL** (Microsoft Sentinel / Defender), with a noise floor:

```kusto
SecurityEvent
| where EventID == 4698                       // a scheduled task was registered
| where TaskContent has_any ("\\Users\\", "\\AppData\\", "\\Temp\\")
| where InitiatorProcessName !in~ (known_good_installers)   // tuning list, maintained
| project TimeGenerated, Computer, Account, TaskName, TaskContent
```

**True positive:** a task registered seconds after a phishing-document process spawns, pointing at a script in `\AppData\`. **False positive:** a legitimate updater that stages a task from a user temp path — hence the `known_good_installers` tuning list. **Rollout:** ship silent/log-only, measure the FP rate against the real estate for a tuning window, then promote to a page once the updater noise is on the allowlist. **Coverage delta:** this report improved detection of T1053.005 and (via the phishing chain) gives a hunt for T1566 process lineage; it did not improve C2 detection beyond the three (rotatable) IPs, which are a perimeter block, not a behavioral rule.

**Why this passes.** It refuses to mistake **indicators for a detection** — the three IPs are blocked but the durable rule is built on the behavior (T1053.005 from a user-writable path), so it survives IP rotation. It **checks collection before writing the rule** (4698 / Sysmon present?), so the rule runs on logs that exist rather than failing silently. It is genuinely **deployable**: a portable Sigma rule and a platform-native KQL translation, each with a true-positive case, a concrete false-positive (legit updater) and the tuning list that suppresses it, plus a silent-first rollout. And it records the **coverage delta** honestly — what the report improved and what it did not — so the intel's value is measured, not assumed.

### Example C — ransomware incident response

**Prompt.** Endpoints across a file-share segment are encrypting; a ransom note appeared; one domain account was used to push the payload via a scheduled task to many hosts. Run the response.

**Senior answer.** **Triage & scope.** Identify the encrypting hosts and shares (blast radius), the entry account, and — critically — whether data was **exfiltrated before encryption** (double extortion). Check egress/proxy and cloud-audit logs for large outbound transfers in the days before; if yes, this is a **data breach**, not just an availability event, which changes notification and legal entirely. **Contain (active harm → speed, but preserve where possible).** Network-isolate the encrypting and adjacent hosts and disable the propagation path: the compromised domain account, the scheduled-task push mechanism, and any exposed RDP/VPN. Because encryption is active ongoing harm, speed can outrank a full forensic image on the *encrypting* hosts — but still capture memory and logs on patient-zero and a representative sample, and preserve the ransom note and any C2/exfil indicators. **Eradicate to full scope.** A domain account pushed the payload to many hosts, so treat domain identity as exposed: rotate that account and every credential/token reachable from the compromised hosts; because tier-0 was used to move laterally, do a full AD reset including a **double `krbtgt` rotation** (with replication between the two resets) and rebuild domain controllers from trusted media, or forged golden tickets survive. Hunt persistence (the scheduled tasks, plus services, run-keys, mailbox rules, new accounts). **Reimage** the affected hosts from known-good images — do not "clean" encrypted/compromised machines. **Recover.** Restore only from backups validated clean against the compromise timeline and confirmed **immutable/offline** — verify the backups were not themselves encrypted or deleted (a common pre-encryption step), and do not restore onto an estate that has not been eradicated, or you re-encrypt. **Route what is not ours.** The **ransom-payment** decision goes to leadership with legal counsel (sanctions-screening and legal exposure — never a SOC call); feed legal/privacy-counsel the **exfiltration evidence and timeline** early for the breach-notification clock. **Review.** Ship detections for the scheduled-task push (T1053.005) and the lateral-movement path, and a control to constrain the over-privileged service account that enabled the spread.

**Why this passes.** It scopes **double extortion first**, so the response treats exfiltration as a breach (with the legal/notification consequence) rather than a pure availability event. The containment names the **active-harm exception** explicitly — speed can outrank a full image on encrypting hosts — while still preserving memory/logs on patient-zero, so it neither freezes nor blindly destroys evidence. Eradication reaches the **full scope**: credential rotation, a **double `krbtgt` reset** because domain identity moved the payload, persistence hunt, and **reimage over clean** — the depth that stops the actor from walking back in. Recovery insists on **validated, immutable/offline backups** and refuses to restore onto an un-eradicated estate. And it **routes the two decisions that are not the SOC's** — ransom payment to leadership/legal, the breach-notification clock to counsel with the evidence — rather than acting on its own authority.

## Հայերեն

### Օրինակ A — alert triage (impact × confidence + ATT&CK)

**Prompt.** Triage արա սա․ finance admin-ի համար 42 failed login, հետո մեկ success unfamiliar ASN-ից, որին հաջորդում է նոր mailbox-forwarding rule այդ հաշվի վրա։

**Senior պատասխան.** **ATT&CK map․** Brute Force / password-spray (T1110) → Valid Accounts (T1078) → նոր forwarding rule-ը Email Collection / persistence է inbox rule-ով։ **Հաստատող data source-ներ․** IdP/auth logs (failure-then-success-ը և source ASN-ը), mail-audit logs (forwarding rule-ը և ցանկացած auto-forward դեպի external հասցե), EDR process event-ներ admin-ի endpoint-ի վրա (session-ը interactive էր, թե token-replay?), և VPN/egress baseline (այդ ASN-ը երբևէ նորմա՞լ է այս user-ի համար)։ **Severity = impact × confidence, առանձին score-ված․** impact-ը **high** է (finance admin = privileged access payment/financial data-ին). confidence-ը **medium-high** է (success-ը plus same-window forwarding rule-ը corroborate են անում. սա մենակ failed-login spike չէ)։ High-impact × medium-high-confidence → **contain հիմա, բայց լուռ։** **Response tier․** isolate արա session-ը և force re-auth արա այդ հաշվին, ջնջիր forwarding rule-ը *capture անելուց հետո որպես ապացույց*, պահպանիր IdP և mail-audit logs-ը, և rotate արա այդ admin-ի credential-ը plus session-ից հասանելի ցանկացած token։ **Hunt․** նույն source ASN-ը այլ user-ների վրա, և նույն forwarding-rule pattern-ը ողջ tenant-ում — password-spray-ը հազվադեպ է մեկ հաշիվ թիրախ դարձնում։ **Ship-ելի detection․** ≥20 auth failure 15 րոպեում, հետո success նոր ASN-ից այդ user-ի համար, *և* նոր external-forwarding inbox rule 30 րոպեի մեջ → page։ **Սպասվող false positive-ներ․** corporate VPN/egress change, որ շարժում է user-ի ASN-ը, և password-manager retry storm. bake արա rule-ը silent/log-only և tune արա դրանք դուրս՝ մինչ paging-ը։

**Ինչու է անցնում gate-ը.** Severity-ն զգացմունք չէ․ impact-ը և confidence-ը *առանձին* են score-ված և անվանված (high × medium-high), ուստի վախեցնող alert-ը չի կարող ինքնաշխատ destructive action գործարկել, և corroboration-ը (success + forwarding rule, ոչ մենակ failure spike) է, որ բարձրացնում է confidence-ը։ Response-ը **լուռ է և ապացույց-պահպանող** — capture արա forwarding rule-ը մինչ ջնջելը, պահպանիր log-երը, rotate արա token scope-ը — հենց containment-ը, որ չի այրում ապացույց և չի զգուշացնում։ Այն map է անում կոնկրետ ATT&CK technique-ների *և* բխեցնում է հաստատող data source-ները և next-behavior hunt-ը (նույն ASN-ը user-ների վրա), ուստի map-ը փոխում է collection-ը և response-ը, ոչ թե դեկորում note-ը։ Ship-ված detection-ն ունի logic, threshold, log source և անվանված false-positive set, և bake է լինում silent նախ — deploy-ելի rule, ոչ ցանկություն։

### Օրինակ B — CTI report-ից deploy-ելի detection (Sigma + KQL)

**Prompt.** Threat-intel report-ը ասում է, որ actor-ը initial access է ստանում phishing-ով, հետո persistence է հաստատում՝ գրանցելով չարամիտ scheduled task, որ script է run անում user-writable directory-ից, և թվարկում է երեք C2 IP։ Դարձրու այն deploy-ելի։

**Senior պատասխան.** **Operationalize արա behavior-ը indicator-ից վեր։** Երեք C2 IP-ները rotatable են — block արա դրանք perimeter-ում, բայց դրանք detection-ը չեն։ Durable TTP-ն **Scheduled Task/Job (T1053.005)**-ն է, որ ստեղծում է task, որ execute է անում user-writable path-ից (օր.՝ user profile / temp directory) — այդ behavior-ը վերապրում է ցանկացած IP։ **Նախ ստուգիր collection-ը․** ingest անո՞ւմ ենք Windows Security 4698 (scheduled-task created) կամ Sysmon, և task-ի action/command line-ը։ Եթե ոչ, deliverable-ը collection request է, ոչ rule։

Արտահայտիր այն portable **Sigma** rule-ով, հետո translate արա SIEM-ին․

```yaml
title: Scheduled Task Created Running From User-Writable Path
logsource: { product: windows, service: security }   # Event ID 4698 (task registered)
detection:
  selection:
    EventID: 4698
  task_path_user_writable:
    TaskContent|contains:
      - '\Users\'
      - '\AppData\'
      - '\Temp\'
  condition: selection and task_path_user_writable
falsepositives:
  - Legitimate installers/updaters that stage tasks from a user temp path
level: high
```

Translate-ված **KQL**-ի (Microsoft Sentinel / Defender), noise floor-ով․

```kusto
SecurityEvent
| where EventID == 4698                       // scheduled task գրանցվեց
| where TaskContent has_any ("\\Users\\", "\\AppData\\", "\\Temp\\")
| where InitiatorProcessName !in~ (known_good_installers)   // tuning list, պահպանվող
| project TimeGenerated, Computer, Account, TaskName, TaskContent
```

**True positive․** task գրանցված phishing-document process-ի spawn-ից վայրկյաններ անց, որ ուղղված է `\AppData\`-ի script-ին։ **False positive․** legitimate updater, որ task է stage անում user temp path-ից — այստեղից `known_good_installers` tuning list-ը։ **Rollout․** ship արա silent/log-only, չափիր FP rate-ը իրական estate-ի դեմ tuning window-ի համար, հետո promote արա page-ի, երբ updater-ի աղմուկը allowlist-ում է։ **Coverage delta․** այս report-ը բարելավեց T1053.005-ի detection-ը և (phishing chain-ով) hunt է տալիս T1566 process lineage-ի համար. այն չբարելավեց C2 detection-ը երեք (rotatable) IP-ից վեր, որոնք perimeter block են, ոչ behavioral rule։

**Ինչու է անցնում gate-ը.** Այն հրաժարվում է **indicator-ը detection-ի հետ շփոթելուց** — երեք IP-ները block-ված են, բայց durable rule-ը կառուցված է behavior-ի վրա (T1053.005 user-writable path-ից), ուստի վերապրում է IP rotation-ը։ Այն **ստուգում է collection-ը մինչ rule գրելը** (4698 / Sysmon կա՞), ուստի rule-ը run է գոյություն ունեցող log-երի վրա, ոչ թե լուռ fail։ Այն իսկապես **deploy-ելի է**․ portable Sigma rule և platform-native KQL translation, ամեն մեկը true-positive case-ով, կոնկրետ false-positive-ով (legit updater) և tuning list-ով, որ suppress է անում այն, plus silent-first rollout։ Եվ այն ազնվորեն գրանցում է **coverage delta**-ն — ինչ բարելավեց report-ը և ինչ ոչ — ուստի intel-ի արժեքը չափվում է, ոչ ենթադրվում։

### Օրինակ C — ransomware incident response

**Prompt.** File-share segment-ի endpoint-ները encrypt են լինում. ransom note հայտնվեց. մեկ domain account օգտագործվեց payload-ը scheduled task-ով շատ host-երի push անելու։ Վարիր response-ը։

**Senior պատասխան.** **Triage & scope.** Հստակեցրու encrypting host-երն ու share-երը (blast radius), entry account-ը, և — կրիտիկորեն — արդյո՞ք data **exfiltrate-վեց մինչ encryption-ը** (double extortion)։ Ստուգիր egress/proxy և cloud-audit log-երը մեծ outbound transfer-ների համար encryption-ից առաջվա օրերին. եթե այո, սա **data breach** է, ոչ միայն availability event, որ լրիվ փոխում է notification-ն ու legal-ը։ **Contain (active վնաս → արագություն, բայց պահպանիր, որտեղ հնարավոր է).** Network-isolate արա encrypting և հարակից host-երը և անջատիր propagation path-ը․ compromised domain account-ը, scheduled-task push mechanism-ը, և ցանկացած exposed RDP/VPN։ Քանի որ encryption-ը active ընթացիկ վնաս է, արագությունը կարող է գերակա լինել լրիվ forensic image-ից *encrypting* host-երի վրա — բայց դեռ capture արա memory-ն ու log-երը patient-zero-ի և representative sample-ի վրա, և պահպանիր ransom note-ը և ցանկացած C2/exfil indicator։ **Eradicate արա լրիվ scope-ով.** Domain account-ը payload-ը push արեց շատ host-երի, ուստի domain identity-ն համարիր exposed․ rotate արա այդ account-ը և compromised host-երից հասանելի ամեն credential/token. քանի որ tier-0-ն օգտագործվեց lateral move անելու, արա լրիվ AD reset՝ ներառյալ **double `krbtgt` rotation** (replication-ով երկու reset-երի միջև) և rebuild արա domain controller-ները trusted media-ից, թե չէ forged golden ticket-ները վերապրում են։ Hunt արա persistence (scheduled task-երը, plus service, run-key, mailbox rule, նոր account)։ **Reimage** արա affected host-երը known-good image-ից — մի՛ «մաքրիր» encrypted/compromised machine-ները։ **Recover.** Restore արա միայն backup-ից, որ validate-ված clean է compromise timeline-ի դեմ և հաստատված **immutable/offline** — ստուգիր, որ backup-ները իրենք encrypt կամ ջնջված չէին (հաճախ pre-encryption քայլ), և մի՛ restore արա estate-ի վրա, որ eradicate-ված չէ, թե չէ կրկին encrypt կլինես։ **Ուղղորդիր այն, ինչ մերը չէ.** **Ransom-payment**-ի որոշումը գնում է leadership-ին legal counsel-ի հետ (sanctions-screening և legal exposure — երբեք SOC call). սնիր legal/privacy-counsel-ին **exfiltration-ի ապացույցով և timeline-ով** վաղ՝ breach-notification ժամացույցի համար։ **Review.** Ship արա detection-ներ scheduled-task push-ի (T1053.005) և lateral-movement path-ի համար, և control՝ over-privileged service account-ը սահմանափակելու, որ հնարավոր դարձրեց spread-ը։

**Ինչու է անցնում gate-ը.** Այն **double extortion-ը scope է անում նախ**, ուստի response-ը exfiltration-ը վերաբերվում է որպես breach (legal/notification հետևանքով), ոչ զուտ availability event։ Containment-ը անվանում է **active-harm բացառությունը** բացահայտ — արագությունը կարող է գերակա լինել լրիվ image-ից encrypting host-երի վրա — մինչ դեռ պահպանում է memory/log patient-zero-ի վրա, ուստի այն ոչ սառեցնում է, ոչ կույր ոչնչացնում ապացույց։ Eradication-ը հասնում է **լրիվ scope-ի**․ credential rotation, **double `krbtgt` reset**, որովհետև domain identity-ն շարժեց payload-ը, persistence hunt, և **reimage՝ clean-ից վեր** — այն խորությունը, որ կանգնեցնում է actor-ի վերադարձը։ Recovery-ն պնդում է **validate-ված, immutable/offline backup** և հրաժարվում է restore անել un-eradicated estate-ի վրա։ Եվ այն **ուղղորդում է երկու որոշումը, որ SOC-ինը չեն** — ransom payment-ը leadership/legal-ին, breach-notification ժամացույցը counsel-ին ապացույցով — ոչ թե սեփական լիազորությամբ գործում։
