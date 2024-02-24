forbes <- read.table("Forbes.data")
lm.sol <- lm(log100 ~ F, data = forbes)

y.res <- residuals(lm.sol)
shapiro.test(y.res)

library(tseries)
jarque.bera.test(y.res)

lm12 <- lm(log100 ~ F, data = forbes, subset = -12)
y12.res <- residuals(lm12)
shapiro.test(y12.res)
jarque.bera.test(y12.res)

