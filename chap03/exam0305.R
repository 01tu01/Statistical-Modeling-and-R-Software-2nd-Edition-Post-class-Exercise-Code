win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.5, 0.1))
w <- scan("exam0301.data")
hist(w, freq = FALSE)
lines(density(w), col = "blue", lwd = 2)
x <- 44:76
lines(x, dnorm(x, mean(w), sd(w)), col = "red", lwd = 2)

savePlot("data_hist", type = "eps")