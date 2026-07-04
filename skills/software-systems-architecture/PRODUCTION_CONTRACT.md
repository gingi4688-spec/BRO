# software-systems-architecture — PRODUCTION CONTRACT / PRODUCTION CONTRACT

> **STATUS: DECLARED — proof slice 2 (Code) PENDING.** This contract is written from the template, but the Code adapter has NOT yet been proven on a real change (the second vertical slice). Per §8 and L18, it stays DECLARED until a real code change reaches runtime GREEN (tests+typecheck+lint+build). It must NOT be cited as PROVEN, and the Universal Core must NOT be "extracted" until this slice exists.
>
> **ԿԱՐԳԱՎԻՃԱԿ՝ ՀԱՅՏԱՐԱՐՎԱԾ — proof slice 2 (Code) ՍՊԱՍՈՒՄ Է։** Contract-ը գրված է template-ից, բայց Code adapter-ը ԴԵՌ ապացուցված չէ իրական change-ով։ §8 + L18-ով՝ մնում է DECLARED մինչ իրական code change-ը runtime GREEN հասնի։ ՉԻ ցիտվում որպես PROVEN, ու Universal Core-ը ՉԻ «extract» արվում մինչ այս slice-ը գա։

## The 10 answers (declared) / 10 պատասխանը (հայտարարված)

1. **Artifacts** — code changes, ADRs, service-boundary maps, integration/saga designs, API/event contracts, resilience plans. / code change, ADR, boundary map, contract, resilience plan։
2. **Inputs** — the change intent · the affected system · constraints · existing tests. / change intent · system · constraint · test-եր։
3. **Evidence** — the actual diff + passing tests + typecheck + lint + build + a known-limits note. / diff + test + typecheck + lint + build + known-limits։
4. **Verification gate** — `tsc`/compiler + test suite + lint + build; for design artifacts, a review against stated criteria + trade-off record.
5. **GREEN** — tests pass + typecheck + lint + build + diff summary + no unrelated changes + rollback noted (independent run, L18).
6. **YELLOW** — builds but a required check missing/blocked, or design lacks a trade-off record (named).
7. **RED** — tests/typecheck/build fail · unrelated changes rode along · GREEN claimed without a run.
8. **Approval-required (D0)** — push · migrate · release · lock architecture · touching prod. Gev-gated.
9. **Refusal / boundary** — no "should pass" as proof · no scope creep in a fix · no silent breaking change.
10. **Eval cases** — TO BE FILLED by the Code proof slice (a real change: red→green with tests). Until then, examples are DECLARED, not run.

## Why DECLARED matters here / Ինչու է DECLARED-ը կարևոր

The whole architecture (§8) earns the word "universal" only from **two** proven adapters (UI + Code). Shipping this as PROVEN off zero runs would be the exact fake-GREEN that L16/L18 forbid — and the empty-abstraction trap the intake warns against three times. Honest label now; PROVEN after the Code slice runs. / «Universal»-ը վաստակվում է 2 ապացուցված adapter-ից։ Սա PROVEN թողարկելը զրո run-ով հենց fake-GREEN-ն է, որ L16/L18 արգելում են։ Ազնիվ պիտակ հիմա. PROVEN՝ Code slice-ից հետո։
