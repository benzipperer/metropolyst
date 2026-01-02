# Metropolyst - Developer Guide

Typst presentation theme based on Metropolis with fully configurable fonts and colors.

## Files

- `metropolyst.typ` - Theme implementation
- `example-default.typ` - Default Fira Sans example
- `example-custom.typ` - Custom Libertinus Serif example
- `example-epi.typ` - EPI brand preset example
- `README.md` - User documentation

## Build & Verify

After any change, rebuild and verify ALL examples:

```bash
for f in example-*.typ; do typst compile "$f"; done
for f in example-*.pdf; do pdffonts "$f"; done
```

**Expected fonts:**
- `example-default.pdf`: FiraSans-{Medium,Regular,Bold,Light}
- `example-custom.pdf`: LibertinusSerif-{Bold,Regular,Semibold}
- `example-epi.pdf`: FiraSans-{Regular,Light}, DejaVuSansMono

## Adding Parameters

1. Add to `metropolyst-theme()` signature
2. Store in `config-store()` call
3. Use in relevant slide function
4. Update `README.md` and `example-custom.typ`
5. Rebuild and verify

## Color System

Colors default to `auto` → resolve to `accent-color`.

## Install

```bash
cargo install --locked typst-cli
apt-get install poppler-utils mupdf-tools
```
