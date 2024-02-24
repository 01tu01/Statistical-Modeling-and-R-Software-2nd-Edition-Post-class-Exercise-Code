moment <- function(x, k, mean = 0)
sum((x - mean)^k)/length(x)
