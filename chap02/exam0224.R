X <- scan("measure.data")
n <- length(X); S <- sd(X); t <- 0.5/(S/sqrt(n))
pt(-t, df = n-1) + 1 - pt(t, df = n-1)
