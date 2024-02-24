source("interval_t1.R")
X <- c(1050, 1100, 1120, 1250, 1280)
interval_t1(X, side = 1)

t.test(X, alternative = "greater")
