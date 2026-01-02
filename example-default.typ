// Metropolyst Theme - Default Configuration Example
// This example uses all default settings to demonstrate the out-of-box experience

#import "metropolyst.typ": *

// Basic theme setup with just the required information
#show: metropolyst-theme.with(
  // Customize fonts and colors (showing defaults):
  // font: ("Fira Sans",),  // All elements use this font
  // accent-color: rgb("#eb811b"),  // Orange accent throughout
  config-info(
    title: [Default Configuration],
    subtitle: [Using All Default Settings],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Institution],
  ),
)

// Title slide
#title-slide()

// Section divider (created automatically from level-1 heading)
= Introduction

== Default Theme Settings

This presentation uses all default Metropolyst settings:

- *Aspect ratio:* 16:9
- *Fonts:* Fira Sans throughout
- *Accent color:* Orange (\#eb811b)
- *Progress bar:* Disabled

== What You See

- *Header:* 1.2em, regular weight (matches original Metropolis)
- *Footer:* 0.6em, regular weight
- *Title slide:* 1.4em title, 1.0em subtitle
- *This text:* Your body content appears here

// Focus slide for emphasis
#focus-slide[
  Ready to customize?

  See example-custom.typ
]
