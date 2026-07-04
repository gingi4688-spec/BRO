# ui / page-templates — LIST-DETAIL (PROVEN) / LIST-DETAIL (ԱՊԱՑՈՒՑՎԱԾ)

> **EN:** The first proven page template. A list of records → a detail drawer, synthetic data. This spec is derived from the runtime-GREEN CRM slice, not invented. **HY:** Առաջին ապացուցված page template-ը։ Գրառումների ցուցակ → detail drawer, սինթետիկ data։ Այս spec-ը բխեցված է runtime-GREEN CRM slice-ից, ոչ հորինված։

## Anatomy / Անատոմիա

```
PageHeader (title · subtitle · primary action [role-gated])
FilterBar   (labeled search input)
Count       ("N of M")
DataTable   (Name/sub · Status badge · Plan · Owner · MRR right-aligned; md/lg column-collapse)
  Row → opens Drawer
Drawer      (title + status · description · detail grid · notes · footer: Close + primary [role-gated])
```

## Required states (all six) / Պահանջվող state-եր (վեցն էլ)

`loading` (skeleton) · `empty-first-run` · `empty-filtered-to-zero` · `error+retry` · `populated` · `permission-denied` (read-only role). Drive them deterministically (URL params) so screenshots are reproducible. / Վեց state, driven URL-ով՝ reproducible screenshot-ի համար։

## Interactions / Փոխազդեցություններ

filter · select row · open drawer · keyboard tab path · primary action keyboard-operable · **close drawer with ESC** · focus returns to trigger on close. / filter · select · open · keyboard · ESC-close · focus-restore։

## GREEN criteria / GREEN չափանիշ (L18)

Renders · all 6 states · viewports 375/768/1024/1440 · keyboard-only operable · axe 0 serious · tokens+kit only · all screenshots · controlled-failure caught+repaired+re-verified · Verifier PASS with evidence. / Render · 6 state · 4 viewport · keyboard · axe 0 serious · token+kit only · screenshot-ներ · controlled-failure · Verifier PASS evidence-ով։

## Proof / Ապացույց

Verified 23/23 Playwright + axe 0 serious on Next.js 16 (see [`../verification/UI_VERIFICATION_CHECKLIST.md`](../verification/UI_VERIFICATION_CHECKLIST.md) and the evidence ledgers). / Verify արած 23/23 Playwright + axe 0 serious Next.js 16-ում։

## Other page types / Այլ էջի տեսակներ

dashboard · CRUD-form · settings · auth · landing · report · admin · kanban · calendar · inbox · profile · audit-log · wizard · … are **DECLARED** templates — each earns PROVEN status only after its own runtime-GREEN slice (L18). No template is claimed proven on paper. / մնացած template-ները **DECLARED** են. ամեն մեկը PROVEN դառնում է միայն իր runtime-GREEN slice-ից հետո (L18)։
