rt <- read.table("exam1010.data"); rt
source("GHbiplot.R")
win.graph(width=8, height=7)
GHbiplot(rt, cor = TRUE, cex=.7)

savePlot("exam1012", type = "bmp")
