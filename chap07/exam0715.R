cotton <- data.frame(
     Y = c(0.30, 0.35, 0.20, 0.30, 0.15, 0.50, 0.15, 0.40),
     A = gl(2, 4), B = gl(2, 2, 8), C = gl(2, 1, 8)
)
cotton.aov <- aov(Y ~ A + B + C + A:B + A:C + B:C, data = cotton)
summary(cotton.aov)

cotton.new <- aov(Y ~ B + C + A:C, data = cotton)
summary(cotton.new)

attach(cotton)
cotton$AC <- c(rep(1:2, 2), rep(2:1, 2))
z <- c(tapply(Y, A, mean), tapply(Y, B, mean), tapply(Y, C, mean),
       tapply(Y, AC, mean))
detach(cotton)

K <- matrix(z, nrow=2, ncol=4, 
     dimnames=list(1:2, c("A", "B", "C", "AC")))
K