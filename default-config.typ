// Default configuration test
// This uses all default font settings

#import "metropolyst.typ": *

#show: metropolyst-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Default Configuration],
    subtitle: [Using Default Font Settings],
    author: [Test],
    institution: [Metropolyst Demo],
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
#set strong(delta: 100)

#title-slide()

== Test Section

#slide[
  = Header with Default Settings

  This slide uses:
  - Header size: 1.2em (default)
  - Header weight: medium (default)
  - Footer size: 0.8em (default)
  - Footer weight: regular (default)

  *Body text* is rendered with Fira Sans Light.
]

#focus-slide[
  Focus slide with default 1.5em size
]
