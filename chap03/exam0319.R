rt <- read.table("applicant.data")
AVG <- apply(rt, 1, mean)
sort(AVG, decreasing = TRUE)[1:6]

cor(rt)

attach(rt)
rt$G1 <- (SC + LC + SMS + DRV + AMB + GSP + POT)/7
rt$G2 <- (FL + EXP + SUIT)/3
rt$G3 <- (LA + HON + KJ)/3
rt$G4 <- AA
rt$G5 <- APP
AVG <- apply(rt[,16:20], 1, mean)
sort(AVG, decreasing = TRUE)[1:6]