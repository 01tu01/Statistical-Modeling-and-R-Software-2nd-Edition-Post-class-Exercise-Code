library(MASS)
(iris.lda <- lda(Species ~ ., data = iris))
iris.pre <- predict(iris.lda)
table(true_class=iris$Species, preedict=iris.pre$class)

plot(iris.pre$x, cex=1.2,
     pch = rep(21:23, c(50, 50, 50)), 
     col = rep(c('red', 'green', 'blue'), c(50, 50, 50)), 
     bg = rep(c('red', 'green', 'blue'), c(50, 50, 50)), 
     xlab = "LD1", ylab = "LD2")
     legend(0, 2.5, c("setosa", "versicolor", "virginica"), 
             pch = c(16, 15, 18), col = c('red', 'green', 'blue'), cex=1.1)

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))

savePlot("iris_disc", type = "eps")
