library(nleqslv)
funs <- function(x) 
    c(x[1]^2 + x[2]^2 - 5, (x[1]+1)*x[2] - (3*x[1]+1)) 
nleqslv(x = c(1, 1), fn = funs)
