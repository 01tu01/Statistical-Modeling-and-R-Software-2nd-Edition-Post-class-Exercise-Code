source("interval_rate2.R")
m <- c(35, 27); n <- c(250, 300)
interval_rate2 (m, n, alpha = 0.1)

prop.test(m, n, correct = FALSE, conf.level = 0.90)
