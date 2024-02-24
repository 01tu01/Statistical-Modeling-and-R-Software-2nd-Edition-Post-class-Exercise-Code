rt <- read.table("exam1010.data")
pr <- princomp(rt, cor = T)
par(mai=c(0.8, 0.8, 0.5, 0.5))
biplot(pr, cex = 0.7)
