x <- 0:10
y <- dbinom(x, size=10, prob=0.3)
y <- dbinom(x, size=10, prob=0.7)
win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))
plot(x, y, xlab = "x", ylab = "Probability", type = "h")

savePlot("mvnorm_75", type = "eps")

y <- dpois(x, lambda = 4)

##----------------------------------------------------------------##
rm(list=ls(all=TRUE))
x <- seq(from = -3, to = 4, by = 0.05)
y <- dnorm(x, mean = 0, sd = 0.5)
z <- dnorm(x, mean = 2, sd = 0.5)
u <- dnorm(x, mean = 0, sd = 1)

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))
plot(x, y, type="l", col = "blue", lwd = 2, xlab = "x", ylab = "Density")
lines(x, z, col = "red", lwd = 2, lty = 5)
lines(x, u, col = "brown", lwd = 2, lty = 4)
abline(v=c(0,2))
expr1 <- expression(paste(mu == 0,",  ",sigma == 0.5))
expr2 <- expression(paste(mu == 2,",  ",sigma == 0.5))
expr3 <- expression(paste(mu == 0,",  ",sigma == 1))
legend(-3, 0.8,  legend= c(expr1, expr2, expr3), lwd=2, 
       lty=c(1, 5, 4), col = c("blue", "red", "brown") )

##--------------------------------------------------------------##
rm(list=ls(all=TRUE))
library(mvtnorm)
par(mai=c(0.2, 0.2, 0, 0))
r <- 0  ## r <- 0.75
Sigma<-matrix(c(1, r, r, 1), nc=2)
x <- seq(from=-2.5, to= 2.5, length.out=51)
y <- seq(from=-2.5, to= 2.5, length.out=51)
z <- dmvnorm(expand.grid(x,y),
           mean = c(0,0), sigma = Sigma)
Z <- matrix(z, nr=length(x), nc=length(y))
persp(x,y,Z, theta=-30, phi=30, expand=.7)

##----------------------------------------------------------------##
rm(list=ls(all=TRUE))
x <- seq(from = 0, to = 18, by = 0.1)
y1 <- dchisq(x, df = 1)
y4 <- dchisq(x, df = 4)
y10 <- dchisq(x, df = 10)

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))
plot(x, y1, type="l", col = "brown", lwd = 2, lty = 4, 
     xlim = c(0, 18), ylim = c(0, 0.22), xlab = "x", ylab = "Density")
lines(x, y4, col = "blue", lwd = 2, lty = 1)
lines(x, y10, col = "red", lwd = 2, lty = 5)
expr1 <- expression(n == 1)
expr2 <- expression(n == 4)
expr3 <- expression(n == 10)
legend(14.5, 0.215,  legend = c(expr1, expr2, expr3), lwd=2, 
       lty=c(4, 1, 5), col = c("brown", "blue", "red") )

savePlot("chisq_plot", type = "eps")

##----------------------------------------------------------------##
rm(list=ls(all=TRUE))
x <- seq(from = -5, to = 5, by = 0.1)
y1 <- dt(x, df = 1)
y2 <- dt(x, df = 2)
y4 <- dt(x, df = 4)
y30 <- dt(x, df = 30)

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))
plot(x, y1, type="l", col = "brown", lwd = 2, lty = 4, 
     xlim = c(-5, 5), ylim = c(0, 0.4), xlab = "x", ylab = "Density")
lines(x, y2, col = "blue", lwd = 2, lty = 1)
lines(x, y4, col = "red", lwd = 2, lty = 5)
lines(x, y30, col = "green", lwd = 2, lty = 2)
abline(v=0, h=0)

expr1 <- expression(n == 1)
expr2 <- expression(n == 2)
expr3 <- expression(n == 4)
expr4 <- expression(n == 30)
legend(-5, 0.4,  legend = c(expr1, expr2, expr3, expr4), lwd=2, 
       lty=c(4, 1, 5, 2), col = c("brown", "blue", "red", "green") )

savePlot("t_plot", type = "eps")

##----------------------------------------------------------------##
rm(list=ls(all=TRUE))
x <- seq(from = 0, to = 4, by = 0.05)
y1 <- df(x, df1 = 3, df2 = 15)
y2 <- df(x, df1 = 7, df2 = 15)
y3 <- df(x, df1 = 15, df2 = 15)

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))
plot(x, y1, type="l", col = "brown", lwd = 2, lty = 4, 
     xlim = c(0, 4), ylim = c(0, 0.9), xlab = "x", ylab = "Density")
lines(x, y2, col = "blue", lwd = 2, lty = 1)
lines(x, y3, col = "red", lwd = 2, lty = 5)
expr1 <- expression(paste(n[1] == 3,",  ",n[2] == 15))
expr2 <- expression(paste(n[1] == 7,",  ",n[2] == 15))
expr3 <- expression(paste(n[1] == 15,",  ",n[2] == 15))

legend(2.7, 0.9,  legend = c(expr1, expr2, expr3), lwd=2, 
       lty=c(4, 1, 5), col = c("brown", "blue", "red") )

savePlot("F_plot", type = "eps")

##----------------------------------------------------------------##
rm(list=ls(all=TRUE))
x <- seq(from = 0, to = 18, by = 0.1)
y <- dchisq(x, df = 6)

win.graph(width=8, height=7)
par(mai=c(0, 0, 0, 0))
plot(x, y, type="l", col = "blue", lwd = 2, lty = 1, 
     xlim = c(0, 18), ylim = c(-0.005, 0.14), xlab = "x", ylab = "Density")
abline(h=0)
xa <- qchisq(0.95, df = 6)
xx <- seq(xa, 18, by=0.1)
polygon(c(xa, xx, 18), 
        c(0, dchisq(xx, df = 6), 0), 
        col="yellow1")
text(xa, -0.005, expression(x[alpha]), adj=0.4, cex=1.1)


plot(x, y, type="l", col = "blue", lwd = 2, lty = 1, 
     xlim = c(0, 18), ylim = c(-0.005, 0.14), xlab = "x", ylab = "Density")
abline(h=0)
xa <- qchisq(0.10, df = 6)
xx <- seq(0, xa, by=0.1)
polygon(c(0, xx, xa), 
        c(0, dchisq(xx, df = 6), 0), 
        col="yellow1")
text(xa, -0.005, expression(x[p]), adj=0.4, cex=1.1)

savePlot("quantile_plot2", type = "eps")


