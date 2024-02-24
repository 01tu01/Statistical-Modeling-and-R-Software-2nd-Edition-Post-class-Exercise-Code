z <- scan("exam0907.data")
R <- matrix(1, nrow = 8, ncol = 8); k <- 1
for (i in 2:8){
    for (j in 1:(i-1)){
        R[i,j] <- R[j,i] <- z[k]; k <- k +1
    }
}
d <- c(0.123, 0.112, 0.155, 0.116, 0.073, 0.045, 0.033, 0.095)
source("factor.analy1.R")
fa <- factor.analy1(R, m = 2); fa
vm1 <-varimax(fa$loadings, normalize = F); vm1

source("factor.analy2.R")
fa <- factor.analy2(R, m = 2, d); fa
vm2 <-varimax(fa$loadings, normalize = F); vm2

source("factor.analy3.R")
fa <- factor.analy3(R, m = 2, d); fa
vm3 <-varimax(fa$loadings, normalize = F); vm3

