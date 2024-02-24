GHbiplot <- function(X, cor = FALSE, cex = 1){
    #% Gower Hand 双重信息图
    source("f.R")         #%调用坐标变换函数
    X <- as.matrix(X); n <- nrow(X); 
    p <- ncol(X); Y <- X
    if (cor == TRUE | cor == T) X <- scale(X)

    e <- rep(1, n); I <- diag(e)
    Xc <- (I-e%o%e/n)%*% X; X.svd <- svd(Xc)

    #% 画样本点的散点图
    R <- X.svd$u[,1:2]; C <- X.svd$v[,1:2]
    xR <- f(R, R)                  #%坐标变换
    par(mai=c(0.1, 0.1, 0.1, 0.1))
    plot(xR, type = "n", axes = F, xlab = "", ylab = "",
        xlim = c(-0.15, 1.15), ylim = c(-0.15, 1.15))
    points(xR, pch = 15)
    text(xR, label = rownames(X), cex = cex, adj = c(0.5, 1.5))
    lines(x = c(-0.1, 1.1, 1.1, -0.1, -0.1), 
          y = c(-0.1, -0.1, 1.1, 1.1, -0.1))

    w <- c(-0.1, 1.1); uC <- f(C, R); uC0 <- f(t(c(0,0)), R) 
    u0 <- uC0[1]; v0 <- uC0[2]; u <- uC[,1]; v <- uC[,2]

    #% 画原始坐标轴
    for (i in 1:p){
        tu <- (w-u0)/(u[i]-u0); tv <- (w-v0)/(v[i]-v0)
        if (tu[1]<0 & tv[1]>0) {
            t <- c(max(tu[1], tv[2]), min(tu[2], tv[1]))
        }else if (tu[1]>0 & tv[1]<0){
            t <- c(max(tu[2], tv[1]), min(tu[1], tv[2]))
        }else if (tu[1]>0 & tv[1]>0) {
            t <- c(max(tu[2], tv[2]), min(tu[1], tv[1]))
        }else {
            t <-c(max(tu[1], tv[1]), min(tu[2], tv[2]))
        }
        ut <- u0+(u[i]-u0)*t; vt <- v0+(v[i]-v0)*t
        if (ut[2] > 1.09) {
            adu <- 0.05; adv <- 0
        }else if (ut[2] < -0.09) {
            adu <- -0.05; adv <- 0
        }else if (vt[2] > 1.09) {
            adu <- 0; adv <- 0.05
        }else if (vt[2] < -0.09) {
            adu <- 0; adv <- -0.05
        }
        lines(ut, vt)
        text(ut[2]+adu, vt[2]+adv, label = colnames(X)[i])

        #% 画原坐标轴上的刻度
        w <- c(-0.1, 1.1); w0<- seq(0, 1, length.out = 5)
        t1 <- t[1] + (t[2]-t[1])/(w[2]-w[1])*(w0-w[1])
        ut <- u0 + (u[i]-u0)*t1; vt <- v0 + (v[i]-v0)*t1
        points(ut, vt, pch = 19, col = 4)
        val <- seq(min(Y[,i]), max(Y[,i]), length.out = 5)
        val <- floor(val*100+0.5)/100
        text(ut, vt, val, adj = c(-0.3,0), col = 2, cex = cex+0.1)
    }
}
