rt <- read.table("exam0610.data")
lm.sol <- lm(Y ~ 1 + X1 + X2 + X3 + X4, data = rt)
summary(lm.sol)

lm.step <- step(lm.sol)
summary(lm.step)
drop1(lm.step, test = "Chisq")
drop1(lm.step, test = "F")
lm.opt <- update(lm.step, Y ~ . - X4); summary(lm.opt)

n <- nrow(rt)
lm.step <- step(lm.sol, k = log(n))

rt <- read.table("exam0610.data")
lm0.sol <- lm(Y ~ 1, data = rt)
lm.step <- step(lm0.sol,  scope = ~ X1 + X2 + X3 + X4)
lm.step <- step(lm0.sol,  scope = ~ X1 + X2 + X3 + X4, k = log(n))
  
