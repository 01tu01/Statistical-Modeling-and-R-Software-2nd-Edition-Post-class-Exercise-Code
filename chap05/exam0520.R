##%% 第一步, 输入数据
X <- scan("../chap03/exam0308.data")
        
##%% 第二步, 分组和记数
A <- table(cut(X, br = c(0, 69, 79, 89, 100)))

##%% 第三步, 构造理论分布
F <- pnorm(c(70, 80, 90, 100), mean(X), sd(X))
p <- c(F[1], F[2]-F[1], F[3]-F[2], 1-F[3])

##%% 第四步, 作检验
chisq.test(A, p = p)

##%% 重新计算
n <- length(X)
F <- pnorm(c(70, 80, 90, 100), mean(X), sqrt((n-1)/n)*sd(X))
p <- c(F[1], F[2]-F[1], F[3]-F[2], 1-F[3])
source("chi2gof.R")
chi2gof(chisq.test(A, p = p), 2)
