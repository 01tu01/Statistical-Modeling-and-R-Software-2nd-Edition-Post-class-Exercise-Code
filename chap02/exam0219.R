p <- 0.99; q <- 1 - p
for(k in 1:10){
    n <- 100 + k
    P <- 1 - pnorm(100, mean = n*p, sd = sqrt(n*p*q))
    if (P >= 0.95) break
}
k
P
