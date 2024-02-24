## 1. 
df <- data.frame(
     X = scan("exec0701.data"),
     A = gl(3,4)
)
df.aov <- aov(X ~ A, data = df)
summary(df.aov)

source("../chap04/interval_t1.R")
with(df, tapply(X, A, interval_t1))

with(df, pairwise.t.test(X, A))
with(df, plot(X ~ A))

## 2. 
df <- data.frame(
     X = scan("exec0702.data"),
     A = factor(rep(1:4, c(10, 6, 6, 2)))
)
df.aov <- aov(X ~ A, data = df)
summary(df.aov)

with(df, pairwise.t.test(X, A))
with(df, plot(X ~ A))

## 3. 
df <- data.frame(
     X = scan("exec0703.data"),
     A = gl(3,12)
)
with(df, tapply(X, A,  shapiro.test))
with(df, bartlett.test(X, A))
oneway.test(X ~ A, data = df)

## 4. 
df <- data.frame(
     X = scan("exec0704.data"),
     A = gl(3,8)
)
kruskal.test(X ~ A, data = df)

## 5. 
df <- data.frame(
     X = scan("exec0705.data"),
     g = gl(4, 8),
     b = gl(8, 1, 32)
)
friedman.test(X ~ g | b, data = df)

## 6. 
df <- data.frame(
     X = scan("exec0706.data"),
     A = gl(3, 6),
     B = gl(3, 2, 18)
)
df.aov <- aov(X ~ A + B + A:B, data = df)
summary(df.aov)

z1 <- with(df, tapply(X, A, mean)); names(z1) <- paste0("A", 1:3); z1
z2 <- with(df, tapply(X, B, mean)); names(z2) <- paste0("B", 1:3); z2
matrix(with(df, tapply(X, A:B, mean)), ncol=3, 
       dimnames = list(paste0("A", 1:3), paste0("B", 1:3)))

## 7. 
df <- data.frame(
    A = gl(3, 3), 
    B = gl(3, 1, 9),
    C = factor(c(1, 2, 3, 2, 3, 1, 3, 1, 2)),
    Y = scan("exec0707.data") 
)
z <- with(df, c(tapply(Y, A, mean), tapply(Y, B, mean), 
             tapply(Y, C, mean))
     )
K <- matrix(z, nrow = 3, ncol = 3, 
         dimnames = list(1:3, c("A", "B", "C")))
K

df.aov <- aov(Y ~ A + B + C, data = df)
summary(df.aov)

## 8. 
df <- data.frame(
    A = gl(2, 4), 
    B = gl(2, 2, 8),
    C = factor(rep(c(1,2,1), c(2,4,2))),
    D = gl(2, 1, 8), 
    Y = c(86, 95, 91, 94, 91, 96, 83, 88) 
)
z <- with(df, c(tapply(Y, A, mean), tapply(Y, B, mean), 
    tapply(Y, C, mean), tapply(Y, D, mean)) 
)
K <- matrix(z, nrow = 2, ncol = 4, 
            dimnames = list(1:2, c("A", "B", "C", "D")))
K

df.aov <- aov(Y ~ A + B + C + D, data = df)
summary(df.aov)

## 9.
df <- data.frame(
    A = gl(2, 16), B = gl(2, 8, 32), C = gl(2, 4, 32), 
    Y = scan("exec0709.data")
)
K <- matrix(z, nrow = 2, ncol = 4, 
            dimnames = list(1:2, c("A", "B", "C", "AB")))
K

df.aov <- aov(Y ~ A + B + C + A:B + A:C + B:C, data = df)
summary(df.aov)

df1.aov <- aov(Y ~ B + C + A:B + A:C + B:C, data = df)
summary(df1.aov)

df2.aov <- aov(Y ~ B + A:B + A:C + B:C, data = df)
summary(df2.aov)

df3.aov <- aov(Y ~ B + A:B + B:C, data = df)
summary(df3.aov)

df4.aov <- aov(Y ~ B + A:B, data = df)
summary(df4.aov)

df$AB <- factor(rep(c(1,2,1), c(8, 16, 8)))
z <- with(df, c(tapply(Y, A, mean), tapply(Y, B, mean), 
    tapply(Y, C, mean), tapply(Y, AB, mean)) 
)
