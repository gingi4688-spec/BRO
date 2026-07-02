# PACK_INDEX.md
Full folder and file index for STANDARD_PROJECT_DOCS_PACK.

## 00_MASTER
- `STANDARD_PROJECT_DOCS_PACK.md` — **MUST** — Always required as the canonical framework reference
- `PACK_INDEX.md` — **MUST** — Required to list all framework folders and files
- `PACK_USAGE_GUIDE.md` — **MUST** — Required to explain how to use the standard
- `PACK_DECISION_TREE.md` — **MUST** — Required before selecting docs for a project
- `DOCS_DEPENDENCY_GRAPH.md` — **MUST** — Required to control fill order and dependencies
- `PROJECT_DOCS_SELECTION.md` — **MUST** — Required before build for every project
- `FILE_STATUS_MATRIX.md` — **MUST** — Required to classify all framework files
- `FILL_ORDER.md` — **MUST** — Required to define safe document creation order
- `AI_BUILDER_RULES.md` — **MUST** — Required when AI/builders create project docs
- `TEMPLATE_CONVENTIONS.md` — **SHOULD** — Required when templates are used
- `SOURCE_OF_TRUTH_RULES.md` — **MUST** — Required to resolve conflicting docs

## 01_CORE
- `README.md` — **MUST** — Required for project entry point
- `PROJECT_CONTEXT.md` — **MUST** — Required for project understanding
- `PROJECT_BRIEF.md` — **MUST** — Required for project definition
- `PROJECT_GOALS.md` — **SHOULD** — Required when goals must be explicit
- `PROJECT_VISION.md` — **SHOULD** — Required for long-term product direction
- `PROBLEM_STATEMENT.md` — **SHOULD** — Required when the problem must be clearly framed
- `TARGET_AUDIENCE.md` — **MUST** — Required for user/customer definition
- `STAKEHOLDERS.md` — **SHOULD** — Required when multiple owners/teams exist
- `SUCCESS_METRICS.md` — **SHOULD** — Required when measurable success matters
- `NON_GOALS.md` — **MUST** — Required to prevent scope creep
- `MVP_SCOPE.md` — **MUST** — Required before build scope is defined
- `ASSUMPTIONS.md` — **SHOULD** — Required when assumptions affect build decisions
- `CONSTRAINTS.md` — **SHOULD** — Required when time, budget, tech, legal, or business constraints exist
- `RISKS.md` — **SHOULD** — Required when delivery/product/security risks exist
- `GLOSSARY.md` — **SHOULD** — Required when terms need shared meaning
- `OPEN_ITEMS_LOG.md` — **MUST** — Required when unanswered questions exist
- `DECISIONS_LOG.md` — **MUST** — Required for approved decisions
- `CHANGELOG.md` — **SHOULD** — Required when docs/product changes are tracked

## 02_PRODUCT_STRATEGY
- `PRODUCT_REQUIREMENTS.md` — **MUST** — Required for product behavior
- `FEATURE_SPEC.md` — **SHOULD** — Required when features need detailed behavior
- `FEATURE_CATALOG.md` — **SHOULD** — Required when feature inventory is needed
- `FEATURE_PRIORITY_MATRIX.md` — **SHOULD** — Required when prioritization matters
- `ROADMAP.md` — **SHOULD** — Required when timeline/milestones matter
- `PRODUCT_ROADMAP.md` — **SHOULD** — Required when feature evolution by release matters
- `RELEASE_SCOPE.md` — **SHOULD** — Required when release boundaries matter
- `PRIORITIZATION.md` — **SHOULD** — Required when feature order must be justified
- `USE_CASES.md` — **SHOULD** — Required when user/system scenarios matter
- `USER_STORIES.md` — **SHOULD** — Required when build tasks need user-centered framing
- `USER_PERSONAS.md` — **OPTIONAL** — Required when audience types need deeper modeling
- `JOBS_TO_BE_DONE.md` — **OPTIONAL** — Required when outcome-based product thinking is needed
- `BUSINESS_RULES.md` — **MUST** — Required when product has rules/workflows
- `EDGE_CASES.md` — **SHOULD** — Required when failure/exception behavior matters
- `ACCEPTANCE_CRITERIA.md` — **SHOULD** — Required before QA/build validation

