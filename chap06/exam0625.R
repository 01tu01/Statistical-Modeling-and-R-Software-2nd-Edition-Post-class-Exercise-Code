cl <- read.table("exam0625.data")
nls.sol <- nls(Y ~ a + (0.49-a) * exp(-b*(X-8)), data = cl,
               start = list( a= 0.1, b = 0.01 ))
summary(nls.sol)

xfit <- seq(8, 44, len = 200)
yfit <- predict(nls.sol, data.frame(X = xfit))
with(cl, plot(X, Y, pch = 19, cex = 1.2, col = 4))
lines(xfit,yfit, lwd=2, col=2)

sigma(nls.sol)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

savePlot("cl", type = "eps")

vcov(nls.sol)

confint(nls.sol)

##---------------------------------------------------##
fn <- function(a, b, X){
    f1 <- 1 - exp(-b*(X-8))
    f2 <- -(0.49-a) * (X-8) * exp(-b*(X-8))
    cbind(f1, f2)
}

z <- nls.sum$parameters[,1]; a <- z[1]; b <- z[2]
D <- fn(a, b, cl$X); D
theta.var <- nls.sum$sigma^2 * solve(t(D)%*%D)

sqrt(diag(theta.var))

nls.sum$parameters[,2]



