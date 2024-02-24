library(MASS)
par(mai = rep(0.6, 4))
rt <- read.table("exam1009.data")
(ct <- corresp(~ ¹¦ÓÃ + ´ÏÓ±ÐÔ, data = rt, nf = 2))
biplot(ct, xlim = c(-0.4, 0.4))
savePlot("exam1009", type = "bmp")


