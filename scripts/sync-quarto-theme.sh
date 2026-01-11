#!/usr/bin/env bash
# Sync lib.typ from typst/ to Quarto extension for local development/testing.
# Run from the repository root directory.
#
# Usage: ./scripts/sync-quarto-theme.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

SRC="$PROJECT_ROOT/typst/lib.typ"
DEST="$PROJECT_ROOT/quarto/_extensions/benzipperer/metropolyst/lib.typ"

if [[ ! -f "$SRC" ]]; then
    echo "Error: Source file not found: $SRC" >&2
    exit 1
fi

if [[ ! -d "$(dirname "$DEST")" ]]; then
    echo "Error: Destination directory not found: $(dirname "$DEST")" >&2
    exit 1
fi

cp "$SRC" "$DEST"
echo "Synced: $SRC -> $DEST"

# Verify the sync
if diff -q "$SRC" "$DEST" > /dev/null 2>&1; then
    echo "Verification: Files are identical"
else
    echo "Warning: Files differ after copy (this should not happen)" >&2
    exit 1
fi
