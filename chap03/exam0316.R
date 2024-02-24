ore <- data.frame(
     x = c(67, 54, 72, 64, 39, 22, 58, 43, 46, 34),
     y = c(24, 15, 23, 19, 16, 11, 20, 16, 17, 13)
)
ore.m <- apply(ore, 2, mean); ore.s<-cov(ore); ore.r<-cor(ore)
