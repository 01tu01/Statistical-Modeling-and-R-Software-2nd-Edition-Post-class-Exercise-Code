z <- scan("exam0907.data")
R <- matrix(1, nrow = 8, ncol = 8); k <- 1
for (i in 2:8){
    for (j in 1:(i-1)){
        R[i,j] <- R[j,i] <- z[k]; k <- k +1
    }
}
source("factor.analy2.R")
d <- c(0.123, 0.112, 0.155, 0.116, 0.073, 0.045, 0.033, 0.095)
fa <- factor.analy2(R, m = 2, d); fa

E <- R - fa$loadings %*% t(fa$loadings) - diag(fa$var[,2])
sum(E^2)
