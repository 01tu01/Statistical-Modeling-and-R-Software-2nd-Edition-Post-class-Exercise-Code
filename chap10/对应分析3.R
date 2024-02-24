x <- scan()
214 48 17
658 92 30
 74 13  3
209  7 18
 99  7  7

X <- matrix(x, ncol = 3, byrow = T)
rownames(X) <- c("中学以下", "中学", "专科", "本科", "研究生")
colnames(X) <- c("白人", "黑人", "其他")

library(MASS)
(X.corresp <- corresp(X, nf=2))
biplot(X.corresp)
biplot(X.corresp, xlim = c(-0.3,0.4))

source("correspPlot.R")
correspPlot(X.corresp)
