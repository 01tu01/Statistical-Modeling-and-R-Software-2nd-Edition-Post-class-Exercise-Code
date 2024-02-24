source("discriminiant.distance.R")
num <- c(1:40, 51:90, 101:140)
X <- iris[num, 1:4]; G <- iris[num, 5]
Tst <- iris[-num, 1:4]
sol <- discriminiant.distance(X, G, Tst, var.equal = TRUE)
sol <- discriminiant.distance(X, G, Tst)
sum(sol == iris[-num, 5])

library(MASS)
lda.sol <- lda(X, G)
predict(lda.sol, newdata = Tst)$class

qda.sol <- qda(X, G)
predict(qda.sol, newdata = Tst)$class

