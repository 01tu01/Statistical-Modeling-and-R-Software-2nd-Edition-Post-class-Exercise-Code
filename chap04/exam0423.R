source("interval_t1.R") 
rt <- read.table("exam0423.data")
with(rt, interval_t1(Untreated - Treated))
