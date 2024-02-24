chi2gof <- function(chi2test, nparams){
    X <- chi2test$statistic
    df <- chi2test$parameter - nparams;   
    Pval <- 1 - pchisq(X, df)
    names(Pval) <- "P-val"
    c(X, df, Pval)
}