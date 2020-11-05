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