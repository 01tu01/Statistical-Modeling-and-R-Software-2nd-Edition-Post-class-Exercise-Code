library(tseries)
X <- scan("exam0544.data")
M <-  median(X)
runs.test(as.factor(X < M))

