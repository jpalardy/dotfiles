
#-------------------------------------------------
# manual colors
#-------------------------------------------------

colors = c("val1"="red", "val2"="darkgreen")
scale_color_manual(values=colors)

#-------------------------------------------------
# color brewer
#-------------------------------------------------

# https://colorbrewer2.org/
library(RColorBrewer)

# base plot...
col=brewer.pal(8, "Set3")

# show bunch of palettes
display.brewer.all()
# show specific palette
display.brewer.pal(5, "Greens")

# ggplot2
+ scale_color_brewer(palette="Greens")

#-------------------------------------------------
# hide legend for aes
#-------------------------------------------------

geom_point(.., show.legend=FALSE)

#-------------------------------------------------
# types of lines
#-------------------------------------------------

# http://www.cookbook-r.com/Graphs/Shapes_and_line_types/
linetype="dashed"

#-------------------------------------------------
# horizontal jitter (20%), no-vertical jitter
#-------------------------------------------------

geom_jitter(height=0, width=0.2, ...)

#-------------------------------------------------
# rotated x-axis labels
#-------------------------------------------------

theme(
  axis.text.x = element_text(angle=-90)
)

#-------------------------------------------------
# customized datetime x-axis
#-------------------------------------------------

scale_x_datetime(breaks=date_breaks("week"), labels=date_format("%m/%d"))

# details from: ?strptime
# %b / %B -- short/full month
# %F -- %Y-%m-%d
# %T -- %H:%M:%S

#-------------------------------------------------
# HTML table for tibbles
#-------------------------------------------------

library(kableExtra)

knitr::kable() %>%
kable_styling(bootstrap_options=c("striped", "hover"), full_width=FALSE, position="left")

#-------------------------------------------------
# ordered horizontal bar-charts
#-------------------------------------------------

d %>%
  count(whatever, sort=TRUE) %>%
  ggplot(aes(reorder(whatever, n), n)) +
  geom_col() +
  coord_flip() +
  NULL

#-------------------------------------------------
# alpha density
#-------------------------------------------------

d$density = fields::interp.surface(MASS::kde2d(d$date, d$duration),
                                   as.data.frame(d[,c("date","duration")]))

# alpha=1/density  ... or
# alpha=sqrt(1/density)

#-------------------------------------------------
# Rmd: asis block
#-------------------------------------------------

```{r, results="asis"}

cat("\n\n## ", header, "\n\n")

```

#-------------------------------------------------
# Rmd: section with tabs
#-------------------------------------------------

## Header {.tabset}
### Tab1
### Tab2
### Tab3

