## 1
x <-scan("binom.data"); x
xb <- mean(x); M2 <- mean((x-xb)^2)
n <- xb^2/(xb-M2); n
p <- (xb-M2)/xb; p

## 2
x <- c(0.1, 0.2, 0.9, 0.8, 0.7, 0.7, 0.6, 0.5)
xb <- mean(x)
alpha <- (2*xb-1)/(1-xb); alpha
alpha <- -length(x)/sum(log(x))-1; alpha

## 3
x <- c(  5,  15,  25,  35, 45, 55, 65)
f <- c(365, 245, 150, 100, 70, 45, 25)
xb <- weighted.mean(x, f); xb
lambda <- 1/xb; lambda

## 4
x <- c( 0,  1,  2, 3, 4, 5, 6)
y <- c(17, 20, 10, 2, 1, 0, 0)
lambda <- weighted.mean(x, y); lambda

## 5
X <- scan("exec0405.data")
source("interval_t1.R")
interval_t1(X, alpha = 0.1)

## 6 
x <- 0:6; y <- c(7, 10, 12, 8, 3, 2, 0)
source("interval_z1.R")
interval_z1(rep(x,y))

## 7
source("interval_t1.R")
X <- c(54, 67, 68, 78, 70, 66, 67, 70, 65, 69)
interval_t1(X)
interval_t1(X, side = -1)

## 8
x <- c(1067, 919, 1196, 785, 1126, 936, 918, 1156, 920, 948)
source("interval_t1.R")
interval_t1(x, side = 1)

## 9 
source("interval_rate1.R")
interval_rate1(m = 57, n = 400)

## 10
z <- scan("exec0411.data")
X <- z[1:30]; Y <- z[31:70]
source("interval_z2.R")
interval_z2(X, Y)

## 11
x <- c(140, 137, 136, 140, 145, 148, 140, 135, 144, 141)
y <- c(135, 118, 115, 140, 128, 131, 130, 115, 131, 125)
source("interval_t2.R")
interval_t2(x, y, var.equal = TRUE)

## 12
x <- c(0.143, 0.142, 0.143, 0.137)
y <- c(0.140, 0.142, 0.136, 0.138, 0.140)
source("interval_t2.R")
interval_t2(x, y, var.equal = TRUE)

## 13 
x <- c(140, 137, 136, 140, 145, 148, 140, 135, 144, 141)
y <- c(135, 118, 115, 140, 128, 131, 130, 115, 131, 125)
source("interval_var2.R")
interval_var2(x, y)
interval_t2(x, y)

## 14 
source("interval_rate2.R")
interval_rate2(m = c(34, 31), n = c(70, 80))


