win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

x<-seq(from=-4, to=4, by=0.1)
plot(x, dnorm(x, mean=0, sd=1), type="l", lwd=2,
     col="blue", xlim=c(-4, 10), xlab="X", ylab="Density")
x<-seq(from=-2, to=10, by=0.1)
lines(x, dnorm(x, mean=4, sd=2), col="red", 
      lty=5, lwd=2)
abline(h=0)
segments(c(0, 4), c(0,0), c(0, 4), c(dnorm(0), dnorm(4, mean=4, sd=2)))
z<-1.65; dz<-dnorm(z)
segments(z, 0, z, dz, col=6, lwd=2, lty=4)
points(z,0, pch=19, cex=1.4, col="brown")

ex1<-expression(paste(mu==0,",",sigma==1))
ex2<-expression(paste(mu==4,",",sigma==2))
legend(6.5, .4, legend=c(ex1, ex2, "Point A"), lty=c(1, 5, NA),
       pch=c(NA, NA, 19),
       col=c("blue", "red", "brown"))

savePlot("mahala", type="eps")
