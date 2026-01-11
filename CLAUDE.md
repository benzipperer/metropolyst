# Metropolyst - Developer Guide

Typst presentation theme based on Metropolis with fully configurable fonts and colors.

## Files

Always keep this list of files up-to-date.

### Root files

- `README.md` - Overview of all implementations
- `LICENSE` - MIT license
- `CLAUDE.md` - Developer guide (this file)
- `UPDATE.md` - Submission instructions for typst/packages
- `TODO.md` - Development todo list
- `WORKPLAN_PUBLISH.md` - Workplan for publishing to Typst Universe
- `WORKPLAN_QUARTO.md` - Workplan for Quarto extension

### Typst package files (in `typst/`, submitted to typst/packages)

- `typst/lib.typ` - Theme implementation (package entrypoint)
- `typst/typst.toml` - Package manifest
- `typst/template/main.typ` - Template for `typst init`
- `typst/README.md` - Typst-specific user documentation
- `typst/thumbnail.png` - Template thumbnail for Typst Universe picker
- `typst/assets/preview.png` - README preview image (excluded from package archive)

### Typst examples (in `typst/examples/`, not submitted)

- `typst/examples/example-default.typ` - Default Fira Sans example
- `typst/examples/example-custom.typ` - Custom Lato example
- `typst/examples/example-epi.typ` - EPI brand preset example
- `typst/examples/example_figure_light.png` - Figure asset for epi example (light background)
- `typst/examples/example_figure_white.png` - Figure asset for epi example (white background)

### Quarto extension (in `quarto/`)

- `quarto/_extensions/benzipperer/metropolyst/_extension.yml` - Extension manifest
- `quarto/_extensions/benzipperer/metropolyst/typst-template.typ` - Template partial (imports theme)
- `quarto/_extensions/benzipperer/metropolyst/typst-show.typ` - Show rule (maps YAML to Typst)
- `quarto/_extensions/benzipperer/metropolyst/lib.typ` - Bundled theme (copied from typst/lib.typ)
- `quarto/template.qmd` - Template document for `quarto use template`
- `quarto/README.md` - Quarto-specific documentation
- `quarto/examples/example.qmd` - Quarto example presentation

### Scripts

- `scripts/update-preview.py` - Generate typst/assets/preview.png from example-default.pdf
- `scripts/copy-to-packages.sh` - Copy files for typst/packages PR (run from destination)
- `scripts/sync-quarto-theme.sh` - Sync lib.typ from typst/ to Quarto extension
- `scripts/example_figures.R` - R script to generate example figure PNGs
- `scripts/productivity_pay.csv` - Data file for example_figures.R

## Build & Verify

### Typst Examples

If `typst/template/main.typ` is updated, ensure that `typst/examples/example-default.typ` matches it.

After any change, rebuild and verify ALL Typst examples:

```bash
for f in typst/examples/example-*.typ; do typst compile --root ./typst "$f"; done
for f in typst/examples/example-*.pdf; do pdffonts "$f"; done
python3 scripts/update-preview.py
```

**Expected fonts:**
- `example-default.pdf`: FiraSans-{Regular,Light}
- `example-custom.pdf`: Lato-{Regular,Bold,Medium,Semibold,Heavy}, DejaVuSansMono
- `example-epi.pdf`: Roboto-{Regular,Light}, DejaVuSansMono

### Quarto Extension

After changes to `typst/lib.typ`, sync to Quarto extension:

```bash
./scripts/sync-quarto-theme.sh
```

Build Quarto examples:

```bash
cd quarto && quarto render examples/example.qmd
```

Test installation from GitHub:

```bash
cd /tmp && mkdir test-quarto && cd test-quarto
quarto add benzipperer/metropolyst/quarto --no-prompt
```

## Adding Parameters

1. Add to `metropolyst-theme()` signature in `typst/lib.typ`
2. Store in `config-store()` call
3. Use in relevant slide function
4. Update `typst/README.md` and `typst/examples/example-custom.typ`
5. Rebuild and verify

## Color System

Colors default to `auto` -> resolve to `accent-color`.

## Install

```bash
cargo install --locked typst-cli
apt-get install poppler-utils mupdf-tools
```
