source("var1.test.R")
X <- c(249, 247, 249, 250, 249, 249, 251, 251, 251, 251)
var1.test(X, sigma2 = 3.2^2, alternative = "less")