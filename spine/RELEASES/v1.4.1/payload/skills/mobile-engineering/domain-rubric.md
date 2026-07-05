# Mobile Engineering domain rubric

## English

Use this rubric before finalizing a mobile architecture plan, offline-sync design, performance-triage report, release/rollout plan, or native-vs-cross-platform decision. A score of 5 requires the mechanism, on-device evidence, and a checkable domain artifact — not vocabulary.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Lifecycle handling | Happy path only. | Some state restore. | Pause/resume/process-death/deep-link/network-loss states are designed and tested; restoration is from saved state/deep link, not in-memory. |
| Sync correctness | Last-write-wins everywhere. | A queue exists. | Local store, ordered operation log, idempotency keys, authority, conflict policy, and a visible synced/conflict status all fit the data risk. |
| Performance & memory | "Feels fast" claim. | Some metrics on one device. | Cold start, p95 frame time vs ~16ms, memory, and battery measured across a device tier; no main-thread heavy work; retain cycles / Context leaks / memory-pressure handled. |
| Release & compatibility | All-at-once release; old clients ignored. | Staged rollout mentioned. | Flags, staged percentage, crash/ANR guardrails, remote kill switch, store constraints, and oldest-installed-client/API compatibility are all planned. |
| Platform & security fit | Native/cross-platform by taste; secrets in the clear. | Tradeoff named; some secure storage. | Stack chosen by requirement (native need, performance, velocity, maintenance); Keychain/KeyStore + at-rest encryption, SPKI pinning + backup, biometric-gates-a-key are correct. |

## Հայերեն

Այս rubric-ը կիրառիր mobile architecture plan, offline-sync design, performance-triage report, release/rollout plan կամ native-vs-cross-platform որոշումը վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, on-device evidence և domain-ին հատուկ ստուգելի artifact — ոչ vocabulary։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Lifecycle handling | Միայն happy path է։ | Որոշ state restore կա։ | Pause/resume/process-death/deep-link/network-loss վիճակները նախագծված և test-ված են. restoration-ը saved state/deep link-ից է, ոչ in-memory։ |
| Sync correctness | Last-write-wins է ամեն տեղ։ | Queue կա։ | Local store, ordered operation log, idempotency key, authority, conflict policy և տեսանելի synced/conflict status-ը՝ բոլորը data risk-ին համապատասխան։ |
| Performance & memory | «Feels fast» claim է։ | Որոշ metric մեկ device-ի վրա։ | Cold start, p95 frame time ընդդեմ ~16ms-ի, memory և battery՝ չափված device tier-ով. main thread-ի վրա heavy work չկա. retain cycle / Context leak / memory-pressure-ը handle-ված։ |
| Release & compatibility | All-at-once release է. հին client-ները անտեսված։ | Staged rollout նշված է։ | Flag, staged percentage, crash/ANR guardrail, remote kill switch, store constraint և oldest-installed-client/API compatibility՝ բոլորը պլանավորված։ |
| Platform & security fit | Native/cross-platform-ը taste է. secret-ները clear-ով։ | Tradeoff նշված է. որոշ secure storage։ | Stack-ը ընտրված է պահանջով (native need, performance, velocity, maintenance). Keychain/KeyStore + at-rest encryption, SPKI pinning + backup, biometric-gate-է-key-ը՝ ճիշտ։ |
