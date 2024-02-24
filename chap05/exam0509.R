rt <- read.table("../chap04/exam0423.data")
with(rt, t.test(Untreated, Treated, paired = TRUE))
