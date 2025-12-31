// Metropolyst Theme - Custom Configuration Example
// This example demonstrates ALL configuration options with explanations

#import "metropolyst.typ": *

#show: metropolyst-theme.with(
  // ============================================================
  // LAYOUT OPTIONS
  // ============================================================
  aspect-ratio: "16-9",           // Options: "16-9" (widescreen) or "4-3" (traditional)
  align: horizon,                  // Options: horizon (center), top, bottom
  footer-progress: true,           // Show progress bar at bottom of slides

  // ============================================================
  // HEADER/FOOTER CONTENT
  // ============================================================
  // header: [Custom Header],      // Override automatic slide title
  // header-right: [Right Side],   // Override logo area
  footer: [Metropolyst Demo],      // Left footer content (default: none)
  // footer-right uses default slide counter "X / Y"

  // ============================================================
  // FONT CONFIGURATION - Header & Footer
  // ============================================================
  header-font: ("Libertinus Serif",),     // Font family for slide headers
  header-size: 1.4em,              // Larger than default 1.2em
  header-weight: "bold",           // Bolder than default "medium"

  footer-font: ("Libertinus Serif",),     // Font family for footer
  footer-size: 0.9em,              // Larger than default 0.8em
  footer-weight: "semibold",       // Bolder than default "regular"

  // ============================================================
  // FONT CONFIGURATION - Title Slide
  // ============================================================
  title-font: ("Libertinus Serif",),      // Font family for presentation title
  title-size: 1.8em,               // Larger than default 1.3em
  title-weight: "bold",            // Bolder than default "medium"

  subtitle-size: 1.1em,            // Larger than default 0.9em
  subtitle-weight: "medium",       // Bolder than default "regular"

  author-size: 0.9em,              // Slightly larger than default 0.8em
  author-weight: "medium",         // Bolder than default "regular"

  date-size: 0.85em,               // Slightly larger than default 0.8em
  date-weight: "regular",          // Same as default

  institution-size: 0.9em,         // Slightly larger than default 0.8em
  institution-weight: "medium",    // Bolder than default "regular"

  extra-size: 0.85em,              // Slightly larger than default 0.8em
  extra-weight: "regular",         // Same as default

  logo-size: 2.5em,                // Larger than default 2em

  // ============================================================
  // FONT CONFIGURATION - Section & Focus Slides
  // ============================================================
  section-font: ("Libertinus Serif",),    // Font family for section slides
  section-size: 1.8em,             // Larger than default 1.5em
  section-weight: "bold",          // Bolder than default "regular"

  focus-font: ("Libertinus Serif",),      // Font family for focus slides
  focus-size: 2.0em,               // Larger than default 1.5em
  focus-weight: "bold",            // Bolder than default "regular"

  // ============================================================
  // COLOR CONFIGURATION
  // ============================================================
  // The accent-color is the base; other colors default to it when set to "auto"
  accent-color: rgb("#2563eb"),              // Blue (default: #eb811b orange)

  // These override accent-color for specific elements:
  hyperlink-color: rgb("#7c3aed"),           // Purple for links (default: auto)
  line-separator-color: rgb("#2563eb"),      // Blue separator (default: auto)
  progress-bar-color: rgb("#10b981"),        // Green progress bar (default: auto)
  progress-bar-background: rgb("#d1fae5"),   // Light green background (default: #d6c6b7)
  alert-color: rgb("#ef4444"),               // Red for alerts (default: auto)

  // ============================================================
  // PRESENTATION INFO
  // ============================================================
  config-info(
    title: [Custom Configuration Demo],
    subtitle: [Demonstrating All Options],
    author: [Theme Developer],
    date: datetime.today(),
    institution: [Metropolyst Project],
    logo: emoji.palette,
  ),
)

#set text(font: "Libertinus Serif", weight: "regular", size: 20pt)
#set strong(delta: 400)
#set par(justify: true)

// ============================================================
// SLIDES BEGIN
// ============================================================

#title-slide(extra: [Extra text appears here with custom size/weight])

== Layout Configuration

#slide[
  = Layout Options

  This presentation demonstrates custom layout settings:

  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 8pt,
    align: left,
    [*Option*], [*This Presentation*], [*Default*],
    [`aspect-ratio`], [`"16-9"`], [`"16-9"`],
    [`align`], [`horizon`], [`horizon`],
    [`footer-progress`], [`true`], [`true`],
    [`footer`], [`[Metropolyst Demo]`], [`none`],
  )

  The footer on the left shows custom content instead of being empty.
]

== Font Configuration

#slide[
  = Header & Footer Fonts

  Notice the header above is *larger and bolder* than default:

  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 8pt,
    align: left,
    [*Option*], [*This Presentation*], [*Default*],
    [`header-size`], [`1.4em`], [`1.2em`],
    [`header-weight`], [`"bold"`], [`"medium"`],
    [`footer-size`], [`0.9em`], [`0.8em`],
    [`footer-weight`], [`"medium"`], [`"regular"`],
  )

  Look at the footer below to see the difference!
]

