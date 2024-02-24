X <- matrix(data = scan("exam0708.data"), 
     ncol = 3, dimnames = list(1:8, c("A", "B", "C"))
)
friedman.test(X)

x <- scan("exam0708.data")
g <- gl(3, 8)
b <- gl(8, 1, 24)
friedman.test(x, g, b)

mouse <- data.frame(
   x = scan("exam0708.data"),
   g = gl(3, 8),
   b = gl(8, 1, 24)
)
friedman.test(x ~ g | b, data = mouse)
