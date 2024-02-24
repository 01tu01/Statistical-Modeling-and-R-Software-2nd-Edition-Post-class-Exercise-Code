x <- c(0.10,0.11,0.12,0.13,0.14,0.15,0.16,0.17,0.18,0.20,0.21,0.23)
y <- c(42.0,43.5,45.0,45.5,45.0,47.5,49.0,53.0,50.0,55.0,55.0,60.0)
lm.sol <- lm(y ~ 1 + x)
summary(lm.sol)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))
plot(x, y, pch = 19, cex = 1.2, col = 4, xlab = "Ì¼º¬Á¿", ylab = "Ç¿¶È")
abline(lm.sol, lwd=2, col=2)

savePlot("line_reg1", type = "bmp")