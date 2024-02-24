rt <- read.table("exam1007.data")
chisq.test(rt) 

library(MASS)
(X.corresp <- corresp(rt, nf = 2))

par(mai = rep(0.6, 4))
biplot(X.corresp)
biplot(X.corresp, type = "rows")
biplot(X.corresp, type = "columns")

savePlot("exam1007", type = "eps")

