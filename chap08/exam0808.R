source("discriminiant.fisher.R")
num <- c(1:40, 51:90, 101:140)
X <- iris[num, 1:4]; G <- iris[num, 5]
Tst <- iris[-num, 1:4]
sol <- discriminiant.fisher(X, G, Tst); #sol

sum(sol == iris[-num, 5])
