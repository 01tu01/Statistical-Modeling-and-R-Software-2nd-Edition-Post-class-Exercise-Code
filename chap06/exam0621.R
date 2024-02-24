life <- read.table("exam0621.data")
glm.sol <- glm(Y ~ ., family = binomial, data = life)
summary(glm.sol)

glm.step <- step(glm.sol, trace = 0)
summary(glm.step)

new1 <- data.frame(X2 = 2, X3 = 0)
predict(glm.step, newdata = new1, type = "response")
new2 <- data.frame(X2 = 2, X3 = 1)
predict(glm.step, newdata = new2, type = "response")

im <- influence.measures(glm.step)
all(im$is.inf==FALSE)

