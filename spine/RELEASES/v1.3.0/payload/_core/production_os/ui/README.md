# production_os / ui — UI ADAPTER KIT / UI ADAPTER KIT

> **EN:** The UI adapter for the production engine. This is the **first proven adapter** (§8): it was validated end-to-end on a real Next.js list-detail slice, not described on paper. The kit is the token system + component contracts + page-template specs + the verification recipe that were actually exercised to reach runtime GREEN.
>
> **HY:** production engine-ի UI adapter-ը։ Սա **առաջին ապացուցված adapter-ն է** (§8)՝ validate արած end-to-end իրական Next.js list-detail slice-ով, ոչ թղթի վրա։ Kit-ը token system + component contract + page-template spec + verification recipe է, որ իրապես վազեցվեց runtime GREEN հասնելու։

## Status / Կարգավիճակ (L15/L18)

**UI adapter = PROVEN.** Proof: neutral-CRM list-detail page rendered in a running Next.js 16 app · 6 states · viewports 375/768/1024/1440 · keyboard operable · axe 0 serious/critical · controlled failure caught→repaired→re-verified · 10 screenshots · Playwright 23/23. Independent evidence: [`memory/_evidence/EVIDENCE_LEDGER.md`](../../../memory/_evidence/EVIDENCE_LEDGER.md), [`memory/_failures/FAILURE_LEDGER.md`](../../../memory/_failures/FAILURE_LEDGER.md).

## Contents / Բովանդակություն

- [`design-tokens/`](design-tokens/README.md) — the token system (single source; L13 zero-hardcode).
- [`component-kit/`](component-kit/README.md) — the components + their required state sets.
- [`page-templates/`](page-templates/list-detail.md) — buildable page-template specs (list-detail proven; others declared).
- [`verification/`](verification/UI_VERIFICATION_CHECKLIST.md) — the wired GREEN recipe (states · viewports · keyboard · a11y · screenshots · controlled-failure).

## Stack / Stack

Next.js (App Router) + React + TypeScript + Tailwind v4 + shadcn/ui (Base UI). The Executor **assembles** from tokens + kit + template and **verifies** — it never "describes" a page (L18). / Executor-ը **հավաքում** է token+kit+template-ից ու **verify** անում, երբեք չի «նկարագրում» էջը (L18)։

## Taste (Mode A → B) / Ճաշակ (Mode A → B)

Mode A professional baseline is live now. Mode B (Gev-taste-tuned) engages when the labeled examples in [`self/gev_standard/`](../../../self/gev_standard/README.md) exist; the 3 levels (Wow · Convert · Product-UX) and the 18-point study-not-copy rubric sharpen tokens/components/templates. Level 3 (app screens — the original pain) is sourced from Mobbin/Pageflows/real product screens, not landing galleries. Taste sits ON TOP of — never replaces — the evidence floors. / Mode A հիմա live է. Mode B՝ երբ labeled օրինակները կան. ճաշակը evidence-հատակների ՎՐԱՅՈՎ է, ոչ փոխարեն։