## 03_USER_ACCESS_ROLES
- `USER_ROLES.md` — **CONDITIONAL_MUST** — Required if project has users or roles
- `ROLE_MODEL.md` — **CONDITIONAL_MUST** — Required if role relationships must be defined
- `PERMISSION_SYSTEM.md` — **CONDITIONAL_MUST** — Required if access control exists
- `ACCESS_CONTROL_MATRIX.md` — **CONDITIONAL_MUST** — Required if multiple roles/permissions exist
- `USER_LIFECYCLE.md` — **CONDITIONAL_MUST** — Required if users are invited/activated/suspended/deleted
- `INVITATION_FLOW.md` — **CONDITIONAL_MUST** — Required if invitations exist
- `ACCOUNT_STATES.md` — **CONDITIONAL_MUST** — Required if account states matter
- `SESSION_RULES.md` — **CONDITIONAL_MUST** — Required if login/session behavior exists
- `ADMIN_ACCESS_RULES.md` — **CONDITIONAL_MUST** — Required if admin access exists

## 04_UX_INFORMATION_ARCHITECTURE
- `UX_FLOW.md` — **SHOULD** — Required when user flow matters
- `USER_JOURNEYS.md` — **SHOULD** — Required for multi-step user journeys
- `INFORMATION_ARCHITECTURE.md` — **SHOULD** — Required for multi-page products
- `SITEMAP.md` — **SHOULD** — Required for websites/content structures
- `ROUTES_AND_NAVIGATION.md` — **MUST** — Required for frontend routing/navigation
- `NAVIGATION_RULES.md` — **SHOULD** — Required when nav visibility or hierarchy matters
- `PAGE_INVENTORY.md` — **SHOULD** — Required for page-level planning
- `SCREEN_INVENTORY.md` — **SHOULD** — Required for app/admin screen planning
- `WIREFRAME_NOTES.md` — **OPTIONAL** — Required when wireframe decisions must be documented
- `EMPTY_STATES.md` — **SHOULD** — Required for empty data/page states
- `LOADING_STATES.md` — **SHOULD** — Required for async/loading experiences
- `ERROR_STATES.md` — **SHOULD** — Required for user-facing error states

## 05_UI_DESIGN_SYSTEM
- `DESIGN_TOKENS.md` — **MUST** — Required for no-hardcode UI
- `DESIGN_SYSTEM_RULES.md` — **MUST** — Required for UI consistency
- `COMPONENT_SPEC.md` — **SHOULD** — Required for reusable UI components
- `UI_PAGE_STRUCTURE.md` — **MUST** — Required for page-level layout
- `RESPONSIVE_RULES.md` — **SHOULD** — Required for mobile/tablet/desktop behavior
- `ACCESSIBILITY_SPEC.md` — **SHOULD** — Required for accessible UX/UI
- `INTERACTION_RULES.md` — **SHOULD** — Required when interactions need consistency
- `MICROCOPY.md` — **OPTIONAL** — Required when button/label/help text needs control
- `ANIMATION_AND_MOTION.md` — **OPTIONAL** — Required when motion is part of UX
- `ICONOGRAPHY.md` — **OPTIONAL** — Required when icon system matters
- `THEME_SYSTEM.md` — **OPTIONAL** — Required when theme abstraction exists
- `DARK_LIGHT_MODE.md` — **OPTIONAL** — Required when dark/light mode exists
- `BRAND_UI_RULES.md` — **SHOULD** — Required when brand visuals must be enforced

