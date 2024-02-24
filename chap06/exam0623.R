alloy <- read.table("exam0623.data")
lm.sol <- lm(y ~ 1 + x + I(x^2), data = alloy)
summary(lm.sol)

xfit <- seq(37,43,len=200)
yfit <- predict(lm.sol, data.frame(x = xfit))
with(alloy,  plot(x, y, pch = 19, cex = 1.2, col = 4))
lines(xfit, yfit, lwd=2, col=2)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

savePlot("alloy", type = "eps")