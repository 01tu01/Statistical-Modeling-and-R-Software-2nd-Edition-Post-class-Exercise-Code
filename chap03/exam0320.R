X <- read.table("course.data"); source("outline.R")
win.graph(width = 8, height = 7)
par(mai=c(0.8, 0.8, 0.5, 0.1))
outline(X)

savePlot("course_star2", type = "bmp")

library(MASS)
par(mai=c(0.9, 0.2, 0.2, 0.1))
parcoord(X, col=1:12, var.label = TRUE)

par(mai=c(0, 0, 0, 0))
stars(X)

stars(X, full = FALSE, draw.segments = TRUE, 
      key.loc = c(5,0.5),  mar = c(2,0,0,0))

