X <- scan("exam0314.data", nlines = 1)
Y <- scan("exam0314.data", skip = 1, nlines = 1)
z <- scan("exam0314.data", skip = 2)
Z <- matrix(z, nrow = 8)

win.graph(width = 8, height = 7)
par(mai=c(0.8, 0.8, 0.1, 0.1))
contour(X, Y, Z, levels = seq(min(z), max(z), by = 80), 
        xlab = "X", ylab = "Y")

par(mai=c(0.3, 0.3, 0.1, 0.1))
persp(X, Y, Z)

par(mai=c(0.1, 0.1, 0.1, 0.1))
persp(X, Y, Z,  theta = 30, phi = 45, expand = 0.7)

savePlot("persp", type = "eps")
savePlot("contour", type = "eps")