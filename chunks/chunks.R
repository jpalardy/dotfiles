library(tidyverse)
theme_set(theme_bw())

# -------------------------------------------------
# scatter
# -------------------------------------------------

d |>
  ggplot(aes(x, y)) +
  geom_point(alpha = 0.7, size = 3, stroke = 0, color = "#0367a6") +
  NULL

# -------------------------------------------------
# density
# -------------------------------------------------

d |>
  ggplot(aes(x)) +
  geom_density(alpha = 0.5, fill = "#0367a6") +
  NULL

# -------------------------------------------------
# compositing graphs
# -------------------------------------------------

library(gridExtra)

list(p1, p2) |> grid.arrange(grobs = _, ncol = 1)
