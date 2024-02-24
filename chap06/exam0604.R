rt <- read.table("exam0601.data")
lm.sol <- lm(Y ~ 1 + X, data = rt)

newdata <- data.frame(X = 0.16)
predict(lm.sol, newdata, interval = "prediction")
predict(lm.sol, newdata, interval = "confidence")
