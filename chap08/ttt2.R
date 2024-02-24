X <- matrix(
c(-2,  5, 0, 3, -1,  1, 
   0,  6, 2, 4,  1,  2, 
   1, -2, 0, 0, -1, -4), 
nc = 2, byrow = T)
G <- gl(3, 3)

lda.sol <- lda(X,G)

X <- iris[,1:4]; G <- gl(3, 50)


X <- matrix(
c(-2,  5, 0, 3, -1,  1, 
   0,  6, 2, 4,  1,  2),
nc = 2, byrow = T)
G <- gl(2, 3)


Tst <- matrix(
c(1, -2, 0, 0, -1, -4), 
nc = 2, byrow = T)

lda.sol <- lda(X, G)
predict(lda.sol, Tst)