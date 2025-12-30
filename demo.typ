// Demo slides for the Metropolyst theme
// This demo showcases the configurable font options

#import "metropolyst.typ": *

#show: metropolyst-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Metropolyst Theme],
    subtitle: [A Highly Configurable Metropolis Variant],
    author: [Demo Author],
    date: datetime.today(),
    institution: [Typst University],
    logo: emoji.rocket,
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 20pt)
// #show math.equation: set text(font: "Fira Math")
#set strong(delta: 100)
#set par(justify: true)

#title-slide(extra: [Created with Touying])

== Introduction

#slide[
  = What is Metropolyst?

  Metropolyst is a highly configurable variant of the Metropolis theme for Touying presentations.

  *Key Features:*
  - All font faces are configurable
  - All font sizes are configurable
  - All font weights are configurable
  - Maintains the elegant Metropolis aesthetic
  - Uses Fira Sans as the default font
]

#slide[
  = Why Metropolyst?

  The original Metropolis theme has *hard-coded* font properties that cannot be overridden:

  - Header size and weight are fixed
  - Footer size is fixed
  - Title slide font sizes are fixed

  Metropolyst exposes *all* of these as configuration parameters!
]

== Features

#slide[
  = Configurable Elements

  Every text element can be customized:

  #table(
    columns: 2,
    [*Element*], [*Configurable Properties*],
    [Header], [font, size, weight],
    [Footer], [font, size, weight],
    [Title], [font, size, weight],
    [Subtitle], [size, weight],
    [Section], [font, size, weight],
    [Focus], [font, size, weight],
  )
]

#slide[
  = Typography Options

  Control typography for *every* element:

  - *Font face*: Choose any installed font
  - *Font size*: Precise control with any CSS unit
  - *Font weight*: From thin to black

  Perfect for matching your institution's brand guidelines!
]

== Mathematics

#slide[
  = Mathematical Expressions

  The theme works great with mathematical content:

  $ integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2 $

  $ sum_(n=1)^infinity 1/n^2 = pi^2/6 $

  $ lim_(x -> 0) (sin x)/x = 1 $
]

== Focus Slide

#focus-slide[
  *Important Message!*

  This is a focus slide.
]

== Lists and Structure

#slide[
  = Lists Work Great

  *Unordered lists:*
  - First item
  - Second item
    - Nested item
    - Another nested item
  - Third item

  *Ordered lists:*
  + First step
  + Second step
  + Third step
]

== Code

#slide[
  = Code Blocks

  The theme supports code highlighting:

  ```python
  def fibonacci(n):
      if n <= 1:
          return n
      return fibonacci(n-1) + fibonacci(n-2)

  print(fibonacci(10))
  ```
]

== Conclusion

#slide[
  = Summary

  Metropolyst provides:

  + Full font customization
  + Metropolis aesthetics
  + Easy configuration
  + Professional results

  *Try it today!*
]

#slide[
  = Thank You!

  Questions?

  #v(2em)

  #align(center)[
    #text(size: 1.5em)[🎉]
  ]
]
