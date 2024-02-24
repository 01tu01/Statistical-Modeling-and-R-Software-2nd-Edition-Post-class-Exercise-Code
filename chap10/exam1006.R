names <-c("����", "�ֱ۳�", "��֫��", "��֫��", "����", "��Χ", "��Χ", "�ؿ�")
z <- scan("../chap08/exam0813.data")
r <- matrix(1, nc = 8, nr = 8)
for (i in 1:7){
    for( j in 1:i){
        r[i+1,j] <- r[j, i+1]<-z[i*(i-1)/2+j]
    }
}
d <- as.dist(1-r); cmds <- cmdscale(d)
plot(cmds, pch=19, col= "blue", 
     xlim = c(-0.4, 0.4), ylim = c(-0.2, 0.3), 
     xlab = "Frist Component", ylab = "Second Component")
text(cmds, label = names, adj=c(.5, -1))

savePlot("exam1006", type = "bmp")