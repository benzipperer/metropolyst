// Metropolyst Theme - Custom Configuration Example
// This example demonstrates ALL configuration options with explanations

#import "metropolyst.typ": *

#show: metropolyst-theme.with(
  // ============================================================
  // LAYOUT OPTIONS
  // ============================================================
  aspect-ratio: "16-9",           // Options: "16-9" (widescreen) or "4-3" (traditional)
  align: horizon,                  // Options: horizon (center), top, bottom
  footer-progress: true,           // Enable progress bar (default: false)

  // ============================================================
  // HEADER/FOOTER CONTENT
  // ============================================================
  // header: [Custom Header],      // Override automatic slide title
  // header-right: [Right Side],   // Override logo area
  footer: [Metropolyst Demo],      // Left footer content (default: none)
  // footer-right uses default slide counter "X / Y"

  // ============================================================
  // FONT CONFIGURATION
  // ============================================================
  // The "font" parameter sets the font for all elements (header, footer,
  // title, section, focus). Individual *-font parameters can override it.
  font: ("Libertinus Serif",),     // Cascades to all elements

  // Header configuration (font inherited from main font)
  header-size: 1.4em,              // Larger than default 1.2em
  header-weight: "bold",           // Bolder than default "regular"

  // Footer configuration (font inherited from main font)
  footer-size: 0.9em,              // Larger than default 0.6em
  footer-weight: "semibold",       // Bolder than default "regular"

  // Title slide configuration (font inherited from main font)
  title-size: 1.8em,               // Larger than default 1.4em
  title-weight: "bold",            // Bolder than default "regular"
  subtitle-size: 1.1em,            // Larger than default 1.0em
  subtitle-weight: "medium",       // Bolder than default "light"
  author-size: 0.9em,              // Slightly larger than default 0.8em
  author-weight: "medium",         // Bolder than default "light"
  date-size: 0.85em,               // Slightly larger than default 0.8em
  date-weight: "regular",          // Bolder than default "light"
  institution-size: 0.9em,         // Slightly larger than default 0.8em
  institution-weight: "medium",    // Bolder than default "light"
  extra-size: 0.85em,              // Slightly larger than default 0.8em
  extra-weight: "regular",         // Bolder than default "light"
  logo-size: 2.5em,                // Larger than default 2em

  // Section slides (font inherited from main font)
  section-size: 1.8em,             // Larger than default 1.4em
  section-weight: "bold",          // Bolder than default "regular"

  // Focus slides (font inherited from main font)
  focus-size: 2.0em,               // Larger than default 1.4em
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
  // Note: alert text (#alert[...]) uses accent-color; bold text inherits normal color
  header-background-color: rgb("#166534"),   // Dark green header background
  focus-background-color: rgb("#166534"),    // Dark green focus slide background

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

= Layout Configuration

== Layout Options

This presentation demonstrates custom layout settings:

#table(
  columns: (1fr, 1fr, 1fr),
  inset: 8pt,
  align: left,
  [*Option*], [*This Presentation*], [*Default*],
  [`aspect-ratio`], [`"16-9"`], [`"16-9"`],
  [`align`], [`horizon`], [`horizon`],
  [`footer-progress`], [`true`], [`false`],
  [`footer`], [`[Metropolyst Demo]`], [`none`],
)

The footer on the left shows custom content instead of being empty.

= Font Configuration

== Header & Footer Fonts

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

== Title Slide Fonts

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

== Section & Focus Slide Fonts

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

#focus-slide[
  Focus slides use custom size (2.0em) and weight (bold)
]

= Color Configuration

== Color System

Metropolyst has two types of configurable colors:

*Accent colors* — inherit from `accent-color` when `auto`:
- `hyperlink-color`, `line-separator-color`, `progress-bar-color`

