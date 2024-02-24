##%% ��һ��, ��������
X <- scan("../chap03/exam0308.data")
        
##%% �ڶ���, ����ͼ���
A <- table(cut(X, br = c(0, 69, 79, 89, 100)))

##%% ������, �������۷ֲ�
F <- pnorm(c(70, 80, 90, 100), mean(X), sd(X))
p <- c(F[1], F[2]-F[1], F[3]-F[2], 1-F[3])

##%% ���Ĳ�, ������
chisq.test(A, p = p)

##%% ���¼���
n <- length(X)
F <- pnorm(c(70, 80, 90, 100), mean(X), sqrt((n-1)/n)*sd(X))
p <- c(F[1], F[2]-F[1], F[3]-F[2], 1-F[3])
source("chi2gof.R")
chi2gof(chisq.test(A, p = p), 2)