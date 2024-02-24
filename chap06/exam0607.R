rt <- read.table("exam0606.data")
lm.sol <- lm(Y ~ 1 + X1 + X2, data = rt)
confint(lm.sol)