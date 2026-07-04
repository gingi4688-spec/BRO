# Mobile Engineering eval prompts

## English

Run these after changes. Each prompt has its own pass check — passing requires mechanism-level reasoning and a concrete artifact, not vocabulary. Do not reuse one check for another prompt.

1. **Offline-sync design.** "Users edit records offline and sync later — design it." — Pass only if it gives a local store, an ordered operation log with **idempotency keys**, a conflict policy fit to data risk (LWW only for low-value fields; server authority/merge/manual for high-value), retry/backoff, and a visible queued/synced/conflict status — not a "cache."
2. **Performance triage (16ms budget).** "The feed feels janky." — Pass only if it reasons against the ~16ms/60fps frame budget, names main-thread offenders (image decode / JSON parse / layout / I/O), moves them off the main thread, and measures p95 frame time on a representative device.
3. **Crash on old phones (memory).** "It crashes on older phones." — Pass only if it identifies a memory cause (full-res images, ignored memory-pressure callback) and prescribes downsampling, releasing off-screen images, honoring `onTrimMemory`/`didReceiveMemoryWarning`, and a leak-tool check for a retain cycle / Context leak.
4. **Mobile security / secure storage.** "Where do we store the auth token and protect the API connection?" — Pass only if it puts the token in Keychain/KeyStore with at-rest encryption and a retention rule, uses SPKI public-key pinning with a backup pin and a remote relax path, and treats biometrics as a key-gate with a passcode fallback — not the credential.
5. **Lifecycle / process death.** "The app loses the user's in-progress form sometimes." — Pass only if it names process death, persists at a save boundary, restores from saved state/deep link (not in-memory), and adds app-switch / low-memory / process-death tests.
6. **Server API compatibility.** "Backend wants to change the response shape — fine?" — Pass only if it checks the oldest installed client, requires backward-compatibility (expand/contract) or a forced-upgrade gate, and refuses to silently break N-2 because "they'll update."
7. **Release / phased rollout.** "We're shipping a risky migration to the app." — Pass only if it puts the risky path behind a flag, uses a staged percentage gated on crash-free/ANR, and keeps a remote kill switch — and notes that store rollback is slow.
8. **Native vs cross-platform.** "Should we build native or cross-platform?" — Pass only if it decides by requirement (hard native dependencies, performance floor, team skill, velocity, maintenance), not familiarity, and proposes a native module / hybrid where one hard dependency justifies it.
9. **Localization & RTL.** "Add Arabic and German support." — Pass only if it externalizes strings, uses locale-aware dates/numbers/plurals, mirrors layout for RTL (leading/trailing), allows text expansion, and runs a pseudo-locale test — not a late translation pass.
10. **Armenian equal-depth.** Ask any of prompts 1–9 in Armenian. — Pass only if the Armenian is native, equal-depth (same mechanism, same artifact, same specifics), and punctuation-clean (correct `․`/`։`/«», no homoglyphs); English tech tokens (Keychain, ANR, SPKI, idempotency) are fine.

Regression checks (run alongside):

- **No invented facts.** Ask for a specific device's RAM, a named benchmark score, or an exact frame number. — Pass only if it refuses to invent it or marks it verify-before-use with a formula/placeholder (e.g. derives 16.7ms from 1000/60, but does not fabricate a device's spec).
- **No thin framework-name answer.** Ask "just tell me mobile best practices." — Pass only if it expands into mechanism, a budget/threshold, or a worked micro-example, not a list of labels.
- **Verify on real hardware.** Ask "it passes in the simulator — are we done?" — Pass only if it says the simulator hides memory/thermal/flash/secure-enclave/biometric behavior and requires a real (low/mid-tier) device run before done.

## Հայերեն

Գործարկիր սրանք փոփոխություններից հետո։ Ամեն prompt ունի իր pass check-ը — անցնելը պահանջում է mechanism-level reasoning և concrete artifact, ոչ vocabulary։ Մի՛ կիրառիր մի check-ը մյուս prompt-ի համար։

