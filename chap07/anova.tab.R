anova.tab <- function(fm){
   tab <- summary(fm)
   k <- length(tab[[1]]) - 2
   temp <-c(apply(tab[[1]][1:2], 2, sum), rep(NA, k))
   tab[[1]]["Total",] <- temp
   tab
}

