## 1
z <- scan("exec1001.data"); n <- 6
D <- matrix(0, nc=n, nr=n); k <- 1
for (i in 2:n){
    for(j in 1:(i-1)){
        D[i,j] <- D[j,i] <- z[k]; k <- k+1
    }
}
cityNames <- c("Berlin", "Dresden", "Hamburg", "Koblenz", 
               "Munich", "Rostock")
cmds <- cmdscale(D); library(MASS)
sam <- sammon(D); iso <- isoMDS(D, tol = 1e-4)

win.graph(width=10, height=7)
par(mai=c(0.8, 0.8, 0.1, 0.1))

plot(sam$points, type = "n", 
     xlim = c(-360, 480), ylim = c(-340, 250),
     xlab = "Frist Component", ylab = "Second Component")
text(cmds[-3,], label = cityNames[-3], adj = c(.5, -1))
text(sam$points[3,1], sam$points[3,2], label = cityNames[3], adj = c(.5, -1))

points(cmds, pch=19, col= "blue")
points(iso$points, pch=15, col= "brown")
points(sam$points, pch=17, col= "red")

legend(0, 0,legend=c("cmdscale", "isoMDS", "sammon"), 
       pch=c(19, 15, 17), col=c("blue", "brown", "red"))

savePlot("exec1005_2", type = "bmp")
##--------------------------------------------------------------------##

## 2
rt <- read.table("../chap08/exam0814.data")
d <- dist(scale(rt))

win.graph(width=10, height=7)
par(mai=c(0.8, 0.8, 0.1, 0.1))

iso <- isoMDS(d, tol = 1e-4)
plot(iso$points, pch=15, col= "brown", 
     xlim = c(-6, 2.3), ylim=c(-3.7, 3.5), 
     xlab = "Frist Component", ylab = "Second Component")
text(iso$points, label = rownames(rt), adj=c(.5, -1))
##--------------------------------------------------------------------##

## 3
z <- scan("../chap08/exam0813.data")
names <-c("身高", "手臂长", "上肢长", "下肢长", "体重", "颈围",
          "胸围", "胸宽")
r <- matrix(1, nc = 8, nr = 8, dimnames = list(names, names))
for (i in 1:7){
    for( j in 1:i){
        r[i+1,j] <- r[j, i+1]<-z[i*(i-1)/2+j]
    }
}

d <- as.dist(1-r)
sam <- sammon(d); sam
plot(sam$points,  pch=17, col= "red", 
     xlim=c(-0.4, 0.4), ylim=c(-0.3, 0.4), 
     xlab = "Frist Component", ylab = "Second Component")
text(sam$points, label = names, adj=c(.5, -1))
##--------------------------------------------------------------------##

## 4
X <- matrix(c(60, 3, 32, 11), nr = 2, nc = 2, 
    dimnames = list(c("吸烟", "不吸烟"), c("患肺癌", "未患肺癌")))
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
##--------------------------------------------------------------------##

## 5
x <- c(42, 82,  67,  55,
       35, 62, 165, 118, 
       13, 28,  92,  81,
        7, 18,  54,  75, 
        3,  7,  32,  54)
X <- matrix(x, nr = 5, nc = 4, byrow =T,  
    dimnames = list(c("<1万", "1-3万", "3-5万", "5-10万", ">10万"), 
                    c("很不满意", "有些不满意", "比较满意", "很满意"))
)
(X.corresp <- corresp(X, nf=2))
par(mai=c(0.6, 0.6, 0.6, 0.6))
biplot(X.corresp, xlim = c(-0.6, 0.5))
##--------------------------------------------------------------------##

## 6
rt <- read.table("exam1009.data")
(ct <- corresp(~ 功用 + 敏捷性, data = rt, nf = 2))
biplot(ct, xlim=c(-0.6, 0.6))

(ct <- corresp(~ 功用 + 身材, data = rt, nf = 2))
biplot(ct, xlim=c(-1.1, 0.8))
##--------------------------------------------------------------------##

## 7
rt <- read.table("exam1010.data")
pr <- prcomp(rt, scale = T)
par(mai=c(0.8, 0.8, 0.5, 0.5))
biplot(pr, cex = 0.7, xlim = c(-0.3, 0.5))

##--------------------------------------------------------------------##

## 8
rt <- read.table("../chap09/exam0901.data"); rt
colnames(rt) <- c("身高", "体重", "胸围", "坐高")
student.pr <- prcomp(rt)

par(mai=c(0.8, 0.8, 0.5, 0.5))
biplot(student.pr, scale = 0.5, xlim = c(-2.1, 2.3))

savePlot("exec1008", type = "bmp")

##--------------------------------------------------------------------##

## 9
rt <- read.table("../chap09/exam0901.data")
colnames(rt) <- c("身高", "体重", "胸围", "坐高")

source("GHbiplot.R")
win.graph(width=8, height=7)
GHbiplot(rt)

savePlot("exec1009", type = "bmp")



