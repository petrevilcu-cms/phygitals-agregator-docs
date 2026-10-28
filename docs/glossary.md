<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Title: Phygitals Aggregator - Glossary -->
<!-- Label: glossary -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/glossary.md`

# Phygitals Aggregator - Glossary

Terms used across these pages. Where Phygitals uses a different word, it is given in brackets.

## Parties

| Term | Definition |
| --- | --- |
| **Phygitals** | The supplier: sells digital packs backed by real graded cards, keeps the cards in an insured US vault, buys them back and ships them. |
| **Partner account** | Patrianna's one account with Phygitals: one set of credentials, one prepaid balance, one catalog. Phygitals sees no brands inside it. |
| **Aggregator** | The whole product described here: Patrianna's middleware plus its back office, standing between the brands and the partner account. |
| **Middleware** | The Patrianna backend that alone talks to Phygitals and serves the brands and the CMS. |
| **Brand** | One storefront brand that sells packs to its own players. An **own brand** is operated by Patrianna; a **partner brand** is a third party with a contract with Patrianna. |
| **Sponsor** | The legal party offering a prize to a player: each brand's own operating company, with its own certification (Q-14). |

## Packs and cards

| Term | Definition |
| --- | --- |
| **Pack** | A digital pack that, when opened, gives one or more cards drawn at random from the pack's backing pool. |
| **Backing pool** (backing inventory) | The vault cards a pack can draw from. |
| **Chase card** | A top card of a pack, shown to attract buyers. |
| **Card** (item) | One physical graded card in the Phygitals vault, held digitally by one player until sold back or shipped. |
| **Rip** | The moment a pack's cards are drawn: its purchase, even when the player opens it later (Q-19). FMV is fixed at the rip. |
| **Reveal** | Showing the player the cards they pulled. |
| **FMV** (fair market value) | The market value of a card, as Phygitals states it. Legal input: fixed at the rip, never changed afterwards. |
| **Brand catalog** | The packs one brand may sell, with that brand's presentation. |
| **Brand-exclusive card** | A card Patrianna bought through Phygitals for one brand and still owns (Q-10, Q-13). Only that brand's players may see or pull it, and it reaches them only through a brand-only pack (Q-11). |
| **Brand-only pack** | A pack made for one brand, holding that brand's exclusive cards. Only that brand lists and sells it. |

## Money

| Term | Definition |
| --- | --- |
| **Prepaid balance** (prepaid partner ledger) | The one balance Patrianna funds at Phygitals. Every purchase and shipment draws on it; every sell-back pays into it. |
| **Brand consumption** | What one brand's activity drew from, or returned to, the prepaid balance. |
| **Pack price** (`mint_price`) | What Phygitals charges Patrianna for one pack. |
| **Player price** | What a brand's player pays for one pack: the pack price, 1:1, in US dollars, for every brand (Q-05, Q-06). |
| **Sell-back** (buyback) | A player returning a card to Phygitals for a set amount instead of shipping it. |
| **Automatic sell-back** (auto-sell) | A sell-back that happens when the player has not sold or shipped a card within its brand's window: 72 hours unless the brand's window is changed in the back office (Q-26). |
| **Handling fee** | The part of a shipping charge for preparing a shipment, as opposed to the carrier's cost. Legal input: never above the actual handling cost, and at most USD 5 in Virginia. |

## Shipping

| Term | Definition |
| --- | --- |
| **Shipping quote** | The options and prices for shipping a set of cards to an address. Nothing is booked. |
| **Shipping order** | A booked shipment of one or more cards to one address. |
| **Claim** | A player's shipping request for a card. The delivery clock starts at the claim (Q-17). |
| **Delivery deadline** | The time by which a claimed card must reach the player: 10 days from the shipping request, in every state (Q-17). Set from the Virginia rule, the strictest known. |

## These pages

| Term | Definition |
| --- | --- |
| **Requirement tag** | **Validated** (clear and agreed) or **TBC** (waiting on a Decision Log row). |
| **Baseline tag** | **Exists**, **Partial** or **New**, against [Current State](current-state.md). |
| **Given** | One of the facts G1–G8 in the [Overview](overview.md) that every requirement must respect. |
