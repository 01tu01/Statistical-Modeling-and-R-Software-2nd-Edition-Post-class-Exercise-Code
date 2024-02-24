rt <- read.table("../chap03/applicant.data")
factanal(~., factors = 5, data = rt)