*Background colors* — have independent defaults:
- `header-background-color` (dark teal \#23373b)
- `focus-background-color` (inherits from header background)

This presentation uses *blue* (\#2563eb) as the base accent.

== Color Options Demonstrated

Each accent element has a custom color:

#text(size: 0.75em)[
#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  inset: 6pt,
  align: left,
  [*Option*], [*Default*], [*This Presentation*], [*Where Used*],
  [`accent-color`], [#box(fill: rgb("#eb811b"), width: 1em, height: 1em) Orange], [#box(fill: rgb("#2563eb"), width: 1em, height: 1em) Blue], [Base color, alert],
  [`hyperlink-color`], [`auto`], [#box(fill: rgb("#7c3aed"), width: 1em, height: 1em) Purple], [Links],
  [`progress-bar-color`], [`auto`], [#box(fill: rgb("#10b981"), width: 1em, height: 1em) Green], [Progress bar],
  [`line-separator-color`], [`auto`], [#box(fill: rgb("#2563eb"), width: 1em, height: 1em) Blue], [Title line],
  [`header-background-color`], [#box(fill: rgb("#23373b"), width: 1em, height: 1em) Dark], [#box(fill: rgb("#166534"), width: 1em, height: 1em) Green], [Header],
  [`focus-background-color`], [`auto`], [#box(fill: rgb("#166534"), width: 1em, height: 1em) Green], [Focus slides],
)
]

== Color Examples in Action

*Hyperlinks* use purple: #link("https://typst.app")[Visit Typst]

*Bold text* is dark like normal text. #alert[Alert text] uses the accent color.

*Progress bar* at the bottom uses green with light green background.

The title slide's horizontal line uses blue (line-separator-color).

The *header* and *focus slides* use dark green backgrounds.

= All Font Options Reference

== Cascading Font System

Like `accent-color`, the `font` parameter cascades to all elements:

#text(size: 0.8em)[
#table(
  columns: (1fr, 1fr, 1fr),
  inset: 6pt,
  align: left,
  [*Parameter*], [*Default*], [*Description*],
  [`font`], [`("Fira Sans",)`], [Base font for all elements],
  [`header-font`], [`auto`], [Header font (defaults to `font`)],
  [`footer-font`], [`auto`], [Footer font (defaults to `font`)],
  [`title-font`], [`auto`], [Title slide font (defaults to `font`)],
  [`section-font`], [`auto`], [Section slide font (defaults to `font`)],
  [`focus-font`], [`auto`], [Focus slide font (defaults to `font`)],
)
]

Set `font` once to change all fonts, or override individual elements.

== Complete Font Options List

#text(size: 0.7em)[
#table(
  columns: (1fr, 1fr, 1fr),
  inset: 5pt,
  align: left,
  [*Parameter*], [*Default*], [*Description*],
  [`header-size`], [`1.2em`], [Header font size],
  [`header-weight`], [`"regular"`], [Header font weight],
  [`footer-size`], [`0.6em`], [Footer font size],
  [`footer-weight`], [`"regular"`], [Footer font weight],
  [`title-size`], [`1.4em`], [Title font size],
  [`title-weight`], [`"regular"`], [Title font weight],
  [`subtitle-size`], [`1.0em`], [Subtitle font size],
  [`subtitle-weight`], [`"light"`], [Subtitle font weight],
  [`author-size`], [`0.8em`], [Author font size],
  [`author-weight`], [`"light"`], [Author font weight],
)
]

== Complete Font Options (continued)

#text(size: 0.7em)[
#table(
  columns: (1fr, 1fr, 1fr),
  inset: 5pt,
  align: left,
  [*Parameter*], [*Default*], [*Description*],
  [`date-size`], [`0.8em`], [Date font size],
  [`date-weight`], [`"light"`], [Date font weight],
  [`institution-size`], [`0.8em`], [Institution font size],
  [`institution-weight`], [`"light"`], [Institution font weight],
  [`extra-size`], [`0.8em`], [Extra text font size],
  [`extra-weight`], [`"light"`], [Extra text font weight],
  [`logo-size`], [`2em`], [Logo size on title slide],
  [`section-size`], [`1.4em`], [Section font size],
  [`section-weight`], [`"regular"`], [Section font weight],
  [`focus-size`], [`1.4em`], [Focus font size],
  [`focus-weight`], [`"regular"`], [Focus font weight],
)
]

= Summary

== Configuration Summary

*Font options* (22 total):
- 1 cascading base font
- 5 element-specific font overrides
- 16 size/weight options

*Color options* (7 total):
- 1 base accent color
- 6 specific color overrides

*Layout options* (7 total):
- Aspect ratio, alignment, progress bar
- Header and footer content

#focus-slide[
  See README.md for complete documentation
]
