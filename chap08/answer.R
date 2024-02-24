## 1. 
rt <- read.table("exec0801.data"); rt
Tst <- c(8.1, 2.0)
X <- rt[,1:2]; G <- rt[,3]
source("discriminiant.distance.R")
discriminiant.distance(X, G, Tst, var.equal = TRUE)
discriminiant.distance(X, G, Tst)

discriminiant.distance(X, G, var.equal = TRUE)
discriminiant.distance(X, G)

source("disc_dis_plot.R")
disc_dis_plot(X, G, Tst, var.equal = TRUE)
disc_dis_plot(X, G, Tst)

source("discriminiant.bayes.R")
discriminiant.bayes(X, G, Tst, var.equal = TRUE)
discriminiant.bayes(X, G, Tst)

discriminiant.bayes(X, G, var.equal = TRUE)
discriminiant.bayes(X, G)

source("disc_bay_plot.R")
disc_bay_plot(X, G, Tst, var.equal = TRUE)
disc_bay_plot(X, G, Tst)

source("discriminiant.fisher.R")
discriminiant.fisher(X, G, Tst)
discriminiant.fisher(X, G)

## 2. 
rt <- read.table("exec0802.data"); rt
X <- rt[, 2:5]; G <- rt[, 1]

table(true_class = G, predict = discriminiant.distance(X, G, var.equal = TRUE))
table(true_class = G, predict = discriminiant.distance(X, G))

table(true_class = G, predict = discriminiant.bayes(X, G, var.equal = TRUE))
table(true_class = G, predict = discriminiant.bayes(X, G))

table(true_class = G, predict = discriminiant.fisher(X, G))

## 3. 
rt <- read.table("exec0801.data"); rt
Tst <- c(8.1, 2.0)
X <- rt[,1:2]; G <- rt[,3]

library(MASS)
lda.sol <- lda(X, G)
predict(lda.sol, newdata = Tst)$class
predict(lda.sol)$class

qda.sol <- qda(X, G)
predict(qda.sol, newdata = Tst)$class
predict(qda.sol)$class

## 4. 
rt <- read.table("exec0802.data"); rt
X <- rt[, 2:5]; G <- rt[, 1]

lda.sol <- lda(X, G)
qda.sol <- qda(X, G)
table(true_class = G, predict = predict(lda.sol)$class)
table(true_class = G, predict = predict(qda.sol)$class)

## 5. 
library(class)
rt <- read.table("exec0801.data"); rt
Tst <- c(8.1, 2.0)
knn(train = rt[,1:2], test = Tst, cl = rt[,3], k = 3) 
knn(train = rt[,1:2], test = Tst, cl = rt[,3], k = 5) 

## 6. 
rt <- read.table("exec0802.data"); rt
knn.sol <- knn.cv(train = rt[, 2:5], cl = rt[,1], k = 5) 
table(true_class = rt[,1], predict = knn.sol)

## 7. 
rt <- read.table("exec0805.data"); rt

d <- dist(scale(rt))
hc1 <- hclust(d);             hc2 <- hclust(d, "average")
hc3 <- hclust(d, "centroid"); hc4 <- hclust(d, "ward.D")

win.graph(width=11, height=7)
opar<-par(mfrow=c(2,1), mar=c(5.2,4,1.5,0))
plot(hc1, hang=-1); re1<-rect.hclust(hc1, k=4, border="red")
plot(hc2, hang=-1); re2<-rect.hclust(hc2, k=4, border="red")
par(opar)

opar<-par(mfrow=c(2,1), mar=c(5.2,4,1.5,0))
plot(hc3,hang=-1); re3<-rect.hclust(hc3,k=4,border="red")
plot(hc4,hang=-1); re4<-rect.hclust(hc4,k=4,border="red")
par(opar)

km <- kmeans(rt, centers=4,  iter.max = 100)
sort(km$cluster)

## 8.
rt <- read.table("../chap03/applicant.data"); rt
r <- cor(rt)

d <- as.dist(1-r)
hc1 <- hclust(d);             hc2 <- hclust(d, "average")
hc3 <- hclust(d, "centroid"); hc4 <- hclust(d, "ward.D")

win.graph(width=11, height=7)
opar<-par(mfrow=c(2,1), mar=c(5.2,4,1.5,0))
plot(hc1, hang=-1); re1<-rect.hclust(hc1, k=5, border="red")
plot(hc2, hang=-1); re2<-rect.hclust(hc2, k=5, border="red")
par(opar)

opar<-par(mfrow=c(2,1), mar=c(5.2,4,1.5,0))
plot(hc3,hang=-1); re3<-rect.hclust(hc3,k=5,border="red")
plot(hc4,hang=-1); re4<-rect.hclust(hc4,k=5,border="red")
par(opar)

km <- kmeans(r, centers=5,  iter.max = 100)
sort(km$cluster)
