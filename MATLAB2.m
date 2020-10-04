%% Matlab Homework Problem Set 2
% Keri Christian, Haoze 
%
% Project Guide Task 1- Task 8
% Chapter 2 #19,20
% Chapter 5 #1,6
%% Task 1
% Find d/dy (sin(x^2y)/xy^2)
%
syms x y;
diff((sin((x.^2)*y))/(x*(y.^2)),x)
%% Task 2
% Find d^2/dxdy ((x.^3+2*(y.^2))/sqrt(x+y))
%
syms x y;
diff(diff((x.^3+2*(y.^2))/sqrt(x+y),y),x)
%% Task 3
% Find nabla f for $f(x,y)=\frac{x}{y^2} - x^2e^y$
%
syms x y;
jacobian((x/(y.^2)) - (x^2)*exp(y),[x y])'
%% Task 4
% Find nabla f(1,-2) for $f(x,y)=x^22^{xy}$
%
subs(jacobian((x.^2)*(2.^(x*y)),[x y]),{x,y},{1,-2})'