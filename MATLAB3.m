%% Matlab Homework Problem Set 3
% Keri Christian, Haoze Yan, Chloe Mackenzie
%
% Project Guide Task 1-2 and Task 5
%
% Chapter 3 #1d,f,h
%
% Chapter 8 #2c,d #11b,d #12b,d
%% Task 1
% Haoze code this problem. 
% calculate the integral
syms x y z;
a1=int(int(int(x,z,0,9-x^2-y^2),y,0,x),x,0,2);
a1


%% Task 2
% Haoze code this problem. 
% calculate the integral
syms theta r z;
a2=int(int(int(z*r,z,0,10-r*cos(theta)),r,0,sin(theta)),theta,0,pi/2);
a2

%% Task 5
%

%% 2.1
%

%% 8.2
%

%% Problem 8.11
% Keri coded this problem.
%
% Use the viewSolid program from Chapter 8 to sketch the region
% over which each of the following triple integrals extends, and then evaluate the
% integrals.
%
% (b) $\int_{0}^{1} \int_{0}^{ \sqrt{1-y^2}} \int_{x^2+y^2-1}^{1-x^2-y^2} e^y \sqrt{1-y^2} dz dx dy$
%
syms x y z
figure(1);
fun = @(x,y,z) exp(y).*sqrt(1-y.^2);
viewSolid('x', 0, 1, 'y', @(x)0*x, @(x) sqrt(1-x.^2), 'z', @(x,y) x.^2+y.^2-1, @(x,y) 1-x.^2-y.^2)
answer1=integral3(fun,0,1, @(x) x*0, @(x) sqrt(1-x.^2),@(x,y) x.^2+y.^2-1, @(x,y) 1-x.^2-y.^2)
fprintf('The value of the evaluated integral is %f',answer1)
%%
% (d) $\int_{0}^{1} \int_{0}^{ x^2} \int_{0}^{x^3-y^3} x^2y^2e^z dz dy dx$
syms x y z
figure(2);
fun = @(x,y,z) exp(z).*x.^2.*y.^2;
viewSolid('x', 0, 1, 'y', @(x)0.*x, @(x) x.^2, 'z', @(x,y) 0.*x.*y, @(x,y) x.^3-y.^3)
answer2=integral3(fun,0,1,@(x)0.*x, @(x) x.^2,@(x,y) 0.*x.*y, @(x,y) x.^3-y.^3)
fprintf('The value of the evaluated integral is %f',answer2)
%% Problem 8.12
% Keri coded part b, Shruthi coded part d.
%
% In each part of this problem, use the viewSolid program from
% Chapter 8 to sketch the region D over which the integral extends, and then evaluate
% the triple integral. You should be able to determine the limits of integration directly
% from the description of D. In (c) and (d), it may help to think about planes that contain
% three of the given points
%
% (b)

