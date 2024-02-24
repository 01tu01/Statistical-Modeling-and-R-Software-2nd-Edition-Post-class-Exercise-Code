VIF.test <- function(X){
    n <- ncol(X); VIF <- numeric(n)
    Names <- colnames(X) 
    for (i in 1:n){
        formula <- paste0(Names[i], ' ~ .')
        lm.sol <- lm(formula, data = X)
        lm.sum <- summary(lm.sol)
        R2 <- lm.sum$r.squared
        VIF[i] <- 1/(1-R2)
    }
    names(VIF) <- Names
    VIF
}


rt <- read.table("exam0618.data")
XX <- cor(rt[, 2:7])
kappa(XX, exact=TRUE)
eigen(XX)


source("VIF.test.R")
VIF.test(rt[,-1])

diag(solve(XX))

rt <- read.table("cigarette.data",  header = TRUE); rt
lm.sol <- lm(CO ~ TAR + NICOTINE + WEIGHT, data = rt)   
summary(lm.sol)

Xdata <- rt[,-4]
XX <- cor(Xdata)

VIF.test(rt[,-4])


lm.ste <- step(lm.sol)
summary(lm.ste)

cor.test(TAR, NICOTINE)

lm.ste <- step(lm.sol, scope= ~TAR+NICOTINE+WEIGHT)
summary(lm.ste)