1. **Offline-sync design.** «User-ները offline են edit անում record-ները և ավելի ուշ sync — նախագծիր այն»։ — Անցնում է միայն, եթե տալիս է local store, ordered operation log՝ **idempotency key**-երով, data risk-ին համապատասխան conflict policy (LWW միայն low-value field-երին. server authority/merge/manual՝ high-value-ին), retry/backoff և տեսանելի queued/synced/conflict status — ոչ «cache»։
2. **Performance triage (16ms budget).** «Feed-ը janky է զգացվում»։ — Անցնում է միայն, եթե դատում է ~16ms/60fps frame budget-ի դեմ, անվանում է main-thread մեղավորները (image decode / JSON parse / layout / I/O), հանում դրանք main thread-ից, և չափում p95 frame time-ը representative device-ի վրա։
3. **Crash հին հեռախոսների վրա (memory).** «Հին հեռախոսների վրա crash է լինում»։ — Անցնում է միայն, եթե հստակեցնում է memory cause (full-res image, անտեսված memory-pressure callback) և նշանակում downsampling, off-screen image-ների ազատում, `onTrimMemory`/`didReceiveMemoryWarning`-ի հարգում, և leak-tool ստուգում retain cycle / Context leak-ի համար։
4. **Մոբայլ security / secure storage.** «Որտեղ ենք պահում auth token-ը և պաշտպանում API connection-ը»։ — Անցնում է միայն, եթե token-ը դնում է Keychain/KeyStore-ում at-rest encryption-ով և retention rule-ով, օգտագործում SPKI public-key pinning՝ backup pin-ով և remote relax path-ով, և համարում biometric-ը key-gate passcode fallback-ով — ոչ credential-ը։
5. **Lifecycle / process death.** «App-ը երբեմն կորցնում է user-ի ընթացքի մեջ form-ը»։ — Անցնում է միայն, եթե անվանում է process death-ը, պահպանում save boundary-ում, restore է անում saved state/deep link-ից (ոչ in-memory), և ավելացնում app-switch / low-memory / process-death test-եր։
6. **Server API compatibility.** «Backend-ը ուզում է response shape-ը փոխել — նորմա՞լ է»։ — Անցնում է միայն, եթե ստուգում է ամենահին տեղադրված client-ը, պահանջում backward-compatibility (expand/contract) կամ forced-upgrade gate, և հրաժարվում լուռ կոտրել N-2-ը՝ «նրանք կ-update անեն»-ի պատճառով։
7. **Release / phased rollout.** «App-ին risky migration ենք ship անում»։ — Անցնում է միայն, եթե risky path-ը դնում է flag-ի հետևում, օգտագործում staged percentage՝ gated crash-free/ANR-ի վրա, և պահում remote kill switch — և նշում, որ store rollback-ը դանդաղ է։
8. **Native ընդդեմ cross-platform.** «Native, թե cross-platform կառուցենք»։ — Անցնում է միայն, եթե որոշում է պահանջով (կոշտ native dependency, performance floor, team skill, velocity, maintenance), ոչ ծանոթությամբ, և առաջարկում native module / hybrid, որտեղ մեկ կոշտ dependency-ն արդարացնում է։
9. **Localization & RTL.** «Ավելացրու արաբերեն և գերմաներեն support»։ — Անցնում է միայն, եթե externalize է անում string-երը, օգտագործում locale-aware date/number/plural, mirror է անում layout-ը RTL-ի համար (leading/trailing), տեղ տալիս text expansion-ի, և գործարկում pseudo-locale test — ոչ ուշ translation pass։
10. **Հայերեն equal-depth.** Հարցրու 1–9-ից որևէ մեկը հայերեն։ — Անցնում է միայն, եթե հայերենը native է, equal-depth (նույն mechanism-ը, նույն artifact-ը, նույն specifics-ը) և punctuation-clean (ճիշտ `․`/`։`/«», առանց homoglyph-ի). անգլերեն tech token-ները (Keychain, ANR, SPKI, idempotency) նորմալ են։

Regression check-եր (գործարկիր կողքից)․

- **Ոչ մի հորինված fact.** Հարցրու կոնկրետ device-ի RAM-ը, named benchmark score կամ ճշգրիտ frame number։ — Անցնում է միայն, եթե հրաժարվում է հորինելուց կամ նշում verify-before-use՝ formula/placeholder-ով (օր.՝ 16.7ms-ը բխեցնում է 1000/60-ից, բայց device-ի spec չի հորինում)։
- **Ոչ բարակ framework-name պատասխան.** Հարցրու «պարզապես ասա մոբայլ best practice-ները»։ — Անցնում է միայն, եթե դառնում է mechanism, budget/threshold կամ worked micro-example, ոչ label-ների ցուցակ։
- **Verify իրական hardware-ի վրա.** Հարցրու «simulator-ում անցնում է — done ե՞նք»։ — Անցնում է միայն, եթե ասում է, որ simulator-ը թաքցնում է memory/thermal/flash/secure-enclave/biometric վարքը և պահանջում իրական (low/mid-tier) device-ի run մինչև done-ը։
