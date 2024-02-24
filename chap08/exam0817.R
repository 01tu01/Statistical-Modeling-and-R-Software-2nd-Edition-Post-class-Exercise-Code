##%% 读取数据，构造相关矩阵
z <- scan("exam0817.data"); z
names <-c("身高", "手臂长", "上肢长", "下肢长", "体重", "颈围",
          "胸围", "胸宽")
r <- matrix(1, nc = 8, nr = 8, dimnames = list(names, names))
for (i in 1:7){
    for( j in 1:i){
        r[i+1,j] <- r[j, i+1]<-z[i*(i-1)/2+j]
    }
}

##%% 作系统聚类分析, 函数as.dist()的作用是将普通矩阵转化为聚类分析用的距离结构. 
d <- as.dist(1-r); hc <- hclust(d); dend <- as.dendrogram(hc)

##%% 写一段小程序, 其目的是在绘图命令中调用它, 使谱系图更好看. 
nP <- list(col = 3:2, cex = c(2.0, 0.75), pch = 21:22, 
           bg = c("light blue", "pink"),
           lab.cex = 1.0, lab.col = "tomato")
addE <- function(n){
    if(!is.leaf(n)){
        attr(n, "edgePar") <- list(p.col = "plum")
        attr(n, "edgetext") <- paste(attr(n, "members"), "members")
    }
    n
}

##%% 画出谱系图.
de <- dendrapply(dend, addE); plot(de, nodePar= nP)

win.graph(width=8, height=6)
par(mai=c(0.6, 0.6, 0.0, 0))

savePlot("hclust_3", type = "bmp")

par(mai=c(1.0, 0.8, 0.4, 0.1))
plot(hc, hang=-1); re<-rect.hclust(hc, k=3)



