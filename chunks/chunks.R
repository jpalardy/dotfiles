library(tidyverse)
theme_set(theme_bw())

# scatter
d |>
  ggplot(aes(x, y)) +
  geom_point(alpha = 0.7, size = 3, stroke = 0, color = "#0367a6") +
  NULL
