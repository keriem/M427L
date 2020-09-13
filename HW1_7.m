
syms x
f = sec(x);
T = taylor(f,'Order',12);
fprintf('Taylor series is %s \n', T)