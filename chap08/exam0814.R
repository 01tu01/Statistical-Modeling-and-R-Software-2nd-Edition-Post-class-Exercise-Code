rt <- read.table("exam0801.data")

library(e1071)
model <- naiveBayes(G ~ X1 + X2, data = rt)
predict(model, newdata = data.frame(X1 = 23.5, X2 = -1.6))
predict(model, data.frame(X1 = 23.5, X2 = -1.6), type = "raw")

predict(model, newdata = rt)

model <- naiveBayes(x = rt[ ,1:2], y = rt[ ,3])
