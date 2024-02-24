inp <- scan(,list(Method="",  M15=0,  M30=0,  M45=0,  M60=0,
                  M80=0, F15=0, F30=0, F45=0, F60=0,  F80=0))
Poison 1160 2823 2465 1531  938  921 1672 2224 2283 1548
Gas     335  883  625  201   45   40  113   91   45   29
Hang   1524 2751 3936 3581 2948  212  575 1481 2014 1355
Drown    67  213  247  207  212   30  139  354  679  501
Gun     512  852  875  477  229   25   64   52   29    3
Jump    189  366  244  273  268  131  276  327  388  383

rt<-data.frame(inp)
rt <- rt[2:11]
rownames(rt) <- inp$Method
rt

apply(rt, 1, sum)
apply(rt, 2, sum)

library(MASS)
(rt.corresp <- corresp(rt,nf=2))
plot(rt.corresp)
biplot(corresp(rt, nf = 2))
abline(h=0, v=0)

rt.corresp$cor
rt.corresp$rscore
rt.corresp$cscore

plot(rt.corresp$rscore, pch=8, xlim=c(-2.3,1.9), ylim=c(-2.3, 1.5), col=2, 
     xlab="Dimension 1", ylab="Dimension 2")
text(rt.corresp$rscore, adj=1.2, labels=rownames(rt), col=2)

points(rt.corresp$cscore, pch=16, col=4, cex=1.1)
text(rt.corresp$cscore, adj=c(0.5,-1), labels=colnames(rt), col=4)


?mca             
?corresp

inp <- scan(,list(Position="",  A=0, B=0, C=0, D=0))
P0 30 10  10 39
P1 53  4  16  2
P2 73  1  41  1
P3 20  6   1  4
P4 46 36  37 13
P5 45  6  59 10
P6 16 28 169  5

rt<-data.frame(inp)
rt <- rt[2:5]
rownames(rt) <- inp$Position
rt

(rt.corresp <- corresp(rt, nf = 2))
biplot(corresp(rt, nf = 2))
abline(h=0, v=0)


plot(rt.corresp$rscore, pch=15, xlim=c(-1.5,1.8), ylim=c(-2.3, 1.5), 
     cex=1.1, col=2, xlab="Dimension 1", ylab="Dimension 2")
text(rt.corresp$rscore, adj=1.2, labels=rownames(rt), col=2)

points(rt.corresp$cscore, pch=16, col=4, cex=1.1)
text(rt.corresp$cscore, adj=c(0.5,-1), labels=colnames(rt), col=4)

