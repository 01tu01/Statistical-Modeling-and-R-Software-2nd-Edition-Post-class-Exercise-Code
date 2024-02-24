var1.test <- function(x, sigma2, alternative = "two.sided", 
                      alpha = 0.05){
    S2 <- var(x); df <- length(x) - 1
    chi2 <- df*S2/sigma2; p <- pchisq(chi2, df) 
    if (alternative == "less" | alternative == "l"){
        a <- 0
        b <- df*S2/qchisq(alpha, df)
    }
    else if (alternative == "greater" | alternative == "g"){
        a <- df*S2/qchisq(1 - alpha, df)
        b <- Inf
        p <- 1 - p
    }
    else{
        a <- df*S2/qchisq(1-alpha/2, df)
        b <- df*S2/qchisq(alpha/2, df)
        p <- if (p < 1/2) 2*p  else  2*(1-p)
    }
    data.frame(X.squared = chi2, sample.var = S2, p.value = p, 
         df = df, a = a, b = b)
}
