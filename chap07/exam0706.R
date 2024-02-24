lamp <- data.frame(
     X = scan("exam0701.data"),
     A = factor(rep(1:4, c(7, 5, 8, 6)))
)
bartlett.test(X ~ A, data = lamp)

with(lamp, bartlett.test(X, A))

