##%% 输入数据
X <- scan("exam0523.data", nlines = 3)
Y <- scan("exam0523.data", skip = 3)
##%% 作K-S检验
ks.test(X, Y)
