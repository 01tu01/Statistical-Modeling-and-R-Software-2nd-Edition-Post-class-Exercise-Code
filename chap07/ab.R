ab <- function(x, y){
   n <- length(x); z <- numeric(n)
   for (i in 1:n)
      if (x[i]==y[i]){z[i] <- 1} else{z[i] <- 2}
   factor(z)
}
