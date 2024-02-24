rt <- read.table("../chap09/exam0901.data"); rt
colnames(rt) <- c("身高", "体重", "胸围", "坐高")
student.pr <- princomp(rt)

par(mai=c(0.8, 0.8, 0.5, 0.5))
biplot(student.pr, scale = 0.5, xlim = c(-2.1, 2.3))

savePlot("exam1011", type="bmp")