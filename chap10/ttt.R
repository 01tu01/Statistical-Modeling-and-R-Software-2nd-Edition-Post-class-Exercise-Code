rt <- read.table("../chap09/exam0901.data"); rt
colnames(rt) <- c("身高", "体重", "胸围", "坐高")
n <- length(rt[,1])

##---------------------------------------------------##
student.pr <- princomp(rt)
Xbar <- apply(rt, 2, mean)
X <- as.matrix(rt)- rep(1, n) %o% Xbar; X
X.svd <- svd(X); X.svd

##---------------------------------------------------##
par(mai=c(0.8, 0.8, 0.5, 0.5))
s <- 0.5
biplot(student.pr, scale = s)
Row <- X.svd$u %*% diag(X.svd$d^(1-s))[,1:2]; Row
Row[,2]<- -Row[,2]
Col <- X.svd$v %*% diag(X.svd$d^s)[,1:2]; Col
Col[,2]<- -Col[,2]

##---------------------------------------------------##
rho <- min(max(Row)/max(Col), min(Row)/min(Col)); rho
text(Row/rho, col=4)
text(Col, c("X1", "X2", "X3", "X4"), col=4)

##---------------------------------------------------##
s <- 1
biplot(student.pr, scale =s, pc.biplot = T)
Row <- X.svd$u %*% diag(X.svd$d^(1-s))[,1:2]/sqrt(n); Row
Row[,2]<- -Row[,2]
Col <- X.svd$v %*% diag(X.svd$d^s)[,1:2]/sqrt(n); Col
Col[,2]<- -Col[,2]

##---------------------------------------------------##
student.pr <- princomp(rt, cor = T)
Xbar <- apply(rt, 2, mean)
X <- as.matrix(rt)- rep(1, n) %o% Xbar; X
S <- apply(rt, 2, sd)*sqrt((n-1)/n)
X <- X %*% diag(1/S)
X.svd <- svd(X); X.svd

##---------------------------------------------------##
student.pr <- princomp(rt)
e <- rep(1, n); I <- diag(e)
X <- as.matrix(rt)
Xc <- (I-e%o%e/n)%*% X
X.svd <- svd(Xc); X.svd

student.pr <- princomp(rt, cor = T)
S <- apply(rt, 2, sd)*sqrt((n-1)/n)
X <- as.matrix(rt) %*% diag(1/S)

##---------------------------------------------------##
rt <- read.table("exam1010.data"); rt
source("GHbiplot.R")
win.graph(width=8, height=7)
GHbiplot(rt, cor = TRUE, cex=.7)
GHbiplot(rt)


E <- X.svd$v[,1:2]
rownames(E) <- colnames(rt)
E

R <- Xc%*% E
rownames(R) <- rownames(rt)
R

x <- (R[,1]-min(R[,1]))/(max(R[,1])-min(R[,1])); x
y <- (R[,2]-min(R[,2]))/(max(R[,2])-min(R[,2])); y
plot(x, y, type = "n", axes = F, xlim=c(-0.15, 1.15), ylim = c(-0.15,1.15))
text(x, y, label=rownames(rt), cex=0.7)
lines(x=c(-0.1, 1.1, 1.1, -0.1, -0.1), y=c(-0.1, -0.1, 1.1, 1.1, -0.1))

u <- (E[,1]-min(R[,1]))/(max(R[,1])-min(R[,1])); u
v <- (E[,2]-min(R[,2]))/(max(R[,2])-min(R[,2])); v
u0 <- (0-min(R[,1]))/(max(R[,1])-min(R[,1])); u0
v0 <- (0-min(R[,2]))/(max(R[,2])-min(R[,2])); v0

i <- 6
w <- c(-0.1, 1.1)
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

ut <- u0+(u[i]-u0)*t
vt <- v0+(v[i]-v0)*t
lines(ut, vt)
if (ut[2] > 1.09) {
    adu <- 0.05; adv <- 0
}else if (ut[2] < -0.09) {
    adu <- -0.05; adv <- 0
}else if (vt[2] > 1.09) {
    adu <- 0; adv <- 0.05
}else if (vt[2] < -0.09) {
    adu <- 0; adv <- -0.05
}

text(ut[2]+adu, vt[2]+adv, label=names(E[i,1]))

w <- c(-0.1, 1.1); w0<- seq(0, 1, length.out = 5)
t1 <- t[1]+(t[2]-t[1])/(w[2]-w[1])*(w0-w[1])
ut <- u0+(u[i]-u0)*t1
vt <- v0+(v[i]-v0)*t1

points(ut, vt, pch=19, col=4)
val <- seq(min(X[,i]), max(X[,i]), length.out = 5)
text(ut, vt, val, adj=-c(0.2,0), col=2, cex = cex+0.1)

win.graph(width=8, height=7)
par(mai=c(0.1, 0.1, 0.1, 0.1))
plot(R, type="n", axes = F)
text(R, label=rownames(rt))


