<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Compliance -->
<!-- Title: Product Spec - Aggregator Compliance -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/compliance/product-spec.md`

# Product Spec - Aggregator Compliance

**Status:** Draft, 2026-10-28 · **Owner:** Product, with legal · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

The legal and regulatory rules the product must honour: shipping fees and delivery deadlines by state, fair market value fixed at the rip, player eligibility, and the records that prove it.

## 2. Why

Each brand's operating company is the sponsor for its players and holds its own certification (Q-14). The legal review of 2026-10-28 sets what those sponsors certify: reasonable shipping charges based on actual cost, delivery of claimed cards within the required time, state limits on charges and deadlines, and FMV fixed at the rip ([Overview](../../overview.md) §7). Nothing in Collectibles enforces or records any of this today ([Current State](../../current-state.md)). This page traces each legal input to the requirements that meet it, and owns the evidence.

## 3. Users

| User | Needs from this module |
| --- | --- |
| Legal | Every rule met, and proof of it per sponsor, per state, for any period |
| Each brand's sponsor | Evidence for its own players only |
| Patrianna operations | Clear rules to apply and early warning of breaches |

## 4. Scope

### 4.1 Legal inputs and where they are met

| # | Legal input (2026-10-28) | How the product reads it | Met by |
| --- | --- | --- | --- |
| 1 | Shipping fees are reasonable and based on what shipping costs the Company | Carrier cost plus handling, never above actual cost (Q-15) | SHP-R2, SHP-2 |
| 2 | Claimed cards ship within the required timeframes | Claimed = shipping requested; delivered within 10 days, every state (Q-17) | SHP-R5, SHP-R6, SHP-4, SHP-5 |
| 3a | States may limit shipping charges | State rules applied per shipment, kept current by operations as legal decides (Q-15, Q-16, Q-30) | SHP-R3, SHP-R9, SHP-2, SHP-8 |
| 3b | Virginia: delivery within 10 days, no expense to the winner | 10 days everywhere (Q-17); "no expense" for cards from paid packs is Q-18 | SHP-4; SHP-2 (TBC) |
| 3c | Virginia: handling fee at most actual cost, capped at USD 5 | Applied to every Virginia shipment; Phygitals' withdrawal fee is Q-29 | SHP-R3, SHP-2 |
| 4 | FMV is determined at the rip and cannot be altered after | Rip = purchase; FMV fixed then, never changed (Q-19) | BUY-R6, BUY-6 |
| — | The "Company" | Each brand's operating company, with its own certification (Q-14) | BRD-R3, BRD-2, INT-3 |
| — | Player eligibility | Brand platform runs KYC, age and location; the aggregator checks shipping addresses (Q-20) | SHP-R4, SHP-3 |

### 4.2 Out of scope

- KYC, age and location checks of players: the brand's own platform (Q-20).
- Legal interpretation itself: legal decides; this page records the outcome.

## 5. Requirements

- **CMP-R1 — Sponsor per brand.** No brand goes live without its sponsor's certification recorded; each brand's terms name its sponsor (Q-14; BRD-R3, INT-R3).
- **CMP-R2 — Shipping charges within the rules.** Every shipment meets compliance inputs 1 and 3 for its destination state (SHP-R2, SHP-R3).
- **CMP-R3 — Delivery deadline.** Every claimed card is delivered within 10 days of the shipping request, in every state (SHP-R5).
- **CMP-R4 — FMV fixed at the rip.** Each card's FMV is fixed at the purchase and never changed (BUY-R6). What FMV is used for is Q-31.
- **CMP-R5 — Rules maintained by operations, decided by legal.** State rules change without a release, and every shipment records the rule it was priced under (Q-16; SHP-R9).
- **CMP-R6 — Evidence per sponsor.** For any brand, state and period, legal can produce: each shipment's charge, actual cost, rule applied, request date, delivery date and deadline; and each card's FMV at the purchase. Evidence for one brand never includes another's (Q-14, Q-25).
- **CMP-R7 — Breaches surface.** Any shipment charged above its rule or delivered after its deadline is flagged to operations and legal.
- **CMP-R8 — Records kept long enough.** Compliance records are kept for the period legal sets (Q-37) and cannot be altered.
- **CMP-R9 — Automatic sell-back confirmed.** Automatic sell-back of unclaimed cards goes live only once legal confirms it sits within each sponsor's rules (Q-18, Q-26).

## 6. Constraints

- **Sponsor per brand** (Q-14): one sponsor's breach is that sponsor's; evidence must be separable per brand.
- **Phygitals' vault and carriers** deliver the cards; meeting the deadline depends on them (Q-32).

## 7. Non-functional expectations

- Evidence can be produced on request without engineering.
- Records are tamper-evident.

## 8. Open questions (legal)

- Q-18 — Virginia "no expense to the winner" for cards from paid packs; automatic sell-back of unclaimed cards.
- Q-29 — Phygitals' withdrawal fee under the caps.
- Q-30 — the full list of states and their rules.
- Q-31 — what FMV is used for.
- Q-37 — how long compliance records are kept.

## 9. References

- [Overview](../../overview.md) §7, the compliance inputs.
- [Existing Jira Tickets](../../existing-tickets.md) §3.9: only availability restrictions are ticketed.
