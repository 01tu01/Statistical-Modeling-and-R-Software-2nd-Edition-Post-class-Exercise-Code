rt <- read.table("exam0622.data")
glm.sol <- glm(Y ~ 1 + X1 + X2 + X3, family = poisson(link = log), 
               data = rt)
summary(glm.sol)

new <- data.frame(
    X1 = rep(0:1, each = 4), 
    X2 = rep(0:1, each = 2, len = 8),
    X3 = rep(0:1, 4)
)

pre <- predict(glm.sol, newdata = new, type = "response", 
        se.fit = TRUE)
new$predict <- pre$fit
new$SE <- pre$se.fit
