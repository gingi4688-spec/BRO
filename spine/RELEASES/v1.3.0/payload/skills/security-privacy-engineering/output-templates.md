# Security and Privacy Engineering output templates

## English

Three domain-shaped deliverables. Fill the real fields; every control names a server-side enforcement point and a paired detection. Do not invent CVEs, statutes, or vendor claims; flag the lawful-basis question to legal.

### Template 1 — Threat model (STRIDE)

- **System & diagram:** components and data flow (sketch or list)
- **Trust boundaries:** where data crosses a privilege level (e.g. Internet ↔ API, app ↔ privileged service, app ↔ datastore/tenant isolation)
- **Assets:** what an attacker wants (identity, money/data, the audit log)
- **STRIDE per boundary** (one row each):
  - Threat (S/T/R/I/D/E) · Mitigation (where enforced — server-side?) · Detection (event logged + alert + owner)
  - Information disclosure: is there an **IDOR/BOLA** path on any id-bearing endpoint? owner/tenant check at the data layer?
  - Elevation: is **function-level authz** enforced per action, not by hiding the UI?
- **Privacy slice:** any PII fields — purpose, retention, deletion, access log (pseudonymized)
- **Residual risk & owners:** what remains, who owns it, the compensating control
- **Routed out:** lawful-basis → legal; SOC-at-scale → cybersecurity-operations-soc
- **Acceptance:** boundaries drawn · IDOR/BOLA + function-level authz addressed · every mitigation has a detection · residual owner named
- **Verify live:** the highest-risk control confirmed in the running system (e.g. wrong-tenant id returns 403)

### Template 2 — Auth / authorization review

- **Flow & grant:** session vs OAuth/OIDC; if public client → authorization code + **PKCE** (not implicit)
- **AuthN:** how identity is proven (MFA where sensitive); token type and binding
- **Token lifecycle:** expiry, refresh rotation, **audience** validation, revocation, logout
- **OAuth checks:** redirect-URI allowlist · `state` · `nonce` · scope = least privilege
- **AuthZ — object level (IDOR/BOLA):** every id-bearing endpoint — owner/tenant check **at the data layer**, not client-side; verification: wrong actor's id → 403
- **AuthZ — function level:** every privileged endpoint — per-action role/permission check on the endpoint; verification: non-admin call → denied
- **Findings table:** flaw · class (IDOR / function-level / lifecycle / grant) · severity · fix (server-side) · live verification
- **Detection to add:** 403-burst on ids · admin-endpoint authz denials · impossible-travel · revoked-token use
- **Acceptance:** authN and authZ distinct · object + function checks server-side · token lifecycle safe · grant correct
- **Verify live:** each fix confirmed in the running system, not "documented as enabled"

### Template 3 — Privacy data-flow map

- **Feature & data subjects:** whose data, for what feature
- **Per field:** field · purpose · collection point · controller/processor · storage · transfer (destination/jurisdiction) · retention · deletion · access
- **Minimization:** fields removed (no purpose) and fields kept (with the purpose)
- **Consent vs necessity:** which data is required to deliver vs opted-into
- **Rights workflow:** access / rectify / erase / export — how each is fulfilled
- **Logging & PII:** what is logged, pseudonymization of PII in logs, retention of the log itself
- **Lawful basis:** **flagged to legal** (do not assert it here)
- **Acceptance:** every field has a purpose + retention + deletion · PII not logged raw · rights workflow defined · legal question routed
- **Verify live:** a deletion request actually removes the field across stores and backups (or the gap is named)

## Հայերեն

Երեք domain-ձև deliverable։ Լրացրու իրական field-երը. ամեն control անվանում է server-side enforcement point և զուգված detection։ Մի՛ հորինիր CVE, statute կամ vendor claim. flag արա lawful-basis-ի հարցը legal-ին։

### Template 1 — Threat model (STRIDE)

