# Metropolyst Theme

A highly configurable variant of the [Metropolis theme](https://touying-typ.github.io/docs/themes/metropolis/) for [Touying](https://github.com/touying-typ/touying) presentations in Typst.

## Why Metropolyst?

The original Metropolis theme has hard-coded font properties (sizes, weights, and faces) that cannot be overridden through configuration. Metropolyst solves this by exposing **all** font properties as configurable parameters while maintaining the elegant Metropolis aesthetic.

## Features

- ✨ **Fully Configurable Typography**: Control font face, size, and weight for every element
- 🎨 **Metropolis Aesthetic**: Maintains the clean, professional look of the original theme
- 📝 **Fira Sans Default**: Uses Fira Sans as the default font family
- 🔧 **Easy Customization**: Simple parameter-based configuration
- 🎯 **Drop-in Replacement**: Compatible with Metropolis theme structure

## Installation

Simply copy `metropolyst.typ` to your project directory or install it as a local Typst package.

## Usage

```typst
#import "metropolyst.typ": *

#show: metropolyst-theme.with(
  aspect-ratio: "16-9",
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

== Section

#slide[
  = Slide Title

  Your content here...
]
```

## Configuration Options

### Font Configuration Parameters

Unlike the original Metropolis theme, Metropolyst exposes all font properties:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `header-font` | `("Fira Sans",)` | Font family for slide headers |
| `header-size` | `1.2em` | Font size for slide headers |
| `header-weight` | `"medium"` | Font weight for slide headers |
| `footer-font` | `("Fira Sans",)` | Font family for footers |
| `footer-size` | `0.8em` | Font size for footers |
| `footer-weight` | `"regular"` | Font weight for footers |
| `title-font` | `("Fira Sans",)` | Font family for title slide main title |
| `title-size` | `1.3em` | Font size for title slide main title |
| `title-weight` | `"medium"` | Font weight for title slide main title |
| `subtitle-size` | `0.9em` | Font size for subtitle |
| `subtitle-weight` | `"regular"` | Font weight for subtitle |
| `author-size` | `0.8em` | Font size for author |
| `author-weight` | `"regular"` | Font weight for author |
| `date-size` | `0.8em` | Font size for date |
| `date-weight` | `"regular"` | Font weight for date |
| `institution-size` | `0.8em` | Font size for institution |
| `institution-weight` | `"regular"` | Font weight for institution |
| `extra-size` | `0.8em` | Font size for extra text on title slide |
| `extra-weight` | `"regular"` | Font weight for extra text |
| `logo-size` | `2em` | Size for logo on title slide |
| `section-font` | `("Fira Sans",)` | Font family for section slides |
| `section-size` | `1.5em` | Font size for section slides |
| `section-weight` | `"regular"` | Font weight for section slides |
| `focus-font` | `("Fira Sans",)` | Font family for focus slides |
| `focus-size` | `1.5em` | Font size for focus slides |
| `focus-weight` | `"regular"` | Font weight for focus slides |

### Other Configuration Options

All standard Metropolis options are supported:

- `aspect-ratio`: `"16-9"` or `"4-3"` (default: `"16-9"`)
- `align`: Content alignment (default: `horizon`)
- `header`: Custom header content or function
- `header-right`: Right-side header content or function
- `footer`: Custom footer content or function
- `footer-right`: Right-side footer content or function
- `footer-progress`: Show progress bar (default: `true`)

Colors can be customized using `config-colors()`:

```typst
#show: metropolyst-theme.with(
  config-colors(
    primary: rgb("#eb811b"),
    primary-light: rgb("#d6c6b7"),
    secondary: rgb("#23373b"),
    neutral-lightest: rgb("#fafafa"),
    neutral-dark: rgb("#23373b"),
    neutral-darkest: rgb("#23373b"),
  ),
)
```

## Example: Custom Configuration

```typst
#show: metropolyst-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Custom Theme],
    subtitle: [With Bold Headers],
    author: [Your Name],
  ),
  // Customize fonts
  header-size: 1.5em,
  header-weight: "bold",
  footer-size: 1.0em,
  footer-weight: "medium",
  title-size: 2.0em,
  title-weight: "bold",
)
```

## Slide Types

Metropolyst provides the same slide types as Metropolis:

- `#title-slide()` - Title slide with presentation metadata
- `#slide[...]` - Standard content slide
- `#focus-slide[...]` - High-contrast attention slide
- `#new-section-slide` - Section divider (automatic with headings)

## Verification

The theme has been verified with:

- ✅ `pdffonts` - Confirms correct font families and weights are embedded
- ✅ `mutool info` - Validates PDF structure and metadata
- ✅ Side-by-side comparisons - Default vs custom configurations show visible differences

See `default-config.pdf` vs `custom-config.pdf` for visual proof that configuration options work as expected.

## Font Installation

For best results, install Fira Sans fonts:

**Linux:**
```bash
# Download Fira Sans
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

## Examples

- `demo.typ` - Comprehensive feature demonstration
- `config-test.typ` - Configuration options testing
- `default-config.typ` - Default settings reference
- `custom-config.typ` - Custom settings example

## Credits

- Inspired by [Matthias Vogelgesang's Beamer Metropolis theme](https://github.com/matze/mtheme)
- Based on the [Touying Metropolis theme](https://touying-typ.github.io/docs/themes/metropolis/) by @Enivex
- Built for [Touying](https://github.com/touying-typ/touying) presentation framework

## License

This theme follows the same license as the original Touying Metropolis theme.

## Contributing

Issues and pull requests are welcome! Please ensure any changes maintain backward compatibility with the original Metropolis theme structure.
