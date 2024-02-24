x <- scan()
30 10  10 39
53  4  16  2
73  1  41  1
20  6   1  4
46 36  37 13
45  6  59 10
16 28 169  5

X <- matrix(x, nrow = 7, byrow = T)
dimnames(X) <- list(
    Site = c("P0", "P1", "P2", "P3", "P4", "P5", "P6"),
    Type = c("A", "B", "C", "D")
)

library(MASS)
(X.corresp <- corresp(X, nf=2))

par(mai = rep(0.6, 4))
biplot(X.corresp)
biplot(X.corresp, type = "r")
biplot(X.corresp, type = "c")

source("correspPlot.R")
correspPlot(X.corresp)

##---------------------------------------------------------------##
M <- matrix(c(762, 327, 468, 484, 239, 477), nc = 3, nr = 2, byrow = T)
dimnames(M) <- list(性别 = c("女", "男"),
    党派 = c("民主党", "其他党派", "共和党"))

(M.corresp <- corresp(M, nf=2))

biplot(M.corresp)

source("correspPlot.R")
correspPlot(M.corresp)

##---------------------------------------------------------------##
rt <- read.table("ttt.data"); rt
(ct <- corresp(~ 功用 + 聪颖性, data = rt, nf = 2))
biplot(ct)
, xlim = c(-0.4, 0.4))

(ct <- corresp(~ 功用 + 敏捷性, data = rt, nf = 2))
(ct <- corresp(~ 功用 + 身材, data = rt, nf = 2))
(ct <- corresp(~ 功用 + 体重, data = rt, nf = 2))
(ct <- corresp(~ 功用 + 友善性, data = rt, nf = 2))
(ct <- corresp(~ 功用 + 进攻性, data = rt, nf = 2))

correspPlot(ct)
