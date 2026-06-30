# FILE_STATUS_MATRIX.md

Global file status matrix for STANDARD_PROJECT_DOCS_PACK.

## Decision Values

| User Decision | Final Status | Meaning |
|---|---|---|
| MUST | MUST | Required for this project |
| GOOD_TO_HAVE | SHOULD | Useful but not mandatory |
| CONDITIONAL_MUST | CONDITIONAL_MUST | Required if the related feature exists |
| ENTERPRISE | ENTERPRISE | Required only for enterprise-grade needs |
| TEMPLATE | TEMPLATE | Reusable template, not project truth |
| NOT_NEEDED | EXCLUDED | Reviewed and intentionally excluded |

## Matrix

| Folder | File | Default Status | When Required | User Decision | Final Status | Notes |
|---|---|---:|---|---|---|---|
| 00_MASTER | STANDARD_PROJECT_DOCS_PACK.md | MUST | Always required as the canonical framework reference |  |  |  |
| 00_MASTER | PACK_INDEX.md | MUST | Required to list all framework folders and files |  |  |  |
| 00_MASTER | PACK_USAGE_GUIDE.md | MUST | Required to explain how to use the standard |  |  |  |
| 00_MASTER | PACK_DECISION_TREE.md | MUST | Required before selecting docs for a project |  |  |  |
| 00_MASTER | DOCS_DEPENDENCY_GRAPH.md | MUST | Required to control fill order and dependencies |  |  |  |
| 00_MASTER | PROJECT_DOCS_SELECTION.md | MUST | Required before build for every project |  |  |  |
| 00_MASTER | FILE_STATUS_MATRIX.md | MUST | Required to classify all framework files |  |  |  |
| 00_MASTER | FILL_ORDER.md | MUST | Required to define safe document creation order |  |  |  |
| 00_MASTER | AI_BUILDER_RULES.md | MUST | Required when AI/builders create project docs |  |  |  |
| 00_MASTER | TEMPLATE_CONVENTIONS.md | SHOULD | Required when templates are used |  |  |  |
| 00_MASTER | SOURCE_OF_TRUTH_RULES.md | MUST | Required to resolve conflicting docs |  |  |  |
| 01_CORE | README.md | MUST | Required for project entry point |  |  |  |
| 01_CORE | PROJECT_CONTEXT.md | MUST | Required for project understanding |  |  |  |
| 01_CORE | PROJECT_BRIEF.md | MUST | Required for project definition |  |  |  |
| 01_CORE | PROJECT_GOALS.md | SHOULD | Required when goals must be explicit |  |  |  |
| 01_CORE | PROJECT_VISION.md | SHOULD | Required for long-term product direction |  |  |  |
| 01_CORE | PROBLEM_STATEMENT.md | SHOULD | Required when the problem must be clearly framed |  |  |  |
| 01_CORE | TARGET_AUDIENCE.md | MUST | Required for user/customer definition |  |  |  |
| 01_CORE | STAKEHOLDERS.md | SHOULD | Required when multiple owners/teams exist |  |  |  |
| 01_CORE | SUCCESS_METRICS.md | SHOULD | Required when measurable success matters |  |  |  |
| 01_CORE | NON_GOALS.md | MUST | Required to prevent scope creep |  |  |  |
| 01_CORE | MVP_SCOPE.md | MUST | Required before build scope is defined |  |  |  |
| 01_CORE | ASSUMPTIONS.md | SHOULD | Required when assumptions affect build decisions |  |  |  |
| 01_CORE | CONSTRAINTS.md | SHOULD | Required when time, budget, tech, legal, or business constraints exist |  |  |  |
| 01_CORE | RISKS.md | SHOULD | Required when delivery/product/security risks exist |  |  |  |
| 01_CORE | GLOSSARY.md | SHOULD | Required when terms need shared meaning |  |  |  |
| 01_CORE | OPEN_ITEMS_LOG.md | MUST | Required when unanswered questions exist |  |  |  |
| 01_CORE | DECISIONS_LOG.md | MUST | Required for approved decisions |  |  |  |
| 01_CORE | CHANGELOG.md | SHOULD | Required when docs/product changes are tracked |  |  |  |
| 02_PRODUCT_STRATEGY | PRODUCT_REQUIREMENTS.md | MUST | Required for product behavior |  |  |  |
| 02_PRODUCT_STRATEGY | FEATURE_SPEC.md | SHOULD | Required when features need detailed behavior |  |  |  |
| 02_PRODUCT_STRATEGY | FEATURE_CATALOG.md | SHOULD | Required when feature inventory is needed |  |  |  |
| 02_PRODUCT_STRATEGY | FEATURE_PRIORITY_MATRIX.md | SHOULD | Required when prioritization matters |  |  |  |
| 02_PRODUCT_STRATEGY | ROADMAP.md | SHOULD | Required when timeline/milestones matter |  |  |  |
| 02_PRODUCT_STRATEGY | PRODUCT_ROADMAP.md | SHOULD | Required when feature evolution by release matters |  |  |  |
| 02_PRODUCT_STRATEGY | RELEASE_SCOPE.md | SHOULD | Required when release boundaries matter |  |  |  |
| 02_PRODUCT_STRATEGY | PRIORITIZATION.md | SHOULD | Required when feature order must be justified |  |  |  |
| 02_PRODUCT_STRATEGY | USE_CASES.md | SHOULD | Required when user/system scenarios matter |  |  |  |
| 02_PRODUCT_STRATEGY | USER_STORIES.md | SHOULD | Required when build tasks need user-centered framing |  |  |  |
| 02_PRODUCT_STRATEGY | USER_PERSONAS.md | OPTIONAL | Required when audience types need deeper modeling |  |  |  |
| 02_PRODUCT_STRATEGY | JOBS_TO_BE_DONE.md | OPTIONAL | Required when outcome-based product thinking is needed |  |  |  |
| 02_PRODUCT_STRATEGY | BUSINESS_RULES.md | MUST | Required when product has rules/workflows |  |  |  |
| 02_PRODUCT_STRATEGY | EDGE_CASES.md | SHOULD | Required when failure/exception behavior matters |  |  |  |
| 02_PRODUCT_STRATEGY | ACCEPTANCE_CRITERIA.md | SHOULD | Required before QA/build validation |  |  |  |
| 03_USER_ACCESS_ROLES | USER_ROLES.md | CONDITIONAL_MUST | Required if project has users or roles |  |  |  |
| 03_USER_ACCESS_ROLES | ROLE_MODEL.md | CONDITIONAL_MUST | Required if role relationships must be defined |  |  |  |
| 03_USER_ACCESS_ROLES | PERMISSION_SYSTEM.md | CONDITIONAL_MUST | Required if access control exists |  |  |  |
| 03_USER_ACCESS_ROLES | ACCESS_CONTROL_MATRIX.md | CONDITIONAL_MUST | Required if multiple roles/permissions exist |  |  |  |
| 03_USER_ACCESS_ROLES | USER_LIFECYCLE.md | CONDITIONAL_MUST | Required if users are invited/activated/suspended/deleted |  |  |  |
| 03_USER_ACCESS_ROLES | INVITATION_FLOW.md | CONDITIONAL_MUST | Required if invitations exist |  |  |  |
| 03_USER_ACCESS_ROLES | ACCOUNT_STATES.md | CONDITIONAL_MUST | Required if account states matter |  |  |  |
| 03_USER_ACCESS_ROLES | SESSION_RULES.md | CONDITIONAL_MUST | Required if login/session behavior exists |  |  |  |
| 03_USER_ACCESS_ROLES | ADMIN_ACCESS_RULES.md | CONDITIONAL_MUST | Required if admin access exists |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | UX_FLOW.md | SHOULD | Required when user flow matters |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | USER_JOURNEYS.md | SHOULD | Required for multi-step user journeys |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | INFORMATION_ARCHITECTURE.md | SHOULD | Required for multi-page products |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | SITEMAP.md | SHOULD | Required for websites/content structures |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | ROUTES_AND_NAVIGATION.md | MUST | Required for frontend routing/navigation |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | NAVIGATION_RULES.md | SHOULD | Required when nav visibility or hierarchy matters |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | PAGE_INVENTORY.md | SHOULD | Required for page-level planning |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | SCREEN_INVENTORY.md | SHOULD | Required for app/admin screen planning |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | WIREFRAME_NOTES.md | OPTIONAL | Required when wireframe decisions must be documented |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | EMPTY_STATES.md | SHOULD | Required for empty data/page states |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | LOADING_STATES.md | SHOULD | Required for async/loading experiences |  |  |  |
| 04_UX_INFORMATION_ARCHITECTURE | ERROR_STATES.md | SHOULD | Required for user-facing error states |  |  |  |
| 05_UI_DESIGN_SYSTEM | DESIGN_TOKENS.md | MUST | Required for no-hardcode UI |  |  |  |
| 05_UI_DESIGN_SYSTEM | DESIGN_SYSTEM_RULES.md | MUST | Required for UI consistency |  |  |  |
| 05_UI_DESIGN_SYSTEM | COMPONENT_SPEC.md | SHOULD | Required for reusable UI components |  |  |  |
| 05_UI_DESIGN_SYSTEM | UI_PAGE_STRUCTURE.md | MUST | Required for page-level layout |  |  |  |
| 05_UI_DESIGN_SYSTEM | RESPONSIVE_RULES.md | SHOULD | Required for mobile/tablet/desktop behavior |  |  |  |
| 05_UI_DESIGN_SYSTEM | ACCESSIBILITY_SPEC.md | SHOULD | Required for accessible UX/UI |  |  |  |
| 05_UI_DESIGN_SYSTEM | INTERACTION_RULES.md | SHOULD | Required when interactions need consistency |  |  |  |
| 05_UI_DESIGN_SYSTEM | MICROCOPY.md | OPTIONAL | Required when button/label/help text needs control |  |  |  |
| 05_UI_DESIGN_SYSTEM | ANIMATION_AND_MOTION.md | OPTIONAL | Required when motion is part of UX |  |  |  |
| 05_UI_DESIGN_SYSTEM | ICONOGRAPHY.md | OPTIONAL | Required when icon system matters |  |  |  |
| 05_UI_DESIGN_SYSTEM | THEME_SYSTEM.md | OPTIONAL | Required when theme abstraction exists |  |  |  |
| 05_UI_DESIGN_SYSTEM | DARK_LIGHT_MODE.md | OPTIONAL | Required when dark/light mode exists |  |  |  |
| 05_UI_DESIGN_SYSTEM | BRAND_UI_RULES.md | SHOULD | Required when brand visuals must be enforced |  |  |  |
| 06_CONTENT_SEO_BRAND | CONTENT_MODEL.md | CONDITIONAL_MUST | Required if project has managed content |  |  |  |
| 06_CONTENT_SEO_BRAND | CONTENT_COPY.md | SHOULD | Required for public-facing copy |  |  |  |
| 06_CONTENT_SEO_BRAND | CONTENT_INVENTORY.md | SHOULD | Required when many content pieces/pages exist |  |  |  |
| 06_CONTENT_SEO_BRAND | CONTENT_GOVERNANCE.md | CONDITIONAL_MUST | Required if content approval/publishing workflow exists |  |  |  |
| 06_CONTENT_SEO_BRAND | BRAND_VOICE.md | SHOULD | Required for consistent tone |  |  |  |
| 06_CONTENT_SEO_BRAND | BRAND_GUIDELINES.md | SHOULD | Required when brand rules exist |  |  |  |
| 06_CONTENT_SEO_BRAND | SEO_CONTENT.md | CONDITIONAL_MUST | Required if SEO matters |  |  |  |
| 06_CONTENT_SEO_BRAND | SEO_TECHNICAL_SPEC.md | CONDITIONAL_MUST | Required if technical SEO matters |  |  |  |
| 06_CONTENT_SEO_BRAND | METADATA_RULES.md | CONDITIONAL_MUST | Required if SEO/social previews matter |  |  |  |
| 06_CONTENT_SEO_BRAND | OPEN_GRAPH_SPEC.md | OPTIONAL | Required when social sharing previews matter |  |  |  |
| 06_CONTENT_SEO_BRAND | SITEMAP_ROBOTS.md | CONDITIONAL_MUST | Required for indexable public websites |  |  |  |
| 06_CONTENT_SEO_BRAND | STRUCTURED_DATA.md | OPTIONAL | Required if schema markup matters |  |  |  |
| 06_CONTENT_SEO_BRAND | MEDIA_AND_ASSETS.md | SHOULD | Required when images/files/icons are used |  |  |  |
| 06_CONTENT_SEO_BRAND | IMAGE_GUIDELINES.md | OPTIONAL | Required when image quality/format matters |  |  |  |
| 06_CONTENT_SEO_BRAND | I18N_LANGUAGE_SYSTEM.md | CONDITIONAL_MUST | Required if multiple languages exist |  |  |  |
| 06_CONTENT_SEO_BRAND | TRANSLATION_RULES.md | CONDITIONAL_MUST | Required if translations exist |  |  |  |
| 06_CONTENT_SEO_BRAND | LOCALIZATION_RULES.md | OPTIONAL | Required when region-specific formats/content matter |  |  |  |
| 07_FRONTEND_ARCHITECTURE | FRONTEND_ARCHITECTURE.md | MUST | Required for frontend build |  |  |  |
| 07_FRONTEND_ARCHITECTURE | PROJECT_STRUCTURE.md | MUST | Required for repo/folder layout |  |  |  |
| 07_FRONTEND_ARCHITECTURE | ROUTING_ARCHITECTURE.md | MUST | Required for app routing |  |  |  |
| 07_FRONTEND_ARCHITECTURE | STATE_MANAGEMENT.md | SHOULD | Required if app has complex state |  |  |  |
| 07_FRONTEND_ARCHITECTURE | FORM_ARCHITECTURE.md | CONDITIONAL_MUST | Required if forms exist |  |  |  |
| 07_FRONTEND_ARCHITECTURE | FORM_AND_LEAD_FLOW.md | CONDITIONAL_MUST | Required if forms create leads/requests |  |  |  |
| 07_FRONTEND_ARCHITECTURE | FRONTEND_VALIDATION.md | CONDITIONAL_MUST | Required if forms/input validation exist |  |  |  |
| 07_FRONTEND_ARCHITECTURE | ERROR_HANDLING_FRONTEND.md | SHOULD | Required for frontend errors |  |  |  |
| 07_FRONTEND_ARCHITECTURE | API_CLIENT_RULES.md | CONDITIONAL_MUST | Required if frontend talks to API |  |  |  |
| 07_FRONTEND_ARCHITECTURE | CACHING_FRONTEND.md | OPTIONAL | Required if frontend caching exists |  |  |  |
| 07_FRONTEND_ARCHITECTURE | PERFORMANCE_FRONTEND.md | SHOULD | Required for frontend performance goals |  |  |  |
| 07_FRONTEND_ARCHITECTURE | BROWSER_SUPPORT.md | SHOULD | Required if browser compatibility matters |  |  |  |
| 07_FRONTEND_ARCHITECTURE | PWA_SPEC.md | OPTIONAL | Required if PWA behavior exists |  |  |  |
| 07_FRONTEND_ARCHITECTURE | MOBILE_WEB_RULES.md | SHOULD | Required for responsive mobile web |  |  |  |
| 08_BACKEND_API_DATA | BACKEND_ARCHITECTURE.md | CONDITIONAL_MUST | Required if backend exists |  |  |  |
| 08_BACKEND_API_DATA | API_SPEC.md | CONDITIONAL_MUST | Required if APIs exist |  |  |  |
| 08_BACKEND_API_DATA | API_CONTRACTS.md | SHOULD | Required when request/response contracts matter |  |  |  |
| 08_BACKEND_API_DATA | API_VERSIONING.md | OPTIONAL | Required when API versions exist |  |  |  |
| 08_BACKEND_API_DATA | DATABASE_SCHEMA.md | CONDITIONAL_MUST | Required if database exists |  |  |  |
| 08_BACKEND_API_DATA | DATA_MODEL.md | CONDITIONAL_MUST | Required if domain entities exist |  |  |  |
| 08_BACKEND_API_DATA | DATA_DICTIONARY.md | SHOULD | Required when fields need definitions |  |  |  |
| 08_BACKEND_API_DATA | DATA_FLOW.md | SHOULD | Required when data movement matters |  |  |  |
| 08_BACKEND_API_DATA | VALIDATION_RULES.md | CONDITIONAL_MUST | Required if input/business validation exists |  |  |  |
| 08_BACKEND_API_DATA | BUSINESS_LOGIC_RULES.md | CONDITIONAL_MUST | Required when backend enforces business logic |  |  |  |
| 08_BACKEND_API_DATA | BACKGROUND_JOBS.md | OPTIONAL | Required if async jobs exist |  |  |  |
| 08_BACKEND_API_DATA | QUEUES_AND_WORKERS.md | OPTIONAL | Required if queue/worker system exists |  |  |  |
| 08_BACKEND_API_DATA | FILE_STORAGE.md | CONDITIONAL_MUST | Required if file uploads/storage exist |  |  |  |
| 08_BACKEND_API_DATA | MIGRATION_PLAN.md | OPTIONAL | Required if schema/data migrations matter |  |  |  |
| 08_BACKEND_API_DATA | SEED_DATA.md | SHOULD | Required when demo/initial data is needed |  |  |  |
| 08_BACKEND_API_DATA | SEARCH_SPEC.md | CONDITIONAL_MUST | Required if search exists |  |  |  |
| 08_BACKEND_API_DATA | IMPORT_EXPORT_SPEC.md | OPTIONAL | Required if import/export exists |  |  |  |
| 08_BACKEND_API_DATA | WEBHOOKS.md | CONDITIONAL_MUST | Required if external callbacks exist |  |  |  |
| 08_BACKEND_API_DATA | INTEGRATIONS.md | CONDITIONAL_MUST | Required if third-party systems exist |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | AUTH_SYSTEM.md | CONDITIONAL_MUST | Required if login/auth exists |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | AUTH_FLOWS.md | CONDITIONAL_MUST | Required if auth has multiple flows |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | PASSWORD_POLICY.md | CONDITIONAL_MUST | Required if password auth exists |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | MFA_2FA_SPEC.md | OPTIONAL | Required if MFA/2FA exists |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | OAUTH_SSO_SPEC.md | OPTIONAL | Required if OAuth/SSO exists |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | ENV_AND_SECRETS.md | MUST | Required for real deployment |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | SECURITY_CHECKLIST.md | MUST | Required for production readiness |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | TRUST_SECURITY_NOTES.md | SHOULD | Required when public trust/security messaging matters |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | SPAM_AND_RATE_LIMITING.md | CONDITIONAL_MUST | Required if public forms/login/API can be abused |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | ABUSE_PREVENTION.md | SHOULD | Required for user-generated/public systems |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | THREAT_MODEL.md | SHOULD | Required for security-sensitive systems |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | PRIVACY_DATA_HANDLING.md | CONDITIONAL_MUST | Required if user/personal data exists |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | DATA_RETENTION.md | CONDITIONAL_MUST | Required if personal/business records are stored |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | AUDIT_LOGGING.md | SHOULD | Required for admin/security-sensitive systems |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | ACCESS_REVIEW.md | ENTERPRISE | Required for enterprise access governance |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | SECURITY_INCIDENT_RESPONSE.md | SHOULD | Required for serious production systems |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | COMPLIANCE.md | CONDITIONAL_MUST | Required if compliance obligations exist |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | COOKIE_POLICY.md | CONDITIONAL_MUST | Required if cookies/tracking exist |  |  |  |
| 09_AUTH_SECURITY_PRIVACY | LEGAL_AND_PRIVACY.md | CONDITIONAL_MUST | Required for public/legal/privacy obligations |  |  |  |
| 10_ADMIN_OPERATIONS | ADMIN_PANEL_SPEC.md | CONDITIONAL_MUST | Required if admin panel exists |  |  |  |
| 10_ADMIN_OPERATIONS | ADMIN_WORKFLOWS.md | CONDITIONAL_MUST | Required if admins perform workflows |  |  |  |
| 10_ADMIN_OPERATIONS | USER_MANAGEMENT.md | CONDITIONAL_MUST | Required if admins manage users |  |  |  |
| 10_ADMIN_OPERATIONS | CONTENT_MANAGEMENT.md | CONDITIONAL_MUST | Required if admin manages content |  |  |  |
| 10_ADMIN_OPERATIONS | MODERATION_SYSTEM.md | OPTIONAL | Required if content/users require moderation |  |  |  |
| 10_ADMIN_OPERATIONS | NOTIFICATION_SYSTEM.md | CONDITIONAL_MUST | Required if system notifications exist |  |  |  |
| 10_ADMIN_OPERATIONS | EMAIL_NOTIFICATION_SPEC.md | CONDITIONAL_MUST | Required if email notifications exist |  |  |  |
| 10_ADMIN_OPERATIONS | SYSTEM_SETTINGS.md | SHOULD | Required if configurable settings exist |  |  |  |
| 10_ADMIN_OPERATIONS | OPERATIONS_MANUAL.md | SHOULD | Required for operational workflows |  |  |  |
| 10_ADMIN_OPERATIONS | SUPPORT_WORKFLOWS.md | SHOULD | Required if support team uses the system |  |  |  |
| 10_ADMIN_OPERATIONS | INTERNAL_NOTES.md | OPTIONAL | Required if internal notes exist |  |  |  |
| 10_ADMIN_OPERATIONS | ACTIVITY_LOGS.md | SHOULD | Required if admin/user activity is tracked |  |  |  |
| 10_ADMIN_OPERATIONS | ADMIN_REPORTING.md | CONDITIONAL_MUST | Required if admin reports exist |  |  |  |
| 11_PAYMENTS_BILLING | PAYMENT_SYSTEM.md | CONDITIONAL_MUST | Required if payments exist |  |  |  |
| 11_PAYMENTS_BILLING | BILLING_AND_SUBSCRIPTIONS.md | CONDITIONAL_MUST | Required if billing/subscriptions exist |  |  |  |
| 11_PAYMENTS_BILLING | CHECKOUT_FLOW.md | CONDITIONAL_MUST | Required if checkout exists |  |  |  |
| 11_PAYMENTS_BILLING | CART_AND_ORDER_FLOW.md | CONDITIONAL_MUST | Required if cart/orders exist |  |  |  |
| 11_PAYMENTS_BILLING | INVOICE_AND_RECEIPT_SPEC.md | CONDITIONAL_MUST | Required if invoices/receipts exist |  |  |  |
| 11_PAYMENTS_BILLING | PAYMENT_PROVIDER_INTEGRATION.md | CONDITIONAL_MUST | Required if payment provider exists |  |  |  |
| 11_PAYMENTS_BILLING | PAYMENT_WEBHOOKS.md | CONDITIONAL_MUST | Required if provider sends webhooks |  |  |  |
| 11_PAYMENTS_BILLING | PAYMENT_STATUS_MODEL.md | CONDITIONAL_MUST | Required if payment statuses are tracked |  |  |  |
| 11_PAYMENTS_BILLING | REFUNDS_AND_CANCELLATIONS.md | CONDITIONAL_MUST | Required if refunds/cancellations exist |  |  |  |
| 11_PAYMENTS_BILLING | PAYMENT_SECURITY.md | CONDITIONAL_MUST | Required if payments exist |  |  |  |
| 11_PAYMENTS_BILLING | PAYMENT_FAILURE_HANDLING.md | CONDITIONAL_MUST | Required if payments exist |  |  |  |
| 11_PAYMENTS_BILLING | PAYMENT_RECONCILIATION.md | SHOULD | Required when financial reconciliation matters |  |  |  |
| 11_PAYMENTS_BILLING | TAX_AND_VAT_RULES.md | CONDITIONAL_MUST | Required if tax/VAT applies |  |  |  |
| 11_PAYMENTS_BILLING | COUPONS_DISCOUNTS.md | OPTIONAL | Required if coupons/discounts exist |  |  |  |
| 11_PAYMENTS_BILLING | SUBSCRIPTION_LIFECYCLE.md | CONDITIONAL_MUST | Required if subscriptions exist |  |  |  |
| 11_PAYMENTS_BILLING | PLAN_LIMITS.md | CONDITIONAL_MUST | Required if plans/tiers exist |  |  |  |
| 11_PAYMENTS_BILLING | TRIALS_AND_GRACE_PERIODS.md | OPTIONAL | Required if trials/grace periods exist |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | ANALYTICS_AND_CONVERSION.md | SHOULD | Required if analytics/conversion matter |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | EVENT_TRACKING_PLAN.md | SHOULD | Required if analytics events matter |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | KPI_DEFINITIONS.md | SHOULD | Required if KPIs are tracked |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | FUNNEL_ANALYTICS.md | OPTIONAL | Required if funnels matter |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | REPORTING_SPEC.md | CONDITIONAL_MUST | Required if reports exist |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | DASHBOARDS_SPEC.md | CONDITIONAL_MUST | Required if dashboards exist |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | ERROR_LOGGING_AND_MONITORING.md | MUST | Required for production systems |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | OBSERVABILITY_SPEC.md | SHOULD | Required for serious production systems |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | LOGGING_STRATEGY.md | SHOULD | Required when logs must be consistent |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | ALERTING_RULES.md | SHOULD | Required when incidents need alerts |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | PERFORMANCE_BUDGET.md | SHOULD | Required when performance targets exist |  |  |  |
| 12_ANALYTICS_MONITORING_REPORTS | UPTIME_MONITORING.md | SHOULD | Required for production uptime tracking |  |  |  |
| 13_QA_TESTING_RELEASE | TESTING_STRATEGY.md | MUST | Required for build quality |  |  |  |
| 13_QA_TESTING_RELEASE | TEST_PLAN.md | MUST | Required before release validation |  |  |  |
| 13_QA_TESTING_RELEASE | UNIT_TESTING.md | SHOULD | Required when unit tests are expected |  |  |  |
| 13_QA_TESTING_RELEASE | INTEGRATION_TESTING.md | SHOULD | Required when services/modules integrate |  |  |  |
| 13_QA_TESTING_RELEASE | E2E_TESTING.md | SHOULD | Required for critical user flows |  |  |  |
| 13_QA_TESTING_RELEASE | REGRESSION_TESTING.md | SHOULD | Required for repeat releases |  |  |  |
| 13_QA_TESTING_RELEASE | SECURITY_TESTING.md | SHOULD | Required for security-sensitive systems |  |  |  |
| 13_QA_TESTING_RELEASE | ACCESSIBILITY_TESTING.md | SHOULD | Required for public/accessibility-sensitive systems |  |  |  |
| 13_QA_TESTING_RELEASE | PERFORMANCE_TESTING.md | SHOULD | Required when performance matters |  |  |  |
| 13_QA_TESTING_RELEASE | QA_SECURITY_RELEASE.md | SHOULD | Required for release security/QA gate |  |  |  |
| 13_QA_TESTING_RELEASE | BUG_REPORT_TEMPLATE.md | SHOULD | Required for QA process |  |  |  |
| 13_QA_TESTING_RELEASE | RELEASE_CHECKLIST.md | MUST | Required before production release |  |  |  |
| 13_QA_TESTING_RELEASE | BUILD_CHECKLIST.md | MUST | Required before/during build |  |  |  |
| 13_QA_TESTING_RELEASE | SMOKE_TEST_CHECKLIST.md | SHOULD | Required for release confidence |  |  |  |
| 13_QA_TESTING_RELEASE | ACCEPTANCE_TESTING.md | SHOULD | Required for final acceptance |  |  |  |
| 14_DEPLOYMENT_DEVOPS | DEPLOYMENT_OPERATIONS.md | MUST | Required for deployment |  |  |  |
| 14_DEPLOYMENT_DEVOPS | ENVIRONMENT_SETUP.md | MUST | Required for environments |  |  |  |
| 14_DEPLOYMENT_DEVOPS | LOCAL_DEV_SETUP.md | SHOULD | Required for team onboarding |  |  |  |
| 14_DEPLOYMENT_DEVOPS | STAGING_PRODUCTION_SETUP.md | SHOULD | Required if staging/production exist |  |  |  |
| 14_DEPLOYMENT_DEVOPS | CI_CD.md | SHOULD | Required if CI/CD exists |  |  |  |
| 14_DEPLOYMENT_DEVOPS | BUILD_PIPELINE.md | SHOULD | Required when build pipeline matters |  |  |  |
| 14_DEPLOYMENT_DEVOPS | RELEASE_PROCESS.md | SHOULD | Required for controlled releases |  |  |  |
| 14_DEPLOYMENT_DEVOPS | ROLLBACK_PLAN.md | SHOULD | Required for safe releases |  |  |  |
| 14_DEPLOYMENT_DEVOPS | BACKUP_AND_RECOVERY.md | SHOULD | Required if data must be protected |  |  |  |
| 14_DEPLOYMENT_DEVOPS | DISASTER_RECOVERY.md | ENTERPRISE | Required for high-criticality systems |  |  |  |
| 14_DEPLOYMENT_DEVOPS | MAINTENANCE_PLAN.md | SHOULD | Required for long-term maintenance |  |  |  |
| 14_DEPLOYMENT_DEVOPS | INFRASTRUCTURE_SPEC.md | SHOULD | Required when infrastructure matters |  |  |  |
| 14_DEPLOYMENT_DEVOPS | HOSTING_ARCHITECTURE.md | SHOULD | Required when hosting choices matter |  |  |  |
| 14_DEPLOYMENT_DEVOPS | DOMAIN_DNS_SSL.md | CONDITIONAL_MUST | Required for public domains/SSL |  |  |  |
| 14_DEPLOYMENT_DEVOPS | CDN_AND_EDGE.md | OPTIONAL | Required if CDN/edge is used |  |  |  |
| 15_GOVERNANCE_HANDOFF | BUILDER_HANDOFF.md | MUST | Required for AI/dev handoff |  |  |  |
| 15_GOVERNANCE_HANDOFF | README_FOR_AI_BUILDERS.md | MUST | Required for AI builder context |  |  |  |
| 15_GOVERNANCE_HANDOFF | IMPLEMENTATION_NOTES.md | SHOULD | Required for build notes |  |  |  |
| 15_GOVERNANCE_HANDOFF | DOCS_MAINTENANCE.md | SHOULD | Required to keep docs updated |  |  |  |
| 15_GOVERNANCE_HANDOFF | VERSIONING_RULES.md | SHOULD | Required for versioned projects |  |  |  |
| 15_GOVERNANCE_HANDOFF | CONTRIBUTING.md | SHOULD | Required when multiple contributors exist |  |  |  |
| 15_GOVERNANCE_HANDOFF | CODE_STYLE.md | SHOULD | Required for consistent code |  |  |  |
| 15_GOVERNANCE_HANDOFF | CODE_REVIEW_RULES.md | SHOULD | Required when review process exists |  |  |  |
| 15_GOVERNANCE_HANDOFF | BRANCHING_STRATEGY.md | SHOULD | Required when git workflow matters |  |  |  |
| 15_GOVERNANCE_HANDOFF | DEVELOPMENT_WORKFLOW.md | SHOULD | Required for team delivery process |  |  |  |
| 15_GOVERNANCE_HANDOFF | HANDOFF_CHECKLIST.md | MUST | Required before implementation handoff |  |  |  |
| 15_GOVERNANCE_HANDOFF | PRODUCTION_ROADMAP.md | SHOULD | Required for production path planning |  |  |  |
| 15_GOVERNANCE_HANDOFF | DECISION_GOVERNANCE.md | SHOULD | Required when decisions need approval/control |  |  |  |
| 15_GOVERNANCE_HANDOFF | ANTI_DRIFT_RULES.md | MUST | Required to prevent scope drift |  |  |  |
| 16_OPTIONAL_ENTERPRISE | MULTI_TENANCY.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | TENANT_ISOLATION.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | ORGANIZATION_ACCOUNTS.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | TEAM_MANAGEMENT.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | WORKSPACES.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | ENTERPRISE_PERMISSIONS.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | SSO_ENTERPRISE.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | SLA_AND_SUPPORT.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | AUDIT_AND_COMPLIANCE.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | DATA_RESIDENCY.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | ADVANCED_SECURITY.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | API_KEYS.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | DEVELOPER_PORTAL.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | RATE_LIMITING_ENTERPRISE.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 16_OPTIONAL_ENTERPRISE | CUSTOM_DOMAINS.md | ENTERPRISE | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | MOBILE_APP_SPEC.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | MOBILE_NAVIGATION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | MOBILE_AUTH.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | PUSH_NOTIFICATIONS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | APP_STORE_RELEASE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | PLAY_STORE_RELEASE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | OFFLINE_MODE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | DEVICE_PERMISSIONS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | MOBILE_ANALYTICS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 17_OPTIONAL_MOBILE_APP | MOBILE_DEEP_LINKS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | AI_FEATURES_SPEC.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | PROMPT_SYSTEM.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | AI_GUARDRAILS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | AI_DATA_USAGE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | AI_EVALUATION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | AI_LOGGING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | AUTOMATION_RULES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | HUMAN_IN_THE_LOOP.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | AGENT_WORKFLOWS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | RAG_KNOWLEDGE_BASE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 18_OPTIONAL_AI_AUTOMATION | MODEL_PROVIDER_STRATEGY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | MARKETPLACE_MODEL.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | PRODUCT_CATALOG.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | SELLER_VENDOR_MANAGEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | ORDER_MANAGEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | INVENTORY_RULES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | SHIPPING_DELIVERY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | RETURNS_EXCHANGES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | REVIEWS_RATINGS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | COMMISSIONS_FEES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 19_OPTIONAL_MARKETPLACE_ECOMMERCE | DISPUTE_RESOLUTION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 20_OPTIONAL_BOOKING_SCHEDULING | BOOKING_SYSTEM.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 20_OPTIONAL_BOOKING_SCHEDULING | CALENDAR_INTEGRATION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 20_OPTIONAL_BOOKING_SCHEDULING | AVAILABILITY_RULES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 20_OPTIONAL_BOOKING_SCHEDULING | APPOINTMENT_FLOW.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 20_OPTIONAL_BOOKING_SCHEDULING | RESCHEDULING_CANCELLATION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 20_OPTIONAL_BOOKING_SCHEDULING | BOOKING_NOTIFICATIONS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 20_OPTIONAL_BOOKING_SCHEDULING | STAFF_RESOURCE_SCHEDULING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 20_OPTIONAL_BOOKING_SCHEDULING | TIMEZONE_RULES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | CRM_MODEL.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | LEAD_MANAGEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | PIPELINE_STAGES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | CUSTOMER_PROFILE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | CONTACT_HISTORY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | SALES_WORKFLOWS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | SUPPORT_TICKETS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | SLA_RULES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 21_OPTIONAL_CRM_SALES_SUPPORT | CUSTOMER_NOTIFICATIONS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 22_OPTIONAL_INVENTORY_LOGISTICS | INVENTORY_SYSTEM.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 22_OPTIONAL_INVENTORY_LOGISTICS | WAREHOUSE_MODEL.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 22_OPTIONAL_INVENTORY_LOGISTICS | STOCK_MOVEMENTS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 22_OPTIONAL_INVENTORY_LOGISTICS | ASSET_MANAGEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 22_OPTIONAL_INVENTORY_LOGISTICS | PROCUREMENT_FLOW.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 22_OPTIONAL_INVENTORY_LOGISTICS | SUPPLIER_MANAGEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 22_OPTIONAL_INVENTORY_LOGISTICS | DELIVERY_LOGISTICS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 22_OPTIONAL_INVENTORY_LOGISTICS | FIELD_OPERATIONS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 23_OPTIONAL_LEGAL_POLICY | TERMS_OF_SERVICE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 23_OPTIONAL_LEGAL_POLICY | PRIVACY_POLICY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 23_OPTIONAL_LEGAL_POLICY | COOKIE_POLICY_PAGE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 23_OPTIONAL_LEGAL_POLICY | REFUND_POLICY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 23_OPTIONAL_LEGAL_POLICY | ACCEPTABLE_USE_POLICY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 23_OPTIONAL_LEGAL_POLICY | DATA_PROCESSING_AGREEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 23_OPTIONAL_LEGAL_POLICY | CONSENT_MANAGEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 23_OPTIONAL_LEGAL_POLICY | AGE_RESTRICTIONS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | GENERIC_MD_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | FEATURE_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | PAGE_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | API_ENDPOINT_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | DATABASE_TABLE_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | USER_FLOW_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | DECISION_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | BUG_REPORT_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | RELEASE_NOTES_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 24_TEMPLATES | MEETING_NOTES_TEMPLATE.md | TEMPLATE | Required when this folder/module is explicitly activated |  |  |  |
| 25_OPTIONAL_FINTECH_COMPLIANCE | KYC_KYB.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 25_OPTIONAL_FINTECH_COMPLIANCE | AML_SCREENING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 25_OPTIONAL_FINTECH_COMPLIANCE | FRAUD_DETECTION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 25_OPTIONAL_FINTECH_COMPLIANCE | CHARGEBACKS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 25_OPTIONAL_FINTECH_COMPLIANCE | FINANCIAL_REPORTING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 25_OPTIONAL_FINTECH_COMPLIANCE | PAYMENT_COMPLIANCE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 26_OPTIONAL_HEALTHCARE_MEDICAL | PATIENT_DATA_HANDLING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 26_OPTIONAL_HEALTHCARE_MEDICAL | MEDICAL_PRIVACY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 26_OPTIONAL_HEALTHCARE_MEDICAL | APPOINTMENT_CLINICAL_FLOW.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 26_OPTIONAL_HEALTHCARE_MEDICAL | HEALTHCARE_COMPLIANCE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 26_OPTIONAL_HEALTHCARE_MEDICAL | MEDICAL_RECORDS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 27_OPTIONAL_EDUCATION_LMS | COURSE_MODEL.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 27_OPTIONAL_EDUCATION_LMS | LESSON_CONTENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 27_OPTIONAL_EDUCATION_LMS | STUDENT_PROGRESS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 27_OPTIONAL_EDUCATION_LMS | QUIZZES_ASSESSMENTS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 27_OPTIONAL_EDUCATION_LMS | CERTIFICATES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 27_OPTIONAL_EDUCATION_LMS | INSTRUCTOR_WORKFLOWS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 28_OPTIONAL_REAL_ESTATE | PROPERTY_LISTINGS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 28_OPTIONAL_REAL_ESTATE | PROPERTY_SEARCH.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 28_OPTIONAL_REAL_ESTATE | AGENT_WORKFLOWS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 28_OPTIONAL_REAL_ESTATE | INQUIRY_FLOW.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 28_OPTIONAL_REAL_ESTATE | VIEWING_BOOKING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 29_OPTIONAL_HARDWARE_IOT | DEVICE_MANAGEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 29_OPTIONAL_HARDWARE_IOT | DEVICE_PROVISIONING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 29_OPTIONAL_HARDWARE_IOT | TELEMETRY_DATA.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 29_OPTIONAL_HARDWARE_IOT | FIRMWARE_UPDATES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 29_OPTIONAL_HARDWARE_IOT | DEVICE_SECURITY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 30_OPTIONAL_GAMING_COMMUNITY | GAME_MECHANICS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 30_OPTIONAL_GAMING_COMMUNITY | USER_REWARDS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 30_OPTIONAL_GAMING_COMMUNITY | COMMUNITY_MODERATION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 30_OPTIONAL_GAMING_COMMUNITY | LEADERBOARDS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 30_OPTIONAL_GAMING_COMMUNITY | VIRTUAL_ITEMS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 31_OPTIONAL_BLOCKCHAIN_WEB3 | WALLET_CONNECTION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 31_OPTIONAL_BLOCKCHAIN_WEB3 | SMART_CONTRACTS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 31_OPTIONAL_BLOCKCHAIN_WEB3 | TOKENOMICS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 31_OPTIONAL_BLOCKCHAIN_WEB3 | ON_CHAIN_OFF_CHAIN_DATA.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 31_OPTIONAL_BLOCKCHAIN_WEB3 | WEB3_SECURITY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 32_OPTIONAL_GOVERNMENT_PUBLIC_SECTOR | PUBLIC_SERVICE_FLOW.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 32_OPTIONAL_GOVERNMENT_PUBLIC_SECTOR | CITIZEN_DATA_HANDLING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 32_OPTIONAL_GOVERNMENT_PUBLIC_SECTOR | PUBLIC_RECORDS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 32_OPTIONAL_GOVERNMENT_PUBLIC_SECTOR | PROCUREMENT_RULES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 32_OPTIONAL_GOVERNMENT_PUBLIC_SECTOR | ACCESSIBILITY_COMPLIANCE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 33_OPTIONAL_DATA_AI_ADVANCED | DATA_PIPELINE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 33_OPTIONAL_DATA_AI_ADVANCED | DATA_WAREHOUSE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 33_OPTIONAL_DATA_AI_ADVANCED | ML_MODEL_LIFECYCLE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 33_OPTIONAL_DATA_AI_ADVANCED | MODEL_MONITORING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 33_OPTIONAL_DATA_AI_ADVANCED | DATA_LABELING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 33_OPTIONAL_DATA_AI_ADVANCED | DATA_QUALITY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 34_OPTIONAL_COMMUNICATIONS | CHAT_SYSTEM.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 34_OPTIONAL_COMMUNICATIONS | IN_APP_MESSAGING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 34_OPTIONAL_COMMUNICATIONS | SMS_NOTIFICATIONS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 34_OPTIONAL_COMMUNICATIONS | EMAIL_DELIVERABILITY.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 34_OPTIONAL_COMMUNICATIONS | CALL_CENTER_INTEGRATION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 35_OPTIONAL_DOCUMENTS_FILES | DOCUMENT_MANAGEMENT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 35_OPTIONAL_DOCUMENTS_FILES | PDF_GENERATION.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 35_OPTIONAL_DOCUMENTS_FILES | E_SIGNATURE.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 35_OPTIONAL_DOCUMENTS_FILES | DOCUMENT_VERSIONING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 35_OPTIONAL_DOCUMENTS_FILES | FILE_PERMISSIONS.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 36_OPTIONAL_SEARCH_DISCOVERY | GLOBAL_SEARCH.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 36_OPTIONAL_SEARCH_DISCOVERY | FILTERING_SORTING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 36_OPTIONAL_SEARCH_DISCOVERY | RECOMMENDATION_SYSTEM.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 36_OPTIONAL_SEARCH_DISCOVERY | SAVED_SEARCHES.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 37_OPTIONAL_MIGRATION_LEGACY | LEGACY_SYSTEM_AUDIT.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 37_OPTIONAL_MIGRATION_LEGACY | DATA_MIGRATION_MAPPING.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 37_OPTIONAL_MIGRATION_LEGACY | CUTOVER_PLAN.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 37_OPTIONAL_MIGRATION_LEGACY | PARALLEL_RUN_PLAN.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
| 37_OPTIONAL_MIGRATION_LEGACY | DECOMMISSION_PLAN.md | CONDITIONAL_MUST | Required when this folder/module is explicitly activated |  |  |  |
