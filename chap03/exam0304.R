source("kurt.R"); w <- scan("exam0301.data")
kurt(w)

library("e1071")
kurtosis(w) 
kurtosis(w, type = 1)
kurtosis(w, type = 2)

