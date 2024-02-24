x <- seq(from = -3, to = 3, by = 0.1)
y <- dnorm(x)

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))
plot(x, y, type="l", col = "blue", lwd = 2, lty = 1, 
     xlim = c(-3, 3), ylim = c(-0.01, 0.42), xlab = "x", ylab = "Density")
abline(h=0)
za <- qnorm(1-0.05/2)
xx <- seq(za, 3, by=0.05)
polygon(c(za, xx, 3), 
        c(0, dnorm(xx), 0), 
        col = "yellow1")
text(za, -0.015, expression(z[alpha/2]), adj=0.4, cex=1.1)

xx <- seq(-3, -za, by=0.05)
polygon(c(-3, xx, -za), 
        c(0, dnorm(xx), 0), 
        col ="yellow1")
text(-za, -0.015, expression(-z[alpha/2]), adj=0.4, cex=1.1)

text(-2.5,  0.015, expression(alpha/2), adj=0.0, cex=1.2)
text(2.0,  0.015, expression(alpha/2), adj=0.0, cex=1.2)
text(-0.45, 0.18, expression(1-alpha), adj=0.0, cex=2)

savePlot("norm_quantile2", type = "eps")

##----------------------------------------------------------------##
rm(list=ls(all=TRUE))
x <- seq(from = -3, to = 3, by = 0.1)
y <- dnorm(x)

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))
plot(x, y, type="l", col = "blue", lwd = 2, lty = 1, 
     xlim = c(-3, 3), ylim = c(-0.01, 0.42), xlab = "x", ylab = "Density")
abline(h=0)
za <- qnorm(1-0.05)
xx <- seq(za, 3, by=0.05)
polygon(c(za, xx, 3), 
        c(0, dnorm(xx), 0), 
        col = "yellow1")
text(za, -0.015, expression(z[alpha]), adj=0.4, cex=1.1)

xx <- seq(-3, -za, by=0.05)
polygon(c(-3, xx, -za), 
        c(0, dnorm(xx), 0), 
        col ="yellow1")
text(-za, -0.015, expression(-z[alpha]), adj=0.4, cex=1.1)

text(-2.1,  0.02, expression(alpha), adj=0.0, cex=1.3)
text(2.0,  0.02, expression(alpha), adj=0.0, cex=1.3)
text(-0.45, 0.18, expression(1-alpha), adj=0.0, cex=2)

##----------------------------------------------------------------##
rm(list=ls(all=TRUE))
x <- seq(from = 0, to = 18, by = 0.1)
y <- dchisq(x, df = 6)

win.graph(width=8, height=6)
par(mai=c(0.0, 0.0, 0.0, 0.0))
plot(x, y, type="l", col = "blue", lwd = 2, lty = 1, 
     xlim = c(0, 18), ylim = c(-0.005, 0.14), xlab = "x", ylab = "Density")
abline(h=0)
xa <- qchisq(0.95, df = 6)
xx <- seq(xa, 18, by=0.1)
polygon(c(xa, xx, 18), 
        c(0, dchisq(xx, df = 6), 0), 
        col="yellow1")
text(xa, -0.005, expression(chi[alpha/2]), adj=0.4, cex=1.1)

xa <- qchisq(0.05, df = 6)
xx <- seq(0, xa, by=0.1)
polygon(c(0, xx, xa), 
        c(0, dchisq(xx, df = 6), 0), 
        col="yellow1")
text(xa, -0.005, expression(chi[1-alpha/2]), adj=0.4, cex=1.1)

text(4, 0.05, expression(1-alpha), adj=0.0, cex=2)

savePlot("chisq_quantile", type = "eps")




