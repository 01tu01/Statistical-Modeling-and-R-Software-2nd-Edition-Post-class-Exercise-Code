disc_bay_plot <- function(X, G, Tst = NULL, 
        var.equal = FALSE){
    if (is.factor(G) != TRUE) G <- as.factor(G)
    if (is.vector(Tst) == TRUE) dim(Tst) <- c(1, length(Tst))
    colnames(Tst) <- colnames(X)

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

    if (var.equal == TRUE  || var.equal == T){
        a <- solve(St, mu[1,] - mu[2,])
        b <- a %*% (mu[1,] + mu[2,])/2 - 2 * log(N[1]/N[2])
    }else{
        S1 <- solve(S[ , , 1]); S2 <- solve(S[ , , 2])
        c <- 2*(S1 %*% mu[1,] - S2 %*% mu[2,])
        d <- mu[2,] %*% S2 %*% mu[2,]- mu[1,] %*% S1 %*% mu[1,] +
            2*log(N[1]/N[2]) - log(det(S[ , , 1])/det(S[ , , 2]))
    }

   if (is.null(Tst) == TRUE)  
      plot(X, t = "n", 
           xlab = "Frist Component", 
           ylab = "Second Component")
   else
      plot(rbind(X, Tst), t = "n", 
           xlab = "Frist Component", 
           ylab = "Second Component")

   points(X[G==g[1], ], pch = 23, cex = 1.1, col = "blue", bg = "blue")
   points(X[G==g[2], ], pch = 22, cex = 1.1, col = "red", bg = "red")
   text(mu[1, 1], mu[1, 2], label = g[1], cex = 1.4)
   text(mu[2, 1], mu[2, 2], label = g[2], cex = 1.4)

   if (is.null(Tst) == FALSE)  
      points(Tst, pch = 19, cex = 1.2, col = "brown")

   if (var.equal == TRUE  || var.equal == T){
     title(main = "Linear Discriminant")
     abline(b/a[2], -a[1]/a[2], lwd = 2)
   }
   else{
     title(main = "Quadratic Discriminant")
     Xmin <- apply(X, 2, min); Xmax <- apply(X, 2, max)
     x <- seq(Xmin[1], Xmax[1], length.out = 51) 
     y <- seq(Xmin[2], Xmax[2], length.out = 51) 
     source("fun.R")
     z <- outer(x, y, FUN = fun, A = S2 - S1, b = c, c = d);
     contour(x, y, z, drawlabels = F, lwd = 2, levels = 0, add = T)
  }
}
