library(MASS)
rt <- read.table("exam0801.data")
X <- rt[ ,1:2]; G <- rt[ ,3]; Tst <- c(23.5, -1.6)

lda.sol <- lda(X, G)
predict(lda.sol, newdata = Tst)$class
predict(lda.sol)$class

qda.sol <- qda(X, G)
predict(qda.sol, newdata = Tst)$class
predict(qda.sol)$class

