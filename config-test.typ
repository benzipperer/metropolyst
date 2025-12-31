// Configuration test for Metropolyst theme
// This file tests various font configuration options to ensure they work correctly

#import "metropolyst.typ": *

#show: metropolyst-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Configuration Test],
    subtitle: [Testing Custom Font and Accent Color Settings],
    author: [Test Author],
    date: datetime.today(),
    institution: [Test Institution],
  ),
  // Custom font configuration - different from defaults
  header-size: 1.5em,        // Default: 1.2em
  header-weight: "bold",      // Default: "medium"
  footer-size: 1.0em,         // Default: 0.8em
  footer-weight: "medium",    // Default: "regular"
  title-size: 2.0em,          // Default: 1.3em
  title-weight: "bold",       // Default: "medium"
  subtitle-size: 1.2em,       // Default: 0.9em
  subtitle-weight: "medium",  // Default: "regular"
  section-size: 2.0em,        // Default: 1.5em
  section-weight: "bold",     // Default: "regular"
  focus-size: 2.0em,          // Default: 1.5em
  focus-weight: "bold",       // Default: "regular"
  // Custom accent color configuration
  accent-color: rgb("#e63946"),           // Red accent instead of orange
  hyperlink-color: rgb("#0077b6"),        // Blue hyperlinks
  line-separator-color: rgb("#2a9d8f"),   // Teal line separator
  progress-bar-color: rgb("#9d4edd"),     // Purple progress bar
  progress-bar-background: rgb("#e0aaff"), // Light purple progress bar background
  alert-color: rgb("#f4a261"),            // Orange alert text
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
// #show math.equation: set text(font: "Fira Math")
#set strong(delta: 100)

#title-slide()

== Test Section

#slide[
  = Custom Header Test

  This slide has a custom header with:
  - Size: 1.5em (instead of default 1.2em)
  - Weight: bold (instead of default medium)

  The footer also has custom settings:
  - Size: 1.0em (instead of default 0.8em)
  - Weight: medium (instead of default regular)
]

#slide[
  = Font Verification

  If the configuration works correctly, you should see:

  *In the header:*
  - Larger text (1.5em vs 1.2em)
  - Bolder weight

  *In the footer:*
  - Larger text (1.0em vs 0.8em)
  - Medium weight

  *On the title slide:*
  - Much larger title (2.0em vs 1.3em)
  - Bold title weight
  - Larger subtitle (1.2em vs 0.9em)
]

#focus-slide[
  This focus slide should be *2.0em* and *bold*
]

== Accent Color Tests

#slide[
  = Accent Color Configuration

  This presentation tests custom accent colors:

  #table(
    columns: 2,
    [*Element*], [*Custom Color*],
    [Accent (base)], [Red #box(fill: rgb("#e63946"), width: 1em, height: 1em)],
    [Hyperlinks], [Blue #box(fill: rgb("#0077b6"), width: 1em, height: 1em)],
    [Line Separator], [Teal #box(fill: rgb("#2a9d8f"), width: 1em, height: 1em)],
    [Progress Bar], [Purple #box(fill: rgb("#9d4edd"), width: 1em, height: 1em)],
    [Progress Background], [Light Purple #box(fill: rgb("#e0aaff"), width: 1em, height: 1em)],
    [Alert Text], [Orange #box(fill: rgb("#f4a261"), width: 1em, height: 1em)],
  )
]

#slide[
  = Hyperlink Test

  Here is a #link("https://typst.app")[hyperlink to Typst] that should appear in blue.

  Another link: #link("https://github.com")[GitHub]

  The hyperlinks use a different color than the main accent!
]

#slide[
  = Alert Text Test

  Here is some #alert[alert text] that should appear in orange.

  The alert color is independent of the accent color!

  You can also use *bold* and _italic_ text normally.
]

#slide[
  = Expected Results

  We can verify these settings using:

  ```bash
  pdffonts config-test.pdf
  mutool info config-test.pdf
  ```

  This will show:
  - Font names (should be Fira Sans variants)
  - Font sizes
  - Whether bold/medium variants are used
]
