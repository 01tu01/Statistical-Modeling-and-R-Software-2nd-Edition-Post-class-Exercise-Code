## 2
S <- apply(expand.grid(x=1:6, y=1:6, z=1:6), 1, sum)
table(S)

## 5
pB <- c(0.3, 0.2, 0.1, 0.4)
P <- c(1/4, 1/3, 1/12, 0)
pB[1]*P[1]/sum(pB*P)

## 6
1-0.3*0.2*0.1

p1 <- 0.7*0.2*0.1 + 0.3*0.8*0.1 + 0.3*0.2*0.9; p1
p2 <- 0.3*0.8*0.9 + 0.7*0.2*0.9 + 0.7*0.8*0.1; p2
p3 <- 0.7*0.8*0.9;  p3
pB <-c(p1, p2, p3); pB 
P <- c(0.7, 0.9, 1)
sum(P*pB)

## 9 
1 - pbinom(0, 100, 0.004)

## 10
qbinom(0.99, size =200, prob = 0.02)

## 11
p <- 1 - pbinom(1, size = 30, prob = 0.01); p
p1 <- 1 - (1-p)^3; p1
p2 <- 1 - pbinom(3, size = 90, prob = 0.01); p2

## 12
dpois(6, lambda = 4)
ppois(10, lambda = 4)

## 13
1 - pnorm(170, mean = 168, sd = 6)
qnorm(0.99, 168, 6)

## 14 
X1 <- 90; X2 <- 60
p1 <- 1-359/10000;  p2 <- 1151/10000; p3 <- 1-2500/10000
sigma <- (X1 - X2)/(qnorm(p1)-qnorm(p2))
mu <- X1 - sigma * qnorm(p1)
C <- mu + sigma * qnorm(p3); C

## 15
p1 <- 1 - pexp(10, rate = 1/5); p1
p2 <- 1 - pbinom(0, size = 5, prob = p1); p2

## 16
F <- function(x,y) 1-2^(-x)-2^(-y)+2^(-x-y)
F(2,5)-F(1,5)-F(2,3)+F(1,3)

## 20
n <- 5000; mu <- 0.5; sigma <- 0.1
p <- 1-pnorm(2510, mean=n*mu, sd=sqrt(n)*sigma); p

## 21 (1)
n <- 1500; sigma <- 1/sqrt(12)
p <- pnorm(-15, sd=sqrt(n)*sigma) + 1-pnorm(15, sd=sqrt(n)*sigma); p

##(2)
for (n in 100:1000){
    p <- pnorm(10, sd=sqrt(n)*sigma) - pnorm(-10, sd=sqrt(n)*sigma)
    if (p<0.9) break
}
n-1

## 22
for(k in 1:10){
    n <- 100 + k
    P <- 1 - pbinom(100, size = n, prob = 0.99)
    if (P >= 0.95) break
}
k
P

## 23 
1 - pchisq(16, df=10)

## 24
pchisq(q = 15*2.04, df = 15)

## 25 
X <- scan("exec0225.data")
n <- length(X); S <- sd(X); t <- 2.85/(S/sqrt(n))
pt(-t, df = n-1) + 1 - pt(t, df = n-1)

