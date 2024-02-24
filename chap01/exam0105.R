X <- scan("sample.data", nlines = 2)
Y <- scan("sample.data", skip = 2)
source("t.stat.R"); t.stat(X, Y)
