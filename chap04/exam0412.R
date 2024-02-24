set.seed(123456)
x <- rcauchy(1000, 1)
f <- function(p)  sum((x-p)/(1+(x-p)^2))
uniroot(f, c(0, 5))

loglike <- function(p) sum(log(1+(x-p)^2))
optimize(loglike, c(0, 5))
