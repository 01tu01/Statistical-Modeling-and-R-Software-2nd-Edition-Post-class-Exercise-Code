source("interval_t2.R")
set.seed(123456)
X <- rnorm(12, 501.1, 2.4)
Y <- rnorm(17, 499.7, 4.7)
interval_t2(X, Y, var.equal = TRUE)
interval_t2(X, Y)

t.test(X, Y)
t.test(X, Y, var.equal = TRUE)