# Workplan: Quarto Extension for Metropolyst

This workplan outlines the strategy for adding a Quarto extension to metropolyst while maintaining the native Typst package and supporting future implementations (e.g., Polylux).

## Goals

1. **Easy user installation** - Users can install with `quarto add benzipperer/metropolyst/quarto`
2. **Clean developer workflow** - Maintain both versions without duplication or sync headaches
3. **Extensible structure** - Support future implementations (Polylux, etc.)
4. **Independent submissions** - Native Typst package can be submitted to Typst Universe independently

## Proposed Repository Structure

```
metropolyst/
├── README.md                         # Root README (overview of all implementations)
├── CLAUDE.md                         # Developer guide (updated)
├── LICENSE
│
├── typst/                            # Native Typst package (for Typst Universe)
│   ├── lib.typ                       # Theme implementation (entrypoint)
│   ├── typst.toml                    # Package manifest
│   ├── template/
│   │   └── main.typ                  # Template for `typst init`
│   ├── README.md                     # Typst-specific documentation
│   ├── thumbnail.png
│   ├── assets/
│   │   └── preview.png               # README preview image (for Typst package README)
│   └── examples/                     # Native Typst examples
│       ├── example-default.typ
│       ├── example-default.pdf
│       ├── example-custom.typ
│       ├── example-custom.pdf
│       ├── example-epi.typ
│       ├── example-epi.pdf
│       ├── example_figure_light.png  # Figure assets for epi example
│       └── example_figure_white.png
│
├── quarto/                           # Quarto extension
│   ├── _extensions/
│   │   └── benzipperer/
│   │       └── metropolyst/
│   │           ├── _extension.yml    # Extension manifest
│   │           ├── typst-template.typ # Template partial (imports from lib.typ)
│   │           └── typst-show.typ    # Show rule (maps YAML to Typst)
│   ├── template.qmd                  # Template document for `quarto add`
│   ├── README.md                     # Quarto-specific documentation
│   └── examples/                     # Quarto examples
│       ├── example.qmd
│       └── example.pdf
│
└── scripts/
    ├── update-preview.py             # Generate preview from example
    ├── copy-to-packages.sh           # Copy typst/ for Typst Universe PR
    ├── sync-quarto-theme.sh          # NEW: Sync lib.typ to Quarto extension
    ├── example_figures.R
    └── productivity_pay.csv
```

## Key Design Decisions

### 1. Theme Code Location

**Decision**: Keep the canonical theme in `typst/lib.typ`. The Quarto extension imports from the published Typst Universe package.

**Rationale**:
- Single source of truth for theme logic
- Users of either version get identical rendering
- Quarto extension stays lightweight (no duplicated code)

**Implementation**:
- Published Quarto extension: `#import "@preview/metropolyst:X.Y.Z": *`
- Development mode: Script copies `typst/lib.typ` into Quarto extension temporarily

### 2. Quarto Extension Design

The Quarto extension will:
1. Import the metropolyst theme from Typst Universe
2. Map Quarto YAML front matter to theme configuration
3. Provide sensible defaults that work out of the box
4. Allow full customization via YAML

**Key files**:

`_extension.yml`:
```yaml
title: Metropolyst
author: Ben Zipperer
version: 0.1.0
quarto-required: ">=1.5.0"
contributes:
  formats:
    metropolyst-typst:
      template-partials:
        - typst-template.typ
        - typst-show.typ
```

`typst-show.typ`:
- Receives YAML metadata from Quarto
- Calls `metropolyst-theme()` with configured options
- Maps standard Quarto metadata (title, author, date) to theme parameters

`typst-template.typ`:
- Imports metropolyst from Typst Universe
- Provides the show rule wrapper
- Handles brand presets and color configuration

### 3. Installation Commands

| Version | Installation Command |
|---------|---------------------|
| Quarto | `quarto add benzipperer/metropolyst/quarto` |
| Typst (after publish) | `typst init @preview/metropolyst:0.1.0` |
| Typst (local) | Clone repo, use `typst/lib.typ` directly |

### 4. Future Implementations (Polylux, etc.)

