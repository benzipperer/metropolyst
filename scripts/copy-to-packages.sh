#!/usr/bin/env bash
# Copy package files from source repo to typst/packages PR repo.
# Run from the destination directory (typst/packages repo).
#
# Usage: ./copy-to-packages.sh /path/to/metropolyst

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 /path/to/metropolyst" >&2
    exit 1
fi

SRC="$1"

if [[ ! -f "$SRC/typst.toml" ]]; then
    echo "Error: $SRC does not appear to be the metropolyst repo (no typst.toml)" >&2
    exit 1
fi

# Required files
cp "$SRC/typst.toml" .
cp "$SRC/lib.typ" .
cp "$SRC/LICENSE" .
cp "$SRC/README.md" .

# Template directory
cp -r "$SRC/template" .

# Assets for README preview (excluded from archive but needed in packages repo)
cp -r "$SRC/assets" .

echo "Copied package files to $(pwd)"
echo "Files NOT copied (by design): scripts/, examples/, CLAUDE.md, TODO.md, WORKPLAN.md"
