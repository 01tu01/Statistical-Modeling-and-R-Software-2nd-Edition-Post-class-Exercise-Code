z <- scan("exam0907.data")
R <- matrix(1, nrow = 8, ncol = 8); k <- 1
for (i in 2:8){
    for (j in 1:(i-1)){
        R[i,j] <- R[j,i] <- z[k]; k <- k +1
    }
}
fa <- factanal(factors = 2, covmat = R); fa