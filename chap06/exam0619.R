rt <- read.table("exam0619.data")
lm.sol <- lm(1/y~1+I(1/x), data = rt)
summary(lm.sol)

a <- lm.sol$coefficients
xx <- seq(1, 20, len=200)
yy <- xx/(a[1]*xx+a[2])
with(rt, plot(x, y, pch = 19, cex =1.2, col = 4))
lines(xx, yy, lty = 4, col = 3, lwd =2)

glm.sol <- glm(y ~ I(1/x), family = gaussian(link = inverse), data = rt) 
summary(glm.sol)
a <- glm.sol$coefficients
xx <- seq(1, 20, len=200)
yy <- xx/(a[1]*xx+a[2])
lines(xx, yy, lty = 2, lwd =2, col = 2)

legend(15, 2, col = c(3, 2), lty = c(4, 2), lwd = c(2, 2), 
   legend = c("LM", "GLM")) 

savePlot("exam0619", type = "eps")

glm.sol <- glm(y ~ I(1/x), data = rt,  
    family = quasi(link = inverse, var = constant))

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