#slide[
  = Title Slide Fonts

  The title slide uses custom typography:

  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 8pt,
    align: left,
    [*Option*], [*This Presentation*], [*Default*],
    [`title-size`], [`1.8em`], [`1.3em`],
    [`title-weight`], [`"bold"`], [`"medium"`],
    [`subtitle-size`], [`1.1em`], [`0.9em`],
    [`subtitle-weight`], [`"medium"`], [`"regular"`],
    [`author-size`], [`0.9em`], [`0.8em`],
    [`logo-size`], [`2.5em`], [`2em`],
  )
]

#slide[
  = Section & Focus Slide Fonts

  Section dividers (like the one before this slide) use:

  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 8pt,
    align: left,
    [*Option*], [*This Presentation*], [*Default*],
    [`section-size`], [`1.8em`], [`1.5em`],
    [`section-weight`], [`"bold"`], [`"regular"`],
    [`focus-size`], [`2.0em`], [`1.5em`],
    [`focus-weight`], [`"bold"`], [`"regular"`],
  )

  The next slide is a focus slide demonstrating these settings.
]

#focus-slide[
  Focus slides use custom size (2.0em) and weight (bold)
]

== Color Configuration

#slide[
  = Accent Color System

  Metropolyst uses a *cascading color system*:

  + Set `accent-color` as the base color
  + Other options default to `auto` (inherit from accent-color)
  + Override specific options for different colors

  This presentation uses *blue* as the base accent (\#2563eb).
]

#slide[
  = Color Options Demonstrated

  Each accent element has a custom color:

  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 8pt,
    align: left,
    [*Option*], [*Color*], [*Where Used*],
    [`accent-color`], [#box(fill: rgb("#2563eb"), width: 1em, height: 1em) Blue], [Base color],
    [`hyperlink-color`], [#box(fill: rgb("#7c3aed"), width: 1em, height: 1em) Purple], [Links],
    [`progress-bar-color`], [#box(fill: rgb("#10b981"), width: 1em, height: 1em) Green], [Progress bar],
    [`alert-color`], [#box(fill: rgb("#ef4444"), width: 1em, height: 1em) Red], [Alert text],
    [`line-separator-color`], [#box(fill: rgb("#2563eb"), width: 1em, height: 1em) Blue], [Title slide line],
  )
]

#slide[
  = Color Examples in Action

  *Hyperlinks* use purple: #link("https://typst.app")[Visit Typst]

  *Alert text* uses red: #alert[This is important!]

  *Progress bar* at the bottom uses green with light green background.

  The title slide's horizontal line uses blue (line-separator-color).
]

== All Font Options Reference

#slide[
  = Complete Font Options List

  #text(size: 0.7em)[
  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 5pt,
    align: left,
    [*Parameter*], [*Default*], [*Description*],
    [`header-font`], [`("Fira Sans",)`], [Header font family],
    [`header-size`], [`1.2em`], [Header font size],
    [`header-weight`], [`"medium"`], [Header font weight],
    [`footer-font`], [`("Fira Sans",)`], [Footer font family],
    [`footer-size`], [`0.8em`], [Footer font size],
    [`footer-weight`], [`"regular"`], [Footer font weight],
    [`title-font`], [`("Fira Sans",)`], [Title slide title font],
    [`title-size`], [`1.3em`], [Title font size],
    [`title-weight`], [`"medium"`], [Title font weight],
    [`subtitle-size`], [`0.9em`], [Subtitle font size],
    [`subtitle-weight`], [`"regular"`], [Subtitle font weight],
  )
  ]
]

#slide[
  = Complete Font Options (continued)

  #text(size: 0.7em)[
  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 5pt,
    align: left,
    [*Parameter*], [*Default*], [*Description*],
    [`author-size`], [`0.8em`], [Author font size],
    [`author-weight`], [`"regular"`], [Author font weight],
    [`date-size`], [`0.8em`], [Date font size],
    [`date-weight`], [`"regular"`], [Date font weight],
    [`institution-size`], [`0.8em`], [Institution font size],
    [`institution-weight`], [`"regular"`], [Institution font weight],
    [`extra-size`], [`0.8em`], [Extra text font size],
    [`extra-weight`], [`"regular"`], [Extra text font weight],
    [`logo-size`], [`2em`], [Logo size on title slide],
    [`section-font`], [`("Fira Sans",)`], [Section slide font],
    [`section-size`], [`1.5em`], [Section font size],
    [`section-weight`], [`"regular"`], [Section font weight],
    [`focus-font`], [`("Fira Sans",)`], [Focus slide font],
    [`focus-size`], [`1.5em`], [Focus font size],
    [`focus-weight`], [`"regular"`], [Focus font weight],
  )
  ]
]

== Summary

#slide[
  = Configuration Summary

  *Font options* (26 total):
  - 6 for header/footer
  - 13 for title slide elements
  - 7 for section/focus slides

  *Color options* (6 total):
  - 1 base accent color
  - 5 specific color overrides

  *Layout options* (7 total):
  - Aspect ratio, alignment, progress bar
  - Header and footer content
]

#focus-slide[
  See README.md for complete documentation
]
