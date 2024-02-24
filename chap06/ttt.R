x <- rnorm(100)
y <- rpois(100, exp(1+x))
glm(y ~ x, family = poisson)

x <- rnorm(100)
y <- rpois(100, exp(1+x))
glm(y ~ x, family = quasi(var = "mu", link = "log"))

glm(y ~ x, family = quasi(var = "mu^2", link = "log"))
y <- rbinom(100, 1, plogis(x))
glm(y ~ x, family = quasi(var = "mu(1-mu)", link = "logit"), 
    start=c(0,1))
