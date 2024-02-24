rt <- read.table("exam0508.data")
rt$R <- with(rt, O/S)
t.test(R ~ E, data = rt)
