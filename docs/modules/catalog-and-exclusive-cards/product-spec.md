<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Catalog and Exclusive Cards -->
<!-- Title: Product Spec - Aggregator Catalog and Exclusive Cards -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/catalog-and-exclusive-cards/product-spec.md`

# Product Spec - Aggregator Catalog and Exclusive Cards

**Status:** Draft, 2026-10-28 · **Owner:** Product · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

Which packs and cards each brand can show and sell, how a brand presents them, and the cards Patrianna buys for one brand that only that brand's players may see.

## 2. Why

Today every brand sees every pack Phygitals offers, under Phygitals' names, with no way to choose, rename or reorder, and no way to keep anything to one brand ([Current State](../../current-state.md)). Patrianna wants each brand to sell its own selection under its own presentation, and to give some brands cards nobody else can see or pull (G3, G4).

## 3. Users

| User | Needs from this module |
| --- | --- |
| Patrianna admin | Choose each brand's packs; build brand-only packs; pause a pack |
| Brand staff (own and partner) | Present their own brand's packs |
| Player | See only their brand's packs, with correct odds, value and availability |
| Patrianna finance | Know which brand each exclusive card was bought for, and its cost |

## 4. Scope

### 4.1 In scope

- Each brand's catalog: which packs it sells and how they look.
- Brand-only packs and the exclusive cards in them.
- Keeping exclusive cards exclusive, including after a sell-back.
- Retiring a brand-only pack; pausing a pack.

### 4.2 Out of scope, owned elsewhere

- Prices: always Phygitals' pack price (Q-06); nothing to configure.
- Buying a pack: [Purchase and Reveal](../purchase-and-reveal/product-spec.md).
- Buying the exclusive cards themselves: done outside the back office (Q-35); only the record of them is here.
- Charging a brand for its exclusive cards: [Funding and Settlement](../funding-and-settlement/product-spec.md).

## 5. Requirements

- **CAT-R1 — A catalog per brand.** Each brand sells only the packs Patrianna chose for it (Q-23). A pack outside a brand's catalog is invisible and cannot be bought by that brand's players, whatever Phygitals offers.
- **CAT-R2 — Presentation per brand, price never.** For each pack in its catalog a brand can have its own name, artwork, category, order, and offer and thrill-level grouping (Q-23; today's pack offers and thrill levels, MN-7698, MN-7807). The price is always Phygitals' pack price, 1:1, in US dollars (Q-06), and odds, expected value and chase cards are always Phygitals' own.
- **CAT-R3 — Availability follows Phygitals.** When Phygitals disables a pack or it runs out, it stops being buyable on every brand within one minute, on every brand (Q-38). A purchase made in that gap is refused and refunded (BUY-R2).
- **CAT-R4 — Brand-only packs.** Patrianna can create a pack for one brand, holding that brand's exclusive cards plus ordinary vault cards that fill out its value (Q-11, Q-23, Q-33). Only that brand lists and sells it.
- **CAT-R5 — Exclusive cards are recorded.** Each exclusive card Patrianna buys is recorded with the brand it is for and what it cost (Q-35). Patrianna owns it (Q-13). It reaches players only through that brand's brand-only packs (Q-11).
- **CAT-R6 — Exclusive means exclusive everywhere.** A brand's exclusive cards and brand-only packs never appear to another brand's players anywhere Patrianna shows packs or cards: pack lists, pack contents, chase cards, previews, recent wins, feeds (G4, Q-12).
- **CAT-R7 — Exclusive after a sell-back.** A card sold back from a brand-only pack returns to that brand's pack and stays exclusive (Q-12).
- **CAT-R8 — Exclusive beyond Patrianna.** Brand-only packs and their exclusive cards are kept off Phygitals' own storefront and away from Phygitals' other partners. This must be agreed with Phygitals in the contract (Q-33).
- **CAT-R9 — Retiring a brand-only pack.** When a brand-only pack is retired, Patrianna decides for each exclusive card nobody pulled: move it into another brand's pack or sell it back to Phygitals; the brand's settlement is adjusted (Q-13).
- **CAT-R10 — Who may change what.** Only Patrianna admin and operations choose a brand's packs and build brand-only packs; brand staff may change the presentation of their own brand's packs (Q-34).
- **CAT-R11 — Pausing a pack.** A pack can be paused for one brand or for every brand, at once, without a release (Q-24).
- **CAT-R12 — Every change is recorded.** Every catalog change is recorded with who made it and when.

## 6. Constraints

- **One pool per pack.** Phygitals draws each pack from one pool, so a card inside a pack every brand sells can be pulled by any brand's player. This is why exclusive cards live only in brand-only packs (Q-11).
- **Shared stock.** A pack sold by several brands sells out for all of them at once.
- **One odds curve and one price per pack.** A brand cannot have its own odds or price for a shared pack; a genuinely different pack is a different Phygitals pack.
- **Restocking.** Phygitals refills a pack from its vault to hold the pack's value band; cards can be protected from this (API 1.17). Engineering to confirm how exclusive cards stay in their pack.
- **Offers and thrill levels.** How today's pack offers and thrill levels map onto Phygitals' packs is not written down ([Existing Jira Tickets](../../existing-tickets.md) §2); engineering to confirm.

## 7. Non-functional expectations

- A change to a brand's catalog or presentation reaches its players without a release.
- The catalog reads at storefront speed for every brand at once.

## 8. Open questions

- Q-33 (contract part) — Phygitals' agreement to keep brand-only packs off its own storefront and other partners.

## 9. References

- [Current State](../../current-state.md) §2: "Catalog", "Brand-exclusive packs or cards".
- [Existing Jira Tickets](../../existing-tickets.md) §3.2.
