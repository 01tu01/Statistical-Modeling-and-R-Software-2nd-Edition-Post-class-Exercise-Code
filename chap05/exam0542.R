library(psych)
rubber <- read.table("../chap03/rubber.data")
ct <- corr.test(rubber); ct
print(ct, short = FALSE)
