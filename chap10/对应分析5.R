(X.corresp <- corresp(X, nf=2))
par(mai = c(0.6, 0.6, 0.6, 0.6))
biplot(X.corresp)
biplot(X.corresp, type = "r")
biplot(X.corresp, type = "c")

Tr <- X.corresp$rscore %*% diag(X.corresp$cor); Tr
Tc <- X.corresp$cscore %*% diag(X.corresp$cor); Tc

text(Tr, label = rownames(X.corresp$rscore), col = 4)
text(Tc, label = rownames(X.corresp$cscore), col = 4)

text(X.corresp$rscore, label=rownames(X.corresp$rscore), col=4)
text(X.corresp$cscore, label=rownames(X.corresp$cscore), col=4)

rho <- min(max(Tr)/max(Tc), min(Tr)/min(Tc)); rho
text(Tr/rho, label=rownames(X.corresp$rscore), col=4)

biplot(X.corresp, xlim = c(-.9, 1))

abline(v=-1, h=-1)

