t.stat <- function(x, y) {
    n1 <- length(x); n2 <- length(y)
    xb <- mean(x); yb <- mean(y)
    Sx2 <- var(x); Sy2 <- var(y)
    S <- ((n1-1)*Sx2 + (n2-1)*Sy2)/(n1+n2-2)
    (xb - yb)/sqrt(S*(1/n1 + 1/n2))
}
