# Workplan: Publish Metropolyst to Typst Universe

This document outlines the steps to organize and submit the Metropolyst theme as a package to the [Typst Universe](https://typst.app/universe).

## Reference Documentation

- [Typst Packages Submission Guide](https://github.com/typst/packages/blob/main/docs/README.md)
- [Typst Packages Tips](https://github.com/typst/packages/blob/main/docs/tips.md) - What to commit vs exclude

---

## Current State

```
metropolyst/
├── metropolyst.typ      # Theme implementation
├── example-default.typ  # Default configuration example (relative import)
├── example-custom.typ   # Custom configuration example (relative import)
├── example-epi.typ      # EPI brand example (relative import)
├── README.md            # Documentation
└── CLAUDE.md            # Developer instructions
```

## Target Package Structure

### Files committed to typst/packages repo

These files are copied by `scripts/copy-to-packages.sh`:

```
packages/preview/metropolyst/0.1.0/
├── typst.toml           # Package manifest
├── lib.typ              # Package entrypoint
├── LICENSE              # License file
├── README.md            # Documentation (displayed on Typst Universe)
├── thumbnail.png        # Template thumbnail (for Typst Universe picker)
├── template/            # Template directory
│   └── main.typ         # Template entrypoint
└── assets/              # Documentation assets (excluded from archive via typst.toml)
    └── preview.png      # README preview image
```

### Files in source repo only (NOT submitted)

```
metropolyst/
├── CLAUDE.md            # Developer instructions
├── WORKPLAN.md          # This file
├── TODO.md              # Development notes
├── scripts/             # Build/utility scripts
│   ├── copy-to-packages.sh
│   └── update-preview.py
└── examples/            # Development examples
    ├── example-*.typ
    └── example-*.pdf
```

### What users download (archive excludes)

The `exclude = ["assets"]` in `typst.toml` means users downloading the package get everything except the assets directory (preview.png is only for README display on Typst Universe).

---

## Tasks

### Phase 1: Package Manifest and Structure

#### 1.1 Create `typst.toml` manifest

Create a `typst.toml` file with the following content:

```toml
[package]
name = "metropolyst"
version = "0.1.0"
entrypoint = "lib.typ"
authors = ["Your Name <your@email.com>"]
license = "MIT"
description = "A highly configurable Metropolis-style presentation theme for Touying with full font and color customization"
repository = "https://github.com/YOUR_USERNAME/metropolyst"
keywords = ["presentation", "slides", "metropolis", "theme", "touying", "beamer"]
categories = ["presentation", "layout"]
exclude = ["examples", "CLAUDE.md", "WORKPLAN.md"]
compiler = "0.12.0"

[template]
path = "template"
entrypoint = "main.typ"
thumbnail = "thumbnail.png"
```

**Notes:**
- Update `authors` with your actual name and email
- Update `repository` with your actual GitHub repository URL
- The `exclude` array keeps development files out of the package
- The `compiler` field specifies minimum Typst version (0.12.0 for touying 0.5.3 compatibility)

#### 1.2 Rename `metropolyst.typ` to `lib.typ`

The package entrypoint should be `lib.typ` (convention used by most packages).

```bash
git mv metropolyst.typ lib.typ
```

#### 1.3 Create `LICENSE` file

Create a LICENSE file (MIT recommended to match Touying):

```
MIT License

Copyright (c) 2024 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

### Phase 2: Template Setup

#### 2.1 Create `template/` directory

```bash
mkdir template
```

#### 2.2 Create `template/main.typ`

This is the template entrypoint that users get when they initialize a project with the template. It **must use absolute package imports** (not relative imports).

```typst
// Metropolyst Theme - Presentation Template
// A highly configurable Metropolis-style theme for Touying

#import "@preview/metropolyst:0.1.0": *

// Theme setup with default configuration
// See README.md for all available options
#show: metropolyst-theme.with(
  // Uncomment to customize:
  // font: ("Fira Sans",),
  // accent-color: rgb("#eb811b"),
  // header-background-color: rgb("#23373b"),
  config-info(
    title: [Your Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Institution],
    // logo: emoji.rocket,
  ),
)

// Title slide
#title-slide()

// Section divider
= Introduction

== Getting Started

This presentation uses the Metropolyst theme with default settings:

- *Aspect ratio:* 16:9
- *Fonts:* Fira Sans throughout
- *Accent color:* Orange (\#eb811b)
- *Header background:* Dark teal (\#23373b)

== Customization

Metropolyst exposes all font and color properties:

- Change fonts with `font:`, `header-font:`, `title-font:`, etc.
- Customize colors with `accent-color:`, `header-background-color:`, etc.
- Use brand presets: `#show: metropolyst-theme.with(..brands.EPI)`

See the README for complete documentation.

// Focus slide for emphasis
#focus-slide[
  Ready to present!
]
```

**Important:** The version number in the import (`@preview/metropolyst:0.1.0`) must match the version in `typst.toml`.

---

### Phase 3: Thumbnail

#### 3.1 Create `thumbnail.png`

Create a thumbnail image (recommended 1200x630 or 16:9 aspect ratio) showing:
- A sample slide from the theme
- The theme name or a distinctive visual

Options:
1. Screenshot the first few slides of `example-default.pdf`
2. Create a custom graphic in Figma, Canva, or similar
3. Use Typst to generate a thumbnail page and export as PNG

The thumbnail appears on Typst Universe and in IDE template pickers.

---

### Phase 4: Update Documentation

#### 4.1 Update `README.md` for Typst Universe

Modify the README to use package-style imports instead of relative imports:

**Change:**
```typst
#import "metropolyst.typ": metropolyst-theme, brands
```

**To:**
```typst
#import "@preview/metropolyst:0.1.0": metropolyst-theme, brands
```

Update all code examples in the README to use this import style.

Also update the Installation section:

**New Installation section:**
```markdown
## Installation

### From Typst Universe (Recommended)

Use the package directly in your document:

```typst
#import "@preview/metropolyst:0.1.0": metropolyst-theme, brands
```

### Using the Template

Initialize a new project with the template:

```bash
typst init @preview/metropolyst:0.1.0
```

### Local Development

Clone the repository and import directly:

```typst
#import "lib.typ": metropolyst-theme, brands
```
```

#### 4.2 Move examples to `examples/` directory

Create the examples directory and move the example files:

```bash
mkdir examples
git mv example-*.typ examples/
git mv example-*.pdf examples/
```

#### 4.3 Update example files for local development

After renaming `metropolyst.typ` to `lib.typ` and moving examples, update the imports:

```bash
# Update imports in example files (now they need to reference parent directory)
sed -i 's|"metropolyst.typ"|"../lib.typ"|g' examples/example-*.typ
```

---

### Phase 5: Handling Examples

#### 5.1 Examples Strategy

The examples serve two purposes:
1. **Development/testing:** `examples/example-*.typ` files with relative imports stay in the repo
2. **Template:** `template/main.typ` with absolute imports goes in the package

**Keep in repository (excluded from package via `examples/` directory):**
- `examples/example-default.typ` - For local development and testing
- `examples/example-custom.typ` - Demonstrates all configuration options
- `examples/example-epi.typ` - Brand preset example
- `examples/*.pdf` - Compiled examples for quick reference

**Include in package:**
- `template/main.typ` - Template entrypoint for `typst init`

The `exclude` field in `typst.toml` ensures the `examples/` directory isn't distributed.

#### 5.2 Keeping examples synchronized

When updating the theme:
1. Make changes to `lib.typ`
2. Test with example files (they use relative imports to `../lib.typ`)
3. Update `template/main.typ` if needed (uses absolute imports)
4. Rebuild and verify:
   ```bash
   for f in examples/example-*.typ; do typst compile "$f"; done
   for f in examples/example-*.pdf; do pdffonts "$f"; done
   ```

---

### Phase 6: Pre-submission Verification

All verification is done from the project root directory using a temporary `.verification-temp/` subdirectory.

#### 6.1 Install package locally

Create a symlink from the project to Typst's local package directory so that `@preview/metropolyst:0.1.0` resolves to your development version:

```bash
mkdir -p ~/.local/share/typst/packages/preview/metropolyst/0.1.0
ln -sf "$(pwd)"/* ~/.local/share/typst/packages/preview/metropolyst/0.1.0/
```

#### 6.2 Verify template compiles

Test that the template compiles with the absolute `@preview` import. Use `--package-path` to tell Typst where to find local packages:

```bash
typst compile --package-path ~/.local/share/typst/packages template/main.typ
pdffonts template/main.pdf  # Verify correct fonts
rm template/main.pdf        # Clean up generated PDF
```

#### 6.3 Test `typst init` workflow

Simulate the exact user experience after publication:

```bash
rm -rf .verification-temp && mkdir .verification-temp
typst init --package-path ~/.local/share/typst/packages @preview/metropolyst:0.1.0 .verification-temp/test-project
typst compile --package-path ~/.local/share/typst/packages .verification-temp/test-project/main.typ
pdffonts .verification-temp/test-project/main.pdf  # Verify correct fonts
```

**Expected fonts:** FiraSans-Regular, FiraSans-Light, DejaVuSansMono

#### 6.4 Verify no syntax errors

```bash
typst compile lib.typ 2>&1 | head -5  # Check for syntax errors (should produce no output)
rm -f lib.pdf                         # Clean up generated PDF
```

#### 6.5 Check file sizes

```bash
du -sh lib.typ README.md template/ thumbnail.png LICENSE typst.toml
du -ch lib.typ README.md template/ thumbnail.png LICENSE typst.toml | tail -1  # Total
```

Keep the total package size small (under 1MB ideally).

#### 6.6 Cleanup

Remove the temporary verification directory:

```bash
rm -rf .verification-temp
```

After the package is published to Typst Universe, also remove the local symlink to avoid shadowing the real package:

```bash
rm -rf ~/.local/share/typst/packages/preview/metropolyst/0.1.0
```

---

### Phase 7: Submission

#### 7.1 Fork typst/packages

```bash
# Clone with sparse checkout (recommended for large repo)
git clone --filter=blob:none --sparse https://github.com/typst/packages
cd packages
git sparse-checkout set packages/preview
```

#### 7.2 Create package directory

```bash
mkdir -p packages/preview/metropolyst/0.1.0
cd packages/preview/metropolyst/0.1.0
```

#### 7.3 Copy package files using script

Use the copy script from the source repo:

```bash
# From the package version directory (packages/preview/metropolyst/0.1.0/)
~/projects/metropolyst/scripts/copy-to-packages.sh ~/projects/metropolyst
```

The script copies:
- Required files: `typst.toml`, `lib.typ`, `LICENSE`, `README.md`, `thumbnail.png`
- Template directory: `template/`
- Documentation assets: `assets/` (excluded from archive but needed for README preview)

**NOT copied (by design):**
- `examples/` - Development examples and PDFs
- `scripts/` - Build utilities
- `CLAUDE.md`, `WORKPLAN.md`, `TODO.md` - Development docs
- `.git/`

#### 7.4 Verify package structure

```bash
cd packages/preview/metropolyst/0.1.0
tree .
# Expected:
# .
# ├── LICENSE
# ├── README.md
# ├── assets
# │   └── preview.png
# ├── lib.typ
# ├── template
# │   └── main.typ
# ├── thumbnail.png
# └── typst.toml
```

#### 7.5 Create pull request

```bash
cd ~/path/to/packages  # Return to repo root
git add packages/preview/metropolyst
git commit -m "Add metropolyst 0.1.0 - configurable Metropolis theme for Touying"
git push origin main
# Create PR on GitHub
```

---

## Checklist

- [x] Create `typst.toml` with correct metadata
- [x] Rename `metropolyst.typ` → `lib.typ`
- [x] Create `LICENSE` file
- [x] Create `template/` directory
- [x] Create `template/main.typ` with absolute imports
- [x] Create `thumbnail.png`
- [x] Update `README.md` with package imports
- [x] Move examples to `examples/` directory
- [x] Update `examples/example-*.typ` to import from `../lib.typ`
- [x] Rebuild and verify all examples compile
- [ ] Fork typst/packages repository
- [ ] Copy package files using `scripts/copy-to-packages.sh`
- [ ] Submit pull request

---

## Post-submission

After the package is merged and published:

1. Update this repository's README to reflect the published version
2. Tag the release: `git tag v0.1.0 && git push --tags`
3. Test: `typst init @preview/metropolyst:0.1.0`
4. Announce on Typst Discord/forums if desired

---

## Version Updates

For future versions:

1. Update version in `typst.toml`
2. Update version in `template/main.typ` import
3. Update version in `README.md` examples
4. Create new directory in packages repo: `packages/preview/metropolyst/0.2.0/`
5. Run `scripts/copy-to-packages.sh` from the new version directory
6. Submit PR (same author required, or get approval from previous author)
