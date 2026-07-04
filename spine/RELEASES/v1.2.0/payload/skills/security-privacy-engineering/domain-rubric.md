# Security and Privacy Engineering domain rubric

## English

Use this rubric before finalizing a threat model, auth/authz review, privacy data-flow map, supply-chain control plan, cloud-hardening review, or detection design. A score of 5 requires the mechanism, server-side enforcement, a paired detection, and a checkable artifact — not vocabulary. Tech tokens (STRIDE, PKCE, AEAD, SBOM, IAM, SIEM, IDOR/BOLA) stay in English.

| Dimension | 1 — weak | 3 — usable | 5 — senior |
|---|---|---|---|
| Threat modeling | Threats are generic; no boundaries. | STRIDE named; a rough diagram exists. | Assets, trust boundaries, STRIDE per boundary, a mitigation per threat, and a named residual-risk owner — built before launch and changing a design decision. |
| Auth correctness (authN/authZ) | Login "works"; authz is a session check. | OAuth/PKCE named; some role checks. | AuthN and authZ are distinct; IDOR/BOLA closed by a server-side owner/tenant check at the data layer; function-level authz enforced per action; OAuth code+PKCE with redirect/state/nonce/audience/expiry/revocation validated. |
| Crypto & secrets hygiene | Custom crypto; secret in code. | Vetted library named; secret in a manager. | AEAD with a unique nonce, a slow salted password KDF, and a managed/rotated key lifecycle; secrets covered in source **and** artifacts/CI/images with rotation-on-exposure and a scanning gate. |
| Privacy engineering | Collects everything; PII in logs. | A data map exists. | Data-flow mapped per field, minimized to a purpose, with retention/deletion and a rights workflow; PII pseudonymized in logs; the lawful-basis question flagged to legal, not invented. |
| Supply-chain, cloud & detection | Dependencies trusted blindly; IAM `*`; no logging. | SCA runs; some IAM scoping; logs exist. | SBOM + SCA gate with pinning/provenance; default-deny least-privilege IAM and non-public storage with block-public verified; **every control paired with a detection** (log + alert + owner) into a SIEM, plus a designed incident-response path. |

A senior answer also holds the dual-use boundary (no offensive build, specific re-routing refusals), invents no CVEs/statutes/vendor claims, and verifies the control live in the running system rather than trusting "documented as enabled."

## Հայերեն

Կիրառիր այս rubric-ը threat model, auth/authz review, privacy data-flow map, supply-chain control plan, cloud-hardening review կամ detection design վերջնականացնելուց առաջ։ 5 միավորի համար պետք է mechanism, server-side enforcement, զուգված detection և ստուգելի artifact — ոչ vocabulary։ Tech token-ները (STRIDE, PKCE, AEAD, SBOM, IAM, SIEM, IDOR/BOLA) մնում են անգլերեն։

| Չափանիշ | 1 — թույլ | 3 — կիրառելի | 5 — senior |
|---|---|---|---|
| Threat modeling | Threat-երը generic են. boundary չկա։ | STRIDE նշված է. կա կոպիտ diagram։ | Asset-ները, trust boundary-ները, STRIDE ամեն boundary-ի, mitigation ամեն threat-ի և անվանված residual-risk owner — կառուցված launch-ից առաջ և փոխում է design որոշում։ |
| Auth correctness (authN/authZ) | Login-ը «աշխատում է». authz-ը session check է։ | OAuth/PKCE նշված է. որոշ role check։ | AuthN-ն ու authZ-ն առանձին են. IDOR/BOLA-ն փակված server-side owner/tenant check-ով data layer-ում. function-level authz enforce-ված ամեն action-ի. OAuth code+PKCE՝ redirect/state/nonce/audience/expiry/revocation validate-ված։ |
| Crypto & secrets hygiene | Custom crypto. secret code-ում։ | Vetted library նշված. secret manager-ում։ | AEAD unique nonce-ով, slow salted password KDF և managed/rotated key lifecycle. secret-ները ծածկված source-ում **և** artifact/CI/image-ում՝ exposure-ի rotation-ով և scanning gate-ով։ |
| Privacy engineering | Ամեն ինչ collect է անում. PII log-ում։ | Data map կա։ | Data-flow map-ված ամեն field-ի, minimize-ված purpose-ի, retention/deletion-ով և rights workflow-ով. PII pseudonymize-ված log-երում. lawful-basis-ի հարցը flag-ված legal-ին, ոչ հորինված։ |
| Supply-chain, cloud & detection | Dependency-ները blind trusted. IAM `*`. ոչ logging։ | SCA վազում է. որոշ IAM scoping. log-եր կան։ | SBOM + SCA gate՝ pinning/provenance-ով. default-deny least-privilege IAM և non-public storage՝ block-public verify-ված. **ամեն control զուգված detection-ի հետ** (log + alert + owner) SIEM-ում, plus նախագծված incident-response path։ |

Senior պատասխանը նաև պահում է dual-use սահմանը (ոչ offensive build, կոնկրետ վերա-ուղղորդող մերժումներ), ոչ մի CVE/statute/vendor claim չի հորինում, և verify է անում control-ը live running system-ում, քան վստահում «documented as enabled»-ին։
