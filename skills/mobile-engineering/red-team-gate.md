# Mobile Engineering red-team gate

## English

This gate extends the skill's final gate for the domain's deliverables (mobile architecture plan, offline-sync design, performance-triage report, release/rollout plan, native-vs-cross-platform decision). It extends but never replaces the safety boundaries in `SKILL.md` and `../shared/OPERATING_PROTOCOL.md`.

### Domain failure cases (must be caught)

- **Sensitive data stored in the clear** — do not approve tokens/PII in `UserDefaults`/`SharedPreferences` or a plain file; require Keychain/KeyStore + at-rest encryption + a retention rule.
- **Leaf-cert pinning with no backup / no relax path** — do not approve a single pinned leaf cert; require SPKI public-key pinning, a backup pin, and a remote relax/kill path.
- **Biometric used as the credential** — do not approve a bare biometric yes/no; require it to gate a Keychain/KeyStore key operation with a passcode fallback.
- **Last-write-wins on collaborative or money/inventory data** — do not approve LWW where data is high-value; require server authority / field-level merge / manual resolution.
- **Offline "cache" with no operation log or idempotency** — do not approve a cache as offline; require an ordered operation log, idempotency keys, a conflict policy, and a status UI.
- **Server-contract change with no oldest-client check** — do not approve a breaking change with installed clients in the field; require backward-compatibility or a forced-upgrade gate.
- **Big-bang release with no kill switch** — do not approve a risky change shipped to 100% with only a store rebuild as rollback; require staged % + crash/ANR guardrails + remote kill switch.
- **Heavy work on the main thread** — do not approve JSON parse / image decode / disk I/O on the UI thread; it is a jank/ANR risk.
- **Performance "verified" on a flagship or the simulator** — do not accept metrics from one high-end device or the simulator; require a real low/mid-tier device.
- **Memory-pressure callback ignored / a known retain cycle / Context leak** — do not approve; require handling the pressure callback and a leak-tool confirmation.

### Reviewer probes (ask these of any answer)

- For offline: where is the operation log and the idempotency key, and what stops a flaky-network retry from double-submitting? What is the conflict policy for the highest-value data, and is it last-write-wins?
- For lifecycle: what is the save boundary, and does the screen restore from saved state / a deep link after a process-death kill — or only from in-memory happy path?
- For performance: what is the p95 frame time against the ~16ms budget, on which device tier was it measured (a flagship or the low tier users carry), and what heavy work is on the main thread?
- For the crash on old phones: is it a memory problem (full-res images, ignored `onTrimMemory`/`didReceiveMemoryWarning`), and is there a retain cycle / Context leak confirmed with a leak tool?
- For security: are secrets in Keychain/KeyStore with at-rest encryption and a retention rule, is pinning SPKI with a backup pin and a remote relax path, and does the biometric gate a real key operation with a fallback?
- For compatibility: what is the oldest installed client, and is the server-contract change backward-compatible or gated — or will it silently break N-2?
- For release: is there a staged percentage with crash-free/ANR halt thresholds and a remote kill switch, or is the only rollback a store rebuild?
- For native-vs-cross-platform: which hard native dependency (if any) forces the choice, or was the stack picked by the team's familiarity / resume?
- For localization/RTL: are strings externalized, dates/plurals locale-aware, and does the layout mirror for RTL — or is it a late translation pass that will break?
- Does the answer rely on the simulator, or does it name the real-device run that confirms memory, thermal, biometric, and pinning behavior? Did it invent any benchmark, device spec, or price, and is the Armenian equal-depth and punctuation-clean?

## Հայերեն

Այս gate-ը ընդլայնում է skill-ի final gate-ը ոլորտի deliverable-ների համար (mobile architecture plan, offline-sync design, performance-triage report, release/rollout plan, native-vs-cross-platform որոշում)։ Այն ընդլայնում, բայց երբեք չի փոխարինում `SKILL.md`-ի և `../shared/OPERATING_PROTOCOL.md`-ի անվտանգության սահմանները։

### Ոլորտային failure case-եր (պետք է բռնվեն)

