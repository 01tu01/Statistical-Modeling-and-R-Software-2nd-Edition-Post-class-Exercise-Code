rt <- read.table("exam0601.data")
lm.sol <- lm(Y ~ 1 + X, data = rt)
confint(lm.sol)