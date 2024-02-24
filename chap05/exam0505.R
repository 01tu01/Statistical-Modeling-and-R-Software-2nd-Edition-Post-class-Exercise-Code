source("z.test2.R")
rc <- read.csv("Airport.csv")
with(data = rc, z.test2(A, B))
