data(cars)
attach(cars)
win.graph(width = 8, height = 7)
par(mai=c(0.9, 0.8, 0.5, 0.1))
for (i in c("p", "l", "b", "c", "o", "h", "s", "S", "n")){
    plot(speed, dist, type = i, 
         main = paste("type = \"", i, "\"", sep = ""))
    if (i == "S") i="s2"
    fileName = paste("carPlot_", i, sep = "")
    savePlot(filename = fileName, type = "eps")
}
detach()

## 另一种绘图方法
for (i in c("p", "l", "b", "c", "o", "h", "s", "S", "n")){
    plot(cars, type = i, 
         main = paste("type = \"", i, "\"", sep = ""))
    if (i == "S") i="s2"
    fileName = paste("carPlot_", i, sep = "")
    savePlot(filename = fileName, type = "eps")
}
