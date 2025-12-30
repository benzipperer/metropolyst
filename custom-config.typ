// Custom configuration test
// This uses very different font settings to make the differences obvious

#import "metropolyst.typ": *

#show: metropolyst-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Custom Configuration],
    subtitle: [Using Bold and Large Font Settings],
    author: [Test],
    institution: [Metropolyst Demo],
  ),
  // Make everything notably larger and bolder
  header-size: 2.0em,         // Much larger than default 1.2em
  header-weight: "bold",      // Bolder than default "medium"
  footer-size: 1.2em,         // Much larger than default 0.8em
  footer-weight: "bold",      // Bolder than default "regular"
  title-size: 2.5em,          // Much larger than default 1.3em
  title-weight: "bold",       // Bolder than default "medium"
  subtitle-size: 1.5em,       // Larger than default 0.9em
  subtitle-weight: "bold",    // Bolder than default "regular"
  focus-size: 3.0em,          // Much larger than default 1.5em
  focus-weight: "bold",       // Bolder than default "regular"
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
#set strong(delta: 100)

#title-slide()

== Test Section

#slide[
  = Header with Custom Settings

  This slide uses:
  - Header size: 2.0em (custom, vs 1.2em default)
  - Header weight: bold (custom, vs medium default)
  - Footer size: 1.2em (custom, vs 0.8em default)
  - Footer weight: bold (custom, vs regular default)

  *Body text* is rendered with Fira Sans Light.
]

#focus-slide[
  Focus slide with custom 3.0em bold size
]
