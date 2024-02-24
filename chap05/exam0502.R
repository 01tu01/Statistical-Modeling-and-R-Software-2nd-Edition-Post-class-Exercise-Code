source("P_value.R")
x_bar <- 495; S <- 30; n <- 36; mu <- 500
Z <- (x_bar - mu)/(S/sqrt(n))
P_value(Z, side = -1)
