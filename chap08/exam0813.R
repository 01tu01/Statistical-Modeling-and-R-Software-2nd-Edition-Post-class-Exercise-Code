library(class)
num <- c(1:40, 51:90, 101:140)
X <- iris[num, 1:4]; G <- iris[num, 5]; Tst <- iris[-num, 1:4]
knn(train = X, test = Tst, cl = G, k = 5, prob = TRUE)

knn_class <- knn.cv(train = iris[,1:4], cl = iris[,5], k = 3)
table(true_class = iris[,5], predict = knn_class)

