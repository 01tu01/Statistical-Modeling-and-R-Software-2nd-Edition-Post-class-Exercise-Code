mouse <- data.frame(
     X = scan("exam0703.data"), 
     A = factor(rep(1:3, c(11, 10, 12)))
)
mouse.aov <- aov(X ~ A, data = mouse)
source("anova.tab.R"); anova.tab(mouse.aov)

mouse.lm <- lm(X ~ A, data = mouse)
anova(mouse.lm)

oneway.test(X ~ A, data = mouse)
oneway.test(X ~ A, data = mouse, var.equal = TRUE)

bartlett.test(X ~ A, data = mouse)
with(mouse, tapply(X, A, shapiro.test))
