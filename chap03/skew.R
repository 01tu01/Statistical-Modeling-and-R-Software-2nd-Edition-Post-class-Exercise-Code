skew <- function(x){
    mu <- mean(x); n <- length(x)
    m2 <- sum((x - mu)^2)/n
    m3 <- sum((x - mu)^3)/n
    m3/sqrt(m2^3)
}
