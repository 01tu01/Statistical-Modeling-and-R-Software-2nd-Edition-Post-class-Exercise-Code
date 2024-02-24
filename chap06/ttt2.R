X1 <- scan()
0 0 0 1 0 1 0 1 0 1 0 0 0 1 0 1 0 1 0 1 0 1 1 0 1 0 0 1 1 0

X2 <- scan()
1 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 1 0 0 0 1 1 1 0 0 0 0 1 1 0

X3 <- scan()
1 0 0 1 0 1 0 1 0 1 0 1 1 1 0 0 1 1 0 0 1 0 0 1 0 1 0 1 0 1

Y <- scan()
11  7  3  5  2 13  6 10  4  7  1  9  6 17  5 11  8  9  8 
 5  5  8 13  8  6  4  6 13  9  5

data.frame(X1, X2, X3, Y)

fm <- glm(Y ~ 1 + X1 + X2 + X3, family = poisson(link = log))
fm <- glm(Y ~ 1 + X1 + X2 + X3, family = quasi(var = "mu", link = "log"))
fm <- glm(Y ~ 1 + X1 + X2 + X3, family = quasi(var = "mu^2", link = "log"))
summary(fm)

new <- data.frame(
    X1 = rep(0:1, each = 4), 
    X2 = rep(0:1, each = 2, len = 8),
    X3 = rep(0:1, 4)
)

pre <- predict(fm, newdata = new, type = "response", 
        se.fit = TRUE)
new$predict <- pre$fit
new$SE <- pre$se.fit

predict(fm, newdata = new, type = "response")

      



