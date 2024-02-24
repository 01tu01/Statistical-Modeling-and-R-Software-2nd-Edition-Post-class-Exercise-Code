lamp <- data.frame(
     X = scan("exam0701.data"),
     A = factor(rep(1:4, c(7, 5, 8, 6)))
)
lamp.aov <- aov(X ~ A, data = lamp)
summary(lamp.aov)

source("anova.tab.R"); anova.tab(lamp.aov)

with(lamp, plot(X ~ A))

lamp.lm <- lm(X ~ A, data = lamp)
lmap.anova <- anova(lamp.lm)

win.graph(width=8, height=6)
par(mai=c(0.9, 0.9, 0.1, 0.1))

savePlot("lamp", type = "eps")