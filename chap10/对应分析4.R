X <- read.table("数据.data"); X
X <- as.matrix(X)
library(MASS)
(X.corresp <- corresp(X, nf=2))
biplot(X.corresp)

source("correspPlot.R")
correspPlot(X.corresp)

chisq.test(X)

##------------------------------------------------------##
P <- X/sum(X); P
r <- apply(P, 1, sum); r
c <- apply(P, 2, sum); c


Z <- (P-r%o%c)/sqrt(r%o%c); Z
Z.svd <- svd(Z); Z.svd

A <- t(Z)%*%Z; A
A.eig <- eigen(A); A.eig
sum(A.eig$values)
A.eig$values/sum(A.eig$values)

B <- Z%*%t(Z); B
B.eig <- eigen(B); B.eig
sum(B.eig$values)
B.eig$values/sum(B.eig$values)

##------------------------------------------------------##
R <- diag(1/sqrt(r))%*% Z.svd$u; 
rownames(R) <- rownames(X.corresp$rscore)
R
Q <- diag(1/sqrt(c)) %*% Z.svd$v; 
rownames(Q) <- rownames(X.corresp$cscore)
Q

X.corresp$cor
X.corresp$rscore 
X.corresp$cscore

R %*% diag(Z.svd$d)
Q %*% diag(Z.svd$d)
biplot(X.corresp, xlim=c(-2.2, 0.6))

abline(v=0.359, h=-0.094)
abline(v=0.587, h=1.145)
abline(v=-1.744, h=0.0397)

abline(v=0.512/rho, h=0.733/rho)
abline(v=-2.15/rho, h=0.139/rho)


##------------------------------------------------------##
x <- c(42, 82,  67,  55,
       35, 62, 165, 118, 
       13, 28,  92,  81,
        7, 18,  54,  75, 
        3,  7,  32,  54)
X <- matrix(x, nr = 5, nc = 4, byrow =T,  
    dimnames = list(c("<1万", "1-3万", "3-5万", "5-10万", ">10万"), 
                    c("很不满意", "有些不满意", "比较满意", "很满意"))
)
X

##------------------------------------------------------##
X <- read.table("基因类型.data"); X


