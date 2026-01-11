# Metropolyst Quarto Extension

A Quarto extension for creating presentations with the Metropolyst theme—a highly configurable variant of the classic Metropolis style.

## Installation

### Using the template (recommended for new projects)

```bash
quarto use template benzipperer/metropolyst/quarto
```

This will create a new directory with a starter presentation.

### Adding to an existing project

```bash
quarto add benzipperer/metropolyst/quarto
```

## Usage

Create a `.qmd` file with the `metropolyst-typst` format:

```yaml
---
title: "Your Presentation Title"
subtitle: "Optional Subtitle"
author: "Your Name"
date: today
institute: "Your Institution"
format:
  metropolyst-typst:
    aspect-ratio: "16-9"
    footer-progress: true
---

# First Section

## Slide Title

Your content here.
```

## YAML Configuration

### Layout Options

| Option | Default | Description |
|--------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer-progress` | `false` | Show progress bar in footer |
| `footer` | none | Left footer content |
| `footer-right` | slide number | Right footer content |

### Color Options

All colors accept hex values (e.g., `"#eb811b"`).

| Option | Default | Description |
|--------|---------|-------------|
| `accent-color` | `"#eb811b"` | Main accent color (orange) |
| `hyperlink-color` | auto | Link color (defaults to accent) |
| `line-separator-color` | auto | Title slide separator color |
| `progress-bar-color` | auto | Progress bar fill color |
| `progress-bar-background` | `"#d6c6b7"` | Progress bar background |
| `header-background-color` | `"#23373b"` | Slide header background (dark teal) |
| `focus-background-color` | auto | Focus slide background |
| `main-background-color` | `"#fafafa"` | Main slide background |
| `main-text-color` | `"#23373b"` | Body text color |
| `header-text-color` | auto | Header text color |
| `focus-text-color` | auto | Focus slide text color |
| `footer-text-color` | auto | Footer text color |

### Font Options

| Option | Default | Description |
|--------|---------|-------------|
| `font` | `"Fira Sans"` | Main font family |
| `header-font` | auto | Header font (defaults to main font) |
| `header-size` | `1.2em` | Header font size |
| `header-weight` | `"regular"` | Header font weight |
| `footer-font` | auto | Footer font |
| `footer-size` | `0.6em` | Footer font size |
| `footer-weight` | `"regular"` | Footer font weight |
| `title-font` | auto | Title slide font |
| `title-size` | `1.4em` | Title font size |
| `title-weight` | `"regular"` | Title font weight |
| `section-font` | auto | Section slide font |
| `section-size` | `1.4em` | Section font size |
| `section-weight` | `"regular"` | Section font weight |
| `focus-font` | auto | Focus slide font |
| `focus-size` | `1.4em` | Focus font size |
| `focus-weight` | `"regular"` | Focus font weight |

### Brand Presets

Use a brand preset to apply organizational styling:

```yaml
format:
  metropolyst-typst:
    brand: "EPI"
```

Available presets:

- **EPI**: Economic Policy Institute branding (Roboto font, red accent, dark blue header)

### Logo

Add a logo to the title slide:

```yaml
format:
  metropolyst-typst:
    logo: "path/to/logo.png"
```

## Slide Types

### Regular Slides

Use level-2 headings for slide titles:

```markdown
## My Slide Title

Content goes here.
```

### Section Slides

Use level-1 headings to create section dividers:

```markdown
# New Section

## First Slide in Section
```

### Focus Slides

Use a raw Typst block:

````markdown
```{=typst}
#focus-slide[
  Your emphasized message here!
]
```
````

### Two-Column Layouts

Use Quarto's layout syntax:

```markdown
::: {layout-ncol=2}
### Left Column
Content here.

### Right Column
Content here.
:::
```

Or use Typst directly for more control:

````markdown
```{=typst}
#slide(composer: (3fr, 2fr))[
  Left column (wider)
][
  Right column (narrower)
]
```
````

## Building

Render your presentation:

```bash
quarto render presentation.qmd
```

## Requirements

- Quarto 1.5.0 or later
- Typst (bundled with Quarto)
- Fira Sans font (for default styling)

## Example

See `examples/example.qmd` for a complete example presentation.

## License

MIT License - see the main repository for details.
