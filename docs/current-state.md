<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Title: Phygitals Aggregator - Current State -->
<!-- Label: current-state -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/current-state.md`

# Phygitals Aggregator - Current State

What the **Collectibles** service already does with Phygitals, so every story can say whether its need **Exists**, exists in **Partial** form, or is **New**. This page describes; it does not prescribe. The Jira tickets behind this work, mapped to the aggregator's modules, are in [Existing Jira Tickets](existing-tickets.md). Whether the aggregator grows out of Collectibles or is built beside it is engineering's call.

**Snapshot:** Collectibles, branch `dev`, commit `14bd76c` (2026-10-28), Phygitals Partner API **1.17.0**. Read from the code and `docs/shared-topology.md` on 2026-10-28. Engineering: correct anything that is wrong here, then re-check the Baseline tags that depend on it.

## 1. In one paragraph

One Collectibles server per stage already serves every brand. The brand comes from the player's login token, and players are kept apart per brand. Collectibles talks to Phygitals **as if every brand had its own partner account**: each brand has its own Phygitals credentials and its own webhook address, and several brands can share one account only by being given the same key. Players can buy and open packs, see their cards, sell them back and ship them. The brand's wallet is charged in US dollars at Phygitals' own price. There is **no per-brand catalog, no brand-exclusive stock, no back office, no state shipping rules, and no split of the shared prepaid balance by brand.**

## 2. Capability by capability

| Capability | What Collectibles does today | Baseline |
| --- | --- | --- |
| **Many brands on one service** | One server per stage serves all brands. The brand is taken from the player's login token; player accounts are unique per brand. A request without a brand is refused. | Exists |
| **One Phygitals account for all brands** | Each brand has its own Phygitals credentials setting. Brands share an account only if each is given the same key; reconciliation notices that case. | Partial |
| **Telling brands apart at Phygitals** | The id sent to Phygitals for a player is Collectibles' internal account id, unique across brands but carrying no brand. Idempotency keys carry the operation and the account, not the brand. | Partial |
| **Phygitals events** | Received per brand at a brand-specific address, signature-checked, stored once. Handles purchase, buyback and shipping events. Whether brands sharing one account can share one event address is an open point in Collectibles' own docs. | Partial |
| **Catalog** | Each brand sees every pack its Phygitals key returns, refreshed every minute. Names, prices, odds and expected value come straight from Phygitals. No per-brand selection, no renaming, no custom artwork, no ordering. | Partial |
| **Brand-exclusive packs or cards** | None. | New |
| **Buying a pack** | One pack per purchase. The player's brand wallet is debited first, then Phygitals is called; the player is refunded only once Phygitals confirms the buy failed. A purchase may also grant gold coins (GC) as a bonus, through a pack-to-bundle mapping kept by hand. | Exists |
| **Player price** | Phygitals' pack price, charged 1:1 in US dollars. No markup, no discount, no currency conversion. Sweepstakes coins (SC) are not used. | Exists (single model) |
| **Opening a pack** | Cards are drawn at purchase; Collectibles records when the player reveals them. Buying a pack to open later is not used. | Exists |
| **Fair market value (FMV)** | Read per card after purchase, stored and shown. Never paid out. Whether the stored figure is the value "at the rip" in the legal sense has not been checked against the compliance input. | Partial |
| **Fairness proof** | Not used. | New |
| **Card collection** | The player's cards are listed from Phygitals and from Collectibles' own records. | Exists |
| **Sell-back** | One card or several at once. The wallet is credited with the card's buyback price, rounded down to the cent. | Exists |
| **Automatic sell-back** | Unsold cards are sold back automatically after 72 hours. Off by default; one setting for the whole stage, not per brand. | Partial |
| **Shipping** | Off by default. Address book (up to 10 per player), quote, request, order list and detail, cancellation, delivery status. The player pays Phygitals' total shipping cost rounded up to the cent; Phygitals' withdrawal fee is shown as the "handling fee". No free shipping, no fee cap, no state rules, no delivery-deadline tracking. | Partial |
| **Shared prepaid balance** | Every record carries its brand. A daily per-brand check against Phygitals' ledger exists, off by default. No per-brand allocation or cap on the shared balance, no low-balance alert, no settlement with brands. | Partial |
| **Back office / CMS** | An admin module exists but has no operations and is not deployed. No CMS. No ops tooling for refunds, pack set-up, reconciliation or shipping exceptions. | New |
| **Player eligibility** | No KYC, age, state or purchase-limit checks inside Collectibles. Phygitals' "country not supported" refusal is passed through. The brand platform may cover some of this; to be confirmed. | New |
| **RepackZ** | Runs side by side as a separate integration with its own routes and records. There is no common layer shared by the two providers. | — |

## 3. The gaps that shape the aggregator most

1. **A single account in fact, not by coincidence.** Today's design assumes one Phygitals account per brand and tolerates sharing. The aggregator starts from one shared account (G1), so brand attribution of every player, purchase, card, sell-back, shipment and event must hold by design.
2. **A catalog per brand, down to the card.** Nothing today restricts what a brand sees or sells (G4).
3. **A back office.** Nothing exists for packs, shipping operations, support or money (G6).
4. **Compliance rules.** No shipping fee cap, no free delivery where the law requires it, no delivery deadline, no explicit FMV-at-rip guarantee.
5. **Money per brand.** No allocation, protection or settlement of the shared prepaid balance by brand (G2).

## 4. Where to look

- `Collectibles/docs/shared-topology.md`: deployment, per-brand settings, the webhook route.
- `Collectibles/docs/phygitals-api-reference.json`: Phygitals Partner API 1.17.0.
- `Collectibles/docs/phygitals-test-coverage.md`: what is tested against Phygitals.
