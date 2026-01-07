here::i_am("scripts/example_figures.R")
library(tidyverse)
library(here)

data = read_csv(here("scripts", "productivity_pay.csv"), show_col_types = F) |>
  rename(prod = 2, comp = 3) |>
  pivot_longer(-date)

colors = c(
  "prod" = "#e63946",
  "comp" = "#1372ae"
)

theme_options = theme(
  legend.position = "none",
  text = element_text(family = "Roboto"),
  plot.title.position = "plot",
  plot.caption.position = "plot",
  panel.grid.major.x = element_blank(),
  panel.grid.minor.x = element_blank(),
  panel.grid.minor.y = element_blank()
)

main_plot = data |>
  ggplot(aes(x = date, y = value, color = name)) +
  geom_line() +
  labs(
    x = NULL,
    y = NULL,
    title = "Productivity and pay since 1948",
    souce = "EPI State of Working America Data Library"
  ) +
  scale_color_manual(values = colors) +
  theme_minimal()

main_plot_white = main_plot +
  theme_minimal() +
  theme_options

main_plot_white |>
  ggsave(
    filename = here("examples", "example_figure_white.png"),
    width = 1600,
    height = 900,
    units = "px"
  )

main_plot_light = main_plot +
  theme_minimal(paper = "#fafafa") +
  theme_options

main_plot_light |>
  ggsave(
    filename = here("examples", "example_figure_light.png"),
    width = 1600,
    height = 900,
    units = "px"
  )
