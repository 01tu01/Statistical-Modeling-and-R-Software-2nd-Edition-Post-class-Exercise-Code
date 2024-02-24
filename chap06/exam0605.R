forbes <- read.table("Forbes.data")
lm.sol <- lm(log100 ~ F, data = forbes)
summary(lm.sol)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))
attach(forbes)
plot(F, log100, pch = 19, cex = 1.2, col = 4)
abline(lm.sol, lwd = 2, col=2)
detach()

y.fit <- fitted(lm.sol)
y.res <- residuals(lm.sol)
win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))
plot(y.fit, y.res, xlab = "Fitted Values", ylab = "Residuals", 
     pch = 19, cex = 1.2, col = 4)
text(y.fit[12], y.res[12], labels = 12, adj = 1.3)


savePlot("regress-2", type = "eps")

lm12 <- lm(log100 ~ F, data = forbes, subset = -12)
summary(lm12)

