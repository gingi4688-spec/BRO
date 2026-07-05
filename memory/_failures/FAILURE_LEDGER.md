# FAILURE LEDGER / ՁԱԽՈՂՈՒՄՆԵՐԻ ՄԱՏՅԱՆ

> **EN:** Append-only record of real failures the Verifier caught, and how the Repairer fixed them (L16). Failure is memory, not shame — each entry makes the next build safer. **HY:** Verifier-ի բռնած իրական ձախողումների ու Repairer-ի ուղղումների append-only գրառում (L16)։ Ձախողումը հիշողություն է, ոչ ամոթ։

## FL-001 — Drawer does not close on Escape (CONTROLLED)
- **What failed:** Escape did not close the customer detail drawer.
- **Why:** planted defect — `CONTROLLED_DEFECT_ESC_NOOP=true` swallowed the Base UI `escape-key` close reason (X-button + backdrop still worked).
- **Gate that caught it:** Verifier — Playwright `drawer closes on Escape` timed out on run #1.
- **Fix:** flip the flag to `false`; `handleOpenChange` honors every close reason.
- **Re-verification:** run #2 — test PASSED; focus-restore still passes.
- **Date:** 2026-07-05.

## FL-002 — "Churned" status badge fails WCAG AA contrast (REAL / unplanned)
- **What failed:** axe `color-contrast` (serious) on the destructive badge, 3 states.
- **Why:** kit's soft destructive badge = `#e7000b` on `#fde6e7` = **4.0:1** at 12px (< AA 4.5:1).
- **Gate that caught it:** Verifier — axe dumps `axe/{populated,permission-denied,drawer-open}.json`.
- **Fix:** solid destructive fill — white on `--destructive` = **4.77:1** ≥ AA; semantic red preserved.
- **Re-verification:** run #2 — all 5 axe checks pass, dumps empty `[]`.
- **Date:** 2026-07-05.

## FL-003 — beast-check false-RED on its own secret heuristic (REAL / unplanned)
- **What failed:** pre-push `bro-beast-check` reported `secret-files=1` on a clean install.
- **Why:** the secret heuristic matched the bare word `verifier`, catching the legitimate `_core/production_os/06_VERIFIER.md` role doc — a false-RED; no actual secret was in the diff (confirmed: 0 `secrets/`, keys, `.env`, `bro.home.json`).
- **Gate that caught it:** the beast-check itself, during Phase-H verify BEFORE any push — the verify step caught a defect in the verify tooling.
- **Fix:** precise secret pattern — `bro.home.json` + `secrets/` path + `verifier.<secret-ext>` + key material + `.env`; dropped the over-broad bare `verifier`. (`tools/bro-beast-check.ps1`)
- **Re-verification:** `secret-files=0`.
- **Date:** 2026-07-05.

## FL-004 — spine v1.2.0 release failed self-verify + beast-check hid it (REAL / unplanned)
- **What failed:** after Phase-1 push, `bro-spine-verify v1.2.0` = **REJECTED (426/428)**; 2 files mismatched: `skills/business-strategy-operations/SKILL.md` and `…/agents/claude.md`.
- **Why:** those 2 files carried **CRLF**; `bro-release` hashed them CRLF at cut time (VERIFIED 428/428 then), but `git commit` normalized them **CRLF→LF**, so the committed/checked-out payload no longer matched the manifest's CRLF hashes. Content identical — a line-ending/hash-bookkeeping break, not corruption.
- **Second defect (why it wasn't caught pre-push):** `bro-beast-check.ps1` verified a **hardcoded `spine/RELEASES/v1.1.0`**, never the new release → its GREEN 25/25 never looked at v1.2.0. A false-GREEN on the release dimension.
- **Gate that caught it:** the independent `bro-spine-verify v1.2.0` in post-push verification (NOT beast-check). Honest stop at YELLOW; did NOT proceed to seeding.
- **Fix (GO-RECOVER-v1.2.0):** (1) added root `.gitattributes` (`* text=auto eol=lf`) to prevent recurrence; (2) regenerated `release.manifest.json` + `sha256.txt` from the committed LF payload (2/428 hashes updated, content unchanged); (3) fixed `bro-beast-check.ps1` to verify the **latest** release, not hardcoded v1.1.0.
- **Re-verification:** `bro-spine-verify v1.2.0` = **VERIFIED 428/428**, rollup match; beast-check now checks the latest release.
- **Date:** 2026-07-05.

## FL-005 — seed left EP RED: registry not bumped (tool contract gap / REAL, unplanned)
- **What failed:** after Phase-4 seed of EP to v1.2.0, `bro-project-doctor`/`audit` = **RED/BLACK** — `[B] spine_version mismatch: v1.2.0 (expected v1.1.0)` + `[C] spine hash MISMATCH 9/394`.
- **Why:** `bro-update-spine` stamped `EP\bro\bro.manifest.json` to v1.2.0 but did **not** bump the SuperBro registry's `spine_version_expected` (still v1.1.0). The project-doctor verifies against the **registry-expected** version, so it checked EP's (correct) v1.2.0 spine against the v1.1.0 manifest → 9 changed files mismatch. A tool **contract gap**, not content corruption. App code + `EP\bro\memory` **untouched** (git before==after).
- **Gate that caught it:** `bro-project-doctor`/`audit` in Phase-4 post-seed verification. Honest **stop at EP RED**; GAA/SCOUT/MENQ never touched.
- **Fix (GO-RECOVER-SEED):** `bro-update-spine.ps1` now **atomically bumps** the registry `spine_version_expected` (+`last_sync`, `_before/` snapshot) on a successful `-Execute` update. Reconciled EP by re-running the fixed tool (idempotent re-pull, VERIFIED 428/428).
- **Re-verification:** EP project-doctor GREEN · project-audit **GREEN 428/428** · registry-check GREEN.
- **Date:** 2026-07-05.
- **Prevention:** the tool fix means GAA/SCOUT/MENQ will not hit the same RED.

> **Lesson recorded (see [`REPAIR_PATTERNS.md`](REPAIR_PATTERNS.md), [`NEVER_REPEAT.md`](NEVER_REPEAT.md)):** FL-002 was NOT planted — an independent Verifier catching an *unplanned* real defect is the proof the gate is capability, not ceremony. FL-003 is the same principle turned on the tooling: the pre-push gate caught a false-RED in its OWN heuristic before it could block a legitimate push. FL-004 completes the trio: an independent check (spine-verify) caught a real integrity break AND exposed that a sibling gate (beast-check) was a hardcoded false-GREEN — exactly why L18 demands independent, current evidence, never a check that "looks green" without looking. / FL-002·003·004 = gate-ը բռնում է իրական defect, նույնիսկ իր՛ գործիքի մեջ, ու hardcoded false-GREEN-ը բացահայտում է (L18)։
