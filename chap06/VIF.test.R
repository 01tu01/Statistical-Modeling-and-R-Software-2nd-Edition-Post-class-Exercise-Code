VIF.test <- function(X){
    XX <- cor(X)
    diag(solve(XX))
}


