X <- matrix(c(60, 3, 32, 11), nc = 2)
chisq.test(X, correct = FALSE)
chisq.test(X)

fisher.test(X)
