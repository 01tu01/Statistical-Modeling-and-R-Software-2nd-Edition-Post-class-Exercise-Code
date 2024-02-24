rt <- read.table("exam0606.data")
lm.sol <- lm(Y ~ 1 + X1 + X2, data = rt)
summary(lm.sol)

##%% »­²Ğ²îÍ¼
y.res <- resid(lm.sol); y.fit <- predict(lm.sol)
plot(y.res ~ y.fit, pch = 19, cex = 1.2, col = 4)

##%% »­±ê×¼»¯²Ğ²îÍ¼
y.rst <- rstandard(lm.sol)
plot(y.rst ~ y.fit, pch = 19, cex = 1.2, col = 4)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

savePlot("resid_2", type = "eps")