z <- scan("exam0902.data")
R <- matrix(1, nrow = 16, ncol = 16); k <- 1
for (i in 2:16){
   for (j in 1:(i-1)){
      R[i,j] <- R[j,i] <- z[k]; k <- k + 1
   }
}
R
pr <- princomp(covmat = R); load <- loadings(pr)

Names <- c("����", "����", "��Χ", "ͷ��", "�㳤", "����", "�ֳ�", "��Χ", 
           "ǰ��", "��", "���", "���", "�䳤", "��Χ", "��Χ", "�ȶ�")
plot(load[,1:2], type="n"); text(load[,1:2], label = Names)


savePlot("princom", type = "bmp")

win.graph(width=10, height=7)
par(mai=c(0.9, 0.9, 0.1, 0.1))
