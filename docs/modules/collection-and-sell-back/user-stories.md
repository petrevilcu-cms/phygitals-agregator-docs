<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Collection and Sell-back -->
<!-- Title: User Stories - Aggregator Collection and Sell-back -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/collection-and-sell-back/user-stories.md`

# User Stories - Aggregator Collection and Sell-back

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

### COL-1 — See my cards and unopened packs

Requirement: **Validated** · Baseline: **Exists** · Rules: COL-R1

**As a** player, **I want** to see everything I hold, **so that** I can decide what to open, keep, sell or ship.

Acceptance criteria:

- Given I hold unopened packs and cards on my brand, when I open my collection, then I see all of them and nothing from any other brand.
- Given a card, when I look at it, then I see its status, its FMV at the purchase, what it would sell back for, and when it would be sold automatically.
- Given my collection, when I filter, sort or change the view, then the list updates accordingly.

Notes: Baseline: MN-7702, MN-7706, MN-7707, MN-8023, MN-7876.

### COL-2 — Sell back cards

Requirement: **Validated** · Baseline: **Exists** · Rules: COL-R2

**As a** player, **I want** to sell back one card or several, **so that** I turn cards I do not want into balance.

Acceptance criteria:

- Given a card I hold, when I sell it back, then my USD balance is credited with Phygitals' buyback price at that moment, rounded down to the cent.
- Given several cards, when I sell them back together and some fail, then the ones that sold are credited, the others stay in my collection, and I see which is which.
- Given a sold card, when I look at my collection, then it shows as sold and can no longer be sold or shipped.

Notes: Q-07. Baseline: MN-7701, MN-7704, MN-8025, MN-8191.

### COL-3 — Only I can act on my cards

Requirement: **Validated** · Baseline: **Exists** · Rules: COL-R3

**As a** player, **I want** my cards to be mine alone, **so that** nobody else, on any brand, can sell or ship them.

Acceptance criteria:

- Given a card held by player X on brand A, when anyone other than player X on brand A tries to sell it, ship it or open its pack, then the action is refused before anything reaches Phygitals.
- Given a card already being sold or shipped, when a second sale or shipment is attempted, then it is refused.

Notes: G1. Baseline: Collectibles checks the holder's account, which is unique across brands.

### COL-4 — Unclaimed cards are sold automatically

Requirement: **TBC** (Q-18) · Baseline: **Partial** · Rules: COL-R4, COL-R6

**As** Patrianna, **I want** cards a player leaves untouched to be sold back automatically when their brand's window ends, **so that** cards do not sit in the vault indefinitely.

Acceptance criteria:

- Given a card neither sold nor shipped, when its brand's window ends, then it is sold back and the player's USD balance is credited as for a manual sell-back.
- Given brand A's window is 72 hours and brand B's is 7 days, when cards reach their windows, then each is sold on its own brand's window.
- TBC (Q-18): legal confirmation that this sits within each sponsor's rules.

Notes: Q-26. Baseline: one 72-hour window for the whole stage (MN-7703, MN-8026).

### COL-5 — Told when a card was sold automatically

Requirement: **Validated** · Baseline: **Partial** · Rules: COL-R5

**As a** player, **I want** to be told when a card of mine was sold automatically, **so that** the credit on my balance makes sense.

Acceptance criteria:

- Given a card was sold automatically, when I next open the storefront, then I am shown which card and how much was credited.
- Given I have seen that message, when I acknowledge it, then it is not shown again.

Notes: Baseline: MN-8027 done, MN-8142 ready for testing.

### COL-6 — Warned before a card is sold automatically

Requirement: **Validated** · Baseline: **Partial** · Rules: COL-R5

**As a** player, **I want** a warning before a card of mine is sold automatically, **so that** I can ship or keep it if I want to.

Acceptance criteria:

- Given a card will be sold automatically, when 24 hours remain, then I receive a warning in my brand's inbox naming the card and when it will be sold.
- Given any held card, when I look at it, then it shows the time left before it is sold automatically.
- Given I sell or ship the card before then, when the time comes, then nothing is sold.

Notes: Q-39. Baseline: the inbox notification ticket MN-7856 is on hold.

### COL-7 — See my transaction history

Requirement: **Validated** · Baseline: **Partial** · Rules: COL-R7

**As a** player, **I want** a history of my purchases, sell-backs and shipping charges, **so that** I can follow where my balance went.

Acceptance criteria:

- Given my activity on my brand, when I open my history, then I see purchases, sell-backs, automatic sell-backs, shipping charges and refunds, with dates and amounts.
- Given my history, when I look at it, then it holds nothing from any other brand.

Notes: Baseline: MN-7850 in progress, MN-7877 (iOS) in backlog.

### COL-8 — Set a brand's automatic sell-back window

Requirement: **Validated** · Baseline: **New** · Rules: COL-R4

**As a** Patrianna admin, **I want** to set each brand's automatic sell-back window, **so that** each brand can give its players the time it chooses.

Acceptance criteria:

- Given a brand, when I change its window, then cards revealed after the change use the new window, and who changed it and when is recorded.
- Given a brand with no window set, when cards are revealed, then the window is 72 hours.
- Given cards already held when the window changes, when I look at them, then their deadlines are unchanged.

Notes: Q-26, Q-42.
