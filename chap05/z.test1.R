z.test1 <- function(x, mu, sigma = sd(x), side = 0){
    source("P_value.R")
    n <- length(x); xb <- mean(x)
    z <- (xb-mu)/(sigma/sqrt(n))
    Pvalue <- P_value(z, side)
    data.frame(mean = xb, Z = z, P_value = Pvalue)
}
