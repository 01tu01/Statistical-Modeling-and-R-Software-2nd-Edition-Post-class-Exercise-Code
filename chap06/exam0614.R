rt <- read.table("exam0614.data")
lm.sol <- lm(Y ~ 1 + X, data = rt); summary(lm.sol)

y.rst <- rstandard(lm.sol); y.fit <- predict(lm.sol)
plot(y.rst ~ y.fit, pch = 19, cex = 1.2, col = 4)
abline(0.1,0.5); abline(-0.1, -0.5)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

lm.new <- update(lm.sol, sqrt(.) ~ .); coef(lm.new)
yn.rst <- rstandard(lm.new); yn.fit <- predict(lm.new)
plot(yn.rst ~ yn.fit, pch = 19, cex = 1.2, col = 4)

savePlot("exam0614_2", type = "eps")