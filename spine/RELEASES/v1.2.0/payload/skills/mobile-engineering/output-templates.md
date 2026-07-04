# Mobile Engineering output templates

## English

Three domain-shaped deliverables. Fill the real fields; keep every number traceable to an on-device measurement or a stated assumption. Do not invent benchmarks, device specs, or prices.

### Template 1 — Offline-sync design

- **User & network reality:** who works offline, for how long, on what data
- **Local store:** on-device store + at-rest encryption (key in Keychain/KeyStore) + retention/purge rule
- **Operation log:** ordered, append-only intents; **idempotency key** per operation
- **Authority & conflict policy (per data class):** which fields are last-write-wins (low-value), which need server authority / field-level merge / manual resolution (collaborative or money/inventory)
- **Sync engine:** retry/backoff policy; trigger (on connectivity / on foreground)
- **Status UI:** per-record state — queued / syncing / synced / conflict
- **Lifecycle:** save boundary (when state is persisted); restore from saved state/deep link
- **Release:** behind a remote flag; staged rollout; remote kill switch to old engine
- **Acceptance:** no duplicate on retry · conflict policy fits data risk · status visible · state survives process death
- **Verify live:** real device, airplane mode, force-kill mid-edit, duplicate submit, deliberate conflict — no duplicate, no lost data

### Template 2 — Performance-triage report

- **Symptom & report source:** what users see (jank / slow start / crash) and on which devices ("older phones", a model tier)
- **Repro hardware:** the representative low/mid-tier device profiled (not a flagship); OS version
- **Frame budget:** ~16ms/frame at 60fps target; which frames blow it
- **Main-thread offenders:** image decode / JSON parse / disk-DB I/O / layout passes found on the UI thread
- **Memory:** peak footprint; full-res images held?; memory-pressure callback (`didReceiveMemoryWarning`/`onTrimMemory`) handled?; retain cycle / Context leak checked with a leak tool?
- **Fixes (structural):** move work off main thread · cache decoded images · recycle views · downsample images · release off-screen state · break the leak
- **Re-measurement:** cold start, p95 frame time, memory — on the low tier, before vs after
- **Acceptance:** p95 frame time under budget on the low tier · memory flat across scroll · no OOM kill · leak closed
- **Verify live:** real device (not simulator — it has desktop RAM and hides the OOM)

### Template 3 — Release / rollout plan

- **Change & risk:** what ships, and why it is risky (migration / behavior / API compatibility)
- **Oldest-client / API compatibility:** lowest installed version in the field; is the server contract backward-compatible (expand/contract) or are old clients gated by forced upgrade?
- **Flagging:** the risky path is behind a feature flag / remote config
- **Staged rollout:** percentage steps (e.g. 1% → 5% → 20% → 50% → 100%) and the dwell at each
- **Guardrails:** crash-free session rate · ANR rate · the key business/sync metric — and the halt threshold per guardrail
- **Remote kill switch:** how the risky path is disabled without a store submission
- **Migration safety:** forward-safe; reversible where possible; rollback/backup path
- **Acceptance:** staged % defined · crash/ANR guardrails with halt thresholds · kill switch exists · oldest client handled · no big-bang for a risky change
- **Verify live:** crash-free/ANR observed at each step on the real fleet before widening — not the simulator, not green CI

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն թիվ պահիր հետագծելի on-device measurement-ի կամ նշված assumption-ի։ Մի՛ հորինիր benchmark, device spec կամ price։

### Template 1 — Offline-sync design

- **User & network reality․** ով է աշխատում offline, որքան ժամանակ, ինչ data-ի վրա
- **Local store․** on-device store + at-rest encryption (key-ը Keychain/KeyStore-ում) + retention/purge rule
- **Operation log․** ordered, append-only intent. **idempotency key**՝ ամեն operation-ի
- **Authority & conflict policy (ամեն data class-ի)․** որ field-երն են last-write-wins (low-value), որոնք են ուզում server authority / field-level merge / manual resolution (collaborative կամ money/inventory)
- **Sync engine․** retry/backoff policy. trigger (connectivity-ի / foreground-ի վրա)
- **Status UI․** per-record վիճակ — queued / syncing / synced / conflict
- **Lifecycle․** save boundary (երբ է state-ը պահպանվում). restore saved state/deep link-ից
- **Release․** remote flag-ի հետևում. staged rollout. remote kill switch հին engine-ին
- **Acceptance․** retry-ին duplicate չկա · conflict policy-ն data risk-ին համապատասխան · status տեսանելի · state-ը գերապրում է process death-ին
- **Verify live․** իրական device, airplane mode, force-kill edit-ի կեսին, duplicate submit, միտումնավոր conflict — ոչ duplicate, ոչ կորած data

### Template 2 — Performance-triage report

- **Symptom & report source․** ինչ են user-ները տեսնում (jank / դանդաղ start / crash) և որ device-ների վրա («հին հեռախոս», model tier)
- **Repro hardware․** profile-ված representative low/mid-tier device-ը (ոչ flagship). OS version
- **Frame budget․** ~16ms/frame 60fps target-ի դեպքում. որ frame-երն են պայթեցնում
- **Main-thread մեղավորներ․** image decode / JSON parse / disk-DB I/O / layout pass՝ UI thread-ի վրա գտնված
- **Memory․** peak footprint. full-res image-ները պահվա՞ծ են. memory-pressure callback-ը (`didReceiveMemoryWarning`/`onTrimMemory`) handle-վա՞ծ է. retain cycle / Context leak-ը ստուգվա՞ծ է leak tool-ով
- **Fix-եր (կառուցվածքային)․** work-ը հանիր main thread-ից · cache արա decode-ված image · recycle արա view · downsample արա image · ազատիր off-screen state · կոտրիր leak-ը
- **Վերաչափում․** cold start, p95 frame time, memory — low tier-ի վրա, առաջ ընդդեմ հետո
- **Acceptance․** p95 frame time-ը budget-ից ցածր low tier-ի վրա · memory-ն հարթ scroll-ի ընթացքում · OOM kill չկա · leak-ը փակված
- **Verify live․** իրական device (ոչ simulator — այն desktop RAM ունի և թաքցնում է OOM-ը)

### Template 3 — Release / rollout plan

- **Change & risk․** ինչ է ship-վում, և ինչու է risky (migration / behavior / API compatibility)
- **Oldest-client / API compatibility․** դաշտում ամենացածր տեղադրված version-ը. server contract-ը backward-compatible է՞ (expand/contract), թե հին client-ները gated են forced upgrade-ով
- **Flagging․** risky path-ը feature flag / remote config-ի հետևում է
- **Staged rollout․** percentage step-եր (օր.՝ 1% → 5% → 20% → 50% → 100%) և dwell ամեն մեկին
- **Guardrail-ներ․** crash-free session rate · ANR rate · key business/sync metric — և halt threshold ամեն guardrail-ի
- **Remote kill switch․** ինչպես է risky path-ը անջատվում առանց store submission-ի
- **Migration safety․** forward-safe. հետշրջելի որտեղ հնարավոր է. rollback/backup path
- **Acceptance․** staged % սահմանված · crash/ANR guardrail՝ halt threshold-ով · kill switch կա · oldest client-ը handle-ված · risky change-ի համար big-bang չկա
- **Verify live․** crash-free/ANR դիտված ամեն step-ին իրական fleet-ի վրա մինչև լայնացնելը — ոչ simulator, ոչ green CI
