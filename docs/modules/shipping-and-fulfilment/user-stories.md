<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Shipping and Fulfilment -->
<!-- Title: User Stories - Aggregator Shipping and Fulfilment -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/shipping-and-fulfilment/user-stories.md`

# User Stories - Aggregator Shipping and Fulfilment

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

### SHP-1 — Request a shipment and see the price first

Requirement: **Validated** · Baseline: **Partial** · Rules: SHP-R1, SHP-R7

**As a** player, **I want** to choose cards and an address and see the options and total price before I confirm, **so that** I know what shipping will cost me.

Acceptance criteria:

- Given cards I hold, when I ask to ship them, then I see the available options with their total price and what the total is made of.
- Given I confirm an option, when the shipment is booked, then the charge is taken from my USD balance and the cards show as shipping.
- Given the price shown has expired, when I confirm, then I am shown the current price before anything is charged.

Notes: Baseline: quote and booking exist but are switched off (MN-8029); front end in progress (MN-8141).

### SHP-2 — Pay a fair shipping price

Requirement: **TBC** (Q-29, Q-30) · Baseline: **New** · Rules: SHP-R2, SHP-R3

**As** legal, **I want** every shipping charge to be the actual carrier cost plus a handling fee within the destination state's rules, **so that** each sponsor keeps its certification.

Acceptance criteria:

- Given any shipment, when it is priced, then the charge is never more than what shipping actually costs the sponsor.
- Given a shipment to Virginia, when it is priced, then the handling fee is at most the actual handling cost and at most USD 5.
- Given a state with its own rule (Q-30), when a shipment there is priced, then that rule applies.
- TBC (Q-29): whether Phygitals' withdrawal fee counts as handling, and who absorbs any amount above a cap.
- TBC (Q-18): whether Virginia players ship for free.

Notes: Q-15, compliance inputs 1 and 3. Baseline: today the player pays Phygitals' total rounded up, and its withdrawal fee is shown as the handling fee.

### SHP-3 — Ship only where allowed

Requirement: **TBC** (Q-30) · Baseline: **New** · Rules: SHP-R4

**As** legal, **I want** shipments to excluded or unsupported destinations to be refused before they are booked, **so that** no card ships where the sponsor may not send it.

Acceptance criteria:

- Given an address in an excluded state, when the player tries to ship there, then the request is refused before any charge and the player is told why.
- Given an address in a state with rules, when the player ships there, then those rules apply (SHP-2, SHP-4).
- Given an address outside the US, when the player tries to ship there, then the request is refused before any charge.
- TBC (Q-30): the list of excluded states.

Notes: Q-02, Q-20. Baseline: only Phygitals' own "country not supported" refusal exists.

### SHP-4 — Delivered within 10 days of my request

Requirement: **Validated** · Baseline: **New** · Rules: SHP-R5, SHP-R6

**As a** player, **I want** my cards delivered within 10 days of asking for them, **so that** I receive what I won on time, wherever I live.

Acceptance criteria:

- Given a shipping request, when it is booked, then its deadline is set to 10 days after the request, whatever the state.
- Given an order, when it is delivered, then its delivery date is recorded against its deadline.

Notes: Q-17. Phygitals' own commitment to the deadline is Q-32.

### SHP-5 — Operations sees orders at risk

Requirement: **Validated** · Baseline: **New** · Rules: SHP-R6, SHP-R12

**As** Patrianna operations, **I want** to see orders that may miss their deadline before they do, **so that** I can chase them in time.

Acceptance criteria:

- Given open orders, when I open the shipping queue, then I see each order's deadline and which are at risk or late.
- Given an order becomes at risk, when that happens, then operations is alerted.
- Given brand staff, when they open the queue, then they see their own brand's orders and cannot act on them.

Notes: Q-17, Q-24, Q-34.

### SHP-6 — Follow my shipment

Requirement: **Validated** · Baseline: **Partial** · Rules: SHP-R7

**As a** player, **I want** to follow my shipment, **so that** I know where my cards are.

Acceptance criteria:

- Given an order, when I open it, then I see its status — requested, being prepared, shipped, delivered or exception — and its tracking once shipped.
- Given my orders, when I list them, then I see only my own, on my brand.

Notes: Baseline: MN-8030 done, MN-8141 in progress, MN-7879 (iOS) on hold.

### SHP-7 — Operations works shipping exceptions

Requirement: **Validated** · Baseline: **New** · Rules: SHP-R8

**As** Patrianna operations, **I want** failed, cancelled and late shipments to land in my queue, **so that** none is left unresolved.

Acceptance criteria:

- Given an order fails, is cancelled or is late, when that happens, then it appears in the exceptions queue and the player is told.
- Given an exception, when I resolve it, then the resolution, who did it and when are recorded.
- Given an order that is cancelled or fails before it ships, when that is confirmed, then the player's shipping charge is refunded in full.
- Given an order that fails after it shipped, when I resolve it, then I decide whether to refund, reship or credit, and record why.

Notes: Q-24, Q-40. Baseline: a cancellation path exists (MN-8030); there is no queue.

### SHP-8 — Keep state rules current

Requirement: **Validated** · Baseline: **New** · Rules: SHP-R9

**As** Patrianna operations, **I want** to maintain each state's shipping rules in the back office as legal decides them, **so that** a rule change applies without waiting for a release.

Acceptance criteria:

- Given legal decides a rule for a state, when I enter it, then it applies to every shipment priced after that moment.
- Given a rule change, when it is saved, then who changed what and when is recorded, and earlier orders keep the rule they were priced under.
- Given a shipment, when it is booked, then it records which rule was applied.

Notes: Q-16, Q-30.

### SHP-9 — Manage my addresses

Requirement: **Validated** · Baseline: **Exists** · Rules: SHP-R11

**As a** player, **I want** to save, edit and delete shipping addresses, **so that** I do not retype them each time.

Acceptance criteria:

- Given my addresses, when I add, edit or delete one, then the list updates and I can pick one when shipping.
- Given another brand, when I use it, then my addresses from this brand are not shown there.

Notes: Baseline: MN-8028, MN-7939. Player accounts are per brand today, so addresses already are.

### SHP-10 — Cancel my shipment before it is prepared

Requirement: **Validated** · Baseline: **Partial** · Rules: SHP-R8

**As a** player, **I want** to cancel a shipment until it starts being prepared, **so that** I can change my mind or fix a mistake.

Acceptance criteria:

- Given an order Phygitals has not started preparing, when I cancel it, then it is cancelled, my shipping charge is refunded in full, and the cards return to my collection.
- Given an order already being prepared or shipped, when I look at it, then I cannot cancel it and am told to contact support.

Notes: Q-40. Baseline: cancellation exists (MN-8030); the refund rule and the cut-off are new.
