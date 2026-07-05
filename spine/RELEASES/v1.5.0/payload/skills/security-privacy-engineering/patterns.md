# Security and Privacy Engineering patterns

## English

These are canonical security and privacy engineering moves. Each is a mechanism for one of the domain's artifacts (threat model, auth/authz review, privacy data-flow map, supply-chain control plan, cloud-hardening review, detection design). Choose the move that changes the next decision, not the nicest label. All moves stay defensive — the dual-use boundary in `SKILL.md` holds.

### 1. STRIDE trust-boundary pass

- **Trigger:** A new system, a new integration, or a sensitive action introduces or changes a trust boundary (data crossing a privilege level).
- **Mechanism:** Diagram the components and draw the trust boundaries. List assets. Enumerate STRIDE per boundary (Spoofing, Tampering, Repudiation, Info-disclosure, DoS, Elevation). For each threat assign a concrete mitigation, and for what remains name a residual-risk owner. Pair every mitigation with the detection that proves it fires.
- **Do not use when:** There is no trust boundary change — a purely public static asset with no privilege transition does not need a STRIDE pass (but its delivery pipeline still does).
- **Failure repair:** If there is no diagram and no boundaries, it is a checklist, not a model — redraw the boundaries first; if a mitigation has no detection, add the log/alert before calling it done.

### 2. Authorization review — IDOR/BOLA + function-level

- **Trigger:** An endpoint takes a resource id from the request, or a privileged/admin action is exposed.
- **Mechanism:** Separate authentication (who) from authorization (what). For every object access, enforce an owner/tenant check at the data layer against *this* actor and *this* resource. For every privileged function, enforce a per-action role/permission check on the endpoint itself. Test by requesting another actor's id (expect 403) and by calling the privileged route as a low-privilege user (expect denied).
- **Do not use when:** There is genuinely no per-actor resource ownership (e.g. a truly public read of non-sensitive shared data) — but verify that claim, do not assume it.
- **Failure repair:** If the only control is "the frontend hides it" or "there's a valid session," that is not authorization — add the server-side per-object and per-action checks and verify with the wrong actor's id.

### 3. OAuth/OIDC + PKCE flow review

- **Trigger:** Login, delegated access, or API token issuance is being designed for a public client.
- **Mechanism:** Use authorization code with PKCE (never implicit). Validate the redirect URI against an allowlist, carry `state` (CSRF) and `nonce` (replay), validate the token **audience** so another service cannot accept it, enforce **expiry** with rotation and revocation, and scope tokens to least privilege. AuthN proves who; the resource still runs its own authorization.
- **Do not use when:** There is no delegated/third-party access and no public client — a same-site server-rendered app may need only a hardened session (still validate session fixation, CSRF, and logout).
- **Failure repair:** If the flow is implicit or the audience is unchecked, tokens can be replayed or accepted by the wrong service — move to code+PKCE and add audience validation before shipping.

### 4. Secrets + supply-chain gate (artifacts and dependencies)

- **Trigger:** A secret could live in code/CI/images, or a dependency is being added or a build shipped.
- **Mechanism:** Scan for secrets in the repo **and** build artifacts, images, and CI logs; treat any found secret as compromised and rotate it now. Move to a secret manager or OIDC short-lived credentials. For dependencies: generate an SBOM, run SCA in CI and fail on an unreviewed critical, pin versions, and verify provenance/signatures to defeat typosquat and dependency-confusion.
- **Do not use when:** Never skip it on the grounds that "the repo is private" — a private repo is not a vault, and the leak is in the artifact, not the visibility.
- **Failure repair:** If scanning only covers the source tree, extend it to artifacts/images/logs; if there is no SBOM/SCA gate, add it — supply-chain blindness is an unmonitored door.

### 5. Privacy data-flow map + minimization

- **Trigger:** A feature collects, stores, shares, or exports personal data.
- **Mechanism:** Map each field: data subject, purpose, collection point, controller/processor, storage, transfer (and destination), retention, deletion, access, and the rights workflow. Minimize — a field with no purpose is removed. Separate consent from necessity. Pseudonymize PII in logs. Flag the lawful-basis/transfer question to legal rather than inventing the answer.
- **Do not use when:** No personal data is involved at all — but verify; "just an email for the receipt" is still personal data with a purpose and a retention.
- **Failure repair:** If a field has no purpose, remove it; if PII is in debug logs, strip/pseudonymize it; if there is no retention or deletion path, add one before launch.

