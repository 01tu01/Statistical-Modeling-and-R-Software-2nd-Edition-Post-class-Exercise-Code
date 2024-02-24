source("discriminiant.distance.R")
rt <- read.table("exam0801.data")
X <- rt[ ,1:2]; G <- rt[ ,3]; Tst <- c(23.5, -1.6)
discriminiant.distance(X, G, Tst, var.equal = TRUE)
discriminiant.distance(X, G, Tst)

discriminiant.distance(X, G, var.equal = TRUE)
discriminiant.distance(X, G)

source("disc_dis_plot.R")
disc_dis_plot(X, G, Tst, var.equal = TRUE)
disc_dis_plot(X, G, Tst)

win.graph(width=8, height=7)
par(mai=c(0.8, 0.8, 0.4, 0.1))

savePlot("disc_plot_2", type = "eps")