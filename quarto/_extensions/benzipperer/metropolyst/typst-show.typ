// Metropolyst Quarto Extension - Show Rule
// Maps YAML front matter to metropolyst-theme parameters

#show: metropolyst-theme.with(
  // Layout
  $if(aspect-ratio)$
  aspect-ratio: "$aspect-ratio$",
  $endif$
  $if(footer-progress)$
  footer-progress: $footer-progress$,
  $endif$

  // Brand preset (applies preset defaults)
  $if(brand)$
  ..brands.$brand$,
  $endif$

  // Font configuration
  $if(font)$
  font: ("$font$",),
  $endif$
  $if(header-font)$
  header-font: ("$header-font$",),
  $endif$
  $if(header-size)$
  header-size: $header-size$,
  $endif$
  $if(header-weight)$
  header-weight: "$header-weight$",
  $endif$
  $if(footer-font)$
  footer-font: ("$footer-font$",),
  $endif$
  $if(footer-size)$
  footer-size: $footer-size$,
  $endif$
  $if(footer-weight)$
  footer-weight: "$footer-weight$",
  $endif$
  $if(title-font)$
  title-font: ("$title-font$",),
  $endif$
  $if(title-size)$
  title-size: $title-size$,
  $endif$
  $if(title-weight)$
  title-weight: "$title-weight$",
  $endif$
  $if(section-font)$
  section-font: ("$section-font$",),
  $endif$
  $if(section-size)$
  section-size: $section-size$,
  $endif$
  $if(section-weight)$
  section-weight: "$section-weight$",
  $endif$
  $if(focus-font)$
  focus-font: ("$focus-font$",),
  $endif$
  $if(focus-size)$
  focus-size: $focus-size$,
  $endif$
  $if(focus-weight)$
  focus-weight: "$focus-weight$",
  $endif$

  // Accent colors
  $if(accent-color)$
  accent-color: rgb("$accent-color$"),
  $endif$
  $if(hyperlink-color)$
  hyperlink-color: rgb("$hyperlink-color$"),
  $endif$
  $if(line-separator-color)$
  line-separator-color: rgb("$line-separator-color$"),
  $endif$
  $if(progress-bar-color)$
  progress-bar-color: rgb("$progress-bar-color$"),
  $endif$
  $if(progress-bar-background)$
  progress-bar-background: rgb("$progress-bar-background$"),
  $endif$

  // Background and text colors
  $if(header-background-color)$
  header-background-color: rgb("$header-background-color$"),
  $endif$
  $if(focus-background-color)$
  focus-background-color: rgb("$focus-background-color$"),
  $endif$
  $if(main-background-color)$
  main-background-color: rgb("$main-background-color$"),
  $endif$
  $if(main-text-color)$
  main-text-color: rgb("$main-text-color$"),
  $endif$
  $if(header-text-color)$
  header-text-color: rgb("$header-text-color$"),
  $endif$
  $if(focus-text-color)$
  focus-text-color: rgb("$focus-text-color$"),
  $endif$
  $if(footer-text-color)$
  footer-text-color: rgb("$footer-text-color$"),
  $endif$

  // Footer content
  $if(footer)$
  footer: [$footer$],
  $endif$
  $if(footer-right)$
  footer-right: [$footer-right$],
  $endif$

  // Presentation info
  config-info(
    $if(title)$
    title: [$title$],
    $endif$
    $if(subtitle)$
    subtitle: [$subtitle$],
    $endif$
    $if(author)$
    author: [$for(author)$$author$$sep$, $endfor$],
    $endif$
    $if(date)$
    date: [$date$],
    $endif$
    $if(institute)$
    institution: [$institute$],
    $endif$
    $if(logo)$
    logo: image("$logo$"),
    $endif$
  ),
)

// Generate title slide automatically if metadata is present
$if(title)$
#title-slide()
$endif$
