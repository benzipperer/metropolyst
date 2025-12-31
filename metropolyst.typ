// Metropolyst Theme - A highly configurable variant of the Metropolis theme
// Inspired by https://github.com/matze/mtheme and the Touying Metropolis theme
// Unlike Metropolis, this theme exposes all font properties as configuration options

#import "@preview/touying:0.5.3": *

/// Default slide function for the presentation.
///
/// - title (string): The title of the slide. Default is `auto`.
///
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For several configurations, you can use `utils.merge-dicts` to merge them.
///
/// - repeat (int, string): The number of subslides. Default is `auto`, which means touying will automatically calculate the number of subslides.
///
/// The `repeat` argument is necessary when you use `#slide(repeat: 3, self => [ .. ])` style code to create a slide. The callback-style `uncover` and `only` cannot be detected by touying automatically.
///
/// - setting (function): The setting of the slide. You can use it to add some set/show rules for the slide.
///
/// - composer (function, array): The composer of the slide. You can use it to set the layout of the slide.
///
/// For example, `#slide(composer: (1fr, 2fr, 1fr))[A][B][C]` to split the slide into three parts. The first and the last parts will take 1/4 of the slide, and the second part will take 1/2 of the slide.
///
/// If you pass a non-function value like `(1fr, 2fr, 1fr)`, it will be assumed to be the first argument of the `components.side-by-side` function.
///
/// The `components.side-by-side` function is a simple wrapper of the `grid` function. It means you can use the `grid.cell(colspan: 2, ..)` to make the cell take 2 columns.
///
/// For example, `#slide(composer: 2)[A][B][#grid.cell(colspan: 2)[Footer]]` will make the `Footer` cell take 2 columns.
///
/// If you want to customize the composer, you can pass a function to the `composer` argument. The function should receive the contents of the slide and return the content of the slide, like `#slide(composer: grid.with(columns: 2))[A][B]`.
///
/// - bodies (array): The contents of the slide. You can call the `slide` function with syntax like `#slide[A][B][C]` to create a slide.
#let slide(
  title: auto,
  align: auto,
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(fill: self.colors.secondary, inset: (top: 1.2em, bottom: 1.2em, x: 1em))
    set std.align(horizon)
    set text(
      fill: self.colors.neutral-lightest,
      weight: self.store.header-weight,
      size: self.store.header-size,
      font: self.store.header-font,
    )
    components.left-and-right(
      {
        if title != auto {
          utils.fit-to-width(grow: false, 100%, title)
        } else {
          utils.call-or-display(self, self.store.header)
        }
      },
      utils.call-or-display(self, self.store.header-right),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    set text(
      size: self.store.footer-size,
      font: self.store.footer-font,
      weight: self.store.footer-weight,
    )
    pad(
      .5em,
      components.left-and-right(
        text(
          fill: self.colors.neutral-darkest.lighten(40%),
          utils.call-or-display(self, self.store.footer),
        ),
        text(fill: self.colors.neutral-darkest, utils.call-or-display(
          self,
          self.store.footer-right,
        )),
      ),
    )
    if self.store.footer-progress {
      place(bottom, components.progress-bar(
        height: 2pt,
        self.store.progress-bar-color,
        self.store.progress-bar-background,
      ))
    }
  }
  let self = utils.merge-dicts(
    self,
    config-page(
      fill: self.colors.neutral-lightest,
      header: header,
      footer: footer,
    ),
  )
  let new-setting = body => {
    show: std.align.with(self.store.align)
    set text(fill: self.colors.neutral-darkest)
    // Hide slide title headings in body (they appear in the header)
    show heading.where(level: 1): none
    show: setting
    body
  }
  touying-slide(
    self: self,
    config: config,
    repeat: repeat,
    setting: new-setting,
    composer: composer,
    ..bodies,
  )
})


