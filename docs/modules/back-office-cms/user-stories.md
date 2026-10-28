<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Back Office (CMS) -->
<!-- Title: User Stories - Aggregator Back Office (CMS) -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/back-office-cms/user-stories.md`

# User Stories - Aggregator Back Office (CMS)

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

Back-office stories that belong to another module live there: brand set-up and pausing (BRD), catalog and brand-only packs (CAT), the automatic sell-back window (COL-8), shipping queue and state rules (SHP), caps, alerts and credit approval (FND).

### OPS-1 — Work within my role

Requirement: **Validated** · Baseline: **New** · Rules: OPS-R1

**As a** back-office user, **I want** to see and do exactly what my role allows, **so that** each person has the access their job needs and no more.

Acceptance criteria:

- Given my role, when I sign in, then I see only the screens and actions the role grid gives it.
- Given an action my role does not allow, when I try it by any route, then it is refused.

Notes: Q-22, Q-34.

### OPS-2 — Brand staff stay in their brand

Requirement: **Validated** · Baseline: **New** · Rules: OPS-R2

**As a** brand, **I want** my staff to see only my brand and other brands' staff never to see mine, **so that** our players and figures stay private.

Acceptance criteria:

- Given I am staff of brand A, when I search, list, open a link or export, then everything comes from brand A only.
- Given a record of brand B, when I reach for it by any route, then I get nothing.

Notes: G4, Q-22.

### OPS-3 — Look up a player

Requirement: **Validated** · Baseline: **New** · Rules: OPS-R3

**As** Patrianna support, **I want** to find a player and see everything they did on their brand, **so that** I can answer their questions.

Acceptance criteria:

- Given a player's brand and identifier, when I search, then I find the player.
- Given the player, when I open them, then I see their purchases, cards and unopened packs, sell-backs, automatic sell-backs, shipments, credits and history.
- Given one of their purchases, when the player asks, then I can retrieve its fairness proof (BUY-9).
- Given I am brand staff, when I look up players, then I find only my own brand's.

Notes: Q-24, Q-27, Q-34.

### OPS-4 — Credit or refund a player

Requirement: **Validated** · Baseline: **New** · Rules: OPS-R4

**As** Patrianna operations, **I want** to credit or refund a player with a reason, **so that** I can put right what went wrong.

Acceptance criteria:

- Given a player, when I issue a credit or refund up to the limit, then it reaches their USD balance and is recorded with amount, reason, who and when.
- Given an amount above the limit, when I request it, then it waits for finance's approval (FND-8).
- Given brand staff, when they open a player, then they cannot issue credits.

Notes: Q-24, Q-34.

### OPS-5 — Manage back-office users

Requirement: **Validated** · Baseline: **New** · Rules: OPS-R7

**As a** Patrianna admin, **I want** to add, change and remove back-office users and their roles, **so that** access follows who works on what.

Acceptance criteria:

- Given a new user, when I add them, then I give them one role and, for brand staff, one brand.
- Given a partner leaves or a person leaves a partner, when I remove their access, then it ends at once.

Notes: Q-22, Q-34.

### OPS-6 — See who changed what

Requirement: **Validated** · Baseline: **New** · Rules: OPS-R6

**As** Patrianna admin or finance, **I want** a trail of every change and money action, **so that** anything can be explained later.

Acceptance criteria:

- Given any change or money action in the back office, when it happens, then who, what, when and the reason given are recorded.
- Given the trail, when anyone tries to edit or delete an entry, then they cannot.

### OPS-7 — Open my reports

Requirement: **Validated** · Baseline: **New** · Rules: OPS-R8

**As a** back-office user, **I want** the reports my role allows, **so that** I can follow sales, shipping and money.

Acceptance criteria:

- Given finance, when I open reports, then I see sales and sell-backs, shipping and compliance, and balance and settlement, for every brand.
- Given brand staff, when I open reports, then I see the same reports for my own brand only.

Notes: Q-25, Q-34.
