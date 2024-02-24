z <- scan("exam1001.data"); z
n <- 12
D <- matrix(0, nc=n, nr=n); k <- 1
for (i in 2:n){
    for(j in 1:(i-1)){
        D[i,j] <- D[j,i] <- z[k]; k <- k+1
    }
}
D

A <- -1/2*D^2; A
e <- rep(1, n)
H <- diag(e)- 1/n* e%o%e; H
B <- H %*% A %*% H; B

eig <- eigen(B)
alpha1 <- sum(eig$values[1:2])/sum(abs(eig$values)); alpha1
alpha2 <- sum(eig$values[1:2]^2)/sum(eig$values^2); alpha2

x1 <- sqrt(eig$values[1])*eig$vectors[,1]
x2 <- sqrt(eig$values[2])*eig$vectors[,2]
X <- cbind(x1, x2)

