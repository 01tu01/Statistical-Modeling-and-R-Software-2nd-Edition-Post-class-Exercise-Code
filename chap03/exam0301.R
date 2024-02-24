w <- scan("exam0301.data")
w.mean <- mean(w); w.mean

mean <- sum(w)/length(w); mean

w[1] <- 750
w.mean <- mean(w); w.mean

w.mean <- mean(w, trim = 0.1); w.mean