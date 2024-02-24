##%% ��������
X <- 0:6; Y <- c(7, 10, 12, 8, 3, 2, 0)

##%% �������۷ֲ�, ����lambdaΪ������ֵ
lambda <- weighted.mean(X, Y)
F <- ppois(X, lambda); n <- length(Y) 
p <- F; p[n] <- 1 - F[n-1]
for (i in 2:(n-1)) p[i] <- F[i] - F[i-1]

##%% ������
chisq.test(Y, p = p)

##%% ���·��鲢����
X <- 0:4; Y <- c(7, 10, 12, 8, 5)
F <- ppois(X, lambda); n <- length(Y) 
p <- F; p[n] <- 1 - F[n-1]
for (i in 2:(n-1)) p[i] <- F[i] - F[i-1]
chisq.test(Y, p = p)

##%% ���¼���
source("chi2gof.R")
chi2gof(chisq.test(Y, p = p), 1)