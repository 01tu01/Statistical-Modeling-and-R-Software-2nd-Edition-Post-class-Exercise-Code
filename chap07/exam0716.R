mosquito <- data.frame(
    A = gl(3, 12), B = gl(3, 4, 36),
    C = factor(rep(c(1, 2, 3, 2, 3, 1, 3, 1, 2), rep(4, 9))),
    D = factor(rep(c(1, 2, 3, 3, 1, 2, 2, 3, 1), rep(4, 9))),
    Y = scan("exam0716.data")
  )
mosquito.aov <- aov(Y ~ A + B + C + D, data = mosquito)
summary(mosquito.aov)

attach(mosquito)
z <- c(tapply(Y, A, mean), tapply(Y, B, mean),
       tapply(Y, C, mean), tapply(Y, D, mean))  
K <- matrix(z, nrow = 3, ncol = 4, 
     dimnames = list(1:3, c("A", "B", "C", "D")))
detach(mosquito)

K

