z.test2 <- function(x, y, sigma = c(sd(x), sd(y)), side = 0){
    source("P_value.R")
    n1 <- length(x); n2 <- length(y)
    xb <- mean(x); yb <- mean(y)
    z <- (xb - yb) / sqrt(sigma[1]^2/n1 + sigma[2]^2/n2)
    Pvalue <- P_value(z, side = side)
    data.frame(mean = xb - yb, Z = z, P_value = Pvalue)
}
