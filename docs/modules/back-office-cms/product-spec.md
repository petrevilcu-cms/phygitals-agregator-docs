<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Back Office (CMS) -->
<!-- Title: Product Spec - Aggregator Back Office (CMS) -->
<!-- Label: product-spec -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/back-office-cms/product-spec.md`

# Product Spec - Aggregator Back Office (CMS)

**Status:** Draft, 2026-10-28 · **Owner:** Product · **Stories:** [User Stories](user-stories.md) · **Design (engineering):** [SDD](sdd.md)

Q- and D- numbers refer to the [Decision Log](../../decision-log.md); G- numbers to the givens in the [Overview](../../overview.md).

## 1. Summary

What Patrianna and brand staff do in the Payload CMS: manage each brand's packs, run shipping and player support, and watch the money.

## 2. Why

The aggregator is run by people, not by engineering: brands, catalogs, brand-only packs, shipping, state rules, credits, caps and reports all need a place to be worked on (G6). Nothing of this exists today — Collectibles' admin module has no operations and is not deployed ([Current State](../../current-state.md)). Which Payload instance hosts it is engineering's decision (Q-21).

## 3. Users

Four kinds of user (Q-22). What each may do is fixed by the [role grid](../../decision-log.md#q-34-back-office-role-grid) (Q-34).

| User | Works across | In short |
| --- | --- | --- |
| Patrianna admin and operations | All brands | Run catalogs, brand-only packs, shipping, state rules, pauses, credits up to the limit, users |
| Patrianna finance | All brands | Caps, balance alerts, credits above the limit, money and reports |
| Own-brand staff | Their brand only | Present their packs; look up their players; view their orders and reports |
| Partner-brand staff | Their brand only | The same as own-brand staff |

## 4. Scope

The back office is where the other modules' operator work happens. This page owns access, brand scoping, player look-up, manual credits, users and the audit trail; the rest is specified in the module that owns it.

| Back-office capability | Specified in | Day one (Q-24) |
| --- | --- | --- |
| Brand set-up, go-live, pause, offboarding | [Brands and Onboarding](../brands-and-onboarding/product-spec.md) | Pause: yes |
| Each brand's catalog and presentation; brand-only packs; exclusive-card records; pausing a pack | [Catalog and Exclusive Cards](../catalog-and-exclusive-cards/product-spec.md) | Pause: yes |
| Automatic sell-back window per brand | [Collection and Sell-back](../collection-and-sell-back/product-spec.md) | — |
| Shipping queue, exceptions, deadline alerts; state rules | [Shipping and Fulfilment](../shipping-and-fulfilment/product-spec.md) | Queue and alerts: yes |
| Consumption, reconciliation, allocations, invoices, caps, balance alerts, credit approval | [Funding and Settlement](../funding-and-settlement/product-spec.md) | — |
| Player look-up, including fairness proof | This page | Yes |
| Manual credits and refunds | This page, with approval in Funding and Settlement | Yes |
| Users and access; audit trail; reports | This page | — |

Out of scope: the player-facing storefront ([Brand Integration](../brand-integration/product-spec.md)); Phygitals' own partner dashboard, which stays where exclusive cards are bought (Q-35).

## 5. Requirements

- **OPS-R1 — Access by role.** Every user has one of the four roles, and can do exactly what the role grid allows (Q-22, Q-34).
- **OPS-R2 — Brand staff stay in their brand.** Own-brand and partner-brand staff see and act on their own brand only; nothing of another brand reaches them through search, lists, links or exports (G4, Q-22).
- **OPS-R3 — Player look-up.** Support finds a player within a brand and sees their purchases, cards and unopened packs, sell-backs, automatic sell-backs, shipments, credits and history, and can retrieve a purchase's fairness proof (Q-24, Q-27).
- **OPS-R4 — Manual credits and refunds.** Patrianna admin and operations can credit or refund a player with a recorded reason, up to a limit finance sets; above it, finance approves (Q-24, Q-34; FND-R9).
- **OPS-R5 — Changes without a release.** Everything operators change here — catalogs, presentation, pauses, state rules, windows, caps — takes effect without a release (Q-16, Q-24).
- **OPS-R6 — Audit trail.** Every change and every money action records who, what, when and, where asked for, why. The trail cannot be edited.
- **OPS-R7 — Users and access.** Patrianna admin creates, changes and removes back-office users and their roles; partner-brand staff accounts are tied to their brand.
- **OPS-R8 — Reports.** The three reports of Q-25 are available here: finance sees every brand, brand staff their own brand.

## 6. Constraints

- **Payload CMS** on top of the middleware (G6); the instance is engineering's choice (Q-21).
- **External users.** Partner-brand staff are outside Patrianna (G7); their access must meet the same separation as players' data.

## 7. Non-functional expectations

- Brand separation in the back office is as strict as in the storefront.
- Partner-brand staff accounts can be removed at once when a partner leaves or a person leaves a partner.

## 8. Open questions

- None of its own beyond those of the modules it serves.

## 9. References

- [Decision Log](../../decision-log.md): Q-21 to Q-25, Q-34, Q-35, and the [role grid](../../decision-log.md#q-34-back-office-role-grid).
- [Current State](../../current-state.md) §2: "Back office / CMS".
- [Existing Jira Tickets](../../existing-tickets.md) §3.7: no tickets yet.
