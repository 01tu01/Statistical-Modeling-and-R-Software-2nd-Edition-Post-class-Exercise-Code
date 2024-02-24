z <- scan("exam1001.data"); z
n <- 12
D <- matrix(0, nc=n, nr=n); k <- 1
for (i in 2:n){
    for(j in 1:(i-1)){
        D[i,j] <- D[j,i] <- z[k]; k <- k+1
    }
}
cmds <- cmdscale(D); library(MASS)
sam <- sammon(D); iso <- isoMDS(D, tol = 1e-4)
Names <- c("Aberystwyth", "Brighton", "Carlisle", "Dover", 
   "Exeter", "Glasgow", "Hull", "Inverness", "Leeds", "London", 
   "Newcastle", "Norwich")
plot(sam$points, type = "n", 
     xlim = c(-410, 230), ylim = c(-140, 170),
     xlab = "Frist Component", ylab = "Second Component")
text(sam$points, label = Names, adj = c(.5, -1))

points(cmds, pch=19, col= "blue")
points(iso$points, pch=15, col= "brown")
points(sam$points, pch=17, col= "red")
legend(-400, 150,legend=c("cmdscale", "isoMDS", "sammon"), 
       pch=c(19, 15, 17), col=c("blue", "brown", "red"))

win.graph(width=10, height=7)
par(mai=c(0.8, 0.8, 0.1, 0.1))

savePlot("exam1004", type = "eps")


