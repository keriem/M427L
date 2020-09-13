%1.4a
syms x
lim1= limit((x^2+3*x-4)/(x-1),x,1);
lim1= double(lim1);

%1.4b
lim2=limit(sin(x)/x,x,0);
lim2= double(lim2);

%1.4c
lim3=limit(x*log(x),x,0,'right');
lim3= double(lim3);