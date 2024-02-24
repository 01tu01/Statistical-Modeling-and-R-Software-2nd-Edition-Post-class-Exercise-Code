rt <- read.table("exam0618.data")
XX <- cor(rt[, 2:7])
kappa(XX, exact=TRUE)
eigen(XX)

source("VIF.test.R"); VIF.test(rt[,-1])

library(car)
vif(lm(Y ~ X1 + X2 + X3 + X4 + X5 + X6, data = rt))


