%1.6a
syms x
f1 = (x^2+5*x-1)^10*(2*x+5);
F1 = int(f1);
disp(F1)

%b
f2 = asin(x);
F2 = int(f2);
disp(F2)

%c
f3 = @(x) x.^5.*(1-x.^2).^(3/2);
F3 = integral(f3,0,1);
disp(F3)

%d
f4= @(x) x.^5.*(1-x).^(3/2);
F4 = integral(f4,0,1);
disp(F4)

%e
f5 = @(x) x.^5.*exp(-x.^2);
F5 = integral(f5,0,Inf);
disp(F5)

%f
f6 = @(x) exp(exp(x));
F6 = integral(f6,0,1);
disp(F6)

%g
f7 = exp(x).*(cos(x)).^3 .*(sin(x)).^2;
F7 = int(f7);
disp(F7)

%h
f8 = @(x) sin(x.^3);
F8 = integral(f8,0,1);
disp(F8)