Structure supports adding:
```
metropolyst/
├── polylux/                          # Future: Polylux version
│   ├── lib.typ                       # Polylux-based implementation
│   └── README.md
├── beamer/                           # Future: LaTeX Beamer port
│   ├── metropolyst.sty
│   └── README.md
```

Each implementation:
- Has its own subdirectory with examples and assets
- Uses consistent color/font naming
- Has implementation-specific docs

## Implementation Steps

### Phase 1: Restructure Repository

1. Create new directory structure:
   ```bash
   mkdir -p typst/template typst/assets typst/examples
   mkdir -p quarto/_extensions/benzipperer/metropolyst quarto/examples
   ```

2. Move files to new locations:
   - `lib.typ` → `typst/lib.typ`
   - `typst.toml` → `typst/typst.toml`
   - `template/` → `typst/template/`
   - `thumbnail.png` → `typst/thumbnail.png`
   - `assets/preview.png` → `typst/assets/preview.png`
   - `examples/example-*.typ` → `typst/examples/`
   - `examples/example-*.pdf` → `typst/examples/`
   - `examples/example_figure_*.png` → `typst/examples/`

3. Update file references:
   - `typst/typst.toml`: Update paths
   - `typst/examples/*.typ`: Update import paths
   - `scripts/copy-to-packages.sh`: Update source path
   - `scripts/update-preview.py`: Update paths

4. Update root `README.md` with overview of both implementations

5. Create `typst/README.md` (move current README, adjust paths)

### Phase 2: Create Quarto Extension

1. Create `quarto/_extensions/benzipperer/metropolyst/_extension.yml`

2. Create `quarto/_extensions/benzipperer/metropolyst/typst-template.typ`:
   - Import metropolyst theme
   - Define template structure
   - Handle figure/table placement

3. Create `quarto/_extensions/benzipperer/metropolyst/typst-show.typ`:
   - Map YAML front matter to theme config
   - Handle metadata (title, subtitle, author, date, institution)
   - Support custom colors, fonts, presets

4. Create `quarto/template.qmd`:
   - Example presentation using the extension
   - Demonstrate key features (sections, focus slides, etc.)
   - Show YAML configuration options

5. Create `quarto/README.md`:
   - Installation instructions
   - YAML configuration reference
   - Usage examples

### Phase 3: Development Tooling

1. Create `scripts/sync-quarto-theme.sh`:
   - Copies `typst/lib.typ` to Quarto extension for local testing
   - Modifies imports for local development

2. Update `scripts/copy-to-packages.sh`:
   - Works with new `typst/` directory structure
   - Excludes quarto and other non-package files

3. Update `CLAUDE.md`:
   - Document new file structure
   - Add build commands for both versions
   - Document sync workflow

### Phase 4: Testing & Verification

#### 4.1 Build Verification

1. Build all Typst examples:
   ```bash
   for f in typst/examples/example-*.typ; do typst compile --root ./typst "$f"; done
   ```

2. Build Quarto examples:
   ```bash
   cd quarto && quarto render examples/example.qmd
   cd quarto && quarto render template.qmd
   ```

3. Test Quarto installation from GitHub:
   ```bash
   cd /tmp && mkdir test-quarto && cd test-quarto
   quarto add benzipperer/metropolyst/quarto --no-prompt
   ```

#### 4.2 Font Embedding Verification

Verify both Typst and Quarto outputs embed the same fonts:

```bash
# Check font embedding for all PDFs
for f in typst/examples/*.pdf quarto/examples/*.pdf quarto/*.pdf; do
  echo "=== $f ==="
  pdffonts "$f"
done
```

Expected: Quarto output should embed identical fonts as equivalent Typst examples.

#### 4.3 Quarto-Typst Output Equivalence Tests

Create a parallel test example that can be compiled via both Typst and Quarto to verify identical output:

1. **Create matching test files**:
   - `tests/reference.typ` - Native Typst version
   - `tests/reference.qmd` - Quarto version with equivalent content

2. **PDF metadata comparison**:
   ```bash
   # Compare page count and dimensions
   pdfinfo typst/examples/example-default.pdf | grep -E "Pages|Page size"
   pdfinfo quarto/examples/example.pdf | grep -E "Pages|Page size"
   ```

