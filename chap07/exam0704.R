mouse <- data.frame(
     X = scan("exam0703.data"), 
     A = factor(rep(1:3, c(11, 10, 12)))
)

##%% 求数据在各水平下的均值
attach(mouse)
tapply(X, A, mean)

##%% 作多重t检验
pairwise.t.test(X, A, p.adjust.method = "none")
pairwise.t.test(X, A, p.adjust.method = "holm")
pairwise.t.test(X, A, p.adjust.method = "bonferroni")

plot(X ~ A)

detach(mouse)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

savePlot("mouse", type = "eps")

mouse.aov <- aov(X ~ A, data = mouse)
(tukey <- TukeyHSD(mouse.aov))
win.graph(width=8, height=6)
par(mai=c(0.8, 0.5, 0.5, 0.1))
plot(tukey)


