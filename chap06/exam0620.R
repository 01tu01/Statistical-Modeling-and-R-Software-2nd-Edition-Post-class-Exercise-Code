x <- 0 : 5; y <- c(0, 9, 21, 47, 60, 63)
Y <- cbind(y, 70 - y)
glm.sol <- glm(Y ~ x, family = binomial)
summary(glm.sol)

predict(glm.sol, data.frame(x = 3.5), type = "response")

beta <- coef(glm.sol)
X <- - beta[1]/beta[2]; names(X) <- NULL; X

d <- seq(0, 5, len = 100)
p <- predict(glm.sol, data.frame(x = d), type = "response")
plot(x, y/70, ylim = c(0, 1), pch = 19, cex = 1.2, col = 4, 
     xlab = "电流强度 / 毫安", ylab = "响应比例") 
lines(d, p, lwd=2, col=2) 

savePlot("logistic1", type = "bmp")