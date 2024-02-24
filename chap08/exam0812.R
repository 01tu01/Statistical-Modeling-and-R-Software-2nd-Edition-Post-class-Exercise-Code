rt <- read.table("exam0801.data")
train <- rt[ ,1:2]; cl <- rt[ ,3]; test <- c(23.5, -1.6)
knn(train, test, cl, k = 3, prob = TRUE)
knn(train, test, cl, k = 5, prob = TRUE)