- **Sensitive data՝ պահված clear-ով** — մի՛ approve արա token/PII՝ `UserDefaults`/`SharedPreferences`-ում կամ plain ֆայլում. պահանջիր Keychain/KeyStore + at-rest encryption + retention rule։
- **Leaf-cert pinning՝ առանց backup-ի / relax path-ի** — մի՛ approve արա մեկ pinned leaf cert. պահանջիր SPKI public-key pinning, backup pin և remote relax/kill path։
- **Biometric-ը՝ որպես credential** — մի՛ approve արա մերկ biometric yes/no. պահանջիր, որ այն gate անի Keychain/KeyStore key operation passcode fallback-ով։
- **Last-write-wins collaborative կամ money/inventory data-ի վրա** — մի՛ approve արա LWW, որտեղ data-ն high-value է. պահանջիր server authority / field-level merge / manual resolution։
- **Offline «cache»՝ առանց operation log-ի կամ idempotency-ի** — մի՛ approve արա cache-ը որպես offline. պահանջիր ordered operation log, idempotency key, conflict policy և status UI։
- **Server-contract փոփոխություն՝ առանց oldest-client ստուգման** — մի՛ approve արա breaking change դաշտում տեղադրված client-ներով. պահանջիր backward-compatibility կամ forced-upgrade gate։
- **Big-bang release՝ առանց kill switch-ի** — մի՛ approve արա risky change ship-ված 100%-ին միայն store rebuild-ով որպես rollback. պահանջիր staged % + crash/ANR guardrail + remote kill switch։
- **Heavy work main thread-ի վրա** — մի՛ approve արա JSON parse / image decode / disk I/O UI thread-ի վրա. դա jank/ANR risk է։
- **Performance՝ «verified» flagship-ի կամ simulator-ի վրա** — մի՛ ընդունիր metric մեկ high-end device-ից կամ simulator-ից. պահանջիր իրական low/mid-tier device։
- **Memory-pressure callback-ը անտեսված / հայտնի retain cycle / Context leak** — մի՛ approve արա. պահանջիր pressure callback-ի handle և leak-tool հաստատում։

### Reviewer-ի probe-եր (հարցրու ամեն պատասխանին)

- Offline-ի համար․ որտեղ է operation log-ը և idempotency key-ը, և ինչն է կանգնեցնում անկայուն-network retry-ի double-submit-ը։ Ինչ է conflict policy-ն ամենա-high-value data-ի համար, և last-write-wins է՞։
- Lifecycle-ի համար․ ինչ է save boundary-ն, և screen-ը restore է լինո՞ւմ saved state-ից / deep link-ից process-death kill-ից հետո — թե միայն in-memory happy path-ից։
- Performance-ի համար․ ինչ է p95 frame time-ը ~16ms budget-ի դեմ, որ device tier-ի վրա է չափվել (flagship, թե low tier, որ user-ները կրում են), և ինչ heavy work է main thread-ի վրա։
- Հին հեռախոսի crash-ի համար․ memory-ի խնդիր է՞ (full-res image, անտեսված `onTrimMemory`/`didReceiveMemoryWarning`), և կա՞ retain cycle / Context leak՝ հաստատված leak tool-ով։
- Security-ի համար․ secret-ները Keychain/KeyStore-ում են՞ at-rest encryption-ով և retention rule-ով, pinning-ը SPKI է՞ backup pin-ով և remote relax path-ով, և biometric-ը gate է անո՞ւմ իրական key operation fallback-ով։
- Compatibility-ի համար․ ինչ է ամենահին տեղադրված client-ը, և server-contract փոփոխությունը backward-compatible է՞ կամ gated — թե լուռ կկոտրի N-2-ը։
- Release-ի համար․ կա՞ staged percentage՝ crash-free/ANR halt threshold-ով և remote kill switch-ով, թե միակ rollback-ը store rebuild է։
- Native-vs-cross-platform-ի համար․ որ կոշտ native dependency-ն (եթե կա) ստիպում է ընտրությունը, թե stack-ը ընտրվել է թիմի ծանոթությամբ / resume-ով։
- Localization/RTL-ի համար․ string-երը externalized են՞, date/plural-ը locale-aware, և layout-ը mirror է լինո՞ւմ RTL-ի համար — թե ուշ translation pass է, որ կկոտրվի։
- Պատասխանը հենվու՞մ է simulator-ի վրա, թե անվանում է իրական-device run-ը, որ հաստատում է memory, thermal, biometric և pinning վարքը։ Հորինե՞ց benchmark, device spec կամ price, և հայերենը equal-depth ու punctuation-clean է՞։
