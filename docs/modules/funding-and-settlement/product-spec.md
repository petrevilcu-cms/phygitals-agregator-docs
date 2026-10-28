<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Funding and Settlement -->
<!-- Title: Product Spec - Aggregator Funding and Settlement -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/funding-and-settlement/product-spec.md`

# Product Spec - Aggregator Funding and Settlement

**Status:** Draft, 2026-10-28 · **Owner:** Product · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

Paying Phygitals from one prepaid balance, knowing what each brand consumed, buying cards for a brand, and settling with each brand.

## 2. Why

Patrianna funds one prepaid balance at Phygitals that every brand draws on (G1, G2). Phygitals sees a single partner, so only Patrianna can say which brand consumed what. Finance needs that to allocate cost to own brands, invoice partner brands, cap partners, and keep the balance from running dry ([Current State](../../current-state.md)).

## 3. Users

| User | Needs from this module |
| --- | --- |
| Patrianna finance | Each brand's consumption; allocations and invoices; partner caps; low-balance alerts; reconciliation with Phygitals |
| Partner brand | A clear monthly invoice it can check against its own activity |
| Own brand | Its internal cost allocation |
| Patrianna admin | Large manual credits approved by finance |

## 4. Scope

### 4.1 In scope

- Attributing every movement on the shared balance to a brand.
- Each brand's consumption per period, and reconciliation with Phygitals.
- Exclusive-card costs per brand.
- Internal allocation for own brands; monthly invoice for partner brands.
- Partner spending caps; low-balance alerts.
- Manual credits and refunds, and their approval.

### 4.2 Out of scope, owned elsewhere

- Players' USD balances and the cashier: the brand's wallet.
- Commercial terms Patrianna adds to a partner's invoice: Q-28 (commercial).
- Paying Phygitals and topping up the balance: finance's process outside the product; only the alert is here.

## 5. Requirements

- **FND-R1 — Every movement belongs to a brand.** Every purchase, shipping charge, sell-back credit and exclusive-card purchase that moves the shared balance is attributed to exactly one brand (G2).
- **FND-R2 — Consumption per brand.** For any period, finance can see each brand's consumption: what it drew from the shared balance and what came back to it.
- **FND-R3 — Reconciled with Phygitals.** Across all brands, the attributed movements reconcile with Phygitals' own record of the balance, at least daily. Every difference is shown to finance until explained.
- **FND-R4 — Exclusive cards charged to their brand.** The cost of each exclusive card bought for a brand is part of that brand's settlement (Q-08, Q-10, Q-35).
- **FND-R5 — Own brands: internal allocation.** Each own brand receives an internal cost allocation per period, built from its consumption and its exclusive-card costs (Q-08).
- **FND-R6 — Partner brands: monthly invoice.** Each partner brand receives a monthly invoice built from its usage and its exclusive-card costs (Q-08). What Patrianna adds on top is Q-28.
- **FND-R7 — Partner cap.** Each partner brand has a monthly spending cap set by finance. At the cap, its players cannot buy until the cap resets or finance raises it (Q-09).
- **FND-R8 — Low-balance alert.** Finance is alerted when the shared balance falls below a threshold it sets, early enough to top up before purchases are refused (Q-09). Finance also sets the reserve at which buying pauses on every brand, so shipping can always be paid (Q-41).
- **FND-R9 — Manual credits and refunds.** Every manual credit or refund records the player, brand, amount, reason, who made it and when. Patrianna admin and operations may credit up to a limit finance sets; above it, finance approves (Q-24, Q-34).
- **FND-R10 — Offboarding.** When a brand leaves, its settlement is adjusted for the exclusive cards Patrianna moves or sells back, and its last allocation or invoice is closed (Q-13).
- **FND-R11 — Balance and settlement report.** Finance sees every brand; brand staff see their own brand's consumption and allocation or invoice (Q-25, Q-34).

## 6. Constraints

- **One prepaid balance** in US dollars (G1). Phygitals refuses a purchase the balance cannot cover.
- **Phygitals reports its balance and ledger** (API 1.17): the balance available, holds for purchases in flight, and the movements behind it.
- **Fractions of a cent.** Sell-backs are credited rounded down to the cent (Q-07); the remainder stays with Patrianna and must still reconcile.

## 7. Non-functional expectations

- Settlement figures can be reproduced for any past period and do not change once the period is closed.
- Finance can trace any invoice line back to the player operations behind it.

## 8. Open questions

- Q-28 — commercial terms on a partner's invoice.

## 9. References

- [Current State](../../current-state.md) §2: "Shared prepaid balance".
- [Existing Jira Tickets](../../existing-tickets.md) §3.6.