- **Համակարգ & diagram․** component-ներ և data flow (sketch կամ list)
- **Trust boundary-ներ․** որտեղ data-ն հատում է privilege level (օր.՝ Internet ↔ API, app ↔ privileged service, app ↔ datastore/tenant isolation)
- **Asset-ներ․** ինչ է ուզում attacker-ը (identity, money/data, audit log-ը)
- **STRIDE ամեն boundary-ի** (մեկ row ամեն մեկին)․
  - Threat (S/T/R/I/D/E) · Mitigation (որտեղ enforce-ված — server-side՞) · Detection (log-ված event + alert + owner)
  - Information disclosure․ կա՞ **IDOR/BOLA** path որևէ id-կրող endpoint-ի վրա. owner/tenant check data layer-ո՞ւմ
  - Elevation․ **function-level authz** enforce-ված է՞ ամեն action-ի, ոչ UI-ն թաքցնելով
- **Privacy slice․** ցանկացած PII field — purpose, retention, deletion, access log (pseudonymize-ված)
- **Residual risk & owner-ներ․** ինչ է մնում, ով է տիրում, compensating control-ը
- **Routed out․** lawful-basis → legal. SOC-at-scale → cybersecurity-operations-soc
- **Acceptance․** boundary-ները գծված · IDOR/BOLA + function-level authz լուծված · ամեն mitigation detection ունի · residual owner անվանված
- **Verify live․** ամենա-high-risk control-ը հաստատված running system-ում (օր.՝ սխալ-tenant id-ն վերադարձնում է 403)

### Template 2 — Auth / authorization review

- **Flow & grant․** session ընդդեմ OAuth/OIDC. եթե public client → authorization code + **PKCE** (ոչ implicit)
- **AuthN․** ինչպես է identity-ն ապացուցվում (MFA՝ որտեղ sensitive). token type և binding
- **Token lifecycle․** expiry, refresh rotation, **audience** validation, revocation, logout
- **OAuth check-եր․** redirect-URI allowlist · `state` · `nonce` · scope = least privilege
- **AuthZ — object level (IDOR/BOLA)․** ամեն id-կրող endpoint — owner/tenant check **data layer-ում**, ոչ client-side. verification․ սխալ actor-ի id → 403
- **AuthZ — function level․** ամեն privileged endpoint — per-action role/permission check endpoint-ի վրա. verification․ non-admin call → deny
- **Findings table․** flaw · class (IDOR / function-level / lifecycle / grant) · severity · fix (server-side) · live verification
- **Detection ավելացնելու․** 403-burst id-ների վրա · admin-endpoint authz denial · impossible-travel · revoked-token use
- **Acceptance․** authN-ն ու authZ-ն առանձին · object + function check-երը server-side · token lifecycle-ն safe · grant-ը ճիշտ
- **Verify live․** ամեն fix հաստատված running system-ում, ոչ «documented as enabled»

### Template 3 — Privacy data-flow map

- **Feature & data subject-ներ․** ում data-ն, որ feature-ի համար
- **Ամեն field-ի․** field · purpose · collection point · controller/processor · storage · transfer (destination/jurisdiction) · retention · deletion · access
- **Minimization․** հանված field-եր (purpose չկա) և պահված field-եր (purpose-ով)
- **Consent ընդդեմ necessity-ի․** որ data-ն է պահանջվում մատուցելու համար ընդդեմ opt-in-ի
- **Rights workflow․** access / rectify / erase / export — ինչպես է ամեն մեկը կատարվում
- **Logging & PII․** ինչ է log-վում, PII-ի pseudonymization log-երում, log-ի retention-ը
- **Lawful basis․** **flag-ված legal-ին** (այստեղ մի՛ պնդիր)
- **Acceptance․** ամեն field ունի purpose + retention + deletion · PII-ն raw չի log-վում · rights workflow սահմանված · legal-ի հարցը ուղղորդված
- **Verify live․** deletion request-ն իրականում հանում է field-ը store-երով և backup-ներով (կամ gap-ը անվանված է)
