source("discriminiant.fisher.R")
rt <- read.table("exam0801.data")
X <- rt[ ,1:2]; G <- rt[ ,3]; Tst <- c(23.5, -1.6)
discriminiant.fisher(X, G, Tst)
discriminiant.fisher(X, G)

