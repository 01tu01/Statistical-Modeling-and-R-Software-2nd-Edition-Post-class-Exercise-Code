n <- 10; p <- 0.5; q <- 1 - p
p1 <- pbinom(4, size = n, prob = p); p1
p2 <- pnorm(4, mean = n*p, sd = sqrt(n*p*q)); p2
p3 <- pnorm(4.5, mean = n*p, sd = sqrt(n*p*q)); p3    
