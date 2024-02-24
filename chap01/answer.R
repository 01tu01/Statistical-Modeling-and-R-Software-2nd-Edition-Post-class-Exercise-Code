## 4
library(foreign)
rs <- read.spss("educ_scores.sav")
as.data.frame(rs)

## 5
install.packages("e1071")
library(e1071)
library(help = "e1071")  

## 7
seq(0, 10, by = 3)
seq(0, 10, length = 4)

## 8
x <- rep(1:4, c(5, 3, 4, 2)); x 

## 9
A <- matrix(1:20, nr = 4, nc = 5); A
B <- matrix(1:20, nr = 4, nc = 5, byrow = TRUE); B
C <- A[1:3, 1:3]; C
D <- B[,-3]; D

## 10 
x <- c(1, 3, 5, 7, 9)
X <- cbind(1, x, x^2)
colnames(X) <- c("const", "x", "x^2")
rownames(X) <- 1:5
X

## 11
hilb <- function(n){
    H <- matrix(0, nc = n, nr = n)
    for (i in 1:n){
        for (j in 1:n){
            H[i,j] <- 1/(i+j-1)
        }
    }
    H
}
hilb(5)

## 12
df <- data.frame(
    姓名 = c("张三", "李四", "王五", "赵六", "丁一"), 
    性别 = c("女", "男", "女", "男", "女"), 
    年龄 = c(14, 15, 16, 14, 15), 
    身高 = c(156, 165, 157, 162, 159), 
    体重 = c(42.0, 49.0, 41.5, 52.0, 45.5)
)
df

## 13
x <- 1:3; y <- 4:6
z <- 2*x + y + 1; z
x %*% y
x %o% y


## 14
A <- matrix(c(1, 2, 0, 2, 5, -1, 4, 10, -1), nc = 3, byrow = TRUE); A
B <- t(A); B
C <- A + B; C
D <- A %*% B; D
E <- A * B; E

## 15 
b <- c(1, -1, 1)
x <- solve(A, b); x
B <- solve(A); B
B %*% b 

## 16 
A <- matrix(c(1, 2, 4, 2, 5, 10, 0, -1, -1), nr=3)
QR <- qr(A); qr.Q(QR); qr.R(QR) # (1)
svd(A) # (2)
eigen(A) # (3)

## 17
Lst <- scan(, what = list(ID = 0, Name = "", Num = 0))
    1  dog  3
    2  cat  5
    3  duck 7

Lst

## 18 
f <- function(x) exp(-x^2)*(-2*x^2-2*x*sin(x)+1+cos(x)) 
uniroot(f, c(0, 2))
uniroot(f, c(-2, 0))

## 19 
library(nleqslv)
funs <- function(x) 
    c(x[1] - 0.7*sin(x[1]) - 0.2*cos(x[2]), 
      x[2] - 0.7*cos(x[1]) + 0.2*sin(x[2]) ) 
nleqslv(x = c(0, 0), fn = funs)

## 20 
f <- function(x) exp(-x^2)*(x+sin(x)) 
optimize(f, interval = c(-2, 2))
optimize(f, interval = c(-2, 2), maximum = TRUE)

## 21 
obj <- function(x) 
    (-13 + x[1] + ( (5-x[2])*x[2] - 2)*x[2])^2 + 
    (-29 + x[1] + ( (x[2]+1)*x[2] - 14)*x[2] )^2 
nlm(obj, c(0.5, -2))

## 22 
write.table(df, file = "exec0122.data", quote = FALSE)
write.csv(df, file = "exec0122.csv")
library(openxlsx)
write.xlsx(df, file = "exec0122.xlsx")

## 23
rt <- read.table("exec0122.data"); rt
rc <- read.csv("exec0122.csv"); rc
rx <- read.xlsx("exec0122.xlsx"); rx

## 24 
number <- function(){
    print("请输入一个正整数后，回车，再回车")
    n <- scan()
    if (n <= 0){print("输入负数退出")}
    else{
        while (n > 1){
            cat('n =', n, '\n')
            if (n %% 2 == 0){ n <-  n/2}
            else{ n <- 3*n + 1}
        }
        print("运算成功!")
    }
}
number()

