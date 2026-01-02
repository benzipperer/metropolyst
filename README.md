# Metropolyst Theme

A highly configurable variant of the [Metropolis theme](https://touying-typ.github.io/docs/themes/metropolis/) for [Touying](https://github.com/touying-typ/touying) presentations in Typst.

## Why Metropolyst?

The original Metropolis theme has hard-coded font properties (sizes, weights, and faces) that cannot be overridden through configuration. Metropolyst solves this by exposing **all** font properties as configurable parameters while maintaining the elegant Metropolis aesthetic.

## Features

- **Fully Configurable Typography**: Control font face, size, and weight for every text element
- **Granular Accent Colors**: Customize colors independently for hyperlinks, progress bars, alerts, and more
- **Brand Presets**: Apply organizational branding with a single setting
- **Fira Sans Default**: Uses Fira Sans as the default font family for a clean, modern look
- **Drop-in Replacement**: Compatible with Metropolis theme structure and conventions

## Brands

Brands are preset configurations that apply organizational styling with a single setting. Use the spread operator (`..`) to apply a brand:

```typst
#import "metropolyst.typ": metropolyst-theme, brands

#show: metropolyst-theme.with(..brands.EPI)
```

### Built-in Brands

| Brand | Description |
|-------|-------------|
| `EPI` | Economic Policy Institute branding (dark blue accent `#063957`, no page counter) |

### Combining Brands with Overrides

You can apply a brand and then override specific settings:

```typst
#show: metropolyst-theme.with(
  ..brands.EPI,
  footer-progress: true,  // Add progress bar to EPI brand
)
```

### Defining Your Own Brands

Create custom brands as dictionaries in your own file:

```typst
// my-brands.typ
#let brands = (
  "my-company": (
    accent-color: rgb("#ff0000"),
    header-background-color: rgb("#333333"),
    font: ("Roboto",),
  ),
)
```

Then import and use:

```typst
#import "metropolyst.typ": metropolyst-theme
#import "my-brands.typ": brands

#show: metropolyst-theme.with(..brands.my-company)
```

Or define inline:

```typst
#let my-brand = (
  accent-color: rgb("#0066cc"),
  footer-right: none,
)

#show: metropolyst-theme.with(..my-brand)
```

---

## Installation

Copy `metropolyst.typ` to your project directory or install it as a local Typst package.

## Quick Start

```typst
#import "metropolyst.typ": metropolyst-theme, brands

#show: metropolyst-theme.with(
  config-info(
    title: [Your Title],
    subtitle: [Your Subtitle],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Institution],
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
#set strong(delta: 100)

#title-slide()

== Section Title

#slide[
  = Slide Title
  Your content here...
]
```

See `example-default.typ` for a minimal working example and `example-custom.typ` for a comprehensive demonstration of all configuration options.

---

## Configuration Reference

### Layout Options

These options control the overall slide layout and structure.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio. Use `"16-9"` for widescreen or `"4-3"` for traditional 4:3 presentations. |
| `align` | `horizon` | Vertical alignment of slide content. Use `horizon` for vertically centered content, `top` for top-aligned, or `bottom` for bottom-aligned. |
| `footer-progress` | `false` | Whether to display a progress bar at the bottom of each slide. Set to `true` to show it. |

### Header and Footer Content

These options let you customize what appears in the header and footer areas of each slide.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `header` | *current heading* | Content displayed in the left side of the slide header. By default, shows the current slide title. Can be a string, content, or a function `self => content`. |
| `header-right` | *logo* | Content displayed in the right side of the slide header. By default, shows the logo from `config-info`. Can be content or a function. |
| `footer` | `none` | Content displayed in the left side of the footer. Set to `none` to leave empty, or provide custom content. |
| `footer-right` | *slide counter* | Content displayed in the right side of the footer. By default shows "current / total" slide numbers. |

---

### Font Configuration

Metropolyst exposes font properties for every text element. Each element can have up to three properties configured:
- **font**: The font family (specified as a tuple, e.g., `("Fira Sans",)`)
- **size**: The font size (e.g., `1.2em`, `20pt`)
- **weight**: The font weight (e.g., `"regular"`, `"medium"`, `"bold"`)

#### Understanding the Font System

The theme uses a **cascading font system** similar to the color system:
1. Set `font` to define the base font for your entire presentation
2. All element-specific font options (`header-font`, `footer-font`, etc.) default to `auto`
3. When set to `auto`, these options inherit from `font`
4. Override any specific option to use a different font for that element

This means you can:
- Set just `font` to change all fonts at once (e.g., `font: ("Roboto",)`)
- Set individual `*-font` options to mix fonts for specific elements

#### Font Examples

**Single font for everything:**
```typst
#show: metropolyst-theme.with(
  font: ("Roboto",),  // All elements use Roboto
)
```

**Mixed fonts:**
```typst
#show: metropolyst-theme.with(
  font: ("Libertinus Serif",),       // Base font for most elements
  header-font: ("Fira Sans",),       // Sans-serif for headers only
  focus-font: ("Fira Sans",),        // Sans-serif for focus slides
)
```

#### Base Font Option

| Parameter | Default | Description |
|-----------|---------|-------------|
| `font` | `("Fira Sans",)` | The base font family for all elements. All `*-font` options inherit from this when set to `auto`. |

#### Slide Header and Footer

| Parameter | Default | Description |
|-----------|---------|-------------|
| `header-font` | `auto` | Font family for slide headers. When `auto`, uses `font`. |
| `header-size` | `1.2em` | Font size for slide headers (matches original Metropolis `\large`). |
| `header-weight` | `"regular"` | Font weight for slide headers (matches original Metropolis). Options: `"thin"`, `"light"`, `"regular"`, `"medium"`, `"bold"`, `"black"`. |
| `footer-font` | `auto` | Font family for the slide footer text. When `auto`, uses `font`. |
| `footer-size` | `0.6em` | Font size for footer text (matches original Metropolis `\scriptsize`). |
| `footer-weight` | `"regular"` | Font weight for footer text. |

#### Title Slide Elements

These control the typography on the title slide (created with `#title-slide()`).

| Parameter | Default | Description |
|-----------|---------|-------------|
| `title-font` | `auto` | Font family for the presentation title. When `auto`, uses `font`. |
| `title-size` | `1.4em` | Font size for the presentation title (matches original Metropolis `\Large`). |
| `title-weight` | `"regular"` | Font weight for the presentation title (matches original Metropolis). |
| `subtitle-size` | `1.0em` | Font size for the subtitle (matches original Metropolis `\large`). |
| `subtitle-weight` | `"light"` | Font weight for the subtitle. |
| `author-size` | `0.8em` | Font size for the author name. |
| `author-weight` | `"light"` | Font weight for the author name. |
| `date-size` | `0.8em` | Font size for the date. |
| `date-weight` | `"light"` | Font weight for the date. |
| `institution-size` | `0.8em` | Font size for the institution/organization name. |
| `institution-weight` | `"light"` | Font weight for the institution name. |
| `extra-size` | `0.8em` | Font size for extra text passed via `#title-slide(extra: [...])`. |
| `extra-weight` | `"light"` | Font weight for extra text. |
| `logo-size` | `2em` | Size of the logo/emoji on the title slide. |

#### Section and Focus Slides

| Parameter | Default | Description |
|-----------|---------|-------------|
| `section-font` | `auto` | Font family for section divider slides. When `auto`, uses `font`. |
| `section-size` | `1.4em` | Font size for section slide headings (matches original Metropolis `\Large`). |
| `section-weight` | `"regular"` | Font weight for section slide headings. |
| `focus-font` | `auto` | Font family for focus slides. When `auto`, uses `font`. |
| `focus-size` | `1.4em` | Font size for focus slide content (matches original Metropolis `\Large`). |
| `focus-weight` | `"regular"` | Font weight for focus slide content. |

---

### Color Configuration

Metropolyst provides granular control over colors used throughout the presentation.

#### Understanding the Color System

The theme has two types of configurable colors:

**Accent colors** — inherit from `accent-color` when set to `auto`:
- `hyperlink-color` — color for links
- `line-separator-color` — title slide separator line
- `progress-bar-color` — progress bar foreground

**Background colors** — have independent defaults:
- `header-background-color` — defaults to dark teal (`#23373b`), not `accent-color`
- `focus-background-color` — defaults to `header-background-color`

This means you can:
- Set just `accent-color` to change links, separators, and progress bars at once
- Background colors must be set explicitly if you want them to match

#### Color Options

| Parameter | Default | Description |
|-----------|---------|-------------|
| `accent-color` | `rgb("#eb811b")` (orange) | The primary accent color. When other accent options are `auto`, they use this color. Used for `#alert[...]` text. Bold text (`*...*`) inherits the normal text color. This orange is the classic Metropolis accent. |
| `hyperlink-color` | `auto` | Color for hyperlinks (created with `#link(...)`). When `auto`, uses `accent-color`. Set to a specific color like `rgb("#0077b6")` for blue links. |
| `line-separator-color` | `auto` | Color for the horizontal line on the title slide that separates the title from author information. When `auto`, uses `accent-color`. |
| `progress-bar-color` | `auto` | Color for the foreground of progress bars (in footer and on section slides). When `auto`, uses `accent-color`. |
| `progress-bar-background` | `rgb("#d6c6b7")` (beige) | Background color for progress bars. This is the "unfilled" portion of the progress bar. |
| `header-background-color` | `auto` | Background color for the slide header. When `auto`, uses dark teal `rgb("#23373b")` (does NOT inherit from `accent-color`). |
| `focus-background-color` | `auto` | Background color for focus slides. When `auto`, uses `header-background-color`. |

#### Color Examples

**Single accent color (links, separators, progress bars all match):**
```typst
#show: metropolyst-theme.with(
  accent-color: rgb("#0077b6"),  // Blue for links, separators, progress bars
)
```

**Matching header background to accent color:**
```typst
#show: metropolyst-theme.with(
  accent-color: rgb("#0077b6"),
  header-background-color: rgb("#0077b6"),  // Must be set explicitly
)
```

**Multi-color scheme:**
```typst
#show: metropolyst-theme.with(
  accent-color: rgb("#e63946"),           // Red for alert text
  hyperlink-color: rgb("#0077b6"),        // Blue for links
  progress-bar-color: rgb("#2a9d8f"),     // Teal for progress bars
)
```

---

## Slide Types

Metropolyst provides four slide types:

### Title Slide

```typst
#title-slide()
// or with extra information:
#title-slide(extra: [Conference Name 2025])
```

Creates the opening slide with title, subtitle, author, date, institution, and optional logo. Configure the content using `config-info()`.

### Content Slide

```typst
#slide[
  = Slide Title
  Your content here...
]
```

Standard slide with header showing the slide title, footer with slide counter, and your content.

### Section Slide

```typst
== Section Name
```

Automatically creates a section divider slide when you use a level-2 heading. Shows the section name with a progress bar.

### Focus Slide

```typst
#focus-slide[
  *Key Message*
]
```

High-contrast slide with dark background and light text. Use for important messages or transitions.

---

## Presentation Info

Set presentation metadata using `config-info()`:

```typst
#show: metropolyst-theme.with(
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
    logo: emoji.rocket,  // or an image
  ),
)
```

---

## Font Installation

For best results, install the Fira Sans font family:

**Linux:**
```bash
# Ubuntu/Debian
sudo apt install fonts-fira-sans

# Or download from GitHub
wget https://github.com/mozilla/Fira/archive/refs/heads/master.zip
unzip master.zip
sudo cp Fira-master/ttf/*.ttf /usr/share/fonts/truetype/
fc-cache -fv
```

**macOS:**
```bash
brew install --cask font-fira-sans
```

**Windows:**
Download from [Google Fonts](https://fonts.google.com/specimen/Fira+Sans) and install.

---

## Examples

- `example-default.typ` - Minimal example using default settings
- `example-custom.typ` - Comprehensive example demonstrating all configuration options
- `example-epi.typ` - Example using the built-in EPI brand preset

---

## Credits

- Inspired by [Matthias Vogelgesang's Beamer Metropolis theme](https://github.com/matze/mtheme)
- Based on the [Touying Metropolis theme](https://touying-typ.github.io/docs/themes/metropolis/) by @Enivex
- Built for the [Touying](https://github.com/touying-typ/touying) presentation framework

## License

This theme follows the same license as the original Touying Metropolis theme.
