library(e1071)
m <- naiveBayes(Species ~ ., data = iris)
table(true_class = iris[,5], predict = predict(m, iris[,1:4]))
