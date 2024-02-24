rt <- read.table("../chap03/applicant.data")
fa <- factanal(~., factors = 5, data = rt, scores = "regression")

plot(fa$scores[, 1:2], type = "n")
text(fa$scores[, 1:2])

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.2, 0.1))

savePlot("factor1", type = "eps")

