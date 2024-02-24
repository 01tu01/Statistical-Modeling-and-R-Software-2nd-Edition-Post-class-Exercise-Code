f <- function(z, X){
    #% ×ø±ê±ä»»º¯Êý
    u <- (z[,1]-min(X[,1]))/(max(X[,1])-min(X[,1]))
    v <- (z[,2]-min(X[,2]))/(max(X[,2])-min(X[,2]))
    cbind(u, v)
}