### 6. Cloud hardening + paired detection

- **Trigger:** Cloud IAM, object storage, or a network boundary is being created or reviewed.
- **Mechanism:** Default-deny least-privilege IAM (no `*` actions/resources, no long-lived keys, MFA on privileged, short-lived federated credentials). Storage private by default with block-public-access, verified ACLs/policies, encryption at rest, and access logging. Default-deny network with metadata/SSRF egress restricted. For each control, define the detection: log the IAM/auth/export/config events to a SIEM and alert on a new public bucket, a privilege escalation, or an authz-denial burst.
- **Do not use when:** A resource genuinely must be public — then scope to the specific prefix, front it with a CDN, and document the exception with an owner.
- **Failure repair:** If a bucket is public "for now," close it and verify it is denied anonymously; if controls exist with no logging/alerting, add the detection so a bypass does not pass silently.

## Հայերեն

Սրանք canonical security և privacy engineering move-եր են։ Ամեն մեկը mechanism է ոլորտի artifact-ներից մեկի համար (threat model, auth/authz review, privacy data-flow map, supply-chain control plan, cloud-hardening review, detection design)։ Ընտրիր այն move-ը, որ փոխում է հաջորդ որոշումը, ոչ թե ամենագեղեցիկ անունը։ Բոլոր move-երը մնում են defensive — `SKILL.md`-ի dual-use սահմանը պահվում է։

### 1. STRIDE trust-boundary pass

- **Երբ է պետք․** Նոր system, նոր integration կամ sensitive action ներմուծում կամ փոխում է trust boundary (data, որ հատում է privilege level)։
- **Մեխանիզմը․** Նկարիր component-ները և գծիր trust boundary-ները։ Թվարկիր asset-ները։ Enumerate արա STRIDE ամեն boundary-ի համար (Spoofing, Tampering, Repudiation, Info-disclosure, DoS, Elevation)։ Ամեն threat-ի համար նշանակիր կոնկրետ mitigation, իսկ մնացածի համար անվանիր residual-risk owner։ Ամեն mitigation զուգիր այն detection-ի հետ, որ ապացուցում է, որ կրակում է։
- **Երբ չօգտագործել․** Երբ trust boundary-ի փոփոխություն չկա — զուտ public static asset առանց privilege transition-ի STRIDE pass պետք չունի (բայց իր delivery pipeline-ը դեռ ունի)։
- **Ուղղում․** Եթե diagram և boundary չկան, դա checklist է, ոչ model — նախ վերագծիր boundary-ները. եթե mitigation-ը detection չունի, ավելացրու log/alert-ը մինչև done ասելը։

### 2. Authorization review — IDOR/BOLA + function-level

- **Երբ է պետք․** Endpoint-ը resource id է վերցնում request-ից, կամ privileged/admin action է exposed։
- **Մեխանիզմը․** Բաժանիր authentication-ը (ով) authorization-ից (ինչ)։ Ամեն object access-ի համար enforce արա owner/tenant check data layer-ում *այս* actor-ի և *այս* resource-ի դեմ։ Ամեն privileged function-ի համար enforce արա per-action role/permission check հենց endpoint-ի վրա։ Test արա ուրիշ actor-ի id հարցնելով (սպասիր 403) և privileged route-ը low-privilege user-ով կանչելով (սպասիր deny)։
- **Երբ չօգտագործել․** Երբ իսկապես per-actor resource ownership չկա (օր.՝ իսկապես public read non-sensitive shared data-ի) — բայց verify արա այդ պնդումը, մի՛ ենթադրիր։
- **Ուղղում․** Եթե միակ control-ը «frontend-ը թաքցնում է» կամ «վավեր session կա» է, դա authorization չէ — ավելացրու server-side per-object և per-action check-երը և verify արա սխալ actor-ի id-ով։

### 3. OAuth/OIDC + PKCE flow review