3. **Visual regression testing** (using pdftoppm + ImageMagick):
   ```bash
   # Convert PDFs to images for comparison
   mkdir -p tests/output
   pdftoppm -png tests/reference-typst.pdf tests/output/typst
   pdftoppm -png tests/reference-quarto.pdf tests/output/quarto

   # Compare each page (returns 0 if identical, non-zero with diff image if different)
   for i in tests/output/typst-*.png; do
     page=$(basename "$i" .png | sed 's/typst-//')
     compare -metric AE "$i" "tests/output/quarto-$page.png" "tests/output/diff-$page.png" 2>&1
   done
   ```

4. **Text content extraction and comparison**:
   ```bash
   # Extract text from both PDFs and compare structure
   pdftotext tests/reference-typst.pdf tests/output/typst.txt
   pdftotext tests/reference-quarto.pdf tests/output/quarto.txt
   diff tests/output/typst.txt tests/output/quarto.txt
   ```

#### 4.4 Slide Geometry Tests

Verify slide dimensions match between Typst and Quarto outputs:

```bash
# Check page dimensions (should be 720x405 pt for 16:9)
mutool info typst/examples/example-default.pdf | grep -A2 "Page"
mutool info quarto/examples/example.pdf | grep -A2 "Page"
```

#### 4.5 Theme Configuration Parity Tests

Create test cases that verify all theme parameters produce identical results:

| Test Case | Typst Config | Quarto YAML | Expected |
|-----------|--------------|-------------|----------|
| Default theme | `metropolyst-theme()` | `format: metropolyst-typst` | Identical output |
| Custom accent | `accent-color: red` | `accent-color: red` | Same red accent |
| Custom fonts | `font: "Lato"` | `font: "Lato"` | Same font rendering |
| Footer progress | `footer-progress: true` | `footer-progress: true` | Same progress bar |
| Brand preset | `preset: epi-preset` | `brand: "EPI"` | Same EPI styling |

Test script (`scripts/test-parity.sh`):
```bash
#!/bin/bash
set -e

echo "Building Typst reference..."
typst compile --root ./typst tests/parity-default.typ tests/output/parity-default-typst.pdf

echo "Building Quarto version..."
cd quarto && quarto render ../tests/parity-default.qmd -o ../tests/output/parity-default-quarto.pdf

echo "Comparing outputs..."
# Convert to images
pdftoppm -png -r 150 tests/output/parity-default-typst.pdf tests/output/typst-page
pdftoppm -png -r 150 tests/output/parity-default-quarto.pdf tests/output/quarto-page

# Compare with tolerance for minor rendering differences
for typst_img in tests/output/typst-page-*.png; do
  page=$(basename "$typst_img" | sed 's/typst-page-//' | sed 's/.png//')
  quarto_img="tests/output/quarto-page-$page.png"

  # Use RMSE metric with threshold (allow < 1% difference)
  diff_value=$(compare -metric RMSE "$typst_img" "$quarto_img" null: 2>&1 | cut -d'(' -f2 | cut -d')' -f1)

  if (( $(echo "$diff_value > 0.01" | bc -l) )); then
    echo "FAIL: Page $page differs by ${diff_value}%"
    compare "$typst_img" "$quarto_img" "tests/output/diff-page-$page.png"
    exit 1
  else
    echo "PASS: Page $page (diff: ${diff_value}%)"
  fi
done

echo "All parity tests passed!"
```

#### 4.6 Automated CI Tests (Future)

Add GitHub Actions workflow (`.github/workflows/test.yml`):
```yaml
name: Test Quarto-Typst Parity

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install Typst
        run: cargo install --locked typst-cli

      - name: Install Quarto
        uses: quarto-dev/quarto-actions/setup@v2

      - name: Install test dependencies
        run: sudo apt-get install -y poppler-utils imagemagick mupdf-tools

      - name: Build Typst examples
        run: |
          for f in typst/examples/example-*.typ; do
            typst compile --root ./typst "$f"
          done

      - name: Build Quarto examples
        run: |
          cd quarto && quarto render examples/example.qmd

      - name: Run parity tests
        run: ./scripts/test-parity.sh

      - name: Upload diff artifacts
        if: failure()
        uses: actions/upload-artifact@v4
        with:
          name: parity-diffs
          path: tests/output/diff-*.png
```

#### 4.7 Test File Structure

