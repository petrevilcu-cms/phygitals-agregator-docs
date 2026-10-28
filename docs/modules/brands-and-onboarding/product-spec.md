<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Brands and Onboarding -->
<!-- Title: Product Spec - Aggregator Brands and Onboarding -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/brands-and-onboarding/product-spec.md`

# Product Spec - Aggregator Brands and Onboarding

**Status:** Draft, 2026-10-28 · **Owner:** Product · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

Adding a brand to the aggregator, what a brand is set up with, keeping brands apart from each other, and the path from Patrianna's own brands to third-party partner brands.

## 2. Why

Phygitals sees one partner and no brands (G1). Everything that makes a brand a brand — its players, its catalog, its records, its money, its legal sponsor — exists only because Patrianna provides it. Today Collectibles connects each brand as if it had its own Phygitals account, and a brand is added by engineering, not by configuration ([Current State](../../current-state.md)). The aggregator must let Patrianna add, run, pause and remove brands without a new Phygitals contract or a release, and must keep every brand's players and data apart even though all of them run on one account.

## 3. Users

| User | Needs from this module |
| --- | --- |
| Patrianna super-admin | Set up a brand, take it live, pause it, offboard it |
| Brand (own or partner) | Its own players, data and presentation, never mixed with another brand's |
| Patrianna finance | Partner brands' monthly caps and settlement basis in place before go-live |
| Legal | A brand never goes live without its sponsor's certification |

## 4. Scope

### 4.1 In scope

- The list of brands and each brand's set-up.
- A brand's life: onboarding, live, paused, offboarded.
- Separation between brands on one shared Phygitals account.
- Partner brands as well as own brands.

### 4.2 Out of scope, owned elsewhere

- Player accounts, login, KYC, age and location checks: the brand's own platform (Q-20).
- The player's wallet and cashier: the brand's own platform (Q-05).
- What a brand sells and how it looks: [Catalog and Exclusive Cards](../catalog-and-exclusive-cards/product-spec.md).
- Money per brand: [Funding and Settlement](../funding-and-settlement/product-spec.md).
- The storefront's look per brand: [Brand Integration](../brand-integration/product-spec.md).

## 5. Requirements

- **BRD-R1 — Configuration, not code.** A brand is added and taken live in the back office, on the strength of its agreement with Patrianna. No new Phygitals account, no code change and no release (G1, goal 1).
- **BRD-R2 — What a brand is set up with.** At least: its name and status; its operating company, which is its sponsor, and the state of that company's certification (Q-14); whether it is an own brand or a partner brand; for a partner, its monthly spending cap (Q-09); its automatic sell-back window, 72 hours unless changed (Q-26); its storefront look ([Brand Integration](../brand-integration/product-spec.md)).
- **BRD-R3 — No sponsor, no go-live.** A brand cannot be taken live until its sponsor's certification is recorded as in place (Q-14).
- **BRD-R4 — Brands never mix.** Every player, purchase, card, sell-back, shipment, credit, event and report belongs to exactly one brand. Nothing that belongs to one brand is visible to, or can be acted on from, another brand: not by players, not through the storefront, not by brand staff in the back office (G4, Q-22).
- **BRD-R5 — Separation holds on one account.** Brand separation never relies on Phygitals knowing about brands. Every player, operation and event at Phygitals can be traced back to its brand by Patrianna alone (G1).
- **BRD-R6 — Life of a brand.** A brand is onboarding, live, paused or offboarded. Pausing stops new purchases for that brand at once, without a release (Q-24); its players can still open packs, sell back and ship what they hold (Q-36).
- **BRD-R7 — Offboarding.** When a brand leaves, its players get a final window, whose length Patrianna sets, to ship or sell what they hold; whatever is still held when it ends is sold back automatically, unopened packs included (Q-36). Patrianna decides what happens to the exclusive cards nobody pulled, and the brand's settlement is adjusted (Q-13). Its final allocation or invoice is closed ([Funding and Settlement](../funding-and-settlement/product-spec.md)).
- **BRD-R8 — Partners are first-class.** Own brands launch first (G7), but nothing may assume a brand is internal. A partner brand differs from an own brand only in how it is settled (monthly invoice, Q-08), its spending cap (Q-09), and that its staff are external (Q-22).
- **BRD-R9 — Every change is recorded.** Every change to a brand's set-up or status is recorded with who made it and when.

## 6. Constraints

- **One Phygitals account** (G1): one set of credentials, one prepaid balance, one set of request limits shared by every brand.
- **Sponsor per brand** (Q-14): each brand's operating company answers for its own players, so evidence and terms are per brand.

## 7. Non-functional expectations

- **Fair share.** One brand's traffic must not slow down or block the other brands sharing the account.
- **Adding a brand** takes back-office configuration only; target lead time is set by the business, not by engineering capacity.

## 8. Open questions

- Q-01 — which brands launch first, and when; which partner brands follow.
- Q-30 — the excluded states (legal), since buying is US only (Q-02).

## 9. References

- [Current State](../../current-state.md) §2: "Many brands on one service", "One Phygitals account for all brands".
- [Existing Jira Tickets](../../existing-tickets.md) §3.1: no tickets yet.
