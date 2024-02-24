df <- read.table("student.data")
win.graph(width = 8, height = 6)
plot(df)

savePlot("student_data3", type = "eps")

##-----------------------------------------------------------##
attach(df)
plot(~ Age + Height)
plot(Weight ~ Age + Height)
detach()

##-----------------------------------------------------------##
pairs(df)

win.graph(width = 8, height = 6)
source("panel.hist.R"); source("panel.cor.R")
pairs(df, diag.panel = panel.hist, 
      upper.panel = panel.smooth, lower.panel = panel.cor, 
      cex = 1.5, pch = 21, bg = "light blue")

##-----------------------------------------------------------##
coplot(Weight ~ Height | Age, data = df)

win.graph(width = 8, height = 6)
source("panel.lm.R")
coplot(Weight ~ Height | Age, data = df, 
       panel = panel.lm, cex = 1.5, pch = 21, 
       bg = "light blue")

coplot(lat ~ long | depth * mag, data = quakes)

savePlot("quakes_co", type = "eps")
