#!/usr/bin/env bash
#
# Local Confluence publish helper. This is the only publish path for this repo
# (publishing is local-only; there is no CI). Uses a pinned `mark` release.
#
# SECURITY: you never type the token on a command line and it never lands in your
# shell history or in the repo. It is read from a secure source (below) and handed
# to `mark` via its -p flag in a child process. Secrets are
# resolved in this order:
#   1. Environment variables already exported in the current shell
#   2. macOS Keychain items created by the `store` subcommand (recommended)
#   3. A gitignored .env.local file in the repo root (chmod 600), format:
#        CONFLUENCE_BASE_URL=https://patrianna.atlassian.net/wiki
#        CONFLUENCE_USER=you@example.com
#        CONFLUENCE_API_TOKEN=xxxxxxxx
#
# Usage:
#   scripts/publish-confluence.sh store         # securely save creds to Keychain
#   scripts/publish-confluence.sh               # dry-run: validate/render, NO writes
#   scripts/publish-confluence.sh --publish     # actually write to Confluence
#   scripts/publish-confluence.sh -f docs/overview.md   # single file (dry-run)
#
set -euo pipefail

MARK_VERSION="github.com/kovetskiy/mark/v16/cmd/mark@v16.5.0"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

# Same Keychain items as gacha-lottery-impl-docs: one Atlassian token publishes both
# doc sets into the PN space, so `store` only needs running once per machine.
KEYCHAIN_SERVICE_PREFIX="oripa-confluence"

die() { echo "error: $*" >&2; exit 1; }

# --- store subcommand: save creds to the macOS Keychain -----------------------
if [ "${1:-}" = "store" ]; then
  command -v security >/dev/null || die "'security' not found (macOS Keychain unavailable)"
  read -r -p "Confluence base URL (e.g. https://patrianna.atlassian.net/wiki): " base_url
  read -r -p "Confluence account email: " user
  # -s (silent) keeps the token off screen and out of shell history.
  read -r -s -p "Confluence API token: " token; echo
  [ -n "$base_url" ] && [ -n "$user" ] && [ -n "$token" ] || die "all three values are required"
  security add-generic-password -U -s "${KEYCHAIN_SERVICE_PREFIX}-base-url" -a "$USER" -w "$base_url"
  security add-generic-password -U -s "${KEYCHAIN_SERVICE_PREFIX}-user"     -a "$USER" -w "$user"
  security add-generic-password -U -s "${KEYCHAIN_SERVICE_PREFIX}-token"    -a "$USER" -w "$token"
  echo "Saved to Keychain. Run '$0' for a dry-run."
  exit 0
fi

# --- resolve secrets ----------------------------------------------------------
# 1) .env.local (only fills vars not already set), 2) Keychain fallback.
if [ -f .env.local ]; then
  set -a; # shellcheck disable=SC1091
  . ./.env.local; set +a
fi

keychain_get() { security find-generic-password -s "$1" -a "$USER" -w 2>/dev/null || true; }
: "${CONFLUENCE_BASE_URL:=$(keychain_get "${KEYCHAIN_SERVICE_PREFIX}-base-url")}"
: "${CONFLUENCE_USER:=$(keychain_get "${KEYCHAIN_SERVICE_PREFIX}-user")}"
: "${CONFLUENCE_API_TOKEN:=$(keychain_get "${KEYCHAIN_SERVICE_PREFIX}-token")}"

[ -n "${CONFLUENCE_BASE_URL:-}" ]  || die "CONFLUENCE_BASE_URL not set (run '$0 store')"
[ -n "${CONFLUENCE_USER:-}" ]      || die "CONFLUENCE_USER not set (run '$0 store')"
[ -n "${CONFLUENCE_API_TOKEN:-}" ] || die "CONFLUENCE_API_TOKEN not set (run '$0 store')"

# --- ensure mark is installed (pinned) ----------------------------------------
if ! command -v mark >/dev/null; then
  command -v go >/dev/null || die "Go is required to install mark. Install Go, then: go install ${MARK_VERSION}"
  echo "Installing mark (${MARK_VERSION})..."
  go install "${MARK_VERSION}"
  export PATH="$PATH:$(go env GOPATH)/bin"
  command -v mark >/dev/null || die "mark installed but not on PATH. Add \"$(go env GOPATH)/bin\" to your PATH."
fi

# --- parse args ---------------------------------------------------------------
DRY_RUN="--dry-run"
SINGLE_FILE=""
while [ $# -gt 0 ]; do
  case "$1" in
    --publish) DRY_RUN=""; shift;;
    -f) SINGLE_FILE="${2:-}"; shift 2;;
    *) die "unknown argument: $1";;
  esac
done

if [ -n "$DRY_RUN" ]; then
  echo "Mode: DRY-RUN (no changes pushed)"
else
  echo "Mode: PUBLISH (writing to $CONFLUENCE_BASE_URL)"
fi

# --- collect files ------------------------------------------------------------
FILES=()
if [ -n "$SINGLE_FILE" ]; then
  FILES=("$SINGLE_FILE")
else
  # Portable (bash 3.2, macOS default) alternative to `mapfile`.
  while IFS= read -r line; do
    FILES+=("$line")
  done < <(find docs -name '*.md' -not -path 'docs/_templates/*' | sort)
fi
[ "${#FILES[@]}" -gt 0 ] || { echo "No docs to publish."; exit 0; }

# --- run mark (token passed via env indirection, never echoed) ----------------
FAIL=0
for f in "${FILES[@]}"; do
  echo ">> $f"
  mark \
    -u "$CONFLUENCE_USER" \
    -p "$CONFLUENCE_API_TOKEN" \
    -b "$CONFLUENCE_BASE_URL" \
    --content-appearance fixed \
    --mermaid-scale 3 \
    ${DRY_RUN} \
    -f "$f" || { echo "FAILED: $f"; FAIL=1; }
done

exit $FAIL
