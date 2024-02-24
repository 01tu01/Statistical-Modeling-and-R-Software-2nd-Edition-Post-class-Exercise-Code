source("discriminiant.bayes.R")
rt <- read.table("exam0801.data")
X <- rt[ ,1:2]; G <- rt[ ,3]; Tst <- c(23.5, -1.6)
discriminiant.bayes(X, G, Tst, var.equal = TRUE)
discriminiant.bayes(X, G, Tst)

discriminiant.bayes(X, G, var.equal = TRUE)
discriminiant.bayes(X, G)

source("disc_bay_plot.R")
disc_bay_plot(X, G, Tst, var.equal = TRUE)
disc_bay_plot(X, G, Tst)

win.graph(width=8, height=7)
par(mai=c(0.8, 0.8, 0.4, 0.1))

savePlot("disc_plot_4", type = "eps")