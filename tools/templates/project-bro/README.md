# tools/templates/project-bro/ — Project Bro install source / Project Bro-ի install-ի աղբյուր

> **EN:** The physical copy-source for a Project Bro install (§7). An install (a later, Gev-gated Rollout step)
> copies this skeleton into a project's `X/bro/`, fills the `<PLACEHOLDER>` tokens, pulls an approved spine release,
> and stamps the manifest. **Nothing here is an installed Bro; copying happens only on an explicit Gev command. No
> project folder is touched in the clean build.** See `_core/PROJECT_BRO_TEMPLATE.md` for the full contract.
> **HY:** Project Bro install-ի ֆիզիկական copy-source-ը (§7)։ Install-ը (հետագա, Gev-gated Rollout) պատճենում է այս
> skeleton-ը project-ի `X/bro/`-ի մեջ, լցնում `<PLACEHOLDER>`-ները, pull approved spine release, stamp manifest։
> **Այստեղ ոչինչ installed Bro չէ; պատճենումը միայն Գևի բացահայտ հրամանով։ Մաքուր build-ում ոչ մի project չի դիպչվում։**

## Contents / բովանդակություն
- `bro.manifest.template.json` — Project Bro manifest with `<PLACEHOLDER>` tokens.
- `health.report.template.md` — local health report template.
- `memory/`, `spine/`, `logs/` — empty placeholders (`.gitkeep`); filled at install.
