X <- scan("../chap01/sample.data", nlines = 2)
Y <- scan("../chap01/sample.data", skip = 2)

win.graph(width=8, height=6)
par(mai=c(0.6, 0.6, 0.1, 0.1))
boxplot(X, Y, notch = T, names = c('A', 'B'), col = c(2,3))

savePlot("box3", type = "eps")

boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
boxplot(count ~ spray, data = InsectSprays,
        notch = TRUE, col = 2:7, add = TRUE)


y <- scan("../chap01/sample.data")
f <- as.factor(c(rep('A', 13), rep('B', 8)))
plot(f, y, notch = T, names = c('A', 'B'), col = c(2,3))

