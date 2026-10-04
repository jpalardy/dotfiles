suppressPackageStartupMessages(library(tidyverse))
theme_set(theme_bw())

# -------------------------------------------------
# compositing graphs
# -------------------------------------------------

library(gridExtra)

list(p1, p2) |> grid.arrange(grobs = _, ncol = 1)
