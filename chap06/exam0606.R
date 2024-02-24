rt <- read.table("exam0606.data")
lm.sol <- lm(Y ~ 1 + X1 + X2, data = rt)
summary(lm.sol)

##----------------------------------------##
coef(lm.sol)
coefficients(lm.sol)
resid(lm.sol)
residuals(lm.sol)
df.residual(lm.sol)
residuals(lm.sol)%*%residuals(lm.sol)/df.residual(lm.sol)
sigma(lm.sol)
vcov(lm.sol)
confint(lm.sol)

library(lmtest)
coeftest(lm.sol)
coefci(lm.sol)

