X <- c(30, 70, 120, 50, 80, 60, 40)
Y <- c(70, 90, 130, 40, 80)
poisson.test(c(sum(X), sum(Y)), c(length(X), length(Y)))
