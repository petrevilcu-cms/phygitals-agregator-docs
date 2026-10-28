<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Title: Phygitals Aggregator - Decision Log -->
<!-- Label: decision-log -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/decision-log.md`

# Phygitals Aggregator - Decision Log

Every question the requirements depend on, and every decision taken. A row is **Open** until someone with the authority answers it; it then becomes **Confirmed**, with the date and who decided. A question that turns out to be engineering's to answer is marked **Tech** and moves to that module's SDD.

IDs are stable: stories cite them (`TBC — see Q-11`). Never renumber.

## Confirmed

| ID | Decision | Status | Outcome |
| --- | --- | --- | --- |
| D-01 | How many Phygitals accounts? | Confirmed 2026-10-28 | **One partner account and one API for every brand** (given G1, [Overview](overview.md)). |
| D-02 | Who contracts with whom? | Confirmed 2026-10-28 | **Patrianna holds the Phygitals contract and handles the contract with each brand** (G2). |
| D-03 | Brand-specific stock | Confirmed 2026-10-28 | **Patrianna buys extra cards in the name of each brand** (G3), and **a brand's specific cards are seen only by that brand** (G4). How they are bought and sold is open (Q-10 to Q-13). |
| D-04 | Who talks to Phygitals? | Confirmed 2026-10-28 | **Only the Patrianna middleware.** Brands call the middleware (G5). |
| D-05 | Back office | Confirmed 2026-10-28 | **A Payload CMS on top of the middleware** manages packs, shipping and operations; the same back-office API serves the CMS and each brand's frontend app (G6). Which CMS instance is open (Q-21). |
| D-06 | Which brands first? | Confirmed 2026-10-28 | **Patrianna's own brands first, then third-party partners** (G7). Requirements must hold for an external partner even where launch scope is internal. |
| D-07 | Requirements versus design | Confirmed 2026-10-28 | **Product writes the need; engineering writes the design** (G8). Each module has a Product Spec and User Stories (product) and an SDD (engineering). |
| D-08 | Baseline | Confirmed 2026-10-28 | **Every story is tagged Exists, Partial or New** against Collectibles as recorded in [Current State](current-state.md). |
| D-09 | Where the pages publish | Confirmed 2026-10-28 | **PN space, new root page `Phygitals Aggregator`**, next to `Gacha-Lottery System Design`. Every title contains "Aggregator" to stay unique in the space. |

## Open — scope and brands

| ID | Decision required | Status | Outcome |
| --- | --- | --- | --- |
| Q-01 | **Launch brands and dates.** Which of Patrianna's brands launch first, and when? Which partner brands are expected next, and roughly when? | Open | |
| Q-02 | **Markets.** US only? Which states are excluded from buying, from shipping, or both? Will any brand operate outside the US? | Open | |
| Q-03 | **RepackZ.** For brands on the aggregator, does Phygitals replace RepackZ, run beside it, or should the requirements stay provider-neutral so another supplier can join later? | Open | |
| Q-04 | **Brand frontend.** Does Patrianna ship one storefront that each brand themes (as the Collectibles frontend module does today), or does each brand — partners especially — build its own app against the back-office API? Or both? | Confirmed 2026-10-28 (product) | **One shared storefront.** Patrianna builds one storefront and every brand, partner brands included, themes it. A brand-built app is not in scope. [Brand Integration](modules/brand-integration/product-spec.md) therefore describes what the shared storefront needs from the back-office API and how a brand's look and copy are configured, not a public API for third-party apps. |

## Open — money

| ID | Decision required | Status | Outcome |
| --- | --- | --- | --- |
| Q-05 | **What the player pays with.** Today the brand wallet is debited in US dollars at Phygitals' price, with a gold-coin bonus. Is that the model for every brand? Do sweepstakes coins (SC) or other currencies come in? | Confirmed 2026-10-28 (product) | **US-dollar balance, as today.** The player's brand wallet is debited in US dollars, and the gold-coin (GC) bonus on a purchase stays. Sweepstakes coins (SC) are not a way to pay for packs. Same model for every brand. Baseline: Exists. |
| Q-06 | **Player price.** Does every brand sell at Phygitals' price, or can a price be set per brand and per pack? Who sets it — Patrianna or the brand? | Confirmed 2026-10-28 (product) | **Phygitals' pack price, 1:1, for every brand.** No markup, no discount, no per-brand price. A brand's catalog sets which packs it shows and how they look, never their price. How Patrianna earns from a brand is part of Q-08. Baseline: Exists. |
| Q-07 | **Sell-back payout.** Does the player receive Phygitals' buyback price, or may Patrianna or the brand keep a margin? Which balance is credited? | Open | |
| Q-08 | **Charging brands for what they consume.** For own brands, internal allocation only? For partners: prepayment, a credit limit, or a monthly invoice? Does Patrianna add a fee or a revenue share on top of Phygitals' cost? | Open | |
| Q-09 | **Protecting the shared balance.** May one brand's volume use up the prepaid balance for every brand, or does each brand need its own allocation or cap? Who tops up, and at what threshold? | Open | |

## Open — brand-exclusive cards

| ID | Decision required | Status | Outcome |
| --- | --- | --- | --- |
| Q-10 | **Buying cards for a brand.** Are they bought through Phygitals, or sourced elsewhere and deposited in the Phygitals vault? Who owns them — Patrianna or the brand? Who pays — Patrianna, recharged to the brand? | Open | |
| Q-11 | **How exclusive cards reach players.** Only in packs made for that brand, also mixed into shared packs, or sold as single cards? Constraint: Phygitals draws a shared pack from one pool, so a card inside a shared pack can be pulled by any brand's player. | Confirmed 2026-10-28 (product) | **Only through brand-only packs.** A brand's exclusive cards sit in packs made for that brand, which only that brand lists and sells. They are never mixed into packs other brands sell, and never sold as single cards. Who creates and stocks a brand-only pack (Phygitals on request, or Patrianna through partner-owned packs) is part of Q-10 and Q-23. |
| Q-12 | **What "only that brand sees them" covers.** Pack lists, pack contents and chase cards, recent pulls, anything else? May a brand's own packs also contain shared cards? | Open | |
| Q-13 | **Exclusive cards later on.** When a player sells back a brand's exclusive card, when a brand leaves, or when its pack is retired, where do those cards go? | Open | |

## Open — shipping and compliance

| ID | Decision required | Status | Outcome |
| --- | --- | --- | --- |
| Q-14 | **Who is the sponsor.** Who is "the Company" in the legal opinion — Patrianna, or each brand's operating company? Does each partner brand need its own certification? | Open | |
| Q-15 | **Shipping fee.** Does the player pay the actual carrier cost plus a handling fee no higher than the actual handling cost and USD 5? Is Phygitals' withdrawal fee, shown today as the "handling fee", a handling fee under that cap? Is there any free-shipping rule? | Open | |
| Q-16 | **State rules.** Is Virginia the only state known so far? Who maintains the per-state rules (fee caps, free delivery, deadlines, exclusions), and how often do they change? | Open | |
| Q-17 | **Delivery deadline.** Virginia requires delivery within 10 days of the win notification. What counts as the notification in our flow — the reveal or the shipping request? What deadline applies elsewhere? Who is accountable when Phygitals' vault misses it? | Open | |
| Q-18 | **"No obligation or expense to the winner" (Virginia).** Packs are bought with US dollars (Q-05). Is a card pulled from a paid pack a "prize" under the Virginia rule? If so, must shipping be free for Virginia players, for every card? | Open | |
| Q-19 | **FMV at the rip.** When a pack is bought now and opened later, is the rip the purchase or the opening? What is FMV used for: display only, prize-value disclosure, sell-back value, tax reporting? | Open | |
| Q-20 | **Player checks.** KYC, age and location before buying or shipping: does the brand platform own them, or must the aggregator enforce them? Is shipping outside the US allowed? | Open | |

## Open — back office

| ID | Decision required | Status | Outcome |
| --- | --- | --- | --- |
| Q-21 | **Which Payload CMS.** The existing multi-tenant Patrianna CMS, or a new instance? Which repository? | Open | |
| Q-22 | **Who works in the CMS.** Patrianna super-admin, Patrianna operations, own-brand staff, partner staff: who exists, and what may each do? | Open | |
| Q-23 | **What "manage packs" means.** Choosing which Phygitals packs each brand sells and how they look (name, artwork, price, category, order)? Or also creating and stocking packs, which Phygitals 1.17 allows for partner-owned packs? | Open | |
| Q-24 | **Operations on day one.** Which must exist at launch: shipping queue and exceptions, player support look-ups, manual credits and refunds, pausing a pack or a brand, balance alerts, reconciliation, reports? | Open | |
| Q-25 | **Reporting.** Which reports per brand, for whom? Does a brand see its own reports in the CMS? | Open | |

## Open — player experience

| ID | Decision required | Status | Outcome |
| --- | --- | --- | --- |
| Q-26 | **Unopened packs and automatic sell-back.** May players keep packs unopened? Is automatic sell-back of untouched cards wanted, and is its window set per brand? | Open | |
| Q-27 | **Fairness proof.** Are players shown the proof that a draw was fair? | Open | |
