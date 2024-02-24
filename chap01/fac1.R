fac = function(n) {
    f <- 1
    if (n > 0){
        for(i in 1:n)
            f <- f * i
    }
    f
}
