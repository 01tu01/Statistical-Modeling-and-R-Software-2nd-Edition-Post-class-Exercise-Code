source("discriminiant.bayes.R")
num <- c(1:40, 51:90, 101:140)
X <- iris[num, 1:4]; G <- iris[num, 5]
Tst <- iris[-num, 1:4]
sol <- discriminiant.bayes(X, G, Tst, var.equal = TRUE)
sol <- discriminiant.bayes(X, G, Tst)

sum(sol == iris[-num, 5])
