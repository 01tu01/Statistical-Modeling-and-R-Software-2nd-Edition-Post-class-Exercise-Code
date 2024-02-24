P_value <- function(z, side = 0){
    p <- pnorm(z) 
    if (side < 0 ) p
    else if (side > 0 ) 1 - p
    else
        if (p<1/2) 2*p
        else       2*(1-p)
}
