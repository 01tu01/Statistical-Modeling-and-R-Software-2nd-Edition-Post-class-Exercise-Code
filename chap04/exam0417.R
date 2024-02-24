source("interval_z1.R") 
set.seed(123456)
X <- rexp(50, 1/2.266)
interval_z1(X)
