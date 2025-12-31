// Metropolyst Theme - Default Configuration Example
// This example uses all default settings to demonstrate the out-of-box experience

#import "metropolyst.typ": *

// Basic theme setup with just the required information
#show: metropolyst-theme.with(
  config-info(
    title: [Default Configuration],
    subtitle: [Using All Default Settings],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Institution],
  ),
)

// Recommended text settings for body content
#set text(font: "Fira Sans", weight: "light", size: 20pt)
#set strong(delta: 100)

// Title slide
#title-slide()

// Section divider (created automatically from level-2 heading)
== Introduction

#slide[
  = Default Theme Settings

  This presentation uses all default Metropolyst settings:

  - *Aspect ratio:* 16:9
  - *Fonts:* Fira Sans throughout
  - *Accent color:* Orange (\#eb811b)
  - *Progress bar:* Enabled
]

#slide[
  = What You See

  - *Header:* 1.2em, medium weight
  - *Footer:* 0.8em, regular weight, with progress bar
  - *Title slide:* 1.3em title, 0.9em subtitle
  - *This text:* Your body content appears here
]

// Focus slide for emphasis
#focus-slide[
  Ready to customize?

  See example-custom.typ
]
