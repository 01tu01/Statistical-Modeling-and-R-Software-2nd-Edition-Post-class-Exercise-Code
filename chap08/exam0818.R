##%% 读取数据
rt <- read.table("exam0818.data")

##%% 生成距离结构, 作系统聚类
d <- dist(scale(rt))
hc1 <- hclust(d);             hc2 <- hclust(d, "average")
hc3 <- hclust(d, "centroid"); hc4 <- hclust(d, "ward.D")

##%% 绘出谱系图和聚类情况(最长距离法和类平均法)
win.graph(width=11, height=7)
opar<-par(mfrow=c(2,1), mar=c(5.2,4,1.5,0))
plot(hc1, hang=-1); re1<-rect.hclust(hc1, k=5, border="red")
plot(hc2, hang=-1); re2<-rect.hclust(hc2, k=5, border="red")
par(opar)

##%% 绘出谱系图和聚类情况(重心法和Ward法)
opar<-par(mfrow=c(2,1), mar=c(5.2,4,1.5,0))
plot(hc3,hang=-1); re3<-rect.hclust(hc3,k=5,border="red")
plot(hc4,hang=-1); re4<-rect.hclust(hc4,k=5,border="red")
par(opar)

savePlot("hclust_6", type = "bmp")