/// Title slide for the presentation. You should update the information in the `config-info` function. You can also pass the information directly to the `title-slide` function.
///
/// Example:
///
/// ```typst
/// #show: metropolyst-theme.with(
/// config-info(
/// title: [Title],
/// logo: emoji.city,
/// ),
/// )
///
/// #title-slide(subtitle: [Subtitle], extra: [Extra information])
/// ```
///
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For several configurations, you can use `utils.merge-dicts` to merge them.
///
/// - extra (string, none): The extra information you want to display on the title slide.
#let title-slide(
  config: (:),
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config,
    config-common(freeze-slide-counter: true),
    config-page(fill: self.colors.neutral-lightest),
  )
  let info = self.info + args.named()
  let body = {
    set text(
      fill: self.colors.neutral-darkest,
      font: self.store.title-font,
    )
    set std.align(horizon)
    block(
      width: 100%,
      inset: 2em,
      {
        components.left-and-right(
          {
            text(
              size: self.store.title-size,
              weight: self.store.title-weight,
              info.title,
            )
            if info.subtitle != none {
              // Tight spacing between title and subtitle (like original Metropolis)
              v(-0.4em)
              text(
                size: self.store.subtitle-size,
                weight: self.store.subtitle-weight,
                info.subtitle,
              )
            }
          },
          text(
            size: self.store.logo-size,
            utils.call-or-display(self, info.logo),
          ),
        )
        // Spacing before separator line
        v(0.8em)
        line(length: 100%, stroke: 0.4pt + self.store.line-separator-color)
        set text(
          size: self.store.author-size,
          weight: self.store.author-weight,
        )
        // Spacing matched to original Metropolis
        if info.author != none {
          block(above: 2.5em, below: 0em, info.author)
        }
        if info.date != none {
          block(
            above: 1.0em,
            below: 0em,
            text(
              size: self.store.date-size,
              weight: self.store.date-weight,
              utils.display-info-date(self),
            ),
          )
        }
        if info.institution != none {
          block(
            above: 1.4em,
            below: 0em,
            text(
              size: self.store.institution-size,
              weight: self.store.institution-weight,
              info.institution,
            ),
          )
        }
        if extra != none {
          block(
            above: 1.0em,
            below: 0em,
            text(
              size: self.store.extra-size,
              weight: self.store.extra-weight,
              extra,
            ),
          )
        }
      },
    )
  }
  touying-slide(self: self, body)
})


/// New section slide for the presentation. You can update it by updating the `new-section-slide-fn` argument for `config-common` function.
///
/// Example: `config-common(new-section-slide-fn: new-section-slide.with(numbered: false))`
///
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For several configurations, you can use `utils.merge-dicts` to merge them.
///
/// - level (int): The level of the heading.
///
/// - numbered (boolean): Indicates whether the heading is numbered.
///
/// - body (auto): The body of the section. It will be passed by touying automatically.
#let new-section-slide(
  config: (:),
  level: 1,
  numbered: true,
  body,
) = touying-slide-wrapper(self => {
  let slide-body = {
    set std.align(horizon)
    show: pad.with(20%)
    set text(
      size: self.store.section-size,
      font: self.store.section-font,
      weight: self.store.section-weight,
    )
    stack(
      dir: ttb,
      spacing: 1em,
      text(self.colors.neutral-darkest, utils.display-current-heading(
        level: level,
        numbered: numbered,
        style: auto,
      )),
      block(
        height: 2pt,
        width: 100%,
        spacing: 0pt,
        components.progress-bar(
          height: 2pt,
          self.store.progress-bar-color,
          self.store.progress-bar-background,
        ),
      ),
    )
    text(self.colors.neutral-dark, body)
  }
  self = utils.merge-dicts(
    self,
    config-page(fill: self.colors.neutral-lightest),
  )
  touying-slide(self: self, config: config, slide-body)
})


/// Focus on some content.
///
/// Example: `#focus-slide[Wake up!]`
///
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For several configurations, you can use `utils.merge-dicts` to merge them.
///
/// - align (alignment): The alignment of the content. Default is `horizon + center`.
#let focus-slide(
  config: (:),
  align: horizon + center,
  body,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(fill: self.colors.neutral-dark, margin: 2em),
  )
  set text(
    fill: self.colors.neutral-lightest,
    size: self.store.focus-size,
    font: self.store.focus-font,
    weight: self.store.focus-weight,
  )
  touying-slide(self: self, config: config, std.align(align, body))
})


