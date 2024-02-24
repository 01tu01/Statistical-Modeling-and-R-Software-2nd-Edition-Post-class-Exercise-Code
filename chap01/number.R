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