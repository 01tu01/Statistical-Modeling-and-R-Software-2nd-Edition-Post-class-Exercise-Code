z <- scan("exam1003.data")
n <- 10; k <- 1
C <- matrix(0, nc = n, nr = n)
for (i in 1:n){
    for(j in 1:i){
        C[i,j] <- C[j,i] <- z[k]; k <- k + 1
    }
}
C

D <- matrix(0, nc = n, nr = n)
for (i in 1:n){
    for(j in 1:n){
        D[i,j] <- sqrt(C[i,i] + C[j,j] - 2*C[i,j])
    }
}
D

cmdscale(D)
