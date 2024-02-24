rt <- read.table("exam0914.data")
rt <- scale(rt)
ca <- cancor(rt[,1:3], rt[,4:6])

U <- as.matrix(rt[, 1:3])%*% ca$xcoef
V <- as.matrix(rt[, 4:6])%*% ca$ycoef

plot(U[,1], V[,1], xlab = "U1", ylab = "V1", pch = 19, col = 4)
plot(U[,3], V[,3], xlab = "U3", ylab = "V3", pch = 19, col = 4)

win.graph(width=10, height=8)
par(mai=c(0.9, 0.9, 0.1, 0.1))

savePlot("cancor-2", type = "eps")
