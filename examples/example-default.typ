// Metropolyst Theme - Presentation Template
// A highly configurable Metropolis-style theme for Touying

#import "../lib.typ": *

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

// Focus slide for emphasis
#focus-slide[
  This is a focus slide for emphasis!
]

== Example of two-column layout
#slide(composer: components.side-by-side.with(columns: (3fr, 2fr), gutter: 1.5em))[
  === First column is wide
  But if you want equal-width columns just use *🠚*
][
  === Second column is narrow
  ```typst
  #slide([
    First column content
  ][
    Second colum content
  ])
  ```
]
