food <- data.frame(
     x = scan("exam0707.data"),
     g = factor(rep(1:4, c(8, 4, 7, 6)))
  )
kruskal.test(x ~ g, data = food)

with(food, kruskal.test(x,  g))

A <- c(164, 190, 203, 205, 206, 214, 228, 257)
B <- c(185, 197, 201, 231)
C <- c(187, 212, 215, 220, 248, 265, 281)
D <- c(202, 204, 207, 227, 230, 276)
kruskal.test(list(A, B, C, D))

with(food, tapply(x,  g, shapiro.test))
with(food, bartlett.test(x, g))
summary(aov(x ~ g, data = food))