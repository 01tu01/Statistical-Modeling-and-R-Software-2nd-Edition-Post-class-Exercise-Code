panel.lm <- function(x, y, ...){
    tmp <- lm(y ~ x, na.action = na.omit)
    abline(tmp)
    points(x, y, ...)
}
