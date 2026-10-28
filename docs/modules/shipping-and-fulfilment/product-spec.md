<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Shipping and Fulfilment -->
<!-- Title: Product Spec - Aggregator Shipping and Fulfilment -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/shipping-and-fulfilment/product-spec.md`

# Product Spec - Aggregator Shipping and Fulfilment

**Status:** Draft, 2026-10-28 · **Owner:** Product · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

A player asking for cards to be shipped, what that costs them, how fast the cards must arrive, and what operations does when a shipment goes wrong.

## 2. Why

Shipping is where the product meets the law. The legal review (2026-10-28) requires shipping charges to be reasonable and based on actual cost, claimed cards to arrive within the required time, and some states — Virginia so far — to cap handling fees and set delivery deadlines ([Overview](../../overview.md) §7). Today Collectibles can quote, book and track a shipment, but it passes Phygitals' total through unchanged and knows nothing of state rules or deadlines ([Current State](../../current-state.md)).

## 3. Users

| User | Needs from this module |
| --- | --- |
| Player | Ship cards to their address at a fair, known price; follow the shipment; get it on time |
| Patrianna operations | Work the shipping queue and exceptions; see orders at risk of missing their deadline; keep state rules current |
| Brand staff | See their own brand's orders |
| Legal | Every shipment charged and delivered within the rules of the player's state, with proof per sponsor |

## 4. Scope

### 4.1 In scope

- Saved addresses; requesting a shipment of one or more held cards; the price shown before confirming.
- How the price is made up, and state rules on charges and free delivery.
- Where cards may ship.
- The 10-day delivery deadline and how it is watched.
- Shipment status, tracking and exceptions.
- State rules maintained in the back office.

### 4.2 Out of scope, owned elsewhere

- The vault, packing and carriage: Phygitals.
- Which states have rules, and what they are: legal (Q-30).
- The compliance reports built from shipping records: [Compliance](../compliance/product-spec.md).

## 5. Requirements

- **SHP-R1 — Request a shipment.** A player can ask for one or more cards they hold to be shipped to an address, and sees the shipping options and the total price before confirming.
- **SHP-R2 — Price made of real costs.** The player pays the actual carrier cost plus a handling fee. The charge is never more than what shipping actually costs the sponsor (compliance input 1; Q-15). There is no general free-shipping offer.
- **SHP-R3 — State rules on charges.** Where the destination state limits shipping charges, its rule applies to that shipment. Virginia: the handling fee is at most the actual cost of handling and at most USD 5 (compliance input 3; Q-15). Where a state requires delivery at no expense to the winner, the player is not charged (Q-18).
- **SHP-R4 — Where cards may ship.** Cards ship to US addresses only (Q-02). Before a shipment is booked, its address is checked against the excluded states and the state rules, which legal supplies and operations keeps current (Q-16, Q-30).
- **SHP-R5 — 10-day delivery, every state.** A card is claimed when the player requests its shipment. It must be delivered within 10 days of that request, in every state (Q-17).
- **SHP-R6 — Watching the deadline.** Every shipping order is tracked against its deadline. Operations sees orders at risk before the deadline passes (Q-24).
- **SHP-R7 — Status and tracking.** The player and support can follow each order: requested, being prepared, shipped (with tracking), delivered, or in exception.
- **SHP-R8 — Exceptions.** A shipment that fails, is cancelled or is late lands in operations' queue; the player is told. The player may cancel an order until Phygitals starts preparing it. A cancelled order, or one that fails before it ships, is refunded in full; after it ships, operations decides case by case (Q-40).
- **SHP-R9 — State rules in the back office.** Legal decides the state rules; Patrianna operations keeps them current in the back office; a change takes effect without a release (Q-16). Each order records which rule was applied.
- **SHP-R10 — Evidence per brand and state.** For every order, what was charged, what it actually cost, the rule applied and when it was delivered are kept and reportable per brand and state (Q-14, Q-25).
- **SHP-R11 — Saved addresses.** A player can save, edit and delete addresses.
- **SHP-R12 — Who may do what.** Patrianna admin and operations work the queue and edit state rules; finance and brand staff view; brand staff see their own brand only (Q-34).

## 6. Constraints

- **Phygitals' quote.** Phygitals prices a shipment as a total that includes a `withdrawal_fees` amount. Whether that amount is a handling fee under the state caps is Q-29; who absorbs any difference above a cap follows from it.
- **Phygitals' delivery.** Meeting the 10-day deadline depends on Phygitals preparing and handing over the parcel in time. Its commitment is Q-32.
- **Quotes expire** after a short time; a stale quote must be refreshed before booking.
- **Phygitals' sandbox** does not move orders past creation, so the later states cannot be tested there.

## 7. Non-functional expectations

- No order is ever booked without passing the address check and the state rules in force at that moment.
- Deadline alerts reach operations early enough to act, not after the deadline.

## 8. Open questions

- Q-18 — whether Virginia's "no expense to the winner" means free shipping for cards from paid packs.
- Q-29 — Phygitals' withdrawal fee under the caps.
- Q-30 — the full list of states, their rules and the excluded states.
- Q-32 — Phygitals' delivery commitment.

## 9. References

- [Overview](../../overview.md) §7, compliance inputs 1–3.
- [Current State](../../current-state.md) §2: "Shipping".
- [Existing Jira Tickets](../../existing-tickets.md) §3.5.
