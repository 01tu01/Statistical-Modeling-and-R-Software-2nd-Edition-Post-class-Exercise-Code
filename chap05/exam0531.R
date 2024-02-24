X <- scan("exam0531.data")
binom.test(sum(X>99), length(X), al = "l")
