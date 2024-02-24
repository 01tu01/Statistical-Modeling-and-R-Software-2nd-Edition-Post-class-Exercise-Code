tree <- data.frame(
    Y = scan("exam0711.data"), 
    A = gl(3, 20, 60),
    B = gl(4, 5, 60)
)

##%% ����A����̬�Լ���
with(tree, tapply(Y, A, shapiro.test))

##%% ����B����̬�Լ���
with(tree, tapply(Y, B, shapiro.test))

##%% ��������A��Bartlett�������Լ���
bartlett.test(Y ~ A, data = tree)

##%% ��������B��Bartlett�������Լ���
bartlett.test(Y ~ B, data = tree)
