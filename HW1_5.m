syms x
f1 = (x.^2+5.*x-1).^100;
diff(f1)
f2 = (x^2*exp(x)-1)/(x^2+2);
diff(f2)
f3=(sin(x))^5*(cos(x))^3;
diff(f3)
f4=atan(exp(x));
diff(f4)