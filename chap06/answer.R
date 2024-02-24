win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

## 1.
rt <- read.table("exec0601.data")
with(rt, plot(X, Y, pch = 19, cex = 1.2, col = 4))

lm.sol <- lm(Y ~ 1 + X, data = rt)
summary(lm.sol)
abline(lm.sol, col = 2, lwd = 2)

predict(lm.sol, data.frame(X = 7), interval = "p")
predict(lm.sol, data.frame(X = 7), interval = "c")

## 2.
rt <- read.table("exec0602.data")
lm.sol <- lm(Y ~ 1 + X1 + X2 + X3, data = rt)
summary(lm.sol)

lm.step <-step(lm.sol)
lm.step <-step(lm.sol, k = log(nrow(rt)))
summary(lm.step)

## 3.
rt <- read.table("exec0603.data")
lm.sol <- lm(Y ~ 1 + X, data = rt)
with(rt, plot(X, Y, pch = 19, cex = 1.2, col = 4))
abline(lm.sol, col =2, lwd = 2)
summary(lm.sol)

## (3)
res <- resid(lm.sol)
pre <- predict(lm.sol)
plot(pre, res, pch = 19, cex = 1.2, col = 4)

## (4)
lm.sqrt <- lm(sqrt(Y) ~ 1 + X, data = rt)
summary(lm.sqrt)

b <- lm.sqrt$coefficients
pre <- (b[1] + b[2] * rt$X)^2
res <- rt$Y - pre

xx <- seq(1,13, len = 30)
yy <- (b[1] + b[2] * xx)^2
lines(xx, yy, col=3, lwd=2)

savePlot("exec0603-3", type = "eps")

## 4.
rt <- read.table("exam0609.data")
lm.sol <- lm(Y ~ 1 + X1 + X2, data = rt)
summary(lm.sol)

inf <- influence.measures(lm.sol); inf
which(apply(inf$is.inf, 1, any))
inf$infmat[c(5, 8, 9, 24, 26),]
inf$is.inf[c(5, 8, 9, 24, 26),]
plot(lm.sol, 1)

lm.sol <- lm(Y ~ 1 + X1 + X2, data = rt, subset = -c(5, 8))

## 5.
rt <- read.table("exam0610.data")
lm.sol <- lm(Y ~ 1 + X1 + X2 + X3 + X4, data = rt)
summary(lm.sol)

XX <- cor(rt[, -5])
kappa(XX, exact=TRUE)
eigen(XX)
source("VIF.test.R"); VIF.test(rt[,-5])
VIF.test(rt[,-c(4,5)])

## 6.
X1 <- rep(c(1, 0), each = 8);            ##抗生素
X2 <- rep(c(1, 0, 1, 0), c(4, 4, 4, 4)); ##危险因子
X3 <- rep(c(1, 0), times = 8);           ##有计划
Y  <- c( 1, 17, 11, 87, 0,  2, 0, 0, 
        28, 30, 23,  3, 8, 32, 0, 9)
Ymat <- cbind(Y, sum(Y)-Y)
glm.sol <- glm(Ymat ~ 1 + X1 + X2 + X3, family = binomial(link = "logit"))
summary(glm.sol)

glm.step <- step(glm.sol)
summary(glm.step)

## 7.
rt <- read.table("exec0607.data")
glm.sol <- glm(Y ~ ., family = binomial, data = rt)
summary(glm.sol)

glm.step <- step(glm.sol)
summary(glm.step)

predict(glm.step, type = "response")

## 8.
rt <- read.table("exec0608.data")
with(rt, plot(X, Y, pch = 19, cex = 1.2, col = 4))
lm.sol <- lm(Y ~ 1 + X, data = rt)
abline(lm.sol, col = 2, lwd = 2)

lm.sol <- lm(Y ~ 1 + X + I(X^2), data = rt)
summary(lm.sol)
xx <- seq(-0.2, 6.2, len = 22)
yy <- predict(lm.sol, data.frame(X=xx))
lines(xx, yy, col = 3, lwd = 2)

## 9.
rt <- read.table("exec0609.data")
lm.sol <- lm(log(index) ~ 1 + days, data = rt)
summary(lm.sol)

a <- lm.sol$coefficients
theta0 <- exp(a[1]); theta1 <- a[2]

n <- nrow(rt); k <- 2
sigma2 <- sum((theta0*exp(theta1 * rt$days) - rt$index)^2)/(n-k)
sqrt(sigma2)

xx <- seq(0, 68, length.out = 200)
yy <- theta0*exp(theta1*xx)
with(rt, plot(days, index))
lines(xx,yy, col=4)

## (2)
nls.sol <- nls(index ~ theta0 * exp(theta1 * days), data = rt,  
               start = list(theta0 = 40, theta1 = -0.01))
nls.sum <- summary(nls.sol); nls.sum
nls.sum$coefficients
theta0 <- nls.sum$coefficients[1,1]
theta1 <- nls.sum$coefficients[2,1]
confint(nls.sol)
nls.sum$sigma
nls.sum$parameters[,2]

## (3)
fn <- function(p, X, Y){
    f <- p[1] * exp(p[2] * X) - Y
    res <- sum(f^2)
    f1 <-  exp(p[2] * X)
    f2 <-  p[1] * X * exp(p[2] * X) 
    J <- cbind(f1, f2)
    attr(res, "gradient") <- 2*t(J)%*%f
    res
} 

(out <- nlm(fn, p = c(40, -0.01), rt$days, rt$index))
out$estimate
sigma2 <- out$minimum/(n-k); sqrt(sigma2)

## 10.
rt <- read.table("exam0619.data")
nls.sol <- nls(y ~ x/(a*x+b), data = rt, 
           start = list(a = 0.5, b = 0.5))
summary(nls.sol)

## 11.
rt <- read.table("exec0610.data")
with(rt, plot(X,Y))

lm.sol <- lm(1/Y ~ I(1/X), data=rt)
summary(lm.sol)
a <- lm.sol$coefficients
theta1 <- 1/a[1]
theta2 <- a[2]/a[1]

xx <- seq(0, 1.2, len = 30)
yy <- theta1*xx/(theta2+xx)
lines(xx, yy)

## (2)
glm.sol <- glm(Y ~ 1 + I(1/X), family = quasi(link = inverse), data = rt)
summary(glm.sol)
a <- glm.sol$coefficients

## (3)
nls.sol <- nls(Y ~ theta1*X/(theta2+X), data = rt, 
               start = list(theta1=200, theta2=0.05))
nls.sum <- summary(nls.sol); nls.sum

nls.sum$coefficients
theta1 <- nls.sum$coefficients[1,1] 
theta2 <- nls.sum$coefficients[2,1]

 

