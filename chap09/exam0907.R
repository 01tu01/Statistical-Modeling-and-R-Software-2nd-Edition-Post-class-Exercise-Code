z <- scan("exam0907.data")
R <- matrix(1, nrow = 8, ncol = 8); k <- 1
for (i in 2:8){
    for (j in 1:(i-1)){
        R[i,j] <- R[j,i] <- z[k]; k <- k +1
    }
}
source("factor.analy1.R")
fa <- factor.analy1(R, m = 2); fa

E <- R - fa$loadings %*% t(fa$loadings) - diag(fa$var[,2])
sum(E^2)
