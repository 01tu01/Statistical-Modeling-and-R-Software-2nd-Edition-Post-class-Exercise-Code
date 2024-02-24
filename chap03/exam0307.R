win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.5, 0.1))
w <- scan("exam0301.data")
qqnorm(w); qqline(w)

savePlot("data_qq", type = "eps")