correspPlot <- function(x){
    A <- rbind(x$rscore, x$cscore)
    a <- apply(A, 2, min)
    b <- apply(A, 2, max)
    Y <- A
    Y[,1] <- (2*A[,1] - (a[1]+b[1]))/(b[1]-a[1])
    Y[,2] <- (2*A[,2] - (a[2]+b[2]))/(b[2]-a[2])
    Row <- Y[1:nrow(x$rscore),]
    Col <- Y[(nrow(x$rscore)+1):nrow(A),]

    par(mai = c(0.9, 0.9, 0.2, 0.2))
    plot(Row, pch=15, col=2, xlab="Dimension 1", ylab="Dimension 2", 
         xlim=c(-1.2, 1.2), ylim=c(-1.2, 1.2))
    text(Row, adj=1.2, labels=rownames(x$rscore), col=2)
    points(Col, pch=16, col=4, cex=1.1)
    text(Col, adj=c(0.5,-1), labels=rownames(x$cscore), col=4)
}

