%1.3a
x=0:pi/100:5*pi;
y1= x.*sin(x);
y2= x.^0;
plot(x,y1,x,y2); 
%the first five solution is the five intersections of the redline and the
%blue line. 

%1.3b
%Since x*sin(x)=1, so sin(x)=1/x. While x becomes greater, sin(x) is closer
%to 0, which means x is closer to n*pi.

%1.3c
syms x;
x1=fzero(fun,1);
x2=fzero(fun,3);
x3=fzero(fun,5);
x4=fzero(fun,9);
x5=fzero(fun,12);
%here x1 to x5 are the five solutions. 

function f=fun(x)
f= @(x) x*sin(x)-1;
end

