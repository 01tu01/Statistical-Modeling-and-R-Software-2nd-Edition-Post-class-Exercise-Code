f <- function(x) x*exp(-x^2)
optimize(f, interval = c(-3, 3))
optimize(f, interval = c(-3, 3), maximum = TRUE)


