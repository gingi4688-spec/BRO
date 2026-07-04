# gev_standard / BAD_EXAMPLES / ՎԱՏ ՕՐԻՆԱԿՆԵՐ

> **EN:** Concrete things that MISS Gev's standard — the anti-patterns to catch before shipping. Each: what it was · why it's bad · the fix. **HY:** Կոնկրետ բաներ, որ ՎՐԻՊՈՒՄ են Գևի standard-ից — anti-pattern-ներ, որ բռնվեն մինչ թողարկումը։ Ամեն մեկը՝ ինչ · ինչու վատ · fix։

## B-001 — File-presence "GREEN"
- **What:** the donor pack's 3 "GREEN" commands only check that files/folders EXIST.
- **Why bad:** proves nothing about capability; the exact fake-GREEN L18 forbids.
- **Fix:** a real capability check that renders/tests/cites; file-presence is never GREEN.

## B-002 — "Universal" architecture off zero proven slices
- **What:** designing 13 core layers + 11 adapters top-down, then filling.
- **Why bad:** empty-abstraction trap; generality unearned; empty folders that look done.
- **Fix:** prove one vertical slice, then a second, THEN extract the shared core (rule of three).

## B-003 — Option-menu after "go"
- **What:** answering "do it" with "which of these three would you like?"
- **Why bad:** violates decisive-execution answer taste; wastes his time; treats a decided thing as undecided.
- **Fix:** run the full remaining scope in one pass; report after; pause only for a real external block (one paste, no menu).

## B-004 — Assuming a token pair is AA
- **What:** using a soft color token pair for small text without checking contrast at the used size.
- **Why bad:** shipped a serious a11y defect (FL-002); "looks fine" ≠ AA.
- **Fix:** verify contrast at the rendered size; solid fill for small labels (NR-001).

## B-005 — English-only drift / "done" without a runtime check
- **What:** answering only in English, or calling something done before it ran in the real system.
- **Why bad:** breaks L0 (bilingual) and L16 (no done without verification).
- **Fix:** native Armenian + English, equal load; prove it in the running system before "done".

> Add Gev-labeled anti-patterns below as they arrive. / Ավելացրու Gev-ի պիտակած anti-pattern-ները ներքևում։
