D <- expand.grid(设计 = c(2, 3, 4), 施工= c(6, 7, 8))
D$完成时间 <- apply(D, 1, sum); D
Ta <- table(D$完成时间); Ta
prop.table(Ta)