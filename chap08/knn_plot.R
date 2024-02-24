rt <- read.table("exam0801.data")
X <- rt[ ,1:2]; G <- rt[ ,3]; Tst <- c(23.5, -1.6)

g <- levels(G); 
win.graph(width=11, height=7)
par(mai=c(0.8, 0.8, 0.1, 0.1))
plot(rbind(X, Tst), t = "n", ylim = c(-3.5, 0), 
     xlab = "Frist Component", ylab = "Second Component")

points(X[G==g[1], ], pch = 23, cex = 1.1, col = "blue", bg = "blue")
points(X[G==g[2], ], pch = 22, cex = 1.1, col = "red", bg = "red")

text(21.8, -1.2, label = g[1], cex = 1.4)
text(25, -2.4, label = g[2], cex = 1.4)

x0 <- Tst[1]; y0 <- Tst[2]
points(x0, y0, pch = 19, cex = 1.2, col = "brown")

R <- 1.4 
t <- seq(0, 2*pi, length = 100)
x <- x0 + R *cos(t)
y <- y0 + R *sin(t)
lines(x,y, col=4)

R <- 0.9 
lines(x,y, col=2)

savePlot("knnPlot", type="eps")
