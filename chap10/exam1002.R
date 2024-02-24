z <- c(0, 1, sqrt(3),       2, sqrt(3),       1, 1,
          0,       1, sqrt(3),       2, sqrt(3), 1,
                   0,       1, sqrt(3),       2, 1, 
                            0,       1, sqrt(3), 1, 
                                     0,       1, 1, 
                                              0, 1, 
                                                 0)
n <- 7
D <- matrix(0, nc = n, nr = n); k<-1
for (i in 1:n){
    for(j in i:n){
        D[i,j] <- D[j,i] <- z[k]; k<-k+1
    }    
}
D

A <- -1/2*D^2; A
e <- rep(1, n)
H <- diag(e)- 1/n* e%o%e; H
B <- H %*% A %*% H; B

eig <- eigen(B)
alpha1 <- sum(eig$values[1:2])/sum(abs(eig$values)); alpha1
#alpha2 <- sum(eig$values[1:2]^2)/sum(eig$values^2); alpha2
alpha2 <- sum(eig$values[1:2])/sum(apply(rbind(eig$values, 0), 2, max)); alpha2

x1 <- sqrt(eig$values[1])*eig$vectors[,1]
x2 <- sqrt(eig$values[2])*eig$vectors[,2]
X <- cbind(x1, x2)

cmds <- cmdscale(D)
plot(cmds)

