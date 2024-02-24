rt <- read.table("exam0901.data"); rt
student.pr <- princomp(rt, cor = TRUE)
summary(student.pr, loadings=TRUE)

pred <- predict(student.pr); pred

sort(pred[,1])
sort(pred[,2])

screeplot(student.pr, type = "lines")

win.graph(width=8, height=7)
par(mai=c(0.6, 0.9, 0.4, 0.2))

savePlot("student_pr2", type = "eps")

par(mai=c(0.9, 0.9, 0.1, 0.1))
plot(pred[,1:2], type = "n")
text(pred[,1:2])