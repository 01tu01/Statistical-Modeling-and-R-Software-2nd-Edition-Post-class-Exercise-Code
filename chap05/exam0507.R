rt <- read.table("exam0507.data")
with(rt, t.test(Normal, New, var.equal = TRUE, al = "l"))

with(rt, t.test(Normal, New, al = "l"))
