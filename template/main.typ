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
