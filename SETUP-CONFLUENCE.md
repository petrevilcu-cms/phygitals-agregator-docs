# One-time Confluence setup

This wires the repo to Confluence Cloud so you can publish with the local helper [scripts/publish-confluence.sh](scripts/publish-confluence.sh). It uses the same tool (`mark`, pinned), the same space and the same Keychain items as `gacha-lottery-impl-docs`: if you already publish the gacha docs from this machine, steps 2 and 4b are done.

> Publishing is **local-only**; there is no CI. The security review of the pipeline is the gacha repo's [SECURITY-ANALYSIS.md](https://github.com/patrianna/gacha-lottery-impl-docs/blob/main/SECURITY-ANALYSIS.md); the script here is the same file with a different example path.

## 1. Create the root page

The docs publish into the **`PN`** space under one root page, **`Phygitals Aggregator`**.

1. In the PN space, create an empty page titled exactly `Phygitals Aggregator` at the space root (next to `Gacha-Lottery System Design`).
2. `mark` creates the intermediate parents (`Phygitals Aggregator - Modules`, one page per module) on the first publish. Titles must match the `<!-- Parent: ... -->` headers exactly.
3. Page titles must be unique across the whole PN space. Every title in this repo contains "Aggregator" for that reason; keep it that way when adding pages.

The resulting tree:

- `Phygitals Aggregator` (root, created by hand)
  - `Phygitals Aggregator - Product Overview`
  - `Phygitals Aggregator - Current State`
  - `Phygitals Aggregator - Decision Log`
  - `Phygitals Aggregator - Glossary`
  - `Phygitals Aggregator - Project Guide`
  - `Phygitals Aggregator - Modules`
    - `Aggregator <Module>` → `Product Spec - Aggregator <Module>`, `User Stories - Aggregator <Module>`, `SDD - Aggregator <Module>`

## 2. Create an API token

1. Go to <https://id.atlassian.com/manage-profile/security/api-tokens> and create a token.
2. The account email is `CONFLUENCE_USER`; the base URL is `https://patrianna.atlassian.net/wiki`.

## 3. Space permissions

Stakeholders comment, they do not edit: give them **Add comments** but not **Add/Delete pages**. The banner at the top of every page says the same.

## 4. Publish from your machine

### 4a. Install `mark` (one time)

```bash
brew install go
```

```bash
go install github.com/kovetskiy/mark/v16/cmd/mark@v16.5.0
```

Add `$(go env GOPATH)/bin` to your `PATH`. The script installs the pinned version itself if `mark` is missing.

### 4b. Store credentials (one time)

```bash
scripts/publish-confluence.sh store
```

It saves the base URL, email and token to the macOS Keychain. Alternative: a `.env.local` in the repo root with `CONFLUENCE_BASE_URL`, `CONFLUENCE_USER`, `CONFLUENCE_API_TOKEN`, `chmod 600`; `.gitignore` already excludes it.

### 4c. Dry-run, then publish

```bash
scripts/publish-confluence.sh
```

```bash
scripts/publish-confluence.sh -f docs/overview.md
```

```bash
scripts/publish-confluence.sh --publish
```

## Troubleshooting

- **Page under the wrong parent**: the `<!-- Parent -->` title must match a Confluence title exactly (case-sensitive).
- **Title already exists**: another page in PN has that title. Rename ours; never rename theirs.
- **401/403**: the token user lacks space permissions, or the base URL is missing `/wiki`.
