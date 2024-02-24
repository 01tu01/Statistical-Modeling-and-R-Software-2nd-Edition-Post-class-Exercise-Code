rt <- read.table("../chap08/exam0818.data")
d <- dist(scale(rt))
cmds <- cmdscale(d)
plot(cmds, pch=19, col= "blue", 
     xlim = c(-6, 2.3), ylim = c(-2.5, 3.3),
     xlab = "Frist Component", ylab = "Second Component")
text(cmds, label = rownames(rt), adj = c(.5, -1))

win.graph(width=10, height=7)
par(mai=c(0.8, 0.8, 0.1, 0.1))

savePlot("exam1005", type = "bmp")

