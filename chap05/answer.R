## 1
source("P_value.R")
x_bar <- 393; S <- 24; n <- 36; mu <- 400
Z <- (x_bar - mu)/(S/sqrt(n))
P_value(Z, side = -1)

## 2
X <-scan()
 0.2  0.0 -1.1 -0.1 -1.5 -0.5 -1.9 -1.3 -0.4  2.0 
-2.3  0.5  0.7 -2.1 -0.6 -0.4  2.4  1.5  1.6  0.6 
-2.4 -0.8  1.2 -0.3  2.5  1.1  0.5 -0.1  0.7 

source("z.test1.R")
z.test1(X, mu = 0, sigma = sqrt(1.5))

## 3
source("P_value.R")
Xbar <- 40; S1 <- 9;  n1 <- 36
Ybar <- 35; S2 <- 10; n2 <- 49
Z <- (Xbar - Ybar) / sqrt(S1^2/n1 + S2^2/n2); P_value(Z)

## 4
z <- scan("../chap04/exec0411.data")
X <- z[1:30]; Y <- z[31:70]
source("z.test2.R")
z.test2(X, Y)
z.test2(X, Y, side = 1)

source("../chap04/interval_estimate2.R")
interval_estimate2(X, Y, sigma = c(sd(X), sd(Y)))

## 5
X <- scan("exec0505.data")
t.test(X, mu = 225)

## 6
X <- scan()
1067  919  1196  785  1126  936  918  1156  920  948

t.test(X, mu = 1000, al = "g")

## 7
z <- scan("exec0507.data")
X <- z[1:20]; Y <- z[21:40]
t.test(X, Y, var.equal = T)
var.test(X, Y)

## 8
X <- c(113, 120, 138, 120, 100, 118, 138, 123)
Y <- c(138, 116, 125, 136, 110, 132, 130, 110)
t.test(X, Y,  paired = T)

## 9
X <- c(126, 125, 136, 128, 123, 138, 142, 116, 110, 108, 115, 140)
Y <- c(162, 172, 177, 170, 175, 152, 157, 159, 160, 162)
var.test(X, Y)
t.test(X, Y, var.equal = T)

## 10
prop.test(52, 100, p=0.64)
prop.test(52, 100, p=0.64, al = "l")

binom.test(52, 100, p=0.64)
binom.test(52, 100, p=0.64, al = "l")

## 11
prop.test(x = c(34, 31), n = c(70, 80))

## 12
poisson.test(x = 5, T = 1,  r = 3)
poisson.test(x = 42, T = 10,  r = 3)

## 13
poisson.test(c(96, 91), c(12, 9))

## 14
X <- scan()
15.2  17.5  19.6  16.6  21.3  17.1  15.0  15.5  20.0  16.2

source("var1.test.R")
var1.test(X, sigma2 = 2^2)
var1.test(X, sigma2 = 2^2, alternative = "g")

## 15
X <- c(315, 101, 108, 32)
p <- c(9, 3, 3, 1)/16
chisq.test(X, p = p)

## 16
X <- 0:5; Y <- c(92, 68, 28, 11, 1, 0)
lambda <- weighted.mean(X, Y)

X <- 0:3; Y <- c(92, 68, 28, 12)
F <- ppois(X, lambda); n <- length(Y) 
p <- F; p[n] <- 1 - F[n-1]
for (i in 2:(n-1)) p[i] <- F[i] - F[i-1]
chisq.test(Y, p = p)

source("chi2gof.R")
chi2gof(chisq.test(Y, p = p), 1)

## 17
X <- scan()
0 6 8 16 22 23 34 44 47 51 57

Y <- diff(X)
ks.test(Y, "pexp", 1/mean(Y))

## 18
X <- c(2.36, 3.14, 7.52, 3.48, 2.76, 5.43, 6.54, 7.41)
Y <- c(4.38, 4.25, 6.53, 3.28, 7.21, 6.55)
ks.test(X, Y)

## 19
z <- scan("exec0507.data")
X <- z[1:20]; Y <- z[21:40]
shapiro.test(X)
shapiro.test(Y)

library(tseries)
jarque.bera.test(X)
jarque.bera.test(Y)

library(nortest)
lillie.test(X)
lillie.test(Y)

## 20
z <- scan("exec0520.data")
X <- matrix(z, nr = 4, byrow = T)
chisq.test(X)

## 21 
X <- c(358, 2492, 229, 2745); dim(X) <- c(2, 2)
chisq.test(X)

## 22
X <- c(3, 6, 4, 4); dim(X) <- c(2, 2)
fisher.test(X)

## 23 
X <- c(58, 1, 8, 2, 42, 9, 3, 7, 17); dim(X) <- c(3, 3)
mcnemar.test(X)

## 24
binom.test(7, 10)

## 25
X <- scan()
13.32 13.06 14.02 11.86 13.58 13.77 13.51 14.42 14.44 15.43

binom.test(sum(X>14.6), length(X), al = "l")
wilcox.test(X, mu = 14.6, alternative="less", exact = FALSE)

## 26
z <- scan("exec0526.data")
X <- z[1:20]; Y <- z[21:40]
binom.test(sum(X>Y), length(X))
wilcox.test(X, Y, paired = TRUE, exact = FALSE)
wilcox.test(X, Y, exact = FALSE)

shapiro.test(X)
shapiro.test(Y)

library(tseries)
jarque.bera.test(X)
jarque.bera.test(Y)

library(nortest)
lillie.test(X)
lillie.test(Y)

var.test(X, Y)
t.test(X, Y, var.equal = TRUE)

## 27
X <- rep(1:5, c(0, 1,  9, 7, 3))
Y <- rep(1:5, c(2, 2, 11, 4, 1))
wilcox.test(X, Y, exact = FALSE, al = "g")

## 28
X <- c(24, 17, 20, 41, 52, 23, 46, 18, 15, 29)
Y <- c( 8,  1,  4,  7,  9,  5, 10,  3,  2,  6)
cor.test(X, Y,  method = "spearman")

## 29 
library(psych)
rt <- read.table("../chap03/applicant.data")
ct <- corr.test(rt, method = "spearman")
print(ct, short = FALSE)

## 30 
library(tseries)
X <- scan(what = "")
H H T H T H T H T T H T H T T T H H T H

runs.test(as.factor(X))


