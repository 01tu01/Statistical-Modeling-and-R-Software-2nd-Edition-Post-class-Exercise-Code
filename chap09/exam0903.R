## 读取数据，作回归分析
rt <- read.table("exam0903.data")
lm.sol <- lm(y ~ x1 + x2 + x3, data = rt)
summary(lm.sol)

## 方差膨胀因子检验
source("../chap06/VIF.test.R")
VIF.test(rt[,1:3])

## 主成分分析
conomy.pr <- princomp(~ x1 + x2 + x3, data = rt, cor = T)
summary(conomy.pr, loadings = TRUE)

## 预测，主成分回归
pre <- predict(conomy.pr)
rt$z1 <- pre[,1]; rt$z2 <- pre[,2]
lm.sol <- lm(y ~ z1 + z2, data = rt)
summary(lm.sol)

## 系数变换
beta <- coef(lm.sol); A <- loadings(conomy.pr)
x.bar <- conomy.pr$center; x.sd <- conomy.pr$scale
coef <- (beta[2]*A[,1] + beta[3]*A[,2]) / x.sd
beta0 <- beta[1] - sum(x.bar * coef)

## 列出系数
c(beta0, coef)