## 06_CONTENT_SEO_BRAND
- `CONTENT_MODEL.md` — **CONDITIONAL_MUST** — Required if project has managed content
- `CONTENT_COPY.md` — **SHOULD** — Required for public-facing copy
- `CONTENT_INVENTORY.md` — **SHOULD** — Required when many content pieces/pages exist
- `CONTENT_GOVERNANCE.md` — **CONDITIONAL_MUST** — Required if content approval/publishing workflow exists
- `BRAND_VOICE.md` — **SHOULD** — Required for consistent tone
- `BRAND_GUIDELINES.md` — **SHOULD** — Required when brand rules exist
- `SEO_CONTENT.md` — **CONDITIONAL_MUST** — Required if SEO matters
- `SEO_TECHNICAL_SPEC.md` — **CONDITIONAL_MUST** — Required if technical SEO matters
- `METADATA_RULES.md` — **CONDITIONAL_MUST** — Required if SEO/social previews matter
- `OPEN_GRAPH_SPEC.md` — **OPTIONAL** — Required when social sharing previews matter
- `SITEMAP_ROBOTS.md` — **CONDITIONAL_MUST** — Required for indexable public websites
- `STRUCTURED_DATA.md` — **OPTIONAL** — Required if schema markup matters
- `MEDIA_AND_ASSETS.md` — **SHOULD** — Required when images/files/icons are used
- `IMAGE_GUIDELINES.md` — **OPTIONAL** — Required when image quality/format matters
- `I18N_LANGUAGE_SYSTEM.md` — **CONDITIONAL_MUST** — Required if multiple languages exist
- `TRANSLATION_RULES.md` — **CONDITIONAL_MUST** — Required if translations exist
- `LOCALIZATION_RULES.md` — **OPTIONAL** — Required when region-specific formats/content matter

## 07_FRONTEND_ARCHITECTURE
- `FRONTEND_ARCHITECTURE.md` — **MUST** — Required for frontend build
- `PROJECT_STRUCTURE.md` — **MUST** — Required for repo/folder layout
- `ROUTING_ARCHITECTURE.md` — **MUST** — Required for app routing
- `STATE_MANAGEMENT.md` — **SHOULD** — Required if app has complex state
- `FORM_ARCHITECTURE.md` — **CONDITIONAL_MUST** — Required if forms exist
- `FORM_AND_LEAD_FLOW.md` — **CONDITIONAL_MUST** — Required if forms create leads/requests
- `FRONTEND_VALIDATION.md` — **CONDITIONAL_MUST** — Required if forms/input validation exist
- `ERROR_HANDLING_FRONTEND.md` — **SHOULD** — Required for frontend errors
- `API_CLIENT_RULES.md` — **CONDITIONAL_MUST** — Required if frontend talks to API
- `CACHING_FRONTEND.md` — **OPTIONAL** — Required if frontend caching exists
- `PERFORMANCE_FRONTEND.md` — **SHOULD** — Required for frontend performance goals
- `BROWSER_SUPPORT.md` — **SHOULD** — Required if browser compatibility matters
- `PWA_SPEC.md` — **OPTIONAL** — Required if PWA behavior exists
- `MOBILE_WEB_RULES.md` — **SHOULD** — Required for responsive mobile web

