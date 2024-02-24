## 1
X <- scan("exec0301.data"); X
mean(X)
var(X)
sd(X)
cv <- sd(X)/mean(X)*100; cv
R <- max(X) - min(X); R
Sm <- sd(X)/sqrt(length(X)); Sm
source("skew.R"); skew(X)
source("kurt.R"); kurt(X)

## 2
x <- c(18, 19, 20, 21, 22); w <- c(110, 110, 100, 90,  90)
weighted.mean(x, w)

## 3
win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.5, 0.1))
X <- scan("exec0301.data")
hist(X, freq = FALSE)
lines(density(X), col = "blue", lwd = 2)
x <- 60:90
lines(x, dnorm(x, mean(X), sd(X)), col = "red", lwd = 2)
savePlot("exec0303_hist", type = "eps")

plot(ecdf(X), verticals = TRUE, do.p = FALSE)
lines(x, pnorm(x, mean(X), sd(X)), col = "blue")
savePlot("exec0303_ecdf", type = "eps")

win.graph(width=8, height=6)
par(mai=c(0.8, 0.8, 0.5, 0.1))
qqnorm(X); qqline(X)
savePlot("exec0303_QQ", type = "eps")

## 4
X <- scan("exec0301.data")
stem(X)
win.graph(width=8, height=7)
par(mai=c(0.2, 0.5, 0.2, 0.1))
boxplot(X)
fivenum(X)
savePlot("exec0304_box", type = "eps")

## 5
data(pressure)
win.graph(width = 8, height = 7)
par(mai=c(0.9, 0.8, 0.5, 0.1))
for (i in c("p", "l", "b", "c", "o", "h", "s", "S", "n")){
    plot(pressure, type = i, 
         main = paste("type = \"", i, "\"", sep = ""))
    if (i == "S") i="s2"
    fileName = paste("pressurePlot_", i, sep = "")
    savePlot(filename = fileName, type = "eps")
}

## 6
x <- c(2,  4, 3, 2,  4, 7,  7,  2,  2, 5, 4, 
       5,  6, 8, 5, 10, 7, 12, 12,  6, 6, 
       7, 11, 6, 6,  7, 9,  5,  5, 10, 6, 3, 10)
f <- factor(rep(1:3, c(11, 10, 12)))
plot(f, x)

boxplot(x[1:11], x[12:21], x[22:33])

## 7
win.graph(width = 8, height = 7)
source("panel.hist.R"); source("panel.cor.R")
pairs(iris[,1:4], diag.panel = panel.hist, 
      upper.panel = panel.smooth, 
      lower.panel = panel.cor, 
      cex = 1.5, pch = 21, bg = "light blue")
savePlot("exec0307", type = "eps")

## 8 
source("panel.lm.R")
coplot(Volume ~ Height |Girth, data = trees,
       panel = panel.lm, cex=1.5, pch=21, bg = "light blue")

## 9 
coplot(perm ~ shape |area * peri , data = rock)
        
## 10
x <- seq(-2, 3, by = 0.05)
y <- seq(-1, 7, by = 0.05)
f <- function(x,y) 
x^4 - 2*x^2*y + x^2 - 2*x*y + 2*y^2 + 9/2*x - 4*y + 4
z <- outer(x, y, f)

win.graph(width = 8, height = 7)
par(mai=c(0.8, 0.8, 0.1, 0.1))
contour(x, y, z, 
        levels = c(0, 1, 2, 3, 4, 5, 10, 15, 20, 30, 40, 50, 60, 80, 100),
        col = "blue", xlab = "x", ylab = "y")

par(mai=c(0, 0, 0, 0))
persp(x, y, z, theta=30, phi=30, expand=0.7, col="lightblue")

savePlot("exec0310_persp", type = "eps")
savePlot("exec0310_contour", type = "eps")

## 11
rt <- read.table("applicant.data")
stars(rt)

attach(rt)
rt$G1 <- (SC + LC + SMS + DRV + AMB + GSP + POT)/7
rt$G2 <- (FL + EXP + SUIT)/3
rt$G3 <- (LA + HON + KJ)/3
rt$G4 <- AA
rt$G5 <- APP

stars(rt[,16:20])

## 12 
source("unison.R")
win.graph(width = 8, height = 7)
par(mai=c(0.8, 0.8, 0.5, 0.1))
unison(rt[,16:20])

savePlot("exec0311_1", type = "eps")

