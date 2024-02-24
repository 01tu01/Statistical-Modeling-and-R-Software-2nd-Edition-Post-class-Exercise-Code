X <- scan("exam0601.data", nlines = 1)
Y <- scan("exam0601.data", skip = 1)
lm.sol <- lm(Y ~ 1 + X)

p <- 1; n <- length(X); d <- dffits(lm.sol)
cf <- 1:n; cf[d > 2*sqrt((p+1)/n)]
