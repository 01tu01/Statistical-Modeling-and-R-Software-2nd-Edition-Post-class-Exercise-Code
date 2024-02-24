x <- y <- seq(-2*pi, 2*pi, pi/15)
f <- function(x,y) sin(x)*sin(y)
z <- outer(x, y, f)

win.graph(width = 8, height = 7)
par(mai=c(0.8, 0.8, 0.1, 0.1))
contour(x, y, z, col = "blue", xlab = "x", ylab = "y")

par(mai=c(0, 0, 0, 0))
persp(x, y, z, theta=30, phi=30, expand=0.7, col="lightblue")

savePlot("persp2", type = "eps")
savePlot("contour2", type = "eps")