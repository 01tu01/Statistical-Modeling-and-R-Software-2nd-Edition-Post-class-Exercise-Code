X <- scan("../chap01/sample.data", nlines = 2)
Y <- scan("../chap01/sample.data", skip = 2)
source("interval_var2.R")
interval_var2(X, Y, mu = c(80, 80))
interval_var2(X, Y)

var.test(X, Y)
