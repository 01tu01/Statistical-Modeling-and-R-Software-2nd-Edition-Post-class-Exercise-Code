interval_rate2 <- function(m, n, alpha = 0.05){ 
    p <- m/n; q <- 1 - p; z <- qnorm(1 - alpha/2)
    tmp <- z*sqrt(p[1]*q[1]/n[1]+p[2]*q[2]/n[2])
    data.frame(phat = p[1]-p[2], 
         a = p[1] - p[2] - tmp, b = p[1] - p[2] + tmp)
}
