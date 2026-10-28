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
| **Sponsor** | The legal party offering a prize to a player. Which entity that is per brand is open (Q-14). |

## Packs and cards

| Term | Definition |
| --- | --- |
| **Pack** | A digital pack that, when opened, gives one or more cards drawn at random from the pack's backing pool. |
| **Backing pool** (backing inventory) | The vault cards a pack can draw from. |
| **Chase card** | A top card of a pack, shown to attract buyers. |
| **Card** (item) | One physical graded card in the Phygitals vault, held digitally by one player until sold back or shipped. |
| **Rip** | Opening a pack. FMV is fixed at the rip (see Compliance). Whether a pack bought now and opened later is ripped at purchase or at opening is open (Q-19). |
| **Reveal** | Showing the player the cards they pulled. |
| **FMV** (fair market value) | The market value of a card, as Phygitals states it. Legal input: fixed at the rip, never changed afterwards. |
| **Brand catalog** | The packs one brand may sell, with that brand's presentation. |
| **Brand-exclusive card** | A card Patrianna bought for one brand. Only that brand's players may see or pull it, and it reaches them only through a brand-only pack (Q-11). |
| **Brand-only pack** | A pack made for one brand, holding that brand's exclusive cards. Only that brand lists and sells it. |

## Money

| Term | Definition |
| --- | --- |
| **Prepaid balance** (prepaid partner ledger) | The one balance Patrianna funds at Phygitals. Every purchase and shipment draws on it; every sell-back pays into it. |
| **Brand consumption** | What one brand's activity drew from, or returned to, the prepaid balance. |
| **Pack price** (`mint_price`) | What Phygitals charges Patrianna for one pack. |
| **Player price** | What a brand's player pays for one pack: the pack price, 1:1, in US dollars, for every brand (Q-05, Q-06). |
| **Sell-back** (buyback) | A player returning a card to Phygitals for a set amount instead of shipping it. |
| **Automatic sell-back** (auto-sell) | A sell-back that happens when the player has not acted on a card within a set window. |
| **Handling fee** | The part of a shipping charge for preparing a shipment, as opposed to the carrier's cost. Legal input: never above the actual handling cost, and at most USD 5 in Virginia. |

## Shipping

| Term | Definition |
| --- | --- |
| **Shipping quote** | The options and prices for shipping a set of cards to an address. Nothing is booked. |
| **Shipping order** | A booked shipment of one or more cards to one address. |
| **Delivery deadline** | The time by which a won card must reach the player. Legal input: 10 days from the win notification in Virginia. |

## These pages

| Term | Definition |
| --- | --- |
| **Requirement tag** | **Validated** (clear and agreed) or **TBC** (waiting on a Decision Log row). |
| **Baseline tag** | **Exists**, **Partial** or **New**, against [Current State](current-state.md). |
| **Given** | One of the facts G1–G8 in the [Overview](overview.md) that every requirement must respect. |
