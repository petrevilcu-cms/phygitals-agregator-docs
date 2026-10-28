<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Brand Integration -->
<!-- Title: User Stories - Aggregator Brand Integration -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/brand-integration/user-stories.md`

# User Stories - Aggregator Brand Integration

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

### INT-1 — Enter the storefront from my brand

Requirement: **Validated** · Baseline: **Exists** · Rules: INT-R1, INT-R4

**As a** player, **I want** to reach the storefront from my brand, **so that** I can play without a separate account.

Acceptance criteria:

- Given I am logged in to my brand, when I open the storefront, then it runs as my brand with my account.
- Given I am not logged in, when I open the storefront, then I can browse and am asked to log in before buying, and I come back to where I was.

Notes: Baseline: MN-7712, MN-7864 (iOS).

### INT-2 — The storefront in my brand's look

Requirement: **Validated** · Baseline: **Partial** · Rules: INT-R2

**As a** brand, **I want** the shared storefront to wear my look, **so that** players feel they are on my brand.

Acceptance criteria:

- Given my brand's theme, logo and copy in the back office, when my players open the storefront, then they see them.
- Given I change them, when they are saved, then players see the change without a release.
- Given another brand, when its players open the storefront, then they never see my look.

Notes: Q-04.

### INT-3 — My brand's terms name its sponsor

Requirement: **Validated** · Baseline: **New** · Rules: INT-R3

**As** legal, **I want** each brand's rules, how-to-play and terms to name that brand's sponsor, **so that** players know who answers for their prizes.

Acceptance criteria:

- Given brand A, when its players open the rules, how-to-play or terms, then brand A's operating company is named as sponsor.
- Given the sponsor changes, when brand A's terms are updated, then players see the new sponsor without a release.

Notes: Q-14. Baseline: rules and how-to-play exist for one storefront (MN-7710, MN-7880).

### INT-4 — See and top up my USD balance

Requirement: **Validated** · Baseline: **Partial** · Rules: INT-R5

**As a** player, **I want** to see my USD balance and top it up without leaving what I am doing, **so that** I can buy when I am short.

Acceptance criteria:

- Given I am in the storefront, when I look at the header, then I see my current USD balance.
- Given my balance is too low to buy, when I choose to deposit, then my brand's cashier opens and I return to the same purchase afterwards with the new balance.

Notes: Q-05. Baseline: MN-7693 done; MN-7694 in progress; MN-7830 to do; MN-7872 done on iOS.

### INT-5 — Be told what happened to my cards

Requirement: **Validated** · Baseline: **Partial** · Rules: INT-R6

**As a** player, **I want** notifications about my cards and shipments, **so that** nothing happens to them without my knowing.

Acceptance criteria:

- Given a card was sold automatically, when I next visit, then I am told (COL-5).
- Given my shipment changes status or has a problem, when that happens, then I am told.
- Given a card will be sold automatically in 24 hours, when that point is reached, then I receive a warning in my brand's inbox (COL-6).

Notes: Baseline: MN-8142 ready for testing; MN-7856 on hold; MN-7881 (iOS) in backlog.

### INT-6 — The same storefront on iOS

Requirement: **Validated** · Baseline: **Partial** · Rules: INT-R7

**As a** player on iPhone, **I want** the same flows in the app as on the web, **so that** I can play wherever I am.

Acceptance criteria:

- Given the iOS app, when I use the storefront, then I can browse, buy, open, sell, ship and see my history as on the web.
- Given the brand's look and catalog, when I open the app, then they match the web.

Notes: Baseline: epic MN-7858, 13 of 23 done; shipping, history and notifications still to do.

### INT-7 — Phygitals events reach the right brand

Requirement: **Validated** · Baseline: **Partial** · Rules: INT-R9

**As** Patrianna, **I want** every event Phygitals sends on the one account to update the right brand's player, **so that** statuses and balances are correct on every brand.

Acceptance criteria:

- Given an event about a purchase, sell-back or shipment of brand A's player, when it arrives, then it updates that player on brand A and nothing on any other brand.
- Given the same event arrives twice, when it is processed, then it is applied once.
- Given an event that matches no brand, when it arrives, then it is kept and shown to operations (BRD-4).

Notes: G1. Baseline: events are received at one address per brand (MN-8031); one address for all brands on a shared account is not settled.

### INT-8 — No supplier credentials within reach

Requirement: **Validated** · Baseline: **Exists** · Rules: INT-R10

**As** Patrianna, **I want** Phygitals' credentials kept away from every storefront, browser, app and brand system, **so that** no brand or player can act on the shared account directly.

Acceptance criteria:

- Given the storefront on web or iOS, when it is inspected, then it holds no Phygitals credential and calls only Patrianna.
- Given a brand's own platform, when it integrates, then it is never given a Phygitals credential.

Notes: G5.
