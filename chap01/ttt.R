inp <- scan("h_w.data", list(height=0, weight=0))
sort(inp$height)

b <- seq(from = 150, to = 190, by = 5)
table(cut(inp$height, breaks = b))
Mo <- 165 + (42-9)/((42-9)+(42-27)) * 5; Mo
Mo <- 170 - (42-27)/((42-9)+(42-27)) * 5; Mo

##-------------------------------------------------##
inp <- scan("h_w.data", list(height=0, weight=0))
sort(inp$weight)
b <- seq(from = 45, to = 80, by = 5)
table(cut(inp$weight, breaks = b))
Mo <- 55 + (30-9)/((30-9)+(30-27)) * 5; Mo
Mo <- 60 - (30-27)/((30-9)+(30-27)) * 5; Mo

