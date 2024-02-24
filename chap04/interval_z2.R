interval_z2 <- function(x, y, sigma = c(sd(x), sd(y)), 
          side = 0, alpha = 0.05){ 
    n1 <- length(x); n2 <- length(y)
    xb <- mean(x); yb <- mean(y); zb <- xb - yb
    S  <- sqrt(sigma[1]^2/n1 + sigma[2]^2/n2)
    if (side < 0){
        tmp <- qnorm(1 - alpha) * S 
        a <- -Inf; b <- zb + tmp
    }
    else if (side > 0){
        tmp <- qnorm(1 - alpha) * S
        a <- zb - tmp; b <- Inf
    }
    else{
        tmp <- qnorm(1 - alpha/2) * S
        a <- zb - tmp; b <- zb + tmp
    }
    data.frame(mean = zb, a = a, b = b)
}

