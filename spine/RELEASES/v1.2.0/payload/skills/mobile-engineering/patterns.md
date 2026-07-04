# Mobile Engineering patterns

## English

These are canonical mobile-engineering moves. Each is a mechanism for one of the domain's deliverables (mobile architecture plan, offline-sync design, performance-triage report, release/rollout plan, native-vs-cross-platform decision). Choose the move that changes the next decision, not the nicest label.

### 1. Offline sync contract

- **Trigger:** Users work with intermittent or no network, or an existing "offline cache" has no truth, order, or conflict rule.
- **Mechanism:** Define local truth (on-device store), server truth (authority), an ordered operation log of intents, an idempotency key per operation, a conflict policy fit to data risk (last-write-wins only for low-value single-owner fields; server authority / field-level merge / manual resolution for collaborative or money/inventory data), retry with backoff, and a user-visible queued/synced/conflict status. Test airplane mode, duplicate submit, and stale-edit conflict.
- **Do not use when:** Data must never exist on the device (regulated/secret-only) — then keep it server-only and design for graceful degradation offline, not local persistence.
- **Failure repair:** If the conflict policy is "hope," block launch; add the operation log, idempotency keys, and an explicit conflict rule before shipping.

### 2. Main-thread jank / ANR hunt

- **Trigger:** UI feels slow, animations stutter under load, or ANR/watchdog reports appear.
- **Mechanism:** Profile cold start, main-thread work, p95 frame time against the ~16ms budget, image decode, layout passes, and the network waterfall — on a representative device, not a flagship. Move JSON parse, image decode, and disk/DB I/O off the main thread; cache decoded images; batch network calls. Distinguish a cosmetic stutter from a main-thread block that is an ANR/kill risk.
- **Do not use when:** The symptom is a backend/network latency problem, not on-device work — measure the network leg first; a background thread will not fix a slow server.
- **Failure repair:** If only flagship devices were measured, the performance evidence is thin — re-measure on the mid/low tier most users carry and build a device-tier matrix.

### 3. Staged release gate

- **Trigger:** A mobile release carries migration, behavior, or compatibility risk and cannot be instantly recalled.
- **Mechanism:** Put the risky behavior behind a feature flag / remote config; roll out by staged percentage (e.g. 1% → 5% → 20% → 50% → 100%) gated on crash-free sessions and ANR rate; keep a remote kill switch that disables the risky path without a store submission; ensure migrations are forward-safe and reversible where possible.
- **Do not use when:** It is an emergency security patch that must reach all users at once — then ship broadly but still keep the risky new code behind a flag so it can be disabled remotely.
- **Failure repair:** If the only rollback path is a new build through store review, the code is not reversible — make the risky path flaggable and add a remote disable before release.

### 4. Process-death lifecycle plan

- **Trigger:** State or navigation breaks on app-switch, low memory, or after the OS kills a backgrounded app — bugs that the happy path on a fast device never reveals.
- **Mechanism:** Identify the save boundary (on backgrounding, on each meaningful field change for a draft) and persist state there. Restore the screen from saved state or a deep link, never from in-memory state. Make navigation re-entrant: a deep link or a process-death restart must rebuild the same screen with the same data. Add explicit tests for app-switch, process death, low memory, and network loss.
- **Do not use when:** The state is genuinely ephemeral and cheap to recompute (a transient animation, a spinner) — persisting it is needless complexity.
- **Failure repair:** If state lives only in memory, move it to a save boundary and add a process-death restore test; assert the screen rebuilds, do not trust the happy path.

### 5. Mobile secure-storage & pinning gate

- **Trigger:** The app stores tokens/PII/keys on device, or it needs to protect transport against interception, or it gates access with biometrics.
- **Mechanism:** Put secrets in Keychain (iOS) / KeyStore-backed storage (Android) with the right accessibility class and a retention/purge rule; encrypt sensitive data at rest with the key in the keystore/secure enclave. Pin the SPKI public-key hash (not the leaf cert), carry a backup pin, and keep a remote relax/disable path. Treat biometrics as a local unlock of a keystore key with a passcode fallback, bound to a real key operation.
- **Do not use when:** The data is non-sensitive and public — over-encrypting trivial data adds complexity with no threat reduced; spend the effort where the threat is.
- **Failure repair:** If secrets are in `UserDefaults`/`SharedPreferences` or a plain file, move them to the keystore and rotate the exposed secret; if pinning is a single leaf cert, switch to SPKI + backup pin + remote relax.

### 6. Native-vs-cross-platform decision

