pre.sum <- 0; cla.sum <- 0
for (k in 0:4){
    x <- 10*k + 1:10
    PredSet <- c(x, 50+x, 100+x)
    lda.sol <- lda(Species~., subset = -PredSet, data = iris)
    pre <- predict(lda.sol, iris[PredSet, 1:4])$class
    cla <-predict(lda.sol)$class
    pre.sum <- pre.sum + sum(pre==iris[predict.set,5])
    cla.sum <- cla.sum + sum(cla==iris[-predict.set,5])
}
matrix(c(pre.sum, cla.sum, pre.sum/150, cla.sum/600), nc=2, 
       dimnames = list(c("预测值", "回代值"), c("正确数", "正确率")))
