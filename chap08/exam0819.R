rt <- read.table("exam0818.data")
km <- kmeans(scale(rt), 5, nstart = 20)
sort(km$cluster)