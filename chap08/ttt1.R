rt <- read.table("exam0802.data"); rt
X <- rt[,1:4]; G <- rt[,5]
source("discriminiant.distance.R")
discriminiant.distance(X, G, var.equal = TRUE)
discriminiant.distance(X, G)

source("discriminiant.bayes.R")
discriminiant.bayes(X, G, var.equal = TRUE)
discriminiant.bayes(X, G)

source("discriminiant.fisher.R")
discriminiant.fisher(X, G)

library(MASS)
lda.sol <- lda(X, G)
predict(lda.sol)$class

qda.sol <- qda(X, G)
predict(qda.sol)$class