/// Touying metropolyst theme - A highly configurable variant of Metropolis.
///
/// Example:
///
/// ```typst
/// #show: metropolyst-theme.with(
///   aspect-ratio: "16-9",
///   header-size: 1.5em,
///   header-weight: "bold",
///   // Change the accent color for the whole theme
///   accent-color: rgb("#0077b6"),
/// )
/// ```
///
/// Example with individual accent color overrides:
///
/// ```typst
/// #show: metropolyst-theme.with(
///   aspect-ratio: "16-9",
///   // Set main accent color (affects all accent elements by default)
///   accent-color: rgb("#e63946"),
///   // Override specific accent color uses
///   hyperlink-color: rgb("#0077b6"),  // Blue links
///   line-separator-color: rgb("#2a9d8f"),  // Teal separator
/// )
/// ```
///
/// Consider using:
///
/// ```typst
/// #set text(font: "Fira Sans", weight: "light", size: 20pt)
/// #show math.equation: set text(font: "Fira Math")
/// #set strong(delta: 100)
/// #set par(justify: true)
/// ```
///
/// The default colors (can be overridden with config-colors):
///
/// ```typ
/// config-colors(
///   primary: rgb("#eb811b"),       // Set by accent-color
///   primary-light: rgb("#d6c6b7"), // Set by progress-bar-background
///   secondary: rgb("#23373b"),
///   neutral-lightest: rgb("#fafafa"),
///   neutral-dark: rgb("#23373b"),
///   neutral-darkest: rgb("#23373b"),
/// )
/// ```
///
/// Font configuration parameters:
/// - header-font, header-size, header-weight: Controls slide header appearance
/// - footer-font, footer-size, footer-weight: Controls footer appearance
/// - title-font, title-size, title-weight: Controls main title on title slide
/// - subtitle-size, subtitle-weight: Controls subtitle on title slide
/// - author-size, author-weight: Controls author text
/// - date-size, date-weight: Controls date text
/// - institution-size, institution-weight: Controls institution text
/// - extra-size, extra-weight: Controls extra text on title slide
/// - logo-size: Controls logo size on title slide
/// - section-font, section-size, section-weight: Controls section slide text
/// - focus-font, focus-size, focus-weight: Controls focus slide text
///
/// Accent color configuration:
/// - accent-color: Main accent color used throughout the theme (default: orange #eb811b)
///   This serves as the default for all other accent color options below
/// - hyperlink-color: Color for hyperlinks (defaults to accent-color)
/// - line-separator-color: Color for line separators like on the title slide (defaults to accent-color)
/// - progress-bar-color: Color for progress bars in footer and section slides (defaults to accent-color)
/// - progress-bar-background: Background color for progress bars (default: #d6c6b7)
/// - alert-color: Color for alert/emphasized text via the alert function (defaults to accent-color)
///
/// - aspect-ratio (string): The aspect ratio of the slides. Default is `16-9`.
///
/// - align (alignment): The alignment of the content. Default is `horizon`.
///
/// - header (content, function): The header of the slide. Default is `self => utils.display-current-heading(setting: utils.fit-to-width.with(grow: false, 100%), depth: self.slide-level)`.
///
/// - header-right (content, function): The right part of the header. Default is `self => self.info.logo`.
///
/// - footer (content, function): The footer of the slide. Default is `none`.
///
/// - footer-right (content, function): The right part of the footer. Default is `context utils.slide-counter.display() + " / " + utils.last-slide-number`.
///
/// - footer-progress (boolean): Whether to show the progress bar in the footer. Default is `true`.
#let metropolyst-theme(
  aspect-ratio: "16-9",
  align: horizon,
  header: self => utils.display-current-heading(
    setting: utils.fit-to-width.with(grow: false, 100%),
    depth: self.slide-level,
  ),
  header-right: self => self.info.logo,
  footer: none,
  footer-right: context utils.slide-counter.display()
    + " / "
    + utils.last-slide-number,
  footer-progress: true,
  // Font configuration options - matched to original Metropolis beamer theme
  // Frame titles use \large size (1.2x \normalsize), regular weight
  header-font: ("Fira Sans",),
  header-size: 1.2em,
  header-weight: "regular",
  // Footer uses \scriptsize
  footer-font: ("Fira Sans",),
  footer-size: 0.6em,
  footer-weight: "regular",
  // Title slide uses \Large for title, \large for subtitle
  title-font: ("Fira Sans",),
  title-size: 1.4em,
  title-weight: "regular",
  subtitle-size: 1.0em,
  subtitle-weight: "light",
  // Author/date/institution use \small with light weight
  author-size: 0.8em,
  author-weight: "light",
  date-size: 0.8em,
  date-weight: "light",
  institution-size: 0.8em,
  institution-weight: "light",
  extra-size: 0.8em,
  extra-weight: "light",
  logo-size: 2em,
  // Section pages use \Large
  section-font: ("Fira Sans",),
  section-size: 1.4em,
  section-weight: "regular",
  // Focus/standout slides use \Large
  focus-font: ("Fira Sans",),
  focus-size: 1.4em,
  focus-weight: "regular",
  // Accent color configuration
  accent-color: rgb("#eb811b"),
  hyperlink-color: auto,
  line-separator-color: auto,
  progress-bar-color: auto,
  progress-bar-background: rgb("#d6c6b7"),
  alert-color: auto,
  ..args,
  body,
) = {
  // Resolve auto values for accent colors
  let resolved-hyperlink-color = if hyperlink-color == auto { accent-color } else { hyperlink-color }
  let resolved-line-separator-color = if line-separator-color == auto { accent-color } else { line-separator-color }
  let resolved-progress-bar-color = if progress-bar-color == auto { accent-color } else { progress-bar-color }
  let resolved-alert-color = if alert-color == auto { accent-color } else { alert-color }
  set text(size: 20pt, font: "Fira Sans")

  // Style hyperlinks with configurable color
  show link: it => text(fill: resolved-hyperlink-color, it)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      margin: (top: 3.8em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      alert: (self: none, it) => text(fill: self.store.alert-color, it),
    ),
    config-colors(
      primary: accent-color,
      primary-light: progress-bar-background,
      secondary: rgb("#23373b"),
      neutral-lightest: rgb("#fafafa"),
      neutral-dark: rgb("#23373b"),
      neutral-darkest: rgb("#23373b"),
    ),
    // save the variables for later use
    config-store(
      align: align,
      header: header,
      header-right: header-right,
      footer: footer,
      footer-right: footer-right,
      footer-progress: footer-progress,
      // Accent color configuration
      hyperlink-color: resolved-hyperlink-color,
      line-separator-color: resolved-line-separator-color,
      progress-bar-color: resolved-progress-bar-color,
      progress-bar-background: progress-bar-background,
      alert-color: resolved-alert-color,
      // Store font configuration
      header-font: header-font,
      header-size: header-size,
      header-weight: header-weight,
      footer-font: footer-font,
      footer-size: footer-size,
      footer-weight: footer-weight,
      title-font: title-font,
      title-size: title-size,
      title-weight: title-weight,
      subtitle-size: subtitle-size,
      subtitle-weight: subtitle-weight,
      author-size: author-size,
      author-weight: author-weight,
      date-size: date-size,
      date-weight: date-weight,
      institution-size: institution-size,
      institution-weight: institution-weight,
      extra-size: extra-size,
      extra-weight: extra-weight,
      logo-size: logo-size,
      section-font: section-font,
      section-size: section-size,
      section-weight: section-weight,
      focus-font: focus-font,
      focus-size: focus-size,
      focus-weight: focus-weight,
    ),
    ..args,
  )

  body
}
