win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.5, 0.1))
w <- scan("exam0301.data")
plot(ecdf(w), verticals = TRUE, do.p = FALSE)
x <- 44:78
lines(x, pnorm(x, mean(w), sd(w)), col = "blue")

savePlot("data_ecdf", type = "eps")