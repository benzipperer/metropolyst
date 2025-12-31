# Metropolyst - Developer Guide

Metropolyst is a highly configurable Typst presentation theme based on Metropolis, exposing all font properties and accent colors as configuration options.

## Project Structure

- `metropolyst.typ` - Main theme implementation
- `example-default.typ` - Minimal example using default Fira Sans font
- `example-custom.typ` - Comprehensive example with custom Libertinus Serif font
- `README.md` - User-facing documentation

## Key Design Principles

**Default Font: Fira Sans**
The theme defaults to Fira Sans throughout (headers, footers, title slide, sections, focus slides). This is configured via font parameters in `metropolyst-theme()`.

**Font Configurability**
Unlike the original Metropolis theme, all font properties (family, size, weight) are exposed as parameters. This allows users to customize typography for every element.

**Example Files Demonstrate Configuration**
- `example-default.pdf` - Uses Fira Sans to show out-of-box experience
- `example-custom.pdf` - Uses Libertinus Serif to illustrate font customization

## Development Workflow

### Making Changes

When modifying the theme or examples, always rebuild the PDFs and verify changes:

```bash
# Compile both example presentations
typst compile example-default.typ
typst compile example-custom.typ

# Verify fonts in output PDFs
pdffonts example-default.pdf
pdffonts example-custom.pdf

# Alternative verification using mutool
mutool info -F example-default.pdf
mutool info -F example-custom.pdf
```

### Font Verification

**Expected fonts in example-default.pdf:**
- FiraSans-Medium (headers)
- FiraSans-Regular (footer, body elements)
- FiraSans-Bold (strong emphasis, sections)
- FiraSans-Light (body text from `#set text()`)

**Expected fonts in example-custom.pdf:**
- LibertinusSerif-Bold (headers, sections, focus slides)
- LibertinusSerif-Regular (body text)
- LibertinusSerif-Semibold (footer)

### Testing Changes

After any modification to:
- Theme code (`metropolyst.typ`)
- Example files (`example-*.typ`)
- Font configuration
- Color configuration

Always:
1. Recompile both PDFs
2. Verify typography with `pdffonts` or `mutool`
3. Visually inspect PDFs for expected appearance

## Common Tasks

### Adding Font Parameters

1. Add parameter to `metropolyst-theme()` function signature
2. Store parameter in `config-store()` call
3. Use stored parameter in relevant slide function (e.g., `slide()`, `title-slide()`)
4. Update `README.md` configuration tables
5. Update `example-custom.typ` to demonstrate new parameter
6. Rebuild and verify PDFs

### Changing Default Font

If changing the default font from Fira Sans:
1. Update all `*-font` default parameters in `metropolyst-theme()`
2. Update `README.md` references to default font
3. Update line 444 in `metropolyst.typ`: `set text(size: 20pt, font: "...")`
4. Rebuild examples and verify with `pdffonts`

### Adding Color Parameters

Follow the cascading color system pattern:
- Colors default to `auto`
- Resolve to `accent-color` when `auto`
- Document in color configuration section

## Installation Requirements

For development or building slides locally:

```bash
# Typst compiler
cargo install --locked typst-cli

# PDF inspection tools
apt-get install poppler-utils mupdf-tools

# Fira Sans font (Linux)
wget https://github.com/mozilla/Fira/archive/refs/heads/master.zip
unzip master.zip
cp Fira-master/ttf/*.ttf /usr/share/fonts/truetype/fira/
fc-cache -fv
```

## Build Verification Checklist

Before committing changes:
- [ ] Both example PDFs compile without errors
- [ ] Visual inspection using pdffonts, mutools, pdftohtml, etc. confirms expected typography
- [ ] README.md reflects any new configuration options
- [ ] Examples demonstrate new features (if applicable)
