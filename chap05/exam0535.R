X <- scan("exam0535.data")
wilcox.test(X, mu = 140, alternative="less", 
     exact = FALSE, correct = FALSE, conf.int = TRUE)

wilcox.test(X, mu = 140, alternative="less")

wilcox.test(X, mu = 140, alternative="less", exact = FALSE)

binom.test(sum(X<140), length(X)-1)