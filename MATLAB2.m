%% Matlab Homework Problem Set 2
% Keri Christian, Haoze Yan, Harsha Guddeti
%
% Project Guide Task 1- Task 8
% Chapter 2 #19,20
% Chapter 5 #1,6
%% Task 1
% Keri coded and commented this part
%
% Find $\frac{d}{dy}\frac{sin(x^2y)}{xy^2}$
%
syms x y;
diff((sin((x.^2)*y))/(x*(y.^2)),y) %takes the partial derivative of the function with respect to y
%% Task 2
% Keri coded and commented this part
%
% Find $\frac{d^2}{dxdy}\frac{(x.^3+2*(y.^2))}{sqrt(x+y)}$
%
syms x y;
diff(diff((x.^3+2*(y.^2))/sqrt(x+y),y),x) %takes the 2nd order partial derivative of the function first with respect to y then with respect to x
%% Task 3
% Keri coded and commented this part
%
% Find nabla f for $f(x,y)=\frac{x}{y^2} - x^2e^y$
%
syms x y;
jacobian((x/(y.^2)) - (x^2)*exp(y),[x y])' %finds the jacobian matrix of the function
%% Task 4
% Keri coded and commented this part
%
% Find $\nabla f(1,-2)$ for $f(x,y)=x^22^{xy}$
%
subs(jacobian((x.^2)*(2.^(x*y)),[x y]),{x,y},{1,-2})' %finds the jacobian matrix of the function subbing in the values given into x and y
%% Task 5
% Keri coded and commented this part
%
% Find the directional derivative of $g(x,y) = xy/x+3y$ at $(1,-4)$ in the
% direction $a= 3i - 2j$
%
a=[3 -2]; %direction vector
dot((a/norm(a)),subs(jacobian(x*y/x+3*y,[x y]),{x,y},{1,-4})) %takes the dot product of the unit vector of the direction vector and the jacobian of the function with the values subbed into x and y
%% Task 6
% Keri coded and commented this part
%
% Find all critical points for $f(x, y) = (y-5) ln(xy^2 + x)$. Remember
% that ln in Matlab is log. On your printout write the points as coordinate pairs
% next to the output.
%
syms f(x,y)
f(x,y)=(y-5)*log(x*y.^2+x); %the function given
[xsoln,ysoln]=solve(jacobian(f,[x y])) %solves the jacobian to find critical points of when the partial derivatives are zero
fprintf('The critical point is (%f,%f)',xsoln(1),ysoln(1)) %outputs the critical point
%% Task 7
% Keri coded and commented this part
%
% Find all critical points for $f(x, y) = x^3 + y^3 - 6xy$. On your printout
% write the points as coordinate pairs next to the output. You can ignore any
% complex results because we’re only interested in real results.
%
syms f(x,y)
f(x,y)=x.^3 +y.^3 -6*x*y; %the function given
[xsoln,ysoln]=solve(jacobian(f,[x y])) %solves the jacobian to find critical points of when the partial derivatives are zero
fprintf('The critical points are (%f,%f) and (%f,%f).',xsoln(1),ysoln(1),xsoln(2),ysoln(2)) %outputs the non imaginary critical point
%% Task 8
% Keri coded and commented this part
%
% Use Lagrange multipliers to find the maximum and minimum values
% of $f(x, y) = xy$ subject to the constraint $x^2 + y^2 + 4x = 20$. On your printout
% write a neat summary next to the output.
%
clear all;
syms x y L;
f(x,y)=x*y; %the f function
g(x,y)=x.^2+y.^2+4*x-20; %the constraint g function
firstpart=jacobian(f,[x y])-L*jacobian(g,[x y]); %finds the jacobian of the Langrangian function
[Lsoln,xsoln,ysoln]=solve([firstpart,g]) % solves the jacobian to get critical points at the boundary of the constraint
evaluated = subs(f(x,y),{x,y},{xsoln,ysoln}) %plugs the given critical points into the function to see which is the max and which is the min
fprintf('The minimum value is %f at (%f,%f) and the maximum value is %f at(%f,%f)', evaluated(1), xsoln(1),ysoln(1),evaluated(4),xsoln(4),ysoln(4)) %outputs the max and min
%% Chapter 2 Problem 19
%
%

%% Chapter 2 Problem 20
%
%

%% Chapter 5 Problem 1
%
%

%% Chapter 5 Problem 6
%
%
