interval_rate1 <- function(m, n, approx = FALSE, alpha = 0.05){ 
    p <- m/n; q <- 1 - p; z <- qnorm(1 - alpha/2)
    if (approx == FALSE) {
        A <- 1+z^2/n; B <- 2*p + z^2/n; C <- p^2
        z1 <-  B/(2*A); z2 <- sqrt(B^2-4*A*C)/(2*A)
        data.frame(phat = p, a = z1 - z2, b = z1 + z2)
    } else{
        tmp <- z*sqrt(p*q/n)
        data.frame(phat = p, a = p - tmp, b = p + tmp)
    }
}
