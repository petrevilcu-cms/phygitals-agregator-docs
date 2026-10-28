<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Funding and Settlement -->
<!-- Title: User Stories - Aggregator Funding and Settlement -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/funding-and-settlement/user-stories.md`

# User Stories - Aggregator Funding and Settlement

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

### FND-1 — See each brand's consumption

Requirement: **Validated** · Baseline: **Partial** · Rules: FND-R1, FND-R2

**As** Patrianna finance, **I want** to see what each brand drew from and returned to the shared balance, **so that** I know what each brand costs.

Acceptance criteria:

- Given a period, when I open the balance report, then I see each brand's purchases, shipping charges, sell-back credits and exclusive-card costs, and its net consumption.
- Given any line, when I open it, then I can trace it to the player operations behind it.

Notes: Q-25. Baseline: every Collectibles record carries its brand; there is no report.

### FND-2 — Reconcile with Phygitals every day

Requirement: **Validated** · Baseline: **Partial** · Rules: FND-R3

**As** Patrianna finance, **I want** each day's movements across all brands checked against Phygitals' own ledger, **so that** I find differences while they are fresh.

Acceptance criteria:

- Given a day, when it is reconciled, then the sum of all brands' movements is compared with Phygitals' ledger for that day.
- Given a difference, when it is found, then it is shown to finance and stays visible until it is explained.

Notes: Baseline: a daily per-brand check exists but is switched off (MN-8032).

### FND-3 — Charge exclusive cards to their brand

Requirement: **Validated** · Baseline: **New** · Rules: FND-R4

**As** Patrianna finance, **I want** the cost of exclusive cards bought for a brand to land in that brand's settlement, **so that** Patrianna recovers what it paid.

Acceptance criteria:

- Given an exclusive card recorded for brand A with its cost (CAT-5), when brand A's period is settled, then the cost is included.
- Given that card is later moved to brand B or sold back (CAT-9), when the period is settled, then both brands' settlements reflect it.

Notes: Q-10, Q-13, Q-35.

### FND-4 — Allocate cost to own brands

Requirement: **Validated** · Baseline: **New** · Rules: FND-R5

**As** Patrianna finance, **I want** an internal cost allocation for each own brand per period, **so that** each brand's results show what it really cost.

Acceptance criteria:

- Given a closed period, when I produce the allocation, then each own brand has its consumption and exclusive-card costs for that period.
- Given a closed period, when I produce it again, then the figures are the same.

Notes: Q-08.

### FND-5 — Invoice partner brands monthly

Requirement: **TBC** (Q-28) · Baseline: **New** · Rules: FND-R6

**As** Patrianna finance, **I want** a monthly invoice for each partner brand built from its usage, **so that** partners pay for what their players consumed.

Acceptance criteria:

- Given a closed month, when I produce a partner's invoice, then it lists its usage and exclusive-card costs, each line traceable to the operations behind it.
- Given the partner's staff, when they open their reports, then they see the same figures as on the invoice.
- TBC (Q-28): what Patrianna adds on top of cost, and on what base.

Notes: Q-08, Q-34.

### FND-6 — Cap a partner's monthly spend

Requirement: **Validated** · Baseline: **New** · Rules: FND-R7

**As** Patrianna finance, **I want** to set and change each partner brand's monthly spending cap, **so that** Patrianna never fronts more than agreed.

Acceptance criteria:

- Given a partner brand, when I set its cap, then purchases stop when the month's consumption reaches it (BUY-7).
- Given a partner at its cap, when I raise the cap, then its players can buy again.
- Given anyone other than finance, when they try to change a cap, then they cannot.

Notes: Q-09, Q-34.

### FND-7 — Be warned before the shared balance runs out

Requirement: **Validated** · Baseline: **New** · Rules: FND-R8

**As** Patrianna finance, **I want** an alert when the shared balance falls below my threshold, **so that** I top up before any purchase is refused.

Acceptance criteria:

- Given a threshold I set, when the shared balance falls below it, then finance is alerted.
- Given the alert, when it fires, then it shows the balance and how long it is likely to last at the recent rate of spending.
- Given a reserve I set, when the balance falls to it, then buying pauses on every brand (BUY-8) and finance is told; it resumes once I top the balance back above the reserve.

Notes: Q-09, Q-41.

### FND-8 — Approve large manual credits

Requirement: **Validated** · Baseline: **New** · Rules: FND-R9

**As** Patrianna finance, **I want** manual credits above a limit to need my approval, **so that** large corrections are checked before money moves.

Acceptance criteria:

- Given a manual credit at or under the limit, when Patrianna admin or operations issues it, then it is applied and recorded with player, brand, amount, reason, who and when.
- Given a manual credit above the limit, when it is requested, then it waits for finance's approval and is applied only once approved.
- Given finance, when I set the limit, then it applies to every credit requested afterwards.

Notes: Q-24, Q-34.
