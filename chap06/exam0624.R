alloy <- read.table("exam0623.data")
z <- poly(alloy$x, degree = 2)
xfit <- seq(from = 37, to = 43, length = 200)
zfit <- predict(z, xfit)

alloy$z1 <- z[,1]; alloy$z2 <- z[,2]
lm.pol <- lm(y ~ 1 + z1 + z2, data = alloy)
summary(lm.pol)
yfit <- predict(lm.pol, data.frame(z1 = zfit[,1], z2 = zfit[,2]))

with(alloy,  plot(x, y, pch = 19, cex = 1.2, col = 4))
lines(xfit, yfit, lwd=2, col=2)

lm.pol <- lm(y ~ 1 + poly(x,2), data = alloy)
summary(lm.pol)

xfit <- seq(37, 43, len = 200)
yfit <- predict(lm.pol, data.frame(x = xfit))

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

