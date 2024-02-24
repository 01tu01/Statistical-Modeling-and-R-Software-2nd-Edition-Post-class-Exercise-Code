x <- scan()
1160 2823 2465 1531  938  921 1672 2224 2283 1548
 335  883  625  201   45   40  113   91   45   29
1524 2751 3936 3581 2948  212  575 1481 2014 1355
  67  213  247  207  212   30  139  354  679  501
 512  852  875  477  229   25   64   52   29    3
 189  366  244  273  268  131  276  327  388  383

X <- matrix(x, nrow=6, byrow=T)
rownames(X) <- c("Poison", "Gas", "Hang", "Drown", "Gun", "Jump")
colnames(X) <- c("M15", "M30", "M45", "M60", "M80", 
                 "F15", "F30", "F45", "F60", "F80")

library(MASS)
(X.corresp <- corresp(X,nf=2))
biplot(X.corresp)

source("correspPlot.R")
correspPlot(X.corresp)

##-------------------------------------------------------------##
colnames(caith) <- paste(colnames(caith), "hair")
rownames(caith) <- paste(rownames(caith), "eys")
(caith.corresp <- corresp(caith, nf = 2))

par(mai = rep(0.6, 4))
biplot(caith.corresp, xlim=c(-.6, .8))

chisq.test(caith)

##-------------------------------------------------------------##
X <- matrix(c(60, 3, 32, 11), nc = 2)
rownames(X) <- c("ÎüÑÌ", "²»ÎüÑÌ")
colnames(X) <- c("»¼·Î°©", "Î´»¼·Î°©")
corresp(X)

