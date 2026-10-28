<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Purchase and Reveal -->
<!-- Title: User Stories - Aggregator Purchase and Reveal -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/purchase-and-reveal/user-stories.md`

# User Stories - Aggregator Purchase and Reveal

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

### BUY-1 — Buy a pack from my brand's catalog

Requirement: **Validated** · Baseline: **Exists** · Rules: BUY-R1, BUY-R10

**As a** player, **I want** to buy a pack from my brand's catalog with my USD balance, **so that** I can open it and win cards.

Acceptance criteria:

- Given a pack in my brand's catalog and enough USD balance, when I confirm the purchase, then my balance is reduced by Phygitals' pack price and the pack is mine.
- Given a pack not in my brand's catalog, when I try to buy it, then the purchase is refused.
- Given a completed purchase, when support or a report looks it up, then it shows my brand, the pack, the price, the cards and when it happened.

Notes: Q-05, Q-06. Baseline: MN-7696, MN-7697, MN-8022.

### BUY-2 — Get my money back when a purchase fails

Requirement: **Validated** · Baseline: **Exists** · Rules: BUY-R2

**As a** player, **I want** my money back whenever a purchase does not go through, **so that** I never pay for nothing.

Acceptance criteria:

- Given a purchase that fails after my balance was reduced, when the failure is confirmed, then the full amount returns to my balance.
- Given a failed purchase, when I see the result, then I am told why in plain words: not enough balance, sold out, unavailable or sales paused.
- Given a purchase whose outcome is not yet known, when I look at my balance, then I am never shown a loss as final while it is being resolved.

Notes: Baseline: Collectibles refunds only once Phygitals confirms a refusal (MN-8022).

### BUY-3 — Pay once, even if I tap twice

Requirement: **Validated** · Baseline: **Exists** · Rules: BUY-R3

**As a** player, **I want** a purchase I retry to charge me once, **so that** a slow connection or a double tap never costs me twice.

Acceptance criteria:

- Given I confirm the same purchase twice, when both reach the aggregator, then I am charged once and receive one pack.
- Given my connection drops after I confirm, when I come back, then I see whether the purchase went through, and it is never repeated without my asking.

### BUY-4 — Receive the gold-coin bonus

Requirement: **Validated** · Baseline: **Exists** · Rules: BUY-R4

**As a** player, **I want** the gold coins that come with a pack, **so that** I get the bonus I was promised.

Acceptance criteria:

- Given a pack with a gold-coin bonus, when my purchase completes, then the bonus is credited and I am shown it.
- Given a failed purchase, when it is refunded, then no bonus is credited.

Notes: Q-05. Baseline: MN-7699, MN-7821, MN-8021.

### BUY-5 — Open my pack now or later

Requirement: **Validated** · Baseline: **Exists** · Rules: BUY-R5

**As a** player, **I want** to open a pack straight away or keep it to open later, **so that** I choose when to reveal it.

Acceptance criteria:

- Given a pack I just bought, when I choose to open it, then I see its cards revealed.
- Given a pack I bought and did not open, when I come back later, then it is waiting unopened and I can open it.

Notes: Q-26. Baseline: MN-7700, MN-8111.

### BUY-6 — My card's value is fixed when I buy

Requirement: **Validated** · Baseline: **Partial** · Rules: BUY-R6

**As a** player, **I want** each card's value to be the one it had when I bought the pack, **so that** what I won is clear and does not move afterwards.

Acceptance criteria:

- Given a pack I buy, when the purchase completes, then each card's FMV at that moment is recorded.
- Given I open the pack later, when the cards are revealed, then each shows the FMV recorded at the purchase, not a later one.
- Given a recorded FMV, when anything changes at Phygitals afterwards, then the recorded value never changes.

Notes: Q-19, compliance input 4. Baseline: Collectibles reads FMV after the purchase and retries for up to a day; the stored value must be the one at the purchase ([Current State](../../current-state.md)).

### BUY-7 — A partner at its cap cannot sell

Requirement: **Validated** · Baseline: **New** · Rules: BUY-R7

**As** Patrianna finance, **I want** a partner brand's purchases to stop when it reaches its monthly cap, **so that** Patrianna never fronts more than agreed for one partner.

Acceptance criteria:

- Given a partner brand at its monthly cap, when one of its players tries to buy, then the purchase is refused before any money moves, and the player is told sales are unavailable.
- Given the cap resets at the start of the month or finance raises it, when a player tries again, then they can buy.
- Given an own brand, when it buys, then no cap applies.

Notes: Q-09.

### BUY-8 — No charge when the shared balance cannot cover a purchase

Requirement: **Validated** · Baseline: **Partial** · Rules: BUY-R2, BUY-R8

**As a** player, **I want** never to be charged when Patrianna's balance at Phygitals cannot cover my purchase, **so that** a supplier-side problem never costs me money.

Acceptance criteria:

- Given the shared balance cannot cover a purchase, when a player buys, then the player ends up not charged and is told sales are temporarily unavailable.
- Given the shared balance falls to finance's reserve, when any player of any brand tries to buy, then the purchase is refused before any money moves and packs show as temporarily unavailable.
- Given buying is paused for the reserve, when players open their collection, then they can still open packs, sell back and ship.
- Given finance tops the balance back above the reserve, when players try again, then they can buy.

Notes: Q-41. Baseline: a refused purchase is refunded today; nothing pauses buying.

### BUY-9 — Support shows a purchase's fairness proof

Requirement: **Validated** · Baseline: **New** · Rules: BUY-R9

**As** Patrianna support, **I want** to retrieve the fairness proof for a player's purchase, **so that** I can show a player who asks that the draw was fair.

Acceptance criteria:

- Given a purchase, when I look it up in the back office, then I can retrieve its fairness proof.
- Given the storefront, when a player browses, then no fairness proof is shown there.

Notes: Q-27.
