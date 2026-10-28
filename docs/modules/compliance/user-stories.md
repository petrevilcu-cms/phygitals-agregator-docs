<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Compliance -->
<!-- Title: User Stories - Aggregator Compliance -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/compliance/user-stories.md`

# User Stories - Aggregator Compliance

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

Most compliance rules are met by stories in the module that does the work; the [Product Spec](product-spec.md) §4.1 maps each legal input to them. The stories here are the ones legal itself uses.

### CMP-1 — Produce a sponsor's evidence

Requirement: **Validated** · Baseline: **New** · Rules: CMP-R6

**As** legal, **I want** to produce, for one brand and a period, the evidence that its shipping and card values met the rules, **so that** its sponsor can answer a regulator.

Acceptance criteria:

- Given a brand and a period, when I run the shipping and compliance report, then for each shipment I see the destination state, charge, actual cost, rule applied, request date, delivery date and deadline.
- Given the same brand and period, when I look at cards, then I see each card's FMV at the purchase.
- Given a brand, when I produce its evidence, then nothing from another brand is included.

Notes: Q-14, Q-25.

### CMP-2 — See every breach

Requirement: **Validated** · Baseline: **New** · Rules: CMP-R7

**As** legal, **I want** shipments that broke a rule flagged to me, **so that** each one is dealt with and none goes unnoticed.

Acceptance criteria:

- Given a shipment charged above its state's rule, when that is detected, then it is flagged to operations and legal.
- Given a shipment delivered after its deadline, when that is detected, then it is flagged to operations and legal, with how late it was.
- Given a flagged breach, when it is resolved, then the resolution is recorded.

Notes: Q-15, Q-17.

### CMP-3 — Keep compliance records as long as required

Requirement: **TBC** (Q-37) · Baseline: **New** · Rules: CMP-R8

**As** legal, **I want** compliance records kept for the required period and protected from change, **so that** evidence exists whenever it is asked for.

Acceptance criteria:

- Given a shipment or a card's FMV record, when it is created, then it cannot be altered afterwards.
- TBC (Q-37): how long records are kept, per record type.
