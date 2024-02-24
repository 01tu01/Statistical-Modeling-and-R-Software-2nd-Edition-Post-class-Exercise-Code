obj <- function(x) 
    100*(x[2] - x[1]^2)^2 + (1 - x[1])^2
nlm(obj, c(-1.2, 1))
