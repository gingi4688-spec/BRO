# PROMOTION GATE — the only path a project lesson becomes spine / միակ ճանապարհը

> **EN:** A project lesson becomes a spine rule **only** through the Promotion Gate (§10). **No project-specific fact
> enters the spine.** The gate blocks (a) **unapproved** candidates (no Gev authority) and (b) **project-specific**
> candidates (anything carrying a project id / path / instance fact). Only a **generic, domain-agnostic** rule with
> **explicit Gev approval** may proceed to a spine release. This is the structural answer to the founding failure
> (failure-registry Entry 1: instance content treated as framework — altitude drift).
>
> **HY:** Project lesson-ը spine rule է դառնում **միայն** Promotion Gate-ով (§10)։ **Ոչ մի project-specific fact չի
> մտնում spine**։ Gate-ը block է անում (ա) **unapproved** candidate-ները (ոչ Gev authority) ու (բ) **project-specific**
> candidate-ները (project id / path / instance fact կրողները)։ Միայն **generic, domain-agnostic** rule, **Գևի բացահայտ
> հաստատմամբ**, կարող է անցնել spine release։ Սա հիմնադիր ձախողման կառուցվածքային պատասխանն է (altitude drift)։

---

## Flow / հոսք

```txt
project lesson  ->  candidate spine rule  ->  PROMOTION GATE  ->  Gev approval  ->  spine release  ->  Bros pull
                                                  |
                                                  +-- BLOCK if project-specific (project id/path/instance fact)
                                                  +-- BLOCK if not Gev-approved
```

## Gate checks (`tools/bro-promote.ps1`) / gate-ի ստուգումներ

```txt
1) APPROVAL   require explicit Gev approval (BRO_GEV_APPROVED=1). Missing -> BLOCK (unapproved).
2) ALTITUDE   candidate must be generic/domain-agnostic. If it names a project (EP/DB/GAA/GAAhex/IP),
              a project path, or an instance-specific fact -> BLOCK (project-specific; altitude violation).
3) PASS       generic + approved -> gate PASSED. (Clean build: dry — it would proceed to a spine release;
              no spine content is written in the clean build.)
```

> **EN:** The gate is read-only/advisory in the clean build (no spine write); it **demonstrates the block**. A real
> promotion writes a candidate into a spine release (`bro-release.ps1`) and is a CRITICAL, Gev-gated, logged action.
> **HY:** Gate-ը մաքուր build-ում read-only/advisory է (ոչ spine write); այն **ապացուցում է block-ը**։ Real promotion-ը
> գրում է candidate-ը spine release-ի մեջ ու CRITICAL, Gev-gated, log-վող action է։
