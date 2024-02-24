rt <- read.table("exam0609.data")
lm.sol <- lm(Y ~ 1 + X1 + X2, data = rt)
summary(lm.sol)

##%% 绘X1与Y的散点图和回归直线
attach(rt)
win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))
plot(Y~X1, pch = 19, cex = 1.2, col = 4)
abline(lm(Y~X1), lwd=2, col=2)

##%% 绘X2与Y的散点图和回归曲线
lm2.sol <- lm(Y ~ 1 + X2 + I(X2^2))
x <- seq(min(X2), max(X2), len = 200)
y <- predict(lm2.sol, data.frame(X2 = x))
plot(Y~X2, pch = 19, cex = 1.2, col = 4)
lines(x, y, lwd=2, col=2)

savePlot("toothpaste1", type="eps")

lm.new <- update(lm.sol, Y ~ . + I(X2^2))
summary(lm.new)
confint(lm.new)

lm2.new <- update(lm.new, Y ~ . - X2)
summary(lm2.new)

lm3.new <- update(lm.new, Y ~ . + X1 * X2)
summary(lm3.new)