## 08_BACKEND_API_DATA
- `BACKEND_ARCHITECTURE.md` — **CONDITIONAL_MUST** — Required if backend exists
- `API_SPEC.md` — **CONDITIONAL_MUST** — Required if APIs exist
- `API_CONTRACTS.md` — **SHOULD** — Required when request/response contracts matter
- `API_VERSIONING.md` — **OPTIONAL** — Required when API versions exist
- `DATABASE_SCHEMA.md` — **CONDITIONAL_MUST** — Required if database exists
- `DATA_MODEL.md` — **CONDITIONAL_MUST** — Required if domain entities exist
- `DATA_DICTIONARY.md` — **SHOULD** — Required when fields need definitions
- `DATA_FLOW.md` — **SHOULD** — Required when data movement matters
- `VALIDATION_RULES.md` — **CONDITIONAL_MUST** — Required if input/business validation exists
- `BUSINESS_LOGIC_RULES.md` — **CONDITIONAL_MUST** — Required when backend enforces business logic
- `BACKGROUND_JOBS.md` — **OPTIONAL** — Required if async jobs exist
- `QUEUES_AND_WORKERS.md` — **OPTIONAL** — Required if queue/worker system exists
- `FILE_STORAGE.md` — **CONDITIONAL_MUST** — Required if file uploads/storage exist
- `MIGRATION_PLAN.md` — **OPTIONAL** — Required if schema/data migrations matter
- `SEED_DATA.md` — **SHOULD** — Required when demo/initial data is needed
- `SEARCH_SPEC.md` — **CONDITIONAL_MUST** — Required if search exists
- `IMPORT_EXPORT_SPEC.md` — **OPTIONAL** — Required if import/export exists
- `WEBHOOKS.md` — **CONDITIONAL_MUST** — Required if external callbacks exist
- `INTEGRATIONS.md` — **CONDITIONAL_MUST** — Required if third-party systems exist

## 09_AUTH_SECURITY_PRIVACY
- `AUTH_SYSTEM.md` — **CONDITIONAL_MUST** — Required if login/auth exists
- `AUTH_FLOWS.md` — **CONDITIONAL_MUST** — Required if auth has multiple flows
- `PASSWORD_POLICY.md` — **CONDITIONAL_MUST** — Required if password auth exists
- `MFA_2FA_SPEC.md` — **OPTIONAL** — Required if MFA/2FA exists
- `OAUTH_SSO_SPEC.md` — **OPTIONAL** — Required if OAuth/SSO exists
- `ENV_AND_SECRETS.md` — **MUST** — Required for real deployment
- `SECURITY_CHECKLIST.md` — **MUST** — Required for production readiness
- `TRUST_SECURITY_NOTES.md` — **SHOULD** — Required when public trust/security messaging matters
- `SPAM_AND_RATE_LIMITING.md` — **CONDITIONAL_MUST** — Required if public forms/login/API can be abused
- `ABUSE_PREVENTION.md` — **SHOULD** — Required for user-generated/public systems
- `THREAT_MODEL.md` — **SHOULD** — Required for security-sensitive systems
- `PRIVACY_DATA_HANDLING.md` — **CONDITIONAL_MUST** — Required if user/personal data exists
- `DATA_RETENTION.md` — **CONDITIONAL_MUST** — Required if personal/business records are stored
- `AUDIT_LOGGING.md` — **SHOULD** — Required for admin/security-sensitive systems
- `ACCESS_REVIEW.md` — **ENTERPRISE** — Required for enterprise access governance
- `SECURITY_INCIDENT_RESPONSE.md` — **SHOULD** — Required for serious production systems
- `COMPLIANCE.md` — **CONDITIONAL_MUST** — Required if compliance obligations exist
- `COOKIE_POLICY.md` — **CONDITIONAL_MUST** — Required if cookies/tracking exist
- `LEGAL_AND_PRIVACY.md` — **CONDITIONAL_MUST** — Required for public/legal/privacy obligations

## 10_ADMIN_OPERATIONS
- `ADMIN_PANEL_SPEC.md` — **CONDITIONAL_MUST** — Required if admin panel exists
- `ADMIN_WORKFLOWS.md` — **CONDITIONAL_MUST** — Required if admins perform workflows
- `USER_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required if admins manage users
- `CONTENT_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required if admin manages content
- `MODERATION_SYSTEM.md` — **OPTIONAL** — Required if content/users require moderation
- `NOTIFICATION_SYSTEM.md` — **CONDITIONAL_MUST** — Required if system notifications exist
- `EMAIL_NOTIFICATION_SPEC.md` — **CONDITIONAL_MUST** — Required if email notifications exist
- `SYSTEM_SETTINGS.md` — **SHOULD** — Required if configurable settings exist
- `OPERATIONS_MANUAL.md` — **SHOULD** — Required for operational workflows
- `SUPPORT_WORKFLOWS.md` — **SHOULD** — Required if support team uses the system
- `INTERNAL_NOTES.md` — **OPTIONAL** — Required if internal notes exist
- `ACTIVITY_LOGS.md` — **SHOULD** — Required if admin/user activity is tracked
- `ADMIN_REPORTING.md` — **CONDITIONAL_MUST** — Required if admin reports exist

