intellect <- read.table("exam0617.data")
lm.sol<-lm(Y ~ 1 + X, data = intellect)
summary(lm.sol)

(IM <- influence.measures(lm.sol))
IM$infmat
IM$is.inf[18:19,]

attach(intellect)
win.graph(width=8, height=7)
opar <- par(mfrow = c(2, 2), oma = c(0, 0, 1.1, 0),
            mar = c(4.1, 4.1, 2.1, 1.1))
plot(lm.sol, 1); plot(lm.sol, 3); plot(lm.sol, 4)
plot(X, Y); x <- X[18:19]; y <- Y[18:19]
text(x, y, labels = 18:19, adj = 1.2); abline(lm.sol)
par(opar)

savePlot("intellect_t", type = "eps")