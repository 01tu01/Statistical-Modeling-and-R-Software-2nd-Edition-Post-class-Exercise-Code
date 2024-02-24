lamp <- data.frame(
     X = scan("exam0701.data"),
     A = factor(rep(1:4, c(7, 5, 8, 6)))
)
with(lamp, tapply(X, A, shapiro.test))

