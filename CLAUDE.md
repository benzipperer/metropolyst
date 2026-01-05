# Metropolyst - Developer Guide

Typst presentation theme based on Metropolis with fully configurable fonts and colors.

## Files

- `lib.typ` - Theme implementation (package entrypoint)
- `typst.toml` - Package manifest
- `template/main.typ` - Template for `typst init`
- `examples/example-default.typ` - Default Fira Sans example
- `examples/example-custom.typ` - Custom Libertinus Serif example
- `examples/example-epi.typ` - EPI brand preset example
- `README.md` - User documentation
- `LICENSE` - MIT license

## Build & Verify

After any change, rebuild and verify ALL examples:

```bash
for f in examples/example-*.typ; do typst compile --root . "$f"; done
for f in examples/example-*.pdf; do pdffonts "$f"; done
```

**Expected fonts:**
- `example-default.pdf`: FiraSans-{Regular,Light}
- `example-custom.pdf`: LibertinusSerif-{Bold,Regular,Semibold}
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
