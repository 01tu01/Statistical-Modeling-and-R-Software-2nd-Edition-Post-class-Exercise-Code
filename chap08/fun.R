fun <- function(x, y, A, b, c)
   A[1,1]*x^2 + 2*A[1,2] * x * y + A[2,2]*y^2 + b[1]*x + b[2]*y + 
   rep(c, length(x))
