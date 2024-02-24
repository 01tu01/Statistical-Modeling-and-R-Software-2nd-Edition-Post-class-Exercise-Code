rate <- data.frame(
     A = gl(3, 3), 
     B = gl(3, 1, 9),
     C = factor(c(1, 2, 3, 2, 3, 1, 3, 1, 2)),
     Y = c(31, 54, 38, 53, 49, 42, 57, 62, 64) 
)

rate.aov <- aov(Y ~ A + B + C, data = rate)
summary(rate.aov)