- **Trigger:** A team is choosing the stack for a new app or screen, or is tempted to pick by familiarity/resume rather than requirement.
- **Mechanism:** Score the requirement, not preference. Identify hard native dependencies (a specific sensor, AR/ML on-device, a platform-exclusive API, a tight performance/latency floor, deep OS integration) — any hard native need pulls toward native or a native module. Weigh cross-platform reuse against the cost of bridging and the performance ceiling, the team's existing skills and ability to maintain the chosen stack long-term, the release velocity needed, and the long-term maintenance/upgrade burden. Name which side the requirement is on, and where a hybrid (cross-platform shell with native modules for the hard parts) is the honest answer.
- **Do not use when:** The org already runs a healthy, well-staffed stack and the new work fits it — adding it there is the right-sized choice, not a fresh decision to re-litigate.
- **Failure repair:** If the stack was chosen by familiarity or resume, re-run the decision against the actual requirement, and propose a native module for the one hard dependency rather than rewriting the whole app.

## Հայերեն

Սրանք canonical բջջային ճարտարագիտության move-եր են։ Ամեն մեկը mechanism է ոլորտի deliverable-ներից մեկի համար (mobile architecture plan, offline-sync design, performance-triage report, release/rollout plan, native-vs-cross-platform որոշում)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։

### 1. Offline sync contract

- **Երբ է պետք․** User-ը աշխատում է ընդհատվող կամ բացակա network-ով, կամ եղած «offline cache»-ը truth, կարգ կամ conflict rule չունի։
- **Մեխանիզմը․** Սահմանիր local truth (device-ի store), server truth (authority), intent-ների ordered operation log, idempotency key՝ ամեն operation-ի, data risk-ին համապատասխան conflict policy (last-write-wins միայն low-value single-owner field-երին. server authority / field-level merge / manual resolution՝ collaborative կամ money/inventory data-ին), retry՝ backoff-ով, և user-տեսանելի queued/synced/conflict status։ Test արա airplane mode, duplicate submit և stale-edit conflict։
- **Երբ չօգտագործել․** Երբ data-ն device-ի վրա երբեք չպետք է լինի (regulated/secret-only) — ապա պահիր այն server-only և նախագծիր graceful degradation offline-ի համար, ոչ local persistence։
- **Ուղղում․** Եթե conflict policy-ն «հուսանք» է, block արա launch-ը. ավելացրու operation log-ը, idempotency key-երը և բացահայտ conflict rule-ը մինչև ship-ը։

### 2. Main-thread jank / ANR hunt

- **Երբ է պետք․** UI-ը slow է զգացվում, animation-ները load-ի տակ կակազում են, կամ ANR/watchdog report-եր են հայտնվում։
- **Մեխանիզմը․** Profile արա cold start, main-thread work, p95 frame time՝ ~16ms budget-ի դեմ, image decode, layout pass և network waterfall — representative device-ի վրա, ոչ flagship-ի։ JSON parse-ը, image decode-ը և disk/DB I/O-ն հանիր main thread-ից. cache արա decode-ված image-ները. batch արա network call-երը։ Տարբերակիր cosmetic stutter-ը main-thread block-ից, որ ANR/kill risk է։
- **Երբ չօգտագործել․** Երբ symptom-ը backend/network latency-ի խնդիր է, ոչ on-device work — նախ չափիր network leg-ը. background thread-ը դանդաղ server չի ուղղի։
- **Ուղղում․** Եթե միայն flagship device է չափվել, performance evidence-ը բարակ է — վերաչափիր mid/low tier-ի վրա, որ user-ների մեծ մասն ունի, և կառուցիր device-tier matrix։

### 3. Staged release gate

- **Երբ է պետք․** Mobile release-ը migration, behavior կամ compatibility risk ունի և չի կարող ակնթարթ հետ կանչվել։
- **Մեխանիզմը․** Risky behavior-ը դիր feature flag / remote config-ի հետևում. roll out արա staged percentage-ով (օր.՝ 1% → 5% → 20% → 50% → 100%)՝ gated crash-free session-ի և ANR rate-ի վրա. պահիր remote kill switch, որ անջատում է risky path-ը առանց store submission-ի. համոզվիր, որ migration-ները forward-safe են և, որտեղ հնարավոր է, հետշրջելի։
- **Երբ չօգտագործել․** Երբ դա emergency security patch է, որ պետք է հասնի բոլոր user-ներին միանգամից — ապա ship արա լայն, բայց risky նոր code-ը դեռ պահիր flag-ի հետևում, որ remote-ով անջատվի։
- **Ուղղում․** Եթե միակ rollback path-ը store review-ով նոր build է, code-ը հետշրջելի չէ — դարձրու risky path-ը flaggable և ավելացրու remote disable մինչև release-ը։

### 4. Process-death lifecycle plan

- **Երբ է պետք․** State-ը կամ navigation-ը կոտրվում է app-switch-ին, low memory-ին, կամ այն բանից հետո, երբ OS-ը սպանում է background app-ը — bug-եր, որ արագ device-ի happy path-ը երբեք չի բացահայտում։
- **Մեխանիզմը․** Հստակեցրու save boundary-ն (background-ի անցնելիս, draft-ի ամեն իմաստալից field-ի փոփոխությանը) և state-ը պահպանիր այնտեղ։ Restore արա screen-ը saved state-ից կամ deep link-ից, երբեք in-memory state-ից։ Դարձրու navigation-ը re-entrant․ deep link-ը կամ process-death restart-ը պետք է վերակառուցի նույն screen-ը նույն data-ով։ Ավելացրու բացահայտ test-եր app-switch-ի, process death-ի, low memory-ի և network loss-ի համար։
- **Երբ չօգտագործել․** Երբ state-ը իսկապես ephemeral է և էժան՝ վերահաշվելու (անցողիկ animation, spinner) — այն պահպանելը ավելորդ բարդություն է։
- **Ուղղում․** Եթե state-ը ապրում է միայն memory-ում, տեղափոխիր save boundary և ավելացրու process-death restore test. assert արա, որ screen-ը վերակառուցվում է, մի՛ վստահիր happy path-ին։

### 5. Mobile secure-storage & pinning gate

- **Երբ է պետք․** App-ը token/PII/key է պահում device-ի վրա, կամ պետք է transport-ը պաշտպանի interception-ից, կամ access-ը gate է անում biometric-ով։
- **Մեխանիզմը․** Secret-ները դիր Keychain (iOS) / KeyStore-ապահովված storage (Android)՝ ճիշտ accessibility class-ով և retention/purge rule-ով. encrypt արա sensitive data-ն at-rest՝ key-ը keystore/secure enclave-ում։ Pin արա SPKI public-key hash-ը (ոչ leaf cert-ը), կրիր backup pin, և պահիր remote relax/disable path։ Համարիր biometric-ը keystore key-ի local unlock passcode fallback-ով՝ կապված իրական key operation-ի հետ։
- **Երբ չօգտագործել․** Երբ data-ն ոչ-sensitive է և public — չնչին data-ի over-encrypt-ը բարդություն է ավելացնում առանց threat նվազեցնելու. ծախսիր ջանքը այնտեղ, որտեղ threat-ը կա։
- **Ուղղում․** Եթե secret-ները `UserDefaults`/`SharedPreferences`-ում կամ plain ֆայլում են, տեղափոխիր keystore և rotate արա exposed secret-ը. եթե pinning-ը մեկ leaf cert է, անցիր SPKI + backup pin + remote relax-ի։

### 6. Native-vs-cross-platform որոշում

- **Երբ է պետք․** Թիմը stack է ընտրում նոր app-ի կամ screen-ի համար, կամ գայթակղվում է ընտրել ծանոթությամբ/resume-ով, ոչ թե պահանջով։
- **Մեխանիզմը․** Գնահատիր պահանջը, ոչ նախապատվությունը։ Հստակեցրու կոշտ native dependency-ները (կոնկրետ sensor, on-device AR/ML, platform-exclusive API, խիստ performance/latency floor, խորը OS integration) — ցանկացած կոշտ native կարիք քաշում է դեպի native կամ native module։ Կշռիր cross-platform reuse-ը bridging-ի ծախսի և performance ceiling-ի դեմ, թիմի եղած skill-ների և ընտրած stack-ը երկար ժամկետ maintain անելու կարողության, անհրաժեշտ release velocity-ի, և երկար ժամկետ maintenance/upgrade բեռի դեմ։ Անվանի՛ր, թե պահանջը որ կողմում է, և որտեղ է hybrid-ը (cross-platform shell՝ կոշտ մասերի համար native module-ով) ազնիվ պատասխանը։
- **Երբ չօգտագործել․** Երբ org-ն արդեն վարում է առողջ, լավ համալրված stack, և նոր work-ը տեղավորվում է դրա մեջ — այնտեղ ավելացնելը right-sized ընտրություն է, ոչ նոր որոշում՝ կրկին վիճարկելու։
- **Ուղղում․** Եթե stack-ը ընտրվել է ծանոթությամբ կամ resume-ով, վերագործարկիր որոշումը իրական պահանջի դեմ, և առաջարկիր native module մեկ կոշտ dependency-ի համար՝ ամբողջ app-ը վերագրելու փոխարեն։
