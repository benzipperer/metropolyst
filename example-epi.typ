// Metropolyst Theme - EPI Brand Example
// This example demonstrates the built-in EPI brand preset

#import "metropolyst.typ": *
#import "@preview/touying:0.5.3": *

// Apply the EPI brand with a single spread operator
#show: metropolyst-theme.with(
  ..brands.EPI,
  config-info(
    title: [Economic Policy Institute],
    subtitle: [Brand Preset Example],
    author: [Research Team],
    date: datetime.today(),
    institution: [EPI],
  ),
)

// Title slide
#title-slide()

= Overview

== What the EPI Brand Sets

The EPI brand applies these settings automatically:

- *Accent color:* EPI dark blue (\#063957)
- *Header background:* Default dark teal (\#23373b)
- *Page counter:* Disabled

== Combining with Overrides

You can extend the brand with additional settings:

```typst
#show: metropolyst-theme.with(
  ..brands.EPI,
  footer-progress: true,  // Add progress bar
  font: ("Libertinus Serif",),  // Change font
)
```

== Creating Your Own Brand

Define brands as dictionaries:

```typst
#let my-brand = (
  accent-color: rgb("#0066cc"),
  header-background-color: rgb("#333"),
  footer-right: none,
)
```

#focus-slide[
  One line to apply

  organizational branding
]
