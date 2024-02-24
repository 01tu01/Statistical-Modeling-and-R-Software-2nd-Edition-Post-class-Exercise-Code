##%% 输入数据, 生成距离结构
x <- c(1, 2, 6, 8, 11); dim(x) <- c(5, 1); d <- dist(x)

##%% 生成系统聚类
hc1 <- hclust(d, "single"); hc2 <- hclust(d, "complete")
hc3 <- hclust(d, "median"); hc4 <- hclust(d, "mcquitty")

##%% 绘出所有树形结构图, 并以$2\times 2$的形式绘在一张图上
opar <- par(mfrow = c(2, 2))
plot(hc1, hang = -1); plot(hc2, hang = -1)
plot(hc3, hang = -1); plot(hc4, hang = -1)
par(opar)

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.1, 0.1))

savePlot("hclust_2", type = "eps")


dend1 <- as.dendrogram(hc1)
opar <- par(mfrow = c(2, 2), mar = c(4, 3, 1, 2))
plot(dend1)
plot(dend1, nodePar=list(pch = c(1,NA), cex = 0.8, lab.cex = 0.8),
     type = "t", center = TRUE)
plot(dend1, edgePar = list(col = 1:2, lty = 2:3), 
     dLeaf = 1, edge.root = TRUE)
plot(dend1, nodePar = list(pch = 2:1, cex = 0.4 * 2:1, col = 2:3), 
     horiz = TRUE)
par(opar)
