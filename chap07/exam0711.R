tree <- data.frame(
    Y = scan("exam0711.data"), 
    A = gl(3, 20, 60, labels = paste0("A", 1:3)),
    B = gl(4, 5, 60, labels = paste0("B", 1:4)))
tree.aov <- aov(Y ~ A + B + A:B, data = tree)
summary(tree.aov)

attach(tree); tapply(Y, A, mean)
tapply(Y, B, mean)

matrix(tapply(Y, A:B, mean), nr = 3, nc = 4, byrow = T,
       dimnames = list(levels(A), levels(B)))

interaction.plot(A, B, Y, lwd = 2, col = 2:5)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

savePlot("interaction_plot", type = "eps")