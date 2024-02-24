rt <- read.table("exam0601.data")
lm.sol <- lm(Y ~ 1 + X, data = rt)
summary(lm.sol)

fitted(lm.sol)
resid(lm.sol)
anova(lm.sol)
coef(lm.sol)
vcov(lm.sol)

##------------------------------------------------##
new <- data.frame(X = seq(0.10, 0.24, by = 0.01))
pp <- predict(lm.sol, new, interval = "p")
pc <- predict(lm.sol, new, interval = "c")

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))
matplot(new$X, cbind(pp, pc[,-1]), type="l",
        xlab = "Ì¼º¬Á¿", ylab = "Ç¿¶È", lty = c(1,5,5,2,2), 
        col = c("blue", "red", "red", "brown", "brown"), 
        lwd = 2)
points(rt$X, rt$Y, cex = 1.4, pch = 21, col = "red", bg = "orange")
legend(0.1, 63, c("Points", "Fitted", "Prediction", "Confidence"), 
       pch = c(19, NA, NA, NA), lty = c(NA, 1,5,2), 
       col = c("orange", "blue", "red", "brown"))

savePlot("predict", type="bmp")
