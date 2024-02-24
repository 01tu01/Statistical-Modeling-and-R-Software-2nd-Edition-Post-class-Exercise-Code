## 1
rt <- read.table("exec0901.data")
pca <- princomp(rt, cor = TRUE)
summary(pca, loadings = TRUE)

pred <- predict(pca); pred

sort(pred[,1], decreasing = TRUE)
sort(pred[,2], decreasing = TRUE)
sort(pred[,3])

plot(pred[,1:2], type="n")
text(pred[,1:2], labels = rownames(rt))

plot(pred[,c(1,3)], type="n")
text(pred[,c(1,3)])

plot(pred[,2:3], type="n")
text(pred[,2:3])

## 2
rt <- read.table("exec0902.data")
pca <- princomp(~ X1 + X2 + X3 + X4, data = rt, cor = TRUE)
summary(pca, loadings = TRUE)

lm.sol <- lm(Y ~ X1 + X2 + X3 + X4, data = rt)
summary(lm.sol)

source("../chap06/VIF.test.R")
VIF.test(rt[,1:4])

pred <- predict(pca); pred
rt$z <- pred[,1]
lm.pc <- lm(Y ~ z, data = rt)
summary(lm.pc)

beta <- coef(lm.pc); A <- loadings(pca)
x.bar <- pca$center; x.sd <- pca$scale
coef <- (beta[2]*A[,1]) / x.sd
beta0 <- beta[1] - sum(x.bar * coef)
c(beta0, coef)

## 3
z <- scan("../chap08/exam0813.data"); z
names <-c("身高", "手臂长", "上肢长", "下肢长", "体重", "颈围",
          "胸围", "胸宽")
r <- matrix(1, nc = 8, nr = 8, dimnames = list(names, names))
for (i in 1:7){
    for( j in 1:i){
        r[i+1,j] <- r[j, i+1]<-z[i*(i-1)/2+j]
    }
}
r

factanal(factors = 2, covmat = r)

## 4 
X <- read.table("../chap03/course.data")
fa <- factanal(~., factors = 2, data = X, scores = "regression")
fa <- factanal(~., factors = 2, data = X, scores = "Bartlett")
plot(fa$scores, type = "n")
text(fa$scores)

win.graph(width=8, height=7)
par(mai=c(0.9, 0.9, 0.1, 0.1))

## 5 
rt <- read.table("exec0905.data")
rt <- scale(rt)
ca <- cancor(rt[,1:3], rt[,4:6])
ca

U <- as.matrix(rt[, 1:3]) %*% ca$xcoef
V <- as.matrix(rt[, 4:6]) %*% ca$ycoef

plot(U[,1], V[,1], xlab = "U1", ylab = "V1", pch = 19, col = 4)
plot(U[,3], V[,3], xlab = "U3", ylab = "V3", pch = 19, col = 4)

source("corcoef.test.R")
corcoef.test(r = ca$cor, n = 40, p = 3, q = 3, alpha = 0.05)

