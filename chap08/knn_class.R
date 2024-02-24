rt <- read.table("exam0801.data")
rtrain <- rt[ ,1:2]; cl <- rt[ ,3]; test <- c(23.5, -1.6)
knn(train, test, cl, k = 3, prob = TRUE)


num <- c(1:40, 51:90, 101:140)
X <- iris[num, 1:4]; G <- iris[num, 5]
Tst <- iris[-num, 1:4]
knn(train = X, test = Tst, cl = G, k = 5, prob = TRUE)

knn_class <- knn.cv(train = iris[,1:4], cl=true_class, k = 3)
table(knn_class, true_class = iris[,5])

?naiveBayes

train <- rt[ ,1:2]; cl <- rt[ ,3]
model <- naiveBayes(x = train, y = cl)
predict(model, newdata = data.frame(X1 = 23.5, X2 = -1.6))

model <- naiveBayes(G ~ X1 +X2, data = rt)
pre <- predict(model, newdata = data.frame(X1 = 23.5, X2 = -1.6))
pre <- predict(model, newdata = data.frame(X1 = 23.5, X2 = -1.6), type = "raw")


m <- naiveBayes(Species ~ ., data = iris)
table(predict = predict(m, iris[,1:4]), true_class = iris[,5])
