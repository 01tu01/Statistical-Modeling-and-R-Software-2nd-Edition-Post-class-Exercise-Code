n <- 600; p <- 0.02; q <- 1 - p; phat <- c(0.025, 0.07)
pr <- pnorm(phat, mean = p, sd = sqrt(p*q/n))
pr[2] - pr[1]
