source("unison.R"); unison(X)

win.graph(width = 8, height = 7)
par(mai=c(0.8, 0.8, 0.5, 0.1))
unison(X)

savePlot("course_unison", type = "eps")

library(MSG)
andrews_curve(X)