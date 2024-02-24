interval_z1 <- function(x, sigma = sd(x), side = 0, alpha = 0.05){ 
    n <- length(x); xb <- mean(x)
    if (side < 0){
        tmp <- sigma/sqrt(n) * qnorm(1-alpha)
        a <- -Inf; b <- xb + tmp
    }
    else if (side > 0){
        tmp <- sigma/sqrt(n) * qnorm(1-alpha)
        a <- xb - tmp; b <- Inf
    }
    else{
        tmp <- sigma/sqrt(n) * qnorm(1-alpha/2)
        a <- xb - tmp; b <- xb + tmp
    }
    data.frame(mean = xb, a = a, b = b)
}
