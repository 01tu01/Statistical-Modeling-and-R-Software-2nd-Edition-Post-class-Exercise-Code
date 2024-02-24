n <- 30
x <- runif(n, 0, 10)
y <- 5 + 2*x + rnorm(n)
win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))
plot(x, y)

savePlot("example", type = "eps")