## 11_PAYMENTS_BILLING
- `PAYMENT_SYSTEM.md` — **CONDITIONAL_MUST** — Required if payments exist
- `BILLING_AND_SUBSCRIPTIONS.md` — **CONDITIONAL_MUST** — Required if billing/subscriptions exist
- `CHECKOUT_FLOW.md` — **CONDITIONAL_MUST** — Required if checkout exists
- `CART_AND_ORDER_FLOW.md` — **CONDITIONAL_MUST** — Required if cart/orders exist
- `INVOICE_AND_RECEIPT_SPEC.md` — **CONDITIONAL_MUST** — Required if invoices/receipts exist
- `PAYMENT_PROVIDER_INTEGRATION.md` — **CONDITIONAL_MUST** — Required if payment provider exists
- `PAYMENT_WEBHOOKS.md` — **CONDITIONAL_MUST** — Required if provider sends webhooks
- `PAYMENT_STATUS_MODEL.md` — **CONDITIONAL_MUST** — Required if payment statuses are tracked
- `REFUNDS_AND_CANCELLATIONS.md` — **CONDITIONAL_MUST** — Required if refunds/cancellations exist
- `PAYMENT_SECURITY.md` — **CONDITIONAL_MUST** — Required if payments exist
- `PAYMENT_FAILURE_HANDLING.md` — **CONDITIONAL_MUST** — Required if payments exist
- `PAYMENT_RECONCILIATION.md` — **SHOULD** — Required when financial reconciliation matters
- `TAX_AND_VAT_RULES.md` — **CONDITIONAL_MUST** — Required if tax/VAT applies
- `COUPONS_DISCOUNTS.md` — **OPTIONAL** — Required if coupons/discounts exist
- `SUBSCRIPTION_LIFECYCLE.md` — **CONDITIONAL_MUST** — Required if subscriptions exist
- `PLAN_LIMITS.md` — **CONDITIONAL_MUST** — Required if plans/tiers exist
- `TRIALS_AND_GRACE_PERIODS.md` — **OPTIONAL** — Required if trials/grace periods exist

## 12_ANALYTICS_MONITORING_REPORTS
- `ANALYTICS_AND_CONVERSION.md` — **SHOULD** — Required if analytics/conversion matter
- `EVENT_TRACKING_PLAN.md` — **SHOULD** — Required if analytics events matter
- `KPI_DEFINITIONS.md` — **SHOULD** — Required if KPIs are tracked
- `FUNNEL_ANALYTICS.md` — **OPTIONAL** — Required if funnels matter
- `REPORTING_SPEC.md` — **CONDITIONAL_MUST** — Required if reports exist
- `DASHBOARDS_SPEC.md` — **CONDITIONAL_MUST** — Required if dashboards exist
- `ERROR_LOGGING_AND_MONITORING.md` — **MUST** — Required for production systems
- `OBSERVABILITY_SPEC.md` — **SHOULD** — Required for serious production systems
- `LOGGING_STRATEGY.md` — **SHOULD** — Required when logs must be consistent
- `ALERTING_RULES.md` — **SHOULD** — Required when incidents need alerts
- `PERFORMANCE_BUDGET.md` — **SHOULD** — Required when performance targets exist
- `UPTIME_MONITORING.md` — **SHOULD** — Required for production uptime tracking

