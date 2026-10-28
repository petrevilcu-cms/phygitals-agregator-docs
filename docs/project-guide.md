<!-- Space: PN -->
<!-- Parent: Phygitals Aggregator -->
<!-- Title: Phygitals Aggregator - Project Guide -->
<!-- Label: guide -->

> Published from git (source of truth). Do not edit in Confluence — the next publish overwrites this page; comment instead. Source: `docs/project-guide.md`

# Phygitals Aggregator - Project Guide

How this documentation fits next to the code, and how to edit and publish it.

## 1. One workspace, all the repos

This repo holds the **requirements**. The implementation lives in other repos, opened side by side through `phygitals-aggregator.code-workspace`.

| Repo | Role | What to read there |
| --- | --- | --- |
| `phygitals-agregator-docs` | Requirements (this repo) | Everything under `docs/` |
| `Collectibles` | Today's multi-brand collectibles service (RepackZ and Phygitals) | `docs/shared-topology.md`, `docs/phygitals-api-reference.json` (Phygitals Partner API **1.17.0**) |
| `api` | An earlier copy of the Phygitals spec (**1.0.0**) | Superseded by the 1.17.0 copy in Collectibles |
| CMS (Payload) | Back office | To be confirmed: see the [Decision Log](decision-log.md) |

Clone them side by side into one parent folder, keeping the repo names, then open the workspace file in Cursor or VS Code.

## 2. Who writes what

| Page | Owner | Purpose |
| --- | --- | --- |
| `product-spec.md` | Product | What the module must do and why; scope, rules, constraints, open points |
| `user-stories.md` | Product | Stories with acceptance criteria, tagged Requirement and Baseline |
| `sdd.md` | Engineering | How it is built. Product does not write here |
| `decision-log.md` | Product (with whoever decides) | Every open question and every decision, dated, with who decided |

A requirement says what the brand, the player, the operator or the regulator needs. It does not name tables, endpoints, queues or services. When a constraint from Phygitals or from law limits the options, state the constraint and leave the choice to engineering.

## 3. Editing and publishing

- One file = one Confluence page. Keep the metadata header at the very top.
- Diagrams are Mermaid in the Markdown.
- Dry-run with `scripts/publish-confluence.sh`, then publish with `--publish`. First-time setup is in `SETUP-CONFLUENCE.md` at the repo root.
- New pages start from `docs/_templates/`.