```
tests/
├── parity-default.typ         # Native Typst test document
├── parity-default.qmd         # Equivalent Quarto document
├── parity-custom.typ          # Custom theme options test
├── parity-custom.qmd          # Equivalent Quarto version
├── parity-epi.typ             # EPI preset test
├── parity-epi.qmd             # Equivalent Quarto version
└── output/                    # Generated during testing (gitignored)
    ├── *.pdf
    ├── *.png
    └── *.txt
```

#### 4.8 Test Checklist

- [ ] Typst examples compile without errors
- [ ] Quarto examples render without errors
- [ ] Font embedding matches between Typst and Quarto outputs
- [ ] Page dimensions are identical (16:9 or 4:3)
- [ ] Visual regression tests pass (< 1% pixel difference)
- [ ] Text content extraction produces equivalent text
- [ ] All theme parameters produce matching results
- [ ] Brand presets render identically
- [ ] Installation from GitHub succeeds

### Phase 5: Documentation

1. Root `README.md`:
   - Brief overview of metropolyst
   - Links to implementation-specific docs
   - Quick start for both versions

2. `typst/README.md`:
   - Complete Typst usage documentation
   - Configuration reference
   - Brand presets

3. `quarto/README.md`:
   - Quarto installation and usage
   - YAML configuration reference
   - Migration guide from other Quarto formats

4. Update `CLAUDE.md`:
   - Complete file listing
   - Build commands for all implementations
   - Contribution guidelines

## Quarto YAML Configuration Design

```yaml
---
title: "Presentation Title"
subtitle: "Optional Subtitle"
author: "Author Name"
date: today
institute: "Institution"
format:
  metropolyst-typst:
    # Layout
    aspect-ratio: "16-9"          # or "4-3"
    footer-progress: true

    # Colors (supports hex or named colors)
    accent-color: "#eb811b"
    header-background-color: "#23373b"
    main-background-color: "#fafafa"

    # Fonts
    font: "Fira Sans"
    header-font: auto             # inherits from font

    # Presets (overrides above settings)
    brand: "EPI"                  # optional brand preset
---
```

## Dependency Management

The Quarto extension depends on:
- Touying 0.6.1+ (Typst presentation framework)
- Metropolyst from Typst Universe (once published)

For development before Typst Universe publication:
- Use `scripts/sync-quarto-theme.sh` to bundle lib.typ locally
- Update import paths in typst-template.typ

## Migration Checklist

When restructuring the repo:

- [x] Create directory structure
- [x] Move and update typst package files
- [x] Move example files
- [x] Update all import paths (no changes needed - relative paths still work)
- [x] Create Quarto extension files
- [x] Create sync script
- [x] Update build scripts (copy-to-packages.sh, update-preview.py)
- [x] Update documentation (root README.md, typst/README.md, quarto/README.md)
- [x] Test Typst compilation
- [ ] Test Quarto rendering
- [ ] Test installation from GitHub
- [ ] Commit and push to `quarto` branch
- [ ] Merge to main when ready

## Open Questions

1. **Versioning**: Should Quarto extension version match Typst package version?
   - Recommendation: Yes, keep them synchronized for clarity

2. **Brand presets in Quarto**: Expose as YAML option or require Typst code?
   - Recommendation: YAML option (`brand: "EPI"`) for simplicity

3. **Logo handling**: How should logos work in Quarto?
   - Recommendation: Accept file path in YAML, convert to Typst image

4. **Slide syntax**: Use Quarto's section levels or custom dividers?
   - Recommendation: Follow Quarto conventions (## for slides)

## Timeline Dependencies

1. **Before Quarto extension can use Typst Universe import**:
   - Typst package must be published to Typst Universe
   - Use local bundling for development/testing

2. **Before merging to main**:
   - All tests pass
   - Documentation complete
   - Installation tested from GitHub

## Success Criteria

- [ ] `quarto add benzipperer/metropolyst/quarto` works
- [ ] Quarto presentations render identically to native Typst
- [ ] All configuration options accessible via YAML
- [ ] Brand presets work in Quarto
- [ ] Native Typst package can still be submitted to Typst Universe
- [ ] Developer can update theme in one place
- [ ] Structure supports future Polylux implementation
