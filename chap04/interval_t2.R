interval_t2 <- function(x, y, var.equal = FALSE, 
           side = 0, alpha = 0.05){ 
    n1 <- length(x); n2 <- length(y)
    xb <- mean(x); yb <- mean(y); zb <- xb - yb
    S1 <- var(x); S2 <- var(y)
    if (var.equal ==  TRUE){
        Sw <- sqrt( ((n1-1)*S1 + (n2-1)*S2) / (n1+n2-2) )
        tmp <- Sw * sqrt(1/n1 + 1/n2)
        if (side < 0){
            tmp <- tmp * qt(1 - alpha, n1 + n2 - 2)
            a <- -Inf; b <- zb + tmp
        }
        else if (side > 0){
            tmp <- tmp * qt(1 - alpha, n1 + n2 - 2)
            a <- zb-tmp; b <- Inf
        }
        else{
            tmp <- tmp * qt(1 - alpha/2, n1 + n2 - 2)
            a <- zb - tmp; b <- zb + tmp
        }
            df <- n1 + n2 - 2
    }
    else{
        nu <- (S1/n1+S2/n2)^2
        nu <- nu / (S1^2/n1^2/(n1-1)+S2^2/n2^2/(n2-1))
        if (side < 0){
            tmp <- qt(1 - alpha, nu) * sqrt(S1/n1 + S2/n2)
            a <- -Inf; b <- zb + tmp
        }
        else if (side > 0){
            tmp <- qt(1 - alpha, nu) * sqrt(S1/n1 + S2/n2)
            a <- zb - tmp; b <- Inf
        }
        else{
            tmp <- qt(1 - alpha/2, nu) * sqrt(S1/n1 + S2/n2)
            a <- zb - tmp; b <- zb + tmp
        }
        df <- nu
    }
    data.frame(mean = zb, df = df, a = a, b = b)
}

