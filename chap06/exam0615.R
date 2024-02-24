rt <- read.table("exam0606.data")
lm.sol <- lm(Y ~ 1 + X1 + X2, data = rt)
summary(lm.sol)

##%% »­²Ğ²îÍ¼
y.res <- resid(lm.sol)
attach(rt)
plot(y.res ~ X1, pch = 19, cex = 1.2, col = 4)
plot(y.res ~ X2, pch = 19, cex = 1.2, col = 4)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

savePlot("exam0615_2", type = "eps")

source("dw.test.R"); dw.test(y.res)

library(zoo); library(lmtest)
dwtest(Y ~ 1 + X1 + X2, data = rt, al="two")