##%% 输入数据
rate <- data.frame(
     A = gl(3, 3), 
     B = gl(3, 1, 9),
     C = factor(c(1, 2, 3, 2, 3, 1, 3, 1, 2)),
     Y = c(31, 54, 38, 53, 49, 42, 57, 62, 64) )

##%% 计算各因素的均值
attach(rate)
z <- c(tapply(Y, A, mean), tapply(Y, B, mean), tapply(Y, C, mean))
K <- matrix(z, nrow = 3, ncol = 3, 
            dimnames = list(1:3, c("A", "B", "C")))

##%% 显示计算结果
K

detach(rate)
win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.6, 0.6))

savePlot("rate", type = "eps")

plot(as.vector(K), axes = F, xlab = "Level", ylab = "Rate")
xmark <- c(NA, "A1", "A2", "A3", "B1", "B2", "B3", 
          "C1", "C2", "C3", NA)
axis(1, 0:10, labels = xmark)
axis(2, 4*10:16)
axis(3, 0:10, labels = xmark)
axis(4, 4*10:16)
lines(K[,"A"]); lines(4:6, K[,"B"]); lines(7:9,K[,"C"])

