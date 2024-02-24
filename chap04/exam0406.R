library("nleqslv")
F <- function(p) c(p[1]*p[2] - A1, p[1]*p[2]*(1 - p[2]) - M2)

set.seed(123456)
x <- rbinom(100, 20, 0.7); n <- length(x)
A1 <- mean(x); M2 <- (n-1)/n*var(x); p <- c(10, 0.5)
nleqslv(p, fn = F)

k <- A1^2/(A1-M2); k
p <- (A1-M2)/A1; p
