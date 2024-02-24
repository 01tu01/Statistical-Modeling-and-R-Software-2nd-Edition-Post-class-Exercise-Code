X <- array(1:6, dim = c(2, 3)); X
apply(X, 1, sum)
apply(X, 2, mean)

x <- 1:12; dim(x) <- c(3, 4)
mean(x)
apply(x, 1, mean)
apply(x, 2, mean)
mean(as.data.frame(x))

x <- c(75, 64, 47.4, 66.9, 62.2, 62.2, 58.7, 63.5)
sort(x)
sort(x, decreasing = TRUE)

x.na <- c(75.0, 64.0, 47.4,NA,66.9,62.2,62.2,58.7,63.5)
median(x.na)
median(x.na, na.rm = TRUE)

w <- c(75.0, 64.0, 47.4, 66.9, 62.2, 62.2, 58.7, 63.5,
       66.6, 64.0, 57.0, 69.0, 56.9, 50.0, 72.0)
quantile(w)
quantile(w, probs = seq(0, 1, 0.2))

var(w)
sd(w)


cv <- 100*sd(w)/mean(w); cv
css <- sum((w-mean(w))^2); css
uss <- sum(w^2); uss