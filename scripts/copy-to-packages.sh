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

if [[ ! -f "$SRC/typst/typst.toml" ]]; then
    echo "Error: $SRC does not appear to be the metropolyst repo (no typst/typst.toml)" >&2
    exit 1
fi

# Required files from typst/ subdirectory
cp "$SRC/typst/typst.toml" .
cp "$SRC/typst/lib.typ" .
cp "$SRC/typst/thumbnail.png" .

# LICENSE is in root
cp "$SRC/LICENSE" .

# README for package comes from typst/ subdirectory
cp "$SRC/typst/README.md" .

# Template directory
cp -r "$SRC/typst/template" .

# Assets for README preview (excluded from archive but needed in packages repo)
cp -r "$SRC/typst/assets" .

echo "Copied package files to $(pwd)"
echo "Files NOT copied (by design): scripts/, quarto/, examples/, CLAUDE.md, TODO.md, WORKPLAN*.md"
