win.graph(width=8, height=6)
par(mai=c(0.1, 0.6, 0.1, 0.1))
x <- scan("exam0308.data")
boxplot(x)

savePlot("data_boxplot", type = "eps")