tree <- data.frame(
    Y = scan("exam0711.data"), 
    A = gl(3, 20, 60),
    B = gl(4, 5, 60)
)

##%% 因素A的正态性检验
with(tree, tapply(Y, A, shapiro.test))

##%% 因素B的正态性检验
with(tree, tapply(Y, B, shapiro.test))

##%% 关于因素A的Bartlett方差齐性检验
bartlett.test(Y ~ A, data = tree)

##%% 关于因素B的Bartlett方差齐性检验
bartlett.test(Y ~ B, data = tree)

