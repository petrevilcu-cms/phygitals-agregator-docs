<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Brand Integration -->
<!-- Title: Product Spec - Aggregator Brand Integration -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/brand-integration/product-spec.md`

# Product Spec - Aggregator Brand Integration

**Status:** Draft, 2026-10-28 · **Owner:** Product · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

What a brand's frontend app and backend can do through the aggregator, which events they receive, and the guarantees they can rely on.

## 2. Why

Patrianna builds **one storefront that every brand themes**, partner brands included; no brand builds its own app (Q-04). That storefront talks only to the Patrianna middleware, never to Phygitals (G5), and the same back-office API serves it and the CMS (G6). This module is what the storefront needs from the aggregator and from each brand's own platform, on web and in the iOS app. Today one storefront exists, hosted by each brand's frontend; it does not yet change its look per brand from the back office ([Current State](../../current-state.md), [Existing Jira Tickets](../../existing-tickets.md) §3.8).

## 3. Users

| User | Needs from this module |
| --- | --- |
| Player | Reach the storefront from their brand, in their brand's look, with their balance, on web or iOS |
| Brand | Its look and its sponsor's terms on the storefront; its players only |
| Brand platform | Who the player is (login), their USD balance and cashier, KYC and location checks (Q-20) |
| Patrianna | No Phygitals credentials anywhere a brand or a browser can reach |

## 4. Scope

### 4.1 In scope

- Entering the storefront from a brand, logged in or not.
- The storefront's look and copy per brand, including its sponsor's terms.
- The player's USD balance and deposits as shown in the storefront.
- Notifications to the player.
- Web and iOS.
- Phygitals events for every brand on one account reaching the right brand.

### 4.2 Out of scope, owned elsewhere

- A public API for brand-built apps: not in scope (Q-04).
- The flows themselves: buying ([Purchase and Reveal](../purchase-and-reveal/product-spec.md)), the collection ([Collection and Sell-back](../collection-and-sell-back/product-spec.md)), shipping ([Shipping and Fulfilment](../shipping-and-fulfilment/product-spec.md)).
- The wallet, cashier, login, KYC, age and location checks: the brand's own platform (Q-05, Q-20).

## 5. Requirements

- **INT-R1 — One storefront, every brand.** One storefront serves every brand, own and partner (Q-04). It always runs as exactly one brand, taken from the player's login with that brand's platform.
- **INT-R2 — The brand's look, without a release.** Each brand's look — theme, logo, copy, and the presentation of its packs (CAT-R2) — is set in the back office and reaches the storefront without a release.
- **INT-R3 — The sponsor's terms.** The storefront's rules, how-to-play and terms name the brand's own sponsor (Q-14).
- **INT-R4 — Entry.** A player reaches the storefront from their brand; a player who is not logged in can look and is asked to log in before buying.
- **INT-R5 — Balance and deposit.** The storefront shows the player's USD balance and lets them top it up through their brand's cashier, returning them to what they were doing (Q-05).
- **INT-R6 — Notifications.** The player is told about events that concern them: an automatic sell-back done (COL-R5), shipment progress and exceptions (SHP-R7, SHP-R8), and the warning 24 hours before an automatic sell-back (Q-39).
- **INT-R7 — Web and iOS.** The storefront offers the same flows on mobile web and in the iOS app.
- **INT-R8 — Availability per brand.** A brand's storefront follows its status: nothing to buy while onboarding or paused (BRD-R6), and the brand's own availability restrictions (Q-20).
- **INT-R9 — Events reach the right brand.** Phygitals reports purchases, sell-backs and shipments for every brand through one account (G1); each event is applied to the right brand's player, and none is lost or applied twice.
- **INT-R10 — No supplier credentials in reach.** Phygitals' credentials are never present in the storefront, a browser, the iOS app or anything a brand operates (G5).

## 6. Constraints

- **One storefront** (Q-04): a brand differs only by configuration.
- **App stores.** Payments inside the iOS app are subject to Apple's rules; the approach is still open in MN-7860.

## 7. Non-functional expectations

- The storefront is as fast for one brand as for all brands together.
- A failure at Phygitals shows the player a clear, temporary message, never a broken screen.

## 8. Open questions

- MN-7860 (Jira) — App Store and native payment approach for iOS.

## 9. References

- [Current State](../../current-state.md) §2: "Many brands on one service", "Phygitals events".
- [Existing Jira Tickets](../../existing-tickets.md) §3.8.