## 13_QA_TESTING_RELEASE
- `APP_AUDIT_MASTER.md` — **MUST** — Bro's canonical evidence-first production-readiness audit standard (~57 de-duped dimensions, app-type profiles, bilingual)
- `APP_AUDIT_REPORT_TEMPLATE.md` — **MUST** — The per-project fill-in audit report (proves state with evidence; pairs with APP_AUDIT_MASTER)
- `TESTING_STRATEGY.md` — **MUST** — Required for build quality
- `TEST_PLAN.md` — **MUST** — Required before release validation
- `UNIT_TESTING.md` — **SHOULD** — Required when unit tests are expected
- `INTEGRATION_TESTING.md` — **SHOULD** — Required when services/modules integrate
- `E2E_TESTING.md` — **SHOULD** — Required for critical user flows
- `REGRESSION_TESTING.md` — **SHOULD** — Required for repeat releases
- `SECURITY_TESTING.md` — **SHOULD** — Required for security-sensitive systems
- `ACCESSIBILITY_TESTING.md` — **SHOULD** — Required for public/accessibility-sensitive systems
- `PERFORMANCE_TESTING.md` — **SHOULD** — Required when performance matters
- `QA_SECURITY_RELEASE.md` — **SHOULD** — Required for release security/QA gate
- `BUG_REPORT_TEMPLATE.md` — **SHOULD** — Required for QA process
- `RELEASE_CHECKLIST.md` — **MUST** — Required before production release
- `BUILD_CHECKLIST.md` — **MUST** — Required before/during build
- `SMOKE_TEST_CHECKLIST.md` — **SHOULD** — Required for release confidence
- `ACCEPTANCE_TESTING.md` — **SHOULD** — Required for final acceptance

## 14_DEPLOYMENT_DEVOPS
- `DEPLOYMENT_OPERATIONS.md` — **MUST** — Required for deployment
- `ENVIRONMENT_SETUP.md` — **MUST** — Required for environments
- `LOCAL_DEV_SETUP.md` — **SHOULD** — Required for team onboarding
- `STAGING_PRODUCTION_SETUP.md` — **SHOULD** — Required if staging/production exist
- `CI_CD.md` — **SHOULD** — Required if CI/CD exists
- `BUILD_PIPELINE.md` — **SHOULD** — Required when build pipeline matters
- `RELEASE_PROCESS.md` — **SHOULD** — Required for controlled releases
- `ROLLBACK_PLAN.md` — **SHOULD** — Required for safe releases
- `BACKUP_AND_RECOVERY.md` — **SHOULD** — Required if data must be protected
- `DISASTER_RECOVERY.md` — **ENTERPRISE** — Required for high-criticality systems
- `MAINTENANCE_PLAN.md` — **SHOULD** — Required for long-term maintenance
- `INFRASTRUCTURE_SPEC.md` — **SHOULD** — Required when infrastructure matters
- `HOSTING_ARCHITECTURE.md` — **SHOULD** — Required when hosting choices matter
- `DOMAIN_DNS_SSL.md` — **CONDITIONAL_MUST** — Required for public domains/SSL
- `CDN_AND_EDGE.md` — **OPTIONAL** — Required if CDN/edge is used

## 15_GOVERNANCE_HANDOFF
- `BUILDER_HANDOFF.md` — **MUST** — Required for AI/dev handoff
- `README_FOR_AI_BUILDERS.md` — **MUST** — Required for AI builder context
- `IMPLEMENTATION_NOTES.md` — **SHOULD** — Required for build notes
- `DOCS_MAINTENANCE.md` — **SHOULD** — Required to keep docs updated
- `VERSIONING_RULES.md` — **SHOULD** — Required for versioned projects
- `CONTRIBUTING.md` — **SHOULD** — Required when multiple contributors exist
- `CODE_STYLE.md` — **SHOULD** — Required for consistent code
- `CODE_REVIEW_RULES.md` — **SHOULD** — Required when review process exists
- `BRANCHING_STRATEGY.md` — **SHOULD** — Required when git workflow matters
- `DEVELOPMENT_WORKFLOW.md` — **SHOULD** — Required for team delivery process
- `HANDOFF_CHECKLIST.md` — **MUST** — Required before implementation handoff
- `PRODUCTION_ROADMAP.md` — **SHOULD** — Required for production path planning
- `DECISION_GOVERNANCE.md` — **SHOULD** — Required when decisions need approval/control
- `ANTI_DRIFT_RULES.md` — **MUST** — Required to prevent scope drift

