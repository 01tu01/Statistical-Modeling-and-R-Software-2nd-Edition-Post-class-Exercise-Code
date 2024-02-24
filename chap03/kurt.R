kurt <- function(x){
    mu <- mean(x); n <- length(x)
    m2 <- sum((x - mu)^2)/n;  m4 <- sum((x - mu)^4)/n
    m4/m2^2 - 3
}
