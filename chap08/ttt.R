rt <- read.table("ttt.data")
rt

library(MASS)
lda.sol <- lda(type ~., data=rt)
lda.pre <- predict(lda.sol)

plot(lda.pre$x, type="n")
points(1:12, lda.pre$x[1:12], col=2, pch = 21)
points(13:35, lda.pre$x[13:35], col=4, pch = 23)
abline(h=-1)

a <- lda.sol[[4]]
b <- apply(rt[,2:8], 2, mean) %*% a

(as.matrix(rt[,2:8]) %*% a) - as.numeric(b)

qda.sol <- qda(type ~., data=rt)
qda.pre <- predict(qda.sol)
