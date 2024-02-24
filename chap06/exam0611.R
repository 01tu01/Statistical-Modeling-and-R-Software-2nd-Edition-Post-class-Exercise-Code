summary(lm(y1 ~ x1, data = anscombe))
summary(lm(y2 ~ x2, data = anscombe))
summary(lm(y3 ~ x3, data = anscombe))
summary(lm(y4 ~ x4, data = anscombe))

attach(anscombe)
win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))
plot(x1, y1,  pch = 19, cex = 1.2, col = 4)
abline(lm(y1 ~ x1, data = anscombe), lwd = 2, col = 2)

plot(x2, y2,  pch = 19, cex = 1.2, col = 4)
abline(lm(y2 ~ x2, data = anscombe), lwd = 2, col = 2)

plot(x3, y3,  pch = 19, cex = 1.2, col = 4)
abline(lm(y3 ~ x3, data = anscombe), lwd = 2, col = 2)

plot(x4, y4,  pch = 19, cex = 1.2, col = 4)
abline(lm(y4 ~ x4, data = anscombe), lwd = 2, col = 2)

lm2.sol <- lm(y2 ~ x2 + I(x2^2), data = anscombe); summary(lm2.sol)
plot(x2, y2,  pch = 19, cex = 1.2, col = 4)
x <- seq(4, 14, by = 0.05)
y <- predict(lm2.sol, data.frame(x2 = x))
lines(x, y,  lwd = 2, col = 2)

lm3.sol <- lm(y3 ~ x3, data = anscombe, subset = -3 ); summary(lm3.sol)
plot(x3, y3,  pch = 19, cex = 1.2, col = 4)
abline(lm3.sol, lwd = 2, col = 2)

savePlot("Anscombe6", type = "eps")


