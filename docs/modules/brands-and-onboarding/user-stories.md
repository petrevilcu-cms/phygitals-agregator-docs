<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Brands and Onboarding -->
<!-- Title: User Stories - Aggregator Brands and Onboarding -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/brands-and-onboarding/user-stories.md`

# User Stories - Aggregator Brands and Onboarding

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

### BRD-1 — Add a brand by configuration

Requirement: **Validated** · Baseline: **New** · Rules: BRD-R1, BRD-R2, BRD-R9

**As a** Patrianna super-admin, **I want** to add a brand and its set-up in the back office, **so that** a new brand can go live without a new Phygitals contract or a release.

Acceptance criteria:

- Given a signed agreement, when I create a brand, then I can record its name, own-or-partner type, operating company, storefront look and automatic sell-back window, and it starts in **onboarding**.
- Given a new brand, when I leave its automatic sell-back window empty, then it is 72 hours.
- Given any change to a brand's set-up, when it is saved, then who changed what and when is recorded.
- Given a brand in onboarding, when I look at the storefront, then the brand's players cannot see or buy anything yet.

Notes: G1, Q-26. Today a brand is added by engineering through per-brand credentials.

### BRD-2 — No go-live without the sponsor's certification

Requirement: **Validated** · Baseline: **New** · Rules: BRD-R2, BRD-R3

**As** legal, **I want** a brand to stay out of reach of players until its sponsor's certification is in place, **so that** no player buys from a brand whose sponsor has not certified its shipping practices.

Acceptance criteria:

- Given a brand, when I record its operating company, then I can record whether its certification is in place and from what date.
- Given a brand whose certification is not recorded as in place, when anyone tries to take it live, then it stays in onboarding and the reason is shown.
- Given a live brand, when its certification is withdrawn, then the brand can be paused at once (BRD-5).

Notes: Q-14 — each brand's operating company is its sponsor, with its own certification.

### BRD-3 — Players and staff see only their own brand

Requirement: **Validated** · Baseline: **Partial** · Rules: BRD-R4

**As a** brand, **I want** my players and my staff to see only my brand, **so that** no other brand's player, card, order or report is ever exposed through me, and none of mine through them.

Acceptance criteria:

- Given a player of brand A, when they browse, buy, open, sell or ship, then they only ever see and act on brand A's packs, cards and orders.
- Given a staff member of brand A in the back office, when they search players, orders or reports, then results come from brand A only, and a direct link to brand B's record shows nothing.
- Given any record in reports or support look-ups, when it is displayed, then it carries exactly one brand.

Notes: G4, Q-22. Baseline: Collectibles already separates players by brand through the login token; the back office does not exist yet.

### BRD-4 — Everything at Phygitals traces back to one brand

Requirement: **Validated** · Baseline: **Partial** · Rules: BRD-R5

**As** Patrianna, **I want** every player, purchase, sell-back, shipment and event at Phygitals to be traceable to its brand, **so that** brands stay apart and settle correctly although Phygitals sees a single partner.

Acceptance criteria:

- Given two brands on the one Phygitals account, when Phygitals reports any operation or event, then Patrianna can tell which brand it belongs to without asking Phygitals.
- Given an operation or event that cannot be traced to a brand, when it arrives, then it is kept, flagged to operations and never silently dropped.

Notes: G1. Baseline: Collectibles uses an id unique across brands for each player and receives events at one address per brand; one shared address for all brands is not settled ([Current State](../../current-state.md)).

### BRD-5 — Pause a brand

Requirement: **Validated** · Baseline: **New** · Rules: BRD-R6

**As a** Patrianna admin, **I want** to pause a brand at once, **so that** I can stop its sales when something is wrong, without waiting for a release.

Acceptance criteria:

- Given a live brand, when I pause it, then its players can no longer buy packs, from that moment, and the storefront tells them sales are paused.
- Given a paused brand, when I resume it, then sales resume.
- Given a pause, when it happens, then who paused it, when and why is recorded.
- Given a paused brand, when its players open their collection, then they can still open packs, sell back and ship what they hold.

Notes: Q-24, Q-36.

### BRD-6 — Offboard a brand

Requirement: **Validated** · Baseline: **New** · Rules: BRD-R6, BRD-R7

**As a** Patrianna super-admin, **I want** to offboard a brand in an orderly way, **so that** its players, its exclusive cards and its money are all accounted for.

Acceptance criteria:

- Given a brand being offboarded, when I review it, then I see its unpulled exclusive cards, its players' held cards and unopened packs, and its open settlement.
- Given its unpulled exclusive cards, when I decide, then each is moved into another brand's pack or sold back to Phygitals, and the leaving brand's settlement is adjusted (Q-13).
- Given the final period, when it closes, then the brand's last allocation or invoice is produced.
- Given an offboarding, when I start it, then I set a final window, and the brand's players are told to ship or sell what they hold before it ends.
- Given the final window ends, when cards or unopened packs are still held, then they are sold back automatically and the players are credited.

Notes: Q-13, Q-36.

### BRD-7 — Onboard a partner brand

Requirement: **Validated** · Baseline: **New** · Rules: BRD-R2, BRD-R8

**As a** Patrianna super-admin, **I want** to onboard an external partner brand the same way as an own brand, **so that** partners can join without a different product.

Acceptance criteria:

- Given a partner brand, when I set it up, then I also record its monthly spending cap, which only finance may change (Q-09, Q-34).
- Given a partner brand, when it goes live, then its usage is settled by monthly invoice (Q-08).
- Given partner staff, when they are given back-office access, then they see their own brand only (Q-22).

Notes: G7 — own brands launch first; partner brands follow.
