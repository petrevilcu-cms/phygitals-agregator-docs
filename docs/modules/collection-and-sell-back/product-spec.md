<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Collection and Sell-back -->
<!-- Title: Product Spec - Aggregator Collection and Sell-back -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/collection-and-sell-back/product-spec.md`

# Product Spec - Aggregator Collection and Sell-back

**Status:** Draft, 2026-10-28 · **Owner:** Product · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

The cards a player holds in the vault, selling them back, and what happens to cards a player does not act on.

## 2. Why

After a reveal, every card is held for the player in Phygitals' vault until it is sold back or shipped. This works today for one storefront ([Current State](../../current-state.md)). On the aggregator, a player must only ever act on their own brand's cards, each brand sets its own automatic sell-back window (Q-26), and a brand's exclusive cards must come back to that brand when sold (Q-12).

## 3. Users

| User | Needs from this module |
| --- | --- |
| Player | See every card and unopened pack they hold; sell back at a clear price; know when a card will be or was sold automatically |
| Patrianna admin | Set each brand's automatic sell-back window |
| Patrianna support | See a player's cards and their history |
| Legal | Confirm that automatic sell-back of unclaimed cards is allowed (Q-18) |

## 4. Scope

### 4.1 In scope

- The player's collection: unopened packs and held cards, with their status and values.
- Selling back one card or several.
- Automatic sell-back, its window per brand, and telling the player.
- The player's transaction history.

### 4.2 Out of scope, owned elsewhere

- Shipping a card: [Shipping and Fulfilment](../shipping-and-fulfilment/product-spec.md).
- Where a sold-back exclusive card goes: [Catalog and Exclusive Cards](../catalog-and-exclusive-cards/product-spec.md) (CAT-R7).
- The USD balance itself: the brand's wallet.

## 5. Requirements

- **COL-R1 — The collection.** A player sees every unopened pack and card they hold on their brand, each card with its status (held, selling, sold, shipping, shipped), its FMV at the purchase (BUY-R6), what it would sell back for, and when it would be sold automatically.
- **COL-R2 — Sell back.** A player can sell back one card or several at once. Each sold card credits the player's USD balance with Phygitals' buyback price, rounded down to the cent, with no margin kept (Q-07). If some cards in a batch sell and others do not, the player sees which.
- **COL-R3 — Only the holder acts.** Only the player who holds a card, on the brand where they hold it, can sell it back, ship it or open the pack it is in. Phygitals checks only that a card is held by one of Patrianna's players — any brand — so this check is Patrianna's (G1).
- **COL-R4 — Automatic sell-back per brand.** A card the player has neither sold nor shipped is sold back automatically when its brand's window ends: 72 hours unless the brand's window is changed in the back office (Q-26). It credits the same amount a manual sell-back would.
- **COL-R5 — Told about automatic sell-back.** A player is told when a card was sold automatically and how much was credited. They are also warned 24 hours before, in their brand's inbox, and each card shows its countdown (Q-39).
- **COL-R6 — Legal check on automatic sell-back.** Selling back a card the player has not claimed must be confirmed by legal to sit within each sponsor's rules (Q-18, Q-26).
- **COL-R7 — Transaction history.** A player can see their purchases, sell-backs, automatic sell-backs, shipping charges and refunds on their brand, with dates and amounts.
- **COL-R8 — Support can see it all.** Support can see a player's collection and history, within the player's brand (Q-24).

## 6. Constraints

- **Sell-back is final.** Phygitals offers no way to undo a sell-back.
- **The buyback price can change** while the card is held; a sell-back pays the price at the moment it happens.
- **Batch sell-back may partly succeed**: each card succeeds or fails on its own.

## 7. Non-functional expectations

- An automatic sell-back happens on time for every brand, and none is missed or repeated.
- A card being sold or shipped cannot be sold or shipped a second time.

## 8. Open questions

- Q-18 — legal confirmation that unclaimed cards may be sold automatically.

## 9. References

- [Current State](../../current-state.md) §2: "Card collection", "Sell-back", "Automatic sell-back".
- [Existing Jira Tickets](../../existing-tickets.md) §3.4.
