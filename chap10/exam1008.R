X <- matrix(c(24, 16, 60, 12, 48, 40), nr = 3, nc = 2, 
    dimnames = list(c("A1", "A2", "A3"), c("B1", "B2")))
X

P <- X/sum(X); P
r <- apply(P, 1, sum); r
c <- apply(P, 2, sum); c

Z <- (P-r%o%c)/sqrt(r%o%c); Z
Z.svd <- svd(Z); Z.svd

R <- diag(1/sqrt(r))%*% Z.svd$u 
rownames(R) <- rownames(X); R
C <- diag(1/sqrt(c)) %*% Z.svd$v
rownames(C) <- colnames(X); C

R %*% diag(Z.svd$d)
C %*% diag(Z.svd$d)

library(MASS); corresp(X)
