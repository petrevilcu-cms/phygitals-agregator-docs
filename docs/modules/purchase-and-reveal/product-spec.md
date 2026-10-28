<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Purchase and Reveal -->
<!-- Title: Product Spec - Aggregator Purchase and Reveal -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/purchase-and-reveal/product-spec.md`

# Product Spec - Aggregator Purchase and Reveal

**Status:** Draft, 2026-10-28 · **Owner:** Product · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

A player buying a pack, opening it, seeing what they pulled, and the card value fixed at that moment.

## 2. Why

Buying and opening a pack is the core of the product and already works for one storefront ([Current State](../../current-state.md)). On the aggregator it must keep working the same way for every brand, on one shared Phygitals account and one shared prepaid balance, while honouring the legal rule that a card's fair market value (FMV) is fixed at the rip.

## 3. Users

| User | Needs from this module |
| --- | --- |
| Player | Buy a pack at a clear price, open it now or later, see the cards and their value; never lose money to a failed purchase |
| Patrianna support | See any purchase and, when a player asks, its fairness proof |
| Legal | Each card's FMV fixed at the purchase and never changed |
| Patrianna finance | Every purchase attributed to its brand |

## 4. Scope

### 4.1 In scope

- Buying a pack from the player's brand catalog, and its charge and gold-coin bonus.
- Failed purchases and retried purchases.
- Opening a pack at once or later; the reveal.
- FMV at the rip.
- Purchases blocked by a partner's cap or by the shared balance.
- Fairness proof on request.

### 4.2 Out of scope, owned elsewhere

- What a brand sells: [Catalog and Exclusive Cards](../catalog-and-exclusive-cards/product-spec.md).
- The player's USD balance and deposits: the brand's wallet and cashier ([Brand Integration](../brand-integration/product-spec.md)).
- What happens to cards after the reveal: [Collection and Sell-back](../collection-and-sell-back/product-spec.md), [Shipping and Fulfilment](../shipping-and-fulfilment/product-spec.md).

## 5. Requirements

- **BUY-R1 — Buy from the brand's catalog.** A player can buy only packs in their brand's catalog. The price is Phygitals' pack price, 1:1, in US dollars, taken from the player's USD balance (Q-05, Q-06).
- **BUY-R2 — No money without a pack, no pack without money.** If a purchase fails, the player's money is returned, and the player is told why in plain words: not enough balance, sold out, unavailable, sales paused.
- **BUY-R3 — One purchase, one charge.** A purchase that is retried — a double tap, a dropped connection — charges the player once and gives one pack.
- **BUY-R4 — Gold-coin bonus.** A purchase grants the pack's gold-coin bonus, as today (Q-05).
- **BUY-R5 — Open now or later.** A player may open a pack at once or keep it unopened and open it later (Q-26).
- **BUY-R6 — FMV fixed at the rip.** The rip is the purchase. Each card's FMV is fixed at the moment the pack is bought and never changes afterwards, even if the pack is opened later; the player sees that value (Q-19, compliance input 4). What FMV is used for beyond display is Q-31.
- **BUY-R7 — Partner cap.** When a partner brand has reached its monthly spending cap, its players cannot buy until the cap resets or finance raises it, and they are told sales are unavailable (Q-09).
- **BUY-R8 — Shared balance cannot cover a purchase.** No player is ever charged for a purchase the shared prepaid balance cannot cover. Buying pauses on every brand when the balance falls to a reserve finance sets, so shipping can always be paid; collection, sell-back and shipping keep working, and buying resumes once the balance is back above the reserve (Q-41).
- **BUY-R9 — Fairness proof on request.** Support can retrieve the fairness proof of any purchase when a player asks; the storefront does not show it (Q-27).
- **BUY-R10 — Every purchase is on record.** Each purchase records its brand, player, pack, price, gold-coin bonus, cards drawn, each card's FMV at the purchase, and when it happened. Support and reports can find it (Q-24, Q-25).

## 6. Constraints

- **Cards are drawn at purchase.** Phygitals decides the cards when the pack is bought, even when it stays unopened; the reveal only shows them.
- **One shared prepaid balance** pays for every brand's purchases (G1); Phygitals refuses a purchase the balance cannot cover.
- **No cancellation.** Phygitals has no way to undo a pack once bought.

## 7. Non-functional expectations

- A purchase feels instant to the player; the reveal does not wait on back-office bookkeeping.
- A purchase is never lost or doubled, whatever fails in between.

## 8. Open questions

- Q-31 — what FMV is used for beyond display.

## 9. References

- [Current State](../../current-state.md) §2: "Buying a pack", "Player price", "Opening a pack", "Fair market value (FMV)", "Fairness proof".
- [Existing Jira Tickets](../../existing-tickets.md) §3.3.