## 16_OPTIONAL_ENTERPRISE
- `MULTI_TENANCY.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `TENANT_ISOLATION.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `ORGANIZATION_ACCOUNTS.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `TEAM_MANAGEMENT.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `WORKSPACES.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `ENTERPRISE_PERMISSIONS.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `SSO_ENTERPRISE.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `SLA_AND_SUPPORT.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `AUDIT_AND_COMPLIANCE.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `DATA_RESIDENCY.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `ADVANCED_SECURITY.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `API_KEYS.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `DEVELOPER_PORTAL.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `RATE_LIMITING_ENTERPRISE.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated
- `CUSTOM_DOMAINS.md` — **ENTERPRISE** — Required when this folder/module is explicitly activated

## 17_OPTIONAL_MOBILE_APP
- `MOBILE_APP_SPEC.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `MOBILE_NAVIGATION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `MOBILE_AUTH.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PUSH_NOTIFICATIONS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `APP_STORE_RELEASE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PLAY_STORE_RELEASE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `OFFLINE_MODE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DEVICE_PERMISSIONS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `MOBILE_ANALYTICS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `MOBILE_DEEP_LINKS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 18_OPTIONAL_AI_AUTOMATION
- `AI_FEATURES_SPEC.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PROMPT_SYSTEM.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AI_GUARDRAILS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AI_DATA_USAGE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AI_EVALUATION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AI_LOGGING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AUTOMATION_RULES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `HUMAN_IN_THE_LOOP.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AGENT_WORKFLOWS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `RAG_KNOWLEDGE_BASE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `MODEL_PROVIDER_STRATEGY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 19_OPTIONAL_MARKETPLACE_ECOMMERCE
- `MARKETPLACE_MODEL.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PRODUCT_CATALOG.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SELLER_VENDOR_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `ORDER_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `INVENTORY_RULES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SHIPPING_DELIVERY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `RETURNS_EXCHANGES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `REVIEWS_RATINGS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `COMMISSIONS_FEES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DISPUTE_RESOLUTION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 20_OPTIONAL_BOOKING_SCHEDULING
- `BOOKING_SYSTEM.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CALENDAR_INTEGRATION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AVAILABILITY_RULES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `APPOINTMENT_FLOW.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `RESCHEDULING_CANCELLATION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `BOOKING_NOTIFICATIONS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `STAFF_RESOURCE_SCHEDULING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `TIMEZONE_RULES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 21_OPTIONAL_CRM_SALES_SUPPORT
- `CRM_MODEL.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `LEAD_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PIPELINE_STAGES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CUSTOMER_PROFILE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CONTACT_HISTORY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SALES_WORKFLOWS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SUPPORT_TICKETS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SLA_RULES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CUSTOMER_NOTIFICATIONS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 22_OPTIONAL_INVENTORY_LOGISTICS
- `INVENTORY_SYSTEM.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `WAREHOUSE_MODEL.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `STOCK_MOVEMENTS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `ASSET_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PROCUREMENT_FLOW.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SUPPLIER_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DELIVERY_LOGISTICS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `FIELD_OPERATIONS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 23_OPTIONAL_LEGAL_POLICY
- `TERMS_OF_SERVICE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PRIVACY_POLICY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `COOKIE_POLICY_PAGE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `REFUND_POLICY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `ACCEPTABLE_USE_POLICY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DATA_PROCESSING_AGREEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CONSENT_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AGE_RESTRICTIONS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 24_TEMPLATES
- `GENERIC_MD_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `FEATURE_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `PAGE_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `API_ENDPOINT_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `DATABASE_TABLE_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `USER_FLOW_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `DECISION_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `BUG_REPORT_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `RELEASE_NOTES_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated
- `MEETING_NOTES_TEMPLATE.md` — **TEMPLATE** — Required when this folder/module is explicitly activated

## 25_OPTIONAL_FINTECH_COMPLIANCE
- `KYC_KYB.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AML_SCREENING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `FRAUD_DETECTION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CHARGEBACKS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `FINANCIAL_REPORTING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PAYMENT_COMPLIANCE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 26_OPTIONAL_HEALTHCARE_MEDICAL
- `PATIENT_DATA_HANDLING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `MEDICAL_PRIVACY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `APPOINTMENT_CLINICAL_FLOW.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `HEALTHCARE_COMPLIANCE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `MEDICAL_RECORDS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 27_OPTIONAL_EDUCATION_LMS
- `COURSE_MODEL.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `LESSON_CONTENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `STUDENT_PROGRESS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `QUIZZES_ASSESSMENTS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CERTIFICATES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `INSTRUCTOR_WORKFLOWS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 28_OPTIONAL_REAL_ESTATE
- `PROPERTY_LISTINGS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PROPERTY_SEARCH.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `AGENT_WORKFLOWS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `INQUIRY_FLOW.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `VIEWING_BOOKING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 29_OPTIONAL_HARDWARE_IOT
- `DEVICE_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DEVICE_PROVISIONING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `TELEMETRY_DATA.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `FIRMWARE_UPDATES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DEVICE_SECURITY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 30_OPTIONAL_GAMING_COMMUNITY
- `GAME_MECHANICS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `USER_REWARDS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `COMMUNITY_MODERATION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `LEADERBOARDS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `VIRTUAL_ITEMS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 31_OPTIONAL_BLOCKCHAIN_WEB3
- `WALLET_CONNECTION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SMART_CONTRACTS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `TOKENOMICS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `ON_CHAIN_OFF_CHAIN_DATA.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `WEB3_SECURITY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 32_OPTIONAL_GOVERNMENT_PUBLIC_SECTOR
- `PUBLIC_SERVICE_FLOW.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CITIZEN_DATA_HANDLING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PUBLIC_RECORDS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PROCUREMENT_RULES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `ACCESSIBILITY_COMPLIANCE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 33_OPTIONAL_DATA_AI_ADVANCED
- `DATA_PIPELINE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DATA_WAREHOUSE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `ML_MODEL_LIFECYCLE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `MODEL_MONITORING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DATA_LABELING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DATA_QUALITY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 34_OPTIONAL_COMMUNICATIONS
- `CHAT_SYSTEM.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `IN_APP_MESSAGING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SMS_NOTIFICATIONS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `EMAIL_DELIVERABILITY.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CALL_CENTER_INTEGRATION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 35_OPTIONAL_DOCUMENTS_FILES
- `DOCUMENT_MANAGEMENT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PDF_GENERATION.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `E_SIGNATURE.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DOCUMENT_VERSIONING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `FILE_PERMISSIONS.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 36_OPTIONAL_SEARCH_DISCOVERY
- `GLOBAL_SEARCH.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `FILTERING_SORTING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `RECOMMENDATION_SYSTEM.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `SAVED_SEARCHES.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated

## 37_OPTIONAL_MIGRATION_LEGACY
- `LEGACY_SYSTEM_AUDIT.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DATA_MIGRATION_MAPPING.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `CUTOVER_PLAN.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `PARALLEL_RUN_PLAN.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
- `DECOMMISSION_PLAN.md` — **CONDITIONAL_MUST** — Required when this folder/module is explicitly activated
