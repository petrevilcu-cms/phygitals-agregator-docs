<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Parent: Phygitals Aggregator - Modules -->
<!-- Parent: Aggregator Catalog and Exclusive Cards -->
<!-- Title: User Stories - Aggregator Catalog and Exclusive Cards -->
<!-- Label: user-stories -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/modules/catalog-and-exclusive-cards/user-stories.md`

# User Stories - Aggregator Catalog and Exclusive Cards

Requirements-level user stories for this module, complementing the [Product Spec](product-spec.md) (what and why). The [SDD](sdd.md) is engineering's.

Each story carries two tags. **Requirement**: **Validated** (clear and agreed) or **TBC** (waiting on a row in the [Decision Log](../../decision-log.md)). **Baseline**: **Exists**, **Partial** or **New** against the Collectibles service, as recorded in [Current State](../../current-state.md). IDs are stable: a retired story keeps its number with a note.

### CAT-1 — Choose which packs a brand sells

Requirement: **Validated** · Baseline: **New** · Rules: CAT-R1, CAT-R10, CAT-R12

**As a** Patrianna admin, **I want** to choose which Phygitals packs each brand sells, **so that** every brand offers its own selection.

Acceptance criteria:

- Given the packs Phygitals offers Patrianna, when I build a brand's catalog, then I pick which of them that brand sells.
- Given a pack not in brand A's catalog, when a player of brand A browses or tries to buy it, then it is not shown and cannot be bought.
- Given brand staff, when they open the catalog, then they cannot add or remove packs.
- Given a catalog change, when it is saved, then who changed what and when is recorded, and players see it without a release.

Notes: Q-23, Q-34. Baseline: today each brand sees every pack its Phygitals credentials return (MN-8020).

### CAT-2 — Present my brand's packs

Requirement: **Validated** · Baseline: **New** · Rules: CAT-R2, CAT-R10

**As** brand staff, **I want** to set how my brand's packs look, **so that** the storefront matches my brand.

Acceptance criteria:

- Given a pack in my brand's catalog, when I edit it, then I can set its name, artwork, category, order and its offer and thrill-level grouping.
- Given any pack, when I edit it, then I cannot change its price, odds, expected value or chase cards.
- Given another brand's pack, when I look for it, then I cannot see or edit it.

Notes: Q-06, Q-23, Q-34. Baseline: today names and artwork come straight from Phygitals; pack offers and thrill levels exist (MN-7698, MN-7807, MN-8035).

### CAT-3 — See my brand's packs at Phygitals' price

Requirement: **Validated** · Baseline: **Partial** · Rules: CAT-R1, CAT-R2

**As a** player, **I want** to browse my brand's packs with their price, odds, value and top cards, **so that** I know what I am buying.

Acceptance criteria:

- Given my brand's catalog, when I browse, then I see only its packs, in my brand's presentation and order.
- Given a pack, when I open it, then its price is Phygitals' pack price in US dollars, and its odds, expected value and chase cards are Phygitals' current ones.
- Given a pack, when I preview its possible cards, then I see cards I could actually pull from it.

Notes: Q-06. Baseline: browsing, preview and categories exist (MN-7695, MN-7708, MN-7709, MN-7809).

### CAT-4 — Packs that cannot be bought disappear

Requirement: **Validated** · Baseline: **Partial** · Rules: CAT-R3

**As a** player, **I want** packs that are disabled or sold out to stop being offered, **so that** I do not try to buy something that will fail.

Acceptance criteria:

- Given Phygitals disables a pack or it runs out, when a player of any brand browses, then the pack is shown as unavailable or not shown within one minute.
- Given a player buys the pack within that minute, when Phygitals refuses the purchase, then the player is refunded (BUY-2).
- Given a pack shared by several brands, when it sells out, then it becomes unavailable on all of them.

Notes: Q-38. Baseline: Collectibles refreshes Phygitals' pack list every minute.

### CAT-5 — Record exclusive cards bought for a brand

Requirement: **Validated** · Baseline: **New** · Rules: CAT-R5

**As a** Patrianna admin, **I want** to record each exclusive card bought for a brand, with its cost, **so that** it can go into that brand's packs and that brand can be charged for it.

Acceptance criteria:

- Given a card Patrianna bought from the Phygitals vault outside the back office, when I record it, then it carries the brand it is for and what it cost.
- Given a recorded exclusive card, when finance prepares the brand's allocation or invoice, then its cost is included (FND-3).
- Given a recorded exclusive card, when I build that brand's brand-only pack, then I can add it; I cannot add it to another brand's pack.

Notes: Q-10, Q-13, Q-35.

### CAT-6 — Build a brand-only pack

Requirement: **Validated** · Baseline: **New** · Rules: CAT-R4, CAT-R6, CAT-R10

**As a** Patrianna admin, **I want** to create a pack for one brand and stock it with that brand's exclusive cards and ordinary vault cards, **so that** the brand can sell cards no other brand has.

Acceptance criteria:

- Given brand A's exclusive cards, when I create a brand-only pack for brand A, then I can stock it with them plus ordinary vault cards that fill out its value.
- Given the brand-only pack, when it is live, then only brand A's catalog contains it, and only brand A's players can see or buy it.
- Given brand staff, when they open the catalog, then they cannot create or stock packs.

Notes: Q-11, Q-23, Q-33, Q-34.

### CAT-7 — Exclusive cards stay invisible to other brands

Requirement: **Validated** · Baseline: **New** · Rules: CAT-R6, CAT-R8

**As a** brand, **I want** my exclusive cards to be seen only by my players, **so that** they stay a reason to play on my brand.

Acceptance criteria:

- Given brand A's exclusive cards, when a player of brand B looks at any pack list, pack contents, chase cards, preview, recent wins or feed, then none of brand A's exclusive cards or brand-only packs appear.
- Given brand A's brand-only pack, when Phygitals' own storefront or another Phygitals partner lists packs, then it does not appear there, as agreed in the contract (Q-33).

Notes: G4, Q-12, Q-33. The second criterion depends on the Phygitals contract.

### CAT-8 — A sold-back exclusive card returns to its brand

Requirement: **Validated** · Baseline: **New** · Rules: CAT-R7

**As a** brand, **I want** my exclusive cards to come back to my pack when a player sells them back, **so that** they stay mine to sell again.

Acceptance criteria:

- Given a player of brand A sells back a card from brand A's brand-only pack, when the sell-back completes, then the card is back in brand A's pack and can be pulled only by brand A's players.
- Given that card, when any other brand's player browses, then it does not appear.

Notes: Q-12.

### CAT-9 — Retire a brand-only pack

Requirement: **Validated** · Baseline: **New** · Rules: CAT-R9

**As a** Patrianna admin, **I want** to retire a brand-only pack and decide what happens to the exclusive cards nobody pulled, **so that** none of them are lost and the brand is charged correctly.

Acceptance criteria:

- Given a brand-only pack, when I retire it, then it stops being sold at once.
- Given its unpulled exclusive cards, when I decide, then each is moved into another brand's pack or sold back to Phygitals.
- Given those decisions, when they are made, then the brand's settlement is adjusted and the decision is recorded with who and when.

Notes: Q-13.

### CAT-10 — Pause a pack

Requirement: **Validated** · Baseline: **New** · Rules: CAT-R11, CAT-R12

**As a** Patrianna admin, **I want** to pause a pack for one brand or for every brand, **so that** I can stop a problem at once without a release.

Acceptance criteria:

- Given a pack, when I pause it for brand A, then brand A's players can no longer buy it and every other brand is unaffected.
- Given a pack, when I pause it for all brands, then no player can buy it.
- Given a paused pack, when I resume it, then it is buyable again where it was paused.
- Given a pause or resume, when it happens, then who did it, when and why is recorded.

Notes: Q-24. Baseline: Collectibles has feature toggles for the whole stage only (MN-7714, blocked).
