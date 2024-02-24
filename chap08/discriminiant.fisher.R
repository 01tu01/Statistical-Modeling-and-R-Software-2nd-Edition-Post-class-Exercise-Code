discriminiant.fisher <- function(X, G, Tst = NULL){
    if (is.factor(G) != TRUE) G <- as.factor(G)
    if (is.null(Tst) == TRUE) Tst <- X
    if (is.vector(Tst) == TRUE) dim(Tst) <- c(1, length(Tst))
    else Tst <- as.matrix(Tst)

    g <- levels(G); k <- length(g); N <- numeric(k)
    n <- ncol(X); m <- nrow(Tst)
    for (i in 1:k) N[i] <- sum(G==g[i])

    S <- array(0, c(n, n))
    for (i in 1:k)
       S <- S + (N[i]-1)*var(X[G==g[i], ])

    Xbar <- apply(X, 2, mean)
    mu <- matrix(0, nrow = k, ncol = n, 
        dimnames = list(g, colnames(X)))
    for (j in 1:n)  mu[,j] <- tapply(X[ ,j], G, mean)

    Y <- t(t(mu) - Xbar)
    B <- matrix(0, nc = n, nr = n)
    for (i in 1:k) B <- B + N[i] * (Y[i, ] %o% Y[i, ])
    
    z <- eigen(solve(S, B))
    a <- z$vectors[,1]
    ui <- mu %*% a; u <- Tst %*% a   
   
    blong <- numeric(m); names(blong) <- rownames(Tst)
    for (j in 1:m){
        dmin <- Inf
        for (i in 1:k)
            if (abs(u[j]-ui[i]) < dmin){
                dmin <- abs(u[j]-ui[i]); blong[j] <- g[i]
            }
    }
    blong
}
