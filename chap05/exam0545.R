library(tseries)
X <- scan("exam0545.data")
IX <- sort(X, index.return = T)$ix
runs.test(as.factor(IX < 12.5))
