obj <- function(x){
    f <- c(10*(x[2]-x[1]^2), 1-x[1])
    sum(f^2)
}
x0 <- c(-1.2, 1); nlm(obj, x0)