<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Title: Phygitals Aggregator - Existing Jira Tickets -->
<!-- Label: existing-tickets -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/existing-tickets.md`

# Phygitals Aggregator - Existing Jira Tickets

What is already ticketed for Collectibles in the MN project, mapped to the aggregator's modules, so new stories build on what exists instead of repeating it. [Current State](current-state.md) says what the code does; this page says what was asked for and where each piece stands.

**Snapshot:** 2026-10-28, from the [MN Collectibles board](https://patrianna.atlassian.net/jira/software/projects/MN/boards/3675). The board's tickets sit under four `[Collectibles]` epics, 105 tickets in all; three more outside the epics are included (MN-7795, MN-7820, MN-7932). Statuses are Jira's on that date.

## 1. The four epics

| Epic | Scope | Epic status | Tickets |
| --- | --- | --- | --- |
| [MN-7692](https://patrianna.atlassian.net/browse/MN-7692) [Collectibles] Functional MVP | The first player experience: USD balance, pack offers, purchase, reveal, sell, vault, auto-sell, shipping request | Open | 34: 24 done, 2 in progress, 3 on hold, 1 blocked, 3 to do or backlog, 1 cancelled |
| [MN-7840](https://patrianna.atlassian.net/browse/MN-7840) [Collectibles] Functional MVP 2 – Design Adjustments | Final design: pack colours, bundles, previews, carousel, vault on mobile web | Open | 23: 10 done, 4 on hold, 5 to do, 4 cancelled |
| [MN-7858](https://patrianna.atlassian.net/browse/MN-7858) [Collectibles] Functional MVP 3 – Native app {iOS} | The same experience in the iOS app | Open | 23: 13 done, 1 on hold, 9 backlog |
| [MN-8016](https://patrianna.atlassian.net/browse/MN-8016) [Collectibles] Migration from RepackZ to Phygitals | Backend (BE-1 to BE-19) and frontend (FE-1 to FE-6) move from RepackZ to Phygitals | In progress | 25: 16 done, 5 in progress or testing, 1 on hold, 3 to do |

## 2. What the tickets tell us

1. **RepackZ is being replaced, not joined.** MN-8016 migrates Collectibles to Phygitals, and MN-8019 (BE-3, to do) removes RepackZ. This points to an answer for [Q-03](decision-log.md); product to confirm.
2. **The player pays from a Collectibles USD balance funded by deposit.** MN-7693 shows it, MN-7694 deposits into it (in progress), MN-7830 spends it on offers (to do), MN-7882 lets it buy casino offers (iOS, backlog). This matches [Q-05](decision-log.md).
3. **Packs are sold as "pack offers" with a "thrill level".** The player picks an offer, then a thrill level with its own odds (MN-7698, MN-7870, MN-7814); offers come in bundles (MN-7807); the levels have names such as Apex, Elite and Mythic (MN-7932). How an offer and its levels relate to Phygitals' packs is not stated in the summaries: engineering to confirm. The brand catalog must keep this presentation.
4. **Availability restrictions are the only compliance work ticketed.** MN-7714 (feature toggles, blocked) and MN-7865 (iOS, backlog). Nothing covers state shipping rules, fee caps, delivery deadlines, FMV at the rip, KYC or age.
5. **No ticket names a brand.** Every ticket describes one storefront entered from "the Casino Lobby". Nothing covers several brands, one shared account, a per-brand catalog, exclusive cards or a back office.
6. **Jira lags the code in places.** MN-8031 (BE-15 webhook receiver) is on hold, yet a webhook receiver is on `dev` under that key. MN-8033 (BE-17 test harness) is to do, yet a Phygitals contract check is on `dev` under that key. Engineering to bring the statuses up to date before these tickets are used as a baseline.

## 3. Tickets by aggregator module

### 3.1 Brands and Onboarding

No tickets.

### 3.2 Catalog and Exclusive Cards

| Ticket | Epic | Summary | Status |
| --- | --- | --- | --- |
| [MN-7695](https://patrianna.atlassian.net/browse/MN-7695) | MVP 1 | Display Pack Offers on the Packs tab | Done |
| [MN-7708](https://patrianna.atlassian.net/browse/MN-7708) | MVP 1 | Select Collectibles Category | Done |
| [MN-7709](https://patrianna.atlassian.net/browse/MN-7709) | MVP 1 | Preview Cards available in a Pack Offer | Done |
| [MN-7793](https://patrianna.atlassian.net/browse/MN-7793) | MVP 2 design | Collectibles cards pack color code | Done |
| [MN-7807](https://patrianna.atlassian.net/browse/MN-7807) | MVP 2 design | Collectible packs bundles | Done |
| [MN-7808](https://patrianna.atlassian.net/browse/MN-7808) | MVP 2 design | Collectible card types | To Do |
| [MN-7809](https://patrianna.atlassian.net/browse/MN-7809) | MVP 2 design | Collectible packs preview | Done |
| [MN-7811](https://patrianna.atlassian.net/browse/MN-7811) | MVP 2 design | Collectibles pack presentation with carousel | On hold |
| [MN-7813](https://patrianna.atlassian.net/browse/MN-7813) | MVP 2 design | Pack cards carousel | Done |
| [MN-7815](https://patrianna.atlassian.net/browse/MN-7815) | MVP 2 design | Collectibles main page | Done |
| [MN-7998](https://patrianna.atlassian.net/browse/MN-7998) | MVP 2 design | Group Pack preview Cards by label and FMV | To Do |
| [MN-7932](https://patrianna.atlassian.net/browse/MN-7932) | — | [Collectibles][DEV] Apex, Elite and Mythic packs display 10M GC instead of 20M, 40M and 60M | Done |
| [MN-8020](https://patrianna.atlassian.net/browse/MN-8020) | Migration | BE-4 Catalog on Phygitals | Done |
| [MN-8035](https://patrianna.atlassian.net/browse/MN-8035) | Migration | FE-2 Catalog differences | In Progress |
| [MN-7868](https://patrianna.atlassian.net/browse/MN-7868) | MVP 3 iOS | [Collectibles][iOS] Browse Pack offers with final presentation | Done |
| [MN-7869](https://patrianna.atlassian.net/browse/MN-7869) | MVP 3 iOS | [Collectibles][iOS] Preview potential Cards and recent wins | Done |

### 3.3 Purchase and Reveal

| Ticket | Epic | Summary | Status |
| --- | --- | --- | --- |
| [MN-7696](https://patrianna.atlassian.net/browse/MN-7696) | MVP 1 | Open Pack Offer purchase modal | Done |
| [MN-7697](https://patrianna.atlassian.net/browse/MN-7697) | MVP 1 | Complete Pack Offer purchase | Done |
| [MN-7698](https://patrianna.atlassian.net/browse/MN-7698) | MVP 1 | Select Pack Offer Thrill Level | Done |
| [MN-7699](https://patrianna.atlassian.net/browse/MN-7699) | MVP 1 | Award Gold Coins with Pack purchase | Done |
| [MN-7700](https://patrianna.atlassian.net/browse/MN-7700) | MVP 1 | Select and reveal an unopened Pack | Done |
| [MN-7796](https://patrianna.atlassian.net/browse/MN-7796) | MVP 1 | [Collectibles] Buy CTA labels and prices are missing on Packs page and purchase modal | Done |
| [MN-7821](https://patrianna.atlassian.net/browse/MN-7821) | MVP 1 | [Collectibles] Show GC reward overlay after successful Pack purchase | Done |
| [MN-7822](https://patrianna.atlassian.net/browse/MN-7822) | MVP 1 | [Collectibles] Packs screen blink briefly replaces the Card result during reveal | Done |
| [MN-7810](https://patrianna.atlassian.net/browse/MN-7810) | MVP 2 design | Collectibles card packs reveal animation | On hold |
| [MN-7812](https://patrianna.atlassian.net/browse/MN-7812) | MVP 2 design | Purchase pack - GC coins animation | Done |
| [MN-7814](https://patrianna.atlassian.net/browse/MN-7814) | MVP 2 design | Thrill level interface | On hold |
| [MN-7938](https://patrianna.atlassian.net/browse/MN-7938) | MVP 2 design | [Collectibles] Remove pack purchase confirmation dialog | On hold |
| [MN-7933](https://patrianna.atlassian.net/browse/MN-7933) | MVP 2 design | Buy CTA button is hidden under Safari address bar on smaller iPhones | To Do |
| [MN-7870](https://patrianna.atlassian.net/browse/MN-7870) | MVP 3 iOS | [Collectibles][iOS] Choose Thrill level and inspect its odds | Done |
| [MN-7873](https://patrianna.atlassian.net/browse/MN-7873) | MVP 3 iOS | [Collectibles][iOS] Purchase a Pack and present its GC reward | Done |
| [MN-7874](https://patrianna.atlassian.net/browse/MN-7874) | MVP 3 iOS | [Collectibles][iOS] Reveal a Pack and retain its Card | Done |
| [MN-8021](https://patrianna.atlassian.net/browse/MN-8021) | Migration | BE-5 Gold-coin rewards for Phygitals packs | Done |
| [MN-8022](https://patrianna.atlassian.net/browse/MN-8022) | Migration | BE-6 Purchase flow | Done |
| [MN-8111](https://patrianna.atlassian.net/browse/MN-8111) | Migration | BE-18: Unopened packs and CollectiblesRevealPack | Done |
| [MN-8034](https://patrianna.atlassian.net/browse/MN-8034) | Migration | FE-1 Collectibles API: purchase and packs | Testing DEV |

### 3.4 Collection and Sell-back

| Ticket | Epic | Summary | Status |
| --- | --- | --- | --- |
| [MN-7701](https://patrianna.atlassian.net/browse/MN-7701) | MVP 1 | Sell a revealed Card | Done |
| [MN-7702](https://patrianna.atlassian.net/browse/MN-7702) | MVP 1 | Add a revealed Card to Vault | Done |
| [MN-7795](https://patrianna.atlassian.net/browse/MN-7795) | MN-7702 | [BE] Persist the Vault / Sell decision per Card | Done |
| [MN-7703](https://patrianna.atlassian.net/browse/MN-7703) | MVP 1 | Auto-sell vaulted Cards after 72 hours | Done |
| [MN-7704](https://patrianna.atlassian.net/browse/MN-7704) | MVP 1 | Manually sell a Card from Vault | Done |
| [MN-7706](https://patrianna.atlassian.net/browse/MN-7706) | MVP 1 | Filter, sort and change view mode in Vault | Done |
| [MN-7707](https://patrianna.atlassian.net/browse/MN-7707) | MVP 1 | View detailed Card information | Done |
| [MN-7856](https://patrianna.atlassian.net/browse/MN-7856) | MVP 1 | Auto-sell vaulted Cards after 72 hours - Inbox notification | On hold |
| [MN-7920](https://patrianna.atlassian.net/browse/MN-7920) | MVP 1 | Sell back / Add to Vault on an auto-sold Card returns an error and leaves Collectibles blocked until refresh | On hold |
| [MN-7928](https://patrianna.atlassian.net/browse/MN-7928) | MVP 1 | Auto-sell: close the gap between FE card removal and delayed /credit callback | Done |
| [MN-7931](https://patrianna.atlassian.net/browse/MN-7931) | MVP 1 | Card silently auto sold | To Do |
| [MN-7908](https://patrianna.atlassian.net/browse/MN-7908) | MVP 2 design | [Collectibles] Apply final Vault tab design for mobile web | Done |
| [MN-7909](https://patrianna.atlassian.net/browse/MN-7909) | MVP 2 design | [Collectibles] Apply Vault card viewer and sell-back design for mobile web | Cancel |
| [MN-7913](https://patrianna.atlassian.net/browse/MN-7913) | MVP 2 design | Collectibles cards presented in Vault | Cancel |
| [MN-7914](https://patrianna.atlassian.net/browse/MN-7914) | MVP 2 design | Collectibles Sell or Ship the card | To Do |
| [MN-7915](https://patrianna.atlassian.net/browse/MN-7915) | MVP 2 design | Collectibles filtering and sorting | Cancel |
| [MN-7937](https://patrianna.atlassian.net/browse/MN-7937) | MVP 2 design | [Collectibles][Mobile web] Card Details splits words and numbers across lines | Done |
| [MN-7875](https://patrianna.atlassian.net/browse/MN-7875) | MVP 3 iOS | [Collectibles][iOS] Sell a Card from Reveal or Vault | Done |
| [MN-7876](https://patrianna.atlassian.net/browse/MN-7876) | MVP 3 iOS | [Collectibles][iOS] Browse, filter and sort the Vault | Done |
| [MN-7878](https://patrianna.atlassian.net/browse/MN-7878) | MVP 3 iOS | [Collectibles][iOS] Display Vault expiry and automatic sale | Backlog |
| [MN-7871](https://patrianna.atlassian.net/browse/MN-7871) | MVP 3 iOS | [Collectibles][iOS] View Card details across Collectibles | Done |
| [MN-8023](https://patrianna.atlassian.net/browse/MN-8023) | Migration | BE-7 Inventory and pending cards | Done |
| [MN-8024](https://patrianna.atlassian.net/browse/MN-8024) | Migration | BE-8 Keep card and order history | Done |
| [MN-8025](https://patrianna.atlassian.net/browse/MN-8025) | Migration | BE-9 Sell-back | Done |
| [MN-8026](https://patrianna.atlassian.net/browse/MN-8026) | Migration | BE-10 Auto-sell job | Done |
| [MN-8027](https://patrianna.atlassian.net/browse/MN-8027) | Migration | BE-11 Auto-sold records and monitoring | Done |
| [MN-8036](https://patrianna.atlassian.net/browse/MN-8036) | Migration | FE-3 Decision screen, keep and sell-back | To Do |
| [MN-8142](https://patrianna.atlassian.net/browse/MN-8142) | Migration | FE-5 Auto-sold cards dialog | Ready for Testing |
| [MN-8191](https://patrianna.atlassian.net/browse/MN-8191) | Migration | BE-19 Vault: kept cards can be sold back and are auto-sold | Done |

### 3.5 Shipping and Fulfilment

| Ticket | Epic | Summary | Status |
| --- | --- | --- | --- |
| [MN-7705](https://patrianna.atlassian.net/browse/MN-7705) | MVP 1 | [WIP] Request shipment of a vaulted Card | Done |
| [MN-7916](https://patrianna.atlassian.net/browse/MN-7916) | MVP 2 design | Collectibles shipment process | Cancel |
| [MN-7939](https://patrianna.atlassian.net/browse/MN-7939) | MVP 2 design | [Collectibles] Allow deleting saved shipping addresses | Done |
| [MN-7879](https://patrianna.atlassian.net/browse/MN-7879) | MVP 3 iOS | [Collectibles][iOS] Ship a vaulted Card and view shipment status | On hold |
| [MN-8028](https://patrianna.atlassian.net/browse/MN-8028) | Migration | BE-12 Address book | Done |
| [MN-8029](https://patrianna.atlassian.net/browse/MN-8029) | Migration | BE-13 Delivery quote and creation | Done |
| [MN-8030](https://patrianna.atlassian.net/browse/MN-8030) | Migration | BE-14 Delivery tracking and cancellation | Done |
| [MN-8141](https://patrianna.atlassian.net/browse/MN-8141) | Migration | FE-4 Delivery and addresses | In Progress |

### 3.6 Funding and Settlement

| Ticket | Epic | Summary | Status |
| --- | --- | --- | --- |
| [MN-8032](https://patrianna.atlassian.net/browse/MN-8032) | Migration | BE-16 Reconciliation | Done |

### 3.7 Back Office (CMS)

No tickets.

### 3.8 Brand Integration

Storefront entry, player balance and deposits, history, notifications, the iOS app, and the Phygitals connection itself.

| Ticket | Epic | Summary | Status |
| --- | --- | --- | --- |
| [MN-7693](https://patrianna.atlassian.net/browse/MN-7693) | MVP 1 | Display and update player USD balance on Collectibles page | Done |
| [MN-7694](https://patrianna.atlassian.net/browse/MN-7694) | MVP 1 | Deposit funds to Collectibles USD balance | In Progress |
| [MN-7740](https://patrianna.atlassian.net/browse/MN-7740) | MVP 1 | Add quick add buttons to deposit | On hold |
| [MN-7830](https://patrianna.atlassian.net/browse/MN-7830) | MVP 1 | USD deposit funds to be used for purchasing offers | To Do |
| [MN-7850](https://patrianna.atlassian.net/browse/MN-7850) | MVP 1 | Transaction history | In Progress |
| [MN-7867](https://patrianna.atlassian.net/browse/MN-7867) | MVP 3 iOS | [Collectibles][iOS] Display and refresh the USD balance | Done |
| [MN-7872](https://patrianna.atlassian.net/browse/MN-7872) | MVP 3 iOS | [Collectibles][iOS] Deposit USD and return to the initiating flow | Done |
| [MN-7882](https://patrianna.atlassian.net/browse/MN-7882) | MVP 3 iOS | [Collectibles][iOS] Purchase casino offers with eligible USD balance | Backlog |
| [MN-7877](https://patrianna.atlassian.net/browse/MN-7877) | MVP 3 iOS | [Collectibles][iOS] View Collectibles transaction history | Backlog |
| [MN-7922](https://patrianna.atlassian.net/browse/MN-7922) | MVP 1 | Purchase / Shipment Modal is blinking after topping up the balance in case of insufficient funds | Done |
| [MN-7710](https://patrianna.atlassian.net/browse/MN-7710) | MVP 1 | [WIP] View Collectibles Rules and How to Play | Done |
| [MN-7711](https://patrianna.atlassian.net/browse/MN-7711) | MVP 1 | Collection Tab (Coming Soon Placeholder) | Done |
| [MN-7712](https://patrianna.atlassian.net/browse/MN-7712) | MVP 1 | Enter Collectibles from Casino Lobby when not logged in | Done |
| [MN-7996](https://patrianna.atlassian.net/browse/MN-7996) | MVP 1 | Implement FAQ from How to Play | Backlog |
| [MN-7836](https://patrianna.atlassian.net/browse/MN-7836) | MVP 1 | Logged out users journey | Cancel |
| [MN-7864](https://patrianna.atlassian.net/browse/MN-7864) | MVP 3 iOS | [Collectibles][iOS] Enter Collectibles and return after login | Done |
| [MN-7866](https://patrianna.atlassian.net/browse/MN-7866) | MVP 3 iOS | [Collectibles][iOS] Navigate tabs and retain the selected category | Done |
| [MN-7880](https://patrianna.atlassian.net/browse/MN-7880) | MVP 3 iOS | [Collectibles][iOS] Read How to Play and Collectibles rules | Done |
| [MN-7881](https://patrianna.atlassian.net/browse/MN-7881) | MVP 3 iOS | [Collectibles][iOS] Receive Collectibles Inbox notifications | Backlog |
| [MN-7860](https://patrianna.atlassian.net/browse/MN-7860) | MVP 3 iOS | [Collectibles][iOS] Confirm App Store and native payment approach | Backlog |
| [MN-7861](https://patrianna.atlassian.net/browse/MN-7861) | MVP 3 iOS | [Collectibles][iOS] Confirm mobile-web baseline and native integration contracts | Backlog |
| [MN-7862](https://patrianna.atlassian.net/browse/MN-7862) | MVP 3 iOS | [Collectibles][iOS] Restore Collectibles state after interruptions | Backlog |
| [MN-7863](https://patrianna.atlassian.net/browse/MN-7863) | MVP 3 iOS | [Collectibles][iOS] Validate native parity and controlled rollout | Backlog |
| [MN-7993](https://patrianna.atlassian.net/browse/MN-7993) | MVP 2 design | Apply Collectibles UAT design and interaction fixes | To Do |
| [MN-7936](https://patrianna.atlassian.net/browse/MN-7936) | MVP 2 design | [Collectibles][Mobile view] Apply CTA is only visible after scrolling the Estimated Values dialog | Done |
| [MN-8017](https://patrianna.atlassian.net/browse/MN-8017) | Migration | BE-1 Phygitals client and credentials | Done |
| [MN-8018](https://patrianna.atlassian.net/browse/MN-8018) | Migration | BE-2 Compatibility core | Done |
| [MN-8019](https://patrianna.atlassian.net/browse/MN-8019) | Migration | BE-3 RepackZ removal | To Do |
| [MN-8031](https://patrianna.atlassian.net/browse/MN-8031) | Migration | BE-15 Webhook receiver | On hold |
| [MN-8033](https://patrianna.atlassian.net/browse/MN-8033) | Migration | BE-17 Test harness and test rework | To Do |
| [MN-8212](https://patrianna.atlassian.net/browse/MN-8212) | Migration | FE-6 Align the client with backend contract changes (Phygitals) | In Progress |
| [MN-7820](https://patrianna.atlassian.net/browse/MN-7820) | — | [QA, Collectibles] Synapse meetings, agile ceremonies, demos and team syncs | In Progress |

### 3.9 Compliance

| Ticket | Epic | Summary | Status |
| --- | --- | --- | --- |
| [MN-7714](https://patrianna.atlassian.net/browse/MN-7714) | MVP 1 | Enforce Collectibles availability using Feature Toggles | Blocked |
| [MN-7865](https://patrianna.atlassian.net/browse/MN-7865) | MVP 3 iOS | [Collectibles][iOS] Respect Collectibles availability restrictions | Backlog |

## 4. Not ticketed anywhere

These are the parts of the aggregator with no ticket today. They are where new epics and stories will come from once the open questions are answered.

| Module | Missing |
| --- | --- |
| Brands and Onboarding | Adding a brand by configuration; keeping brands apart on one shared Phygitals account; partner brands |
| Catalog and Exclusive Cards | A catalog per brand (which packs, how they look); brand-only packs and their exclusive cards |
| Purchase and Reveal | FMV fixed at the rip and kept unchanged |
| Collection and Sell-back | Automatic sell-back window per brand (today one setting for the stage) |
| Shipping and Fulfilment | Fee rules by state, the USD 5 handling cap, free delivery where required, delivery deadlines and their tracking |
| Funding and Settlement | Each brand's consumption of the shared balance; protecting the balance; cost of cards bought for a brand; internal allocation and partner invoices |
| Back Office (CMS) | All of it: packs per brand, shipping operations, player support, money |
| Brand Integration | Theming one storefront per brand; Phygitals events for several brands arriving on one account |
| Compliance | State rules, sponsor per brand, player eligibility, records that prove compliance |
