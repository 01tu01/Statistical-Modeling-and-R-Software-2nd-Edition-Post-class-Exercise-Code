rt <- read.table("ttt1.data"); rt
pr <- princomp(rt, cor=T)
par(mai=c(0.8, 0.8, 0.5, 0.5))
biplot(pr, cex=0.7)

pr <- prcomp(rt, scale = T)
biplot(pr, cex=0.7, xlim=c(-0.3, 0.5))

#write.csv(rt, "ttt1.csv")

##------------------------------------------------------##
rt <- read.table("../chap09/exam0901.data"); rt
colnames(rt) <- c("身高", "体重", "胸围", "坐高")
student.pr <- princomp(rt)

par(mai=c(0.8, 0.8, 0.5, 0.5))
biplot(student.pr, scale = 0.5, xlim = c(-2.1, 2.3))

savePlot("exam1010", type="bmp")