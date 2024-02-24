agriculture <- data.frame(
     Y = scan("exam0709.data"), 
     A = gl(4, 3),
     B = gl(3, 1, 12)
)
agriculture.aov <- aov(Y ~ A + B, data = agriculture)
source("anova.tab.R")
anova.tab(agriculture.aov)
