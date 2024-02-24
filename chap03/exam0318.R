rubber <- read.table("rubber.data")
apply(rubber, 2, mean)
cov(rubber)
cor(rubber)

cor.test(~ X1 + X2, data = rubber)
cor.test(~ X1 + X3, data = rubber)
cor.test(~ X2 + X3, data = rubber)