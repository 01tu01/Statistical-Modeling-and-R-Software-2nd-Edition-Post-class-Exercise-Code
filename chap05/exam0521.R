##%% 输入数据
X <- 0:6; Y <- c(7, 10, 12, 8, 3, 2, 0)

##%% 计算理论分布, 其中lambda为样本均值
lambda <- weighted.mean(X, Y)
F <- ppois(X, lambda); n <- length(Y) 
p <- F; p[n] <- 1 - F[n-1]
for (i in 2:(n-1)) p[i] <- F[i] - F[i-1]

##%% 作检验
chisq.test(Y, p = p)

##%% 重新分组并计算
X <- 0:4; Y <- c(7, 10, 12, 8, 5)
F <- ppois(X, lambda); n <- length(Y) 
p <- F; p[n] <- 1 - F[n-1]
for (i in 2:(n-1)) p[i] <- F[i] - F[i-1]
chisq.test(Y, p = p)

##%% 重新计算
source("chi2gof.R")
chi2gof(chisq.test(Y, p = p), 1)
