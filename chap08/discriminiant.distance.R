discriminiant.distance <- function(X, G, Tst = NULL, 
        var.equal = FALSE){
    if (is.factor(G) != TRUE) G <- as.factor(G)
    if (is.null(Tst) == TRUE) Tst <- X
    if (is.vector(Tst) == TRUE) dim(Tst) <- c(1, length(Tst))

    g <- levels(G); k <- length(g); N <- numeric(k)
    n <- ncol(X); m <- nrow(Tst)
    for (i in 1:k) N[i] <- sum(G==g[i])

    mu <- matrix(0, nrow = k, ncol = n, 
        dimnames = list(g, colnames(X)))
    for (j in 1:n)  mu[,j] <- tapply(X[ ,j], G, mean)

    S <- array(0, c(n, n, k)); St <- array(0, c(n,n))
    for (i in 1:k){
       S[, , i] <- var(X[G==g[i], ])
       St <- St + (N[i]-1)*var(X[G==g[i], ])
    }
    St <- St/(sum(N) - k)

    D <- matrix(0, nrow = k, ncol = m, 
        dimnames = list(g, rownames(Tst)))
    if (var.equal == TRUE  || var.equal == T){
        for (i in 1:k)
            D[i,] <-  mahalanobis(Tst, mu[i,], St)
    }else{
        for (i in 1:k)
            D[i,] <-  mahalanobis(Tst, mu[i,], S[ , , i])
    }
    blong <- numeric(m); names(blong) <- rownames(Tst)
    for (j in 1:m){
        dmin <- Inf
        for (i in 1:k)
            if (D[i,j] < dmin){
                dmin <- D[i,j]; blong[j] <- g[i]
            }
    }
    blong
}
