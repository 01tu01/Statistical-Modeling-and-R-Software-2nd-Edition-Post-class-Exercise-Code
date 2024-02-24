sex <- c("M","F","M","M", "F")
is.factor(sex)
sexf <- as.factor(sex); sexf
sex.level <- levels(sexf); sex.level
sex.tab <- table(sexf); sex.tab

height <- c(174, 165, 180, 171, 160)
tapply(height, sex, mean)