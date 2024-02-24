rt <- read.table("../chap08/exam0814.data")
d <- dist(scale(rt))
cmds <- cmdscale(d)
plot(cmds, pch=19, col= "blue", 
     xlim = c(-6, 2.3), ylim=c(-2.5, 3.3), 
     xlab = "Frist Component", ylab = "Second Component")
text(cmds, label = rownames(rt), adj=c(.5, -1))

win.graph(width=10, height=7)
par(mai=c(0.8, 0.8, 0.1, 0.1))

sam <- sammon(d); sam
plot(sam$points, pch=19, col= "blue", 
     xlim = c(-6, 2.2), ylim=c(-2.5, 3.3), 
     xlab = "Frist Component", ylab = "Second Component")
text(sam$points, label = rownames(rt), adj=c(.5, -1))

iso <- isoMDS(d); iso
plot(iso$points, pch=19, col= "blue",
     xlim = c(-6, 2.3), ylim=c(-3.7, 3.5), 
     xlab = "Frist Component", ylab = "Second Component")
text(iso$points, label = rownames(rt), adj=c(.5, -1))

##-----------------------------------------------------------------##
z <- scan("../chap08/exam0813.data")
names <-c("身高", "手臂长", "上肢长", "下肢长", "体重", "颈围",
          "胸围", "胸宽")
r <- matrix(1, nc = 8, nr = 8, dimnames = list(names, names))
for (i in 1:7){
    for( j in 1:i){
        r[i+1,j] <- r[j, i+1]<-z[i*(i-1)/2+j]
    }
}

d <- as.dist(1-r)
cmds <- cmdscale(d)
plot(cmds, pch=19, col= "blue", xlim=c(-0.4, 0.4), ylim=c(-0.2, 0.3), 
     xlab = "Frist Component", ylab = "Second Component")
text(cmds, label = names, adj=c(.5, -1))

sam <- sammon(d); sam
plot(sam$points, pch=19, col= "blue", xlim=c(-0.4, 0.4), ylim=c(-0.3, 0.4), 
     xlab = "Frist Component", ylab = "Second Component")
text(sam$points, label = names, adj=c(.5, -1))

iso <- isoMDS(d, tol = 1e-4,  maxit = 100); iso
plot(iso$points, pch=19, col= "blue", xlim=c(-0.7, 0.7), ylim=c(-0.4, 0.5),
     xlab = "Frist Component", ylab = "Second Component")
text(iso$points, label = names, adj=c(.5, -1))

##--------------------------------------------------------##
## 6.
rt <- read.table("../chap03/applicant.data"); rt
r <- cor(rt)

d <- as.dist(1-r)
cmds <- cmdscale(d)
plot(cmds, pch=19, col= "blue", xlim=c(-0.5, 0.6), ylim=c(-0.5, 0.7),
     xlab = "Frist Component", ylab = "Second Component")
text(cmds, label = colnames(rt), adj=c(.5, -1))

win.graph(width=12, height=7)
par(mai=c(0.8, 0.8, 0.1, 0.1))

sam <- sammon(d); sam
plot(sam$points, pch=19, col= "blue", xlim=c(-0.7, 0.7), ylim=c(-0.5, 0.6), 
     xlab = "Frist Component", ylab = "Second Component")
text(sam$points, label = colnames(rt), adj=c(.5, -1))

iso <- isoMDS(d); iso
plot(iso$points, pch=19, col= "blue", 
     xlim=c(-0.80, 0.81), ylim=c(-0.55, 0.60),
     xlab = "Frist Component", ylab = "Second Component")
text(iso$points, label = colnames(rt), adj=c(.5, -1))






