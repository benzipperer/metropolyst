# Metropolyst - Developer Guide

Typst presentation theme based on Metropolis with fully configurable fonts and colors.

## Files

Always keep this list of files up-to-date.

### Package files (submitted to typst/packages)

- `lib.typ` - Theme implementation (package entrypoint)
- `typst.toml` - Package manifest
- `template/main.typ` - Template for `typst init`
- `README.md` - User documentation
- `LICENSE` - MIT license
- `thumbnail.png` - Template thumbnail for Typst Universe picker
- `assets/preview.png` - README preview image (excluded from package archive)

### Development files (not submitted)

- `examples/example-default.typ` - Default Fira Sans example
- `examples/example-custom.typ` - Custom Lato example
- `examples/example-epi.typ` - EPI brand preset example
- `examples/example_figure_light.png` - Figure asset for epi example (light background)
- `examples/example_figure_white.png` - Figure asset for epi example (white background)
- `scripts/update-preview.py` - Generate assets/preview.png from example-default.pdf
- `scripts/copy-to-packages.sh` - Copy files for typst/packages PR (run from destination)
- `scripts/example_figures.R` - R script to generate example figure PNGs
- `scripts/productivity_pay.csv` - Data file for example_figures.R
- `CLAUDE.md` - Developer guide (this file)
- `UPDATE.md` - Submission instructions for typst/packages
- `TODO.md` - Development todo list
- `WORKPLAN_PUBLISH.md` - Workplan for publishing to Typst Universe

## Build & Verify

If `main.typ` is updated, ensure that `example-default.typ` matches it.

After any change, rebuild and verify ALL examples:

```bash
for f in examples/example-*.typ; do typst compile --root . "$f"; done
for f in examples/example-*.pdf; do pdffonts "$f"; done
python3 scripts/update-preview.py
```

**Expected fonts:**
- `example-default.pdf`: FiraSans-{Regular,Light}
- `example-custom.pdf`: Lato-{Regular,Bold,Medium,Semibold,Heavy}, DejaVuSansMono
- `example-epi.pdf`: Roboto-{Regular,Light}, DejaVuSansMono

## Adding Parameters

1. Add to `metropolyst-theme()` signature in `lib.typ`
2. Store in `config-store()` call
3. Use in relevant slide function
4. Update `README.md` and `examples/example-custom.typ`
5. Rebuild and verify

## Color System

Colors default to `auto` → resolve to `accent-color`.

## Install

```bash
cargo install --locked typst-cli
apt-get install poppler-utils mupdf-tools
```
