source("P_value.R")
Xbar <- 11.5; S1 <- 10.2; n1 <- 45
Ybar <- 9.0;  S2 <- 5.58; n2 <- 38
Z <- (Xbar - Ybar) / sqrt(S1^2/n1 + S2^2/n2); P_value(Z)