- **Երբ է պետք․** Login, delegated access կամ API token issuance է նախագծվում public client-ի համար։
- **Մեխանիզմը․** Օգտագործիր authorization code PKCE-ով (երբեք implicit)։ Validate արա redirect URI-ն allowlist-ի դեմ, կրիր `state` (CSRF) և `nonce` (replay), validate արա token **audience**-ը, որ ուրիշ service չընդունի այն, enforce արա **expiry** rotation-ով և revocation-ով, և scope արա token-ները least privilege-ի։ AuthN-ը հաստատում է ով. resource-ը դեռ վազեցնում է իր սեփական authorization-ը։
- **Երբ չօգտագործել․** Երբ delegated/third-party access չկա և public client չկա — same-site server-rendered app-ին կարող է պետք լինի միայն hardened session (դեռ validate արա session fixation, CSRF և logout)։
- **Ուղղում․** Եթե flow-ը implicit է կամ audience-ը չ-check-ված, token-ները կարող են replay-վել կամ ընդունվել սխալ service-ի կողմից — տեղափոխիր code+PKCE և ավելացրու audience validation մինչև ship-ը։

### 4. Secrets + supply-chain gate (artifact-ներ և dependency-ներ)

- **Երբ է պետք․** Secret-ը կարող է ապրել code/CI/image-ում, կամ dependency է ավելացվում կամ build է ship-վում։
- **Մեխանիզմը․** Scan արա secret-ների համար repo-ում **և** build artifact, image և CI log-երում. ցանկացած գտնված secret համարիր compromised և rotate արա հիմա։ Անցիր secret manager-ի կամ OIDC short-lived credential-ի։ Dependency-ների համար․ generate արա SBOM, վազեցրու SCA CI-ում և fail արա չ-review-ված critical-ի վրա, pin արա version-ները և verify արա provenance/signature-ները՝ typosquat-ը և dependency-confusion-ը հաղթահարելու։
- **Երբ չօգտագործել․** Երբեք մի՛ բաց թող այն «repo-ն private է» հիմքով — private repo-ն vault չէ, և leak-ը artifact-ում է, ոչ visibility-ում։
- **Ուղղում․** Եթե scanning-ը միայն source tree-ն է ծածկում, ընդլայնիր artifact/image/log-ի. եթե SBOM/SCA gate չկա, ավելացրու — supply-chain blindness-ը չհսկվող դուռ է։

### 5. Privacy data-flow map + minimization

- **Երբ է պետք․** Feature-ը personal data է հավաքում, պահում, share կամ export է անում։
- **Մեխանիզմը․** Map արա ամեն field․ data subject, purpose, collection point, controller/processor, storage, transfer (և destination), retention, deletion, access և rights workflow։ Minimize արա — purpose չունեցող field-ը հանվում է։ Բաժանիր consent-ը necessity-ից։ Pseudonymize արա PII-ն log-երում։ Flag արա lawful-basis/transfer-ի հարցը legal-ին, քան հորինես պատասխանը։
- **Երբ չօգտագործել․** Երբ personal data ընդհանրապես չկա — բայց verify արա. «պարզապես email receipt-ի համար»-ը դեռ personal data է՝ purpose-ով և retention-ով։
- **Ուղղում․** Եթե field-ը purpose չունի, հանիր. եթե PII-ն debug log-ում է, strip/pseudonymize արա. եթե retention կամ deletion path չկա, ավելացրու մինչև launch-ը։

### 6. Cloud hardening + զուգված detection

- **Երբ է պետք․** Cloud IAM, object storage կամ network boundary է ստեղծվում կամ review-վում։
- **Մեխանիզմը․** Default-deny least-privilege IAM (ոչ `*` action/resource, ոչ long-lived key, MFA privileged-ի վրա, short-lived federated credential)։ Storage private by default՝ block-public-access-ով, verify-ված ACL/policy-ով, encryption at rest-ով և access logging-ով։ Default-deny network՝ metadata/SSRF egress սահմանափակված։ Ամեն control-ի համար սահմանիր detection-ը․ log արա IAM/auth/export/config event-ները SIEM-ում և alert արա նոր public bucket-ի, privilege escalation-ի կամ authz-denial burst-ի վրա։
- **Երբ չօգտագործել․** Երբ resource-ը իսկապես պետք է public լինի — ապա scope արա կոնկրետ prefix-ին, front արա CDN-ով և փաստաթղթավորիր բացառությունը owner-ով։
- **Ուղղում․** Եթե bucket-ը «առայժմ» public է, փակիր և verify արա, որ deny է անանուն. եթե control-ները կան առանց logging/alerting-ի, ավելացրու detection-ը, որ bypass-ը լուռ չանցնի։
