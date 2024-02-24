source("skew.R"); w <- scan("exam0301.data")
skew(w)

library("e1071")
skewness(w)
skewness(w, type=1)
skewness(w, type=2)