interval_t1 <- function(x, side = 0, alpha = 0.05){ 
    n <- length(x); xb <- mean(x); S <- sd(x)
    if (side < 0){
        tmp <- S/sqrt(n) * qt(1 - alpha, n - 1)
        a <- -Inf; b <- xb + tmp
    }
    else if (side > 0){
        tmp <- S/sqrt(n) * qt(1 - alpha, n - 1)
        a <- xb - tmp; b <- Inf
    }
    else{
        tmp <- S/sqrt(n) * qt(1 - alpha/2, n - 1)
        a <- xb - tmp; b <- xb + tmp
    }
    data.frame(mean = xb, df = n-1, a = a, b = b)
}
