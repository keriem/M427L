%% Matlab Homework Problem Set 1 
% Keri Christian, Brynn 
% Chapter 1 1-9, 11
% Chapter 2 2,5,11-14,17,18
%% Problem A.1
% Keri coded part a and b. Keri commented part a and b. 
% (a) plot |sin(x)| using fplot 
% 
sinx = @(x)(sin(x)) % making sinx an equation that fplot can call
i =1; % setting up an increment variable for all of the figures made for the graphs using fplot
figure(i)
fplot(sinx,'r') %plotting the equation
hold off
title('Plot of Funtion for Problem A.1.a')
%%
% (b) plot |tan(x)| using fplot
%
i=i+1; %incrementing 
figure(i);
tanx = @(x)(tan(x)) % making tanx an equation that fplot can call
fplot(tanx,'b')  %plotting the equation
hold off
title('Plot of Funtion for Problem A.1.b')
%%
% (c) plot |ln(x)| using f plot
%
i=i+1;  %incrementing 
figure(i);
lnx = @(x)(log(x)) % making lnx an equation that fplot can call
x = [0 10] % setting a xmin and xmax for fplot to use
fplot(lnx,x,'g') %plotting the equation
hold off
title('Plot of Funtion for Problem A.1.c')
%% 
% (c) 

%%
% (d)
%% Problem A.8
% Keri coded part a and b. Keri commented code for part a and b.
%
% The alternating harmonic series
% $1-\frac{1}{2}+\frac{1}{3}-\frac{1}{4}+\frac{1}{5}+...$ is known to converge (slowly!!) to $\ln (2)$
%
% (a) Test this by adding the first 100 terms of the series and comparing with the
% value of $\ln (2)$. Do the same with the first 1000 terms
%
sign = -1; %using this to be able to flip sign for every other term
output1 =0; %initializing the output of the alternating harmonic series
    for i = 1:100 %for loops from 1 to 100 terms 
        sign = -sign; %flips the sign each time
        output1 = output1 + sign*(1/i); %adds this term to the output
    end
    
sign = -1; %using this to be able to flip sign for every other term
output2 =0; %initializing the output of the alternating harmonic series
    for i = 1:1000 %for loops from 1 to 1000 terms 
        sign = -sign; %flips the sign each time
        output2 = output2 + sign*(1/i); %adds this term to the output
    end

output1 % adding the first 100 terms of the alternating harmonic series
error1 = abs(vpa(log(2)-output1, 5)) % compares the output of 100 terms of the alternating harmonic series to ln2
output2 % adding the first 1000 terms of the alternating harmonic series
error2 = abs(vpa(log(2)-output2, 5)) % compares the output of 1000 terms of the alternating harmonic series to ln2

%It is pretty close to ln2, but the 1000 terms has slightly less error than
%100 terms
%%
% (b) The alternating series test says that the error in truncating an alternating
% series (whose terms decrease steadily in absolute value) is less than the absolute
% value of the last term included. Check this in the situation of (a). In other words,
% verify that the difference between $\ln (2)$ and the sum of the first 100 terms of the
% series is less than $\frac{1}{100}$ in absolute value, and that the difference between $\ln (2)$ and
% the sum of the first 1000 terms of the series is less than $\frac{1}{1000}$ in absolute value.
%
error1 = abs(vpa(log(2)-output1, 5)) % takes the difference between ln2 and sum of first 100 terms
if error1 < 1/100 %will be true (logical 1) if the difference is less than 1/100
    true
end
error2 = abs(vpa(log(2)-output2, 5)) % takes the difference between ln2 and sum of first 100 terms
if error2 < 1/1000 %will be true (logical 1) if the difference is less than 1/100
    true 
end

%% Problem A.9
% Keri coded this and commented this.
%
% The harmonic series
% $1+\frac{1}{2}+\frac{1}{3}+\frac{1}{4}+\frac{1}{5}+...$ diverges
% (slowly!!) by the integral test. This test also implies that the sum of the first
% n terms of the series is approximately lnn. Test this by adding the first 100 terms of
% the series and comparing with the value of $\ln (100)$, and by adding the first 1000 terms
% of the series and comparing with the value $\ln (1000)$. Do you see any pattern? If so,
% test it by replacing 1000 by 10000.
%
output1 =0; %initializing the output of the harmonic series
    for i = 1:100 %for loops from 1 to 100 terms 
        output1 = output1 + (1/i); %adds this term to the output
    end
    
output2 =0; %initializing the output of the harmonic series
    for i = 1:1000 %for loops from 1 to 1000 terms 
        output2 = output2 + (1/i); %adds this term to the output
    end

output1 % adding the first 100 terms of the harmonic series
error1 = abs(vpa(log(100)-output1, 5)) % compares the output of 100 terms of the harmonic series to ln(100)
output2 % adding the first 1000 terms of the harmonic series
error2 = abs(vpa(log(1000)-output2, 5)) % compares the output of 1000 terms of the harmonic series to ln(1000)

% The pattern I notice is ... (I dont notice a pattern someone help)

output3 =0; %initializing the output of the harmonic series
    for i = 1:10000 %for loops from 1 to 1000 terms 
        output3 = output3 + (1/i); %adds this term to the output
    end
    
output3 % adding the first 10000 terms of the harmonic series
error3 = abs(vpa(log(10000)-output3, 5)) % compares the output of 10000 terms of the harmonic series to ln(10000)
%% Problem A.11
% Keri coded parts a,b,c, and d.
% 
% Use the $\textbf{ezpolar}$ command in MATLAB to graph the following
% equations in polar coordinates.
%
% (a) $r = sin(\theta)$
%

i=i+1;
figure(i);
ezpolar('sin(t)')
hold off
%%
% (b) $r = sin(6\theta)$
%

i=i+1;
figure(i);
ezpolar('sin(6*t)')
hold off
%%
% (c) $r = 4sin(\theta)-2$
%

i=i+1;
figure(i);
ezpolar('(4*sin(t))-2')
hold off
%%
% (d) $r^2 = sin(2\theta)$
%

i=i+1;
figure(i);
ezpolar('sqrt(sin(2*t))')
hold off
%% Problem B.2
% Keri coded this and commented this.
%
%Show that the point P = (2, 0, 3) is equidistant from the two points
%Q1 = (0.12, -1, 5.55) and Q2 = (3.88, 1, 0.45).
%
pq1 = [0.12-2, -1, 5.55-3]; %creating a vector from point P to point Q1
distance1 = norm(pq1) %taking the norm of the vector pq1 to find the distance from point P to point Q1
pq2 = [3.88-2, 1, 0.45-3]; %creating a vector from point P to point Q2
distance2 = norm(pq2) %taking the norm of the vector pq2 to find the distance from point P to point Q2
%
% distance1 = distance2 means that point P is equidistant to point Q1 and
% Q2.
%% Problem B.5
% Keri coded this and commented this.
%
% Compute the angle (in degrees) that the vector a = -24.56i + 44.689j
% makes with the x-axis, measured counterclockwise from the x-axis
%
a = [-24.56,44.689,0]; %creating vector a
b = [1,0,0]; % vector b is the x axis, or the i component of a 
theta = acos(dot(a, b)/(norm(a)*norm(b))); % finds the angle in radians between vector a and the x axis
theta*180/pi %converts the angle into degrees
%% Problem B.11
% Keri coded this and commented this
%
% Prove the identity
% ||a × b|| ^2 = ||a|| ^2 * ||b|| ^2 ? (a · b) ^2
% by assigning letter (i.e., variable) coordinates to a and b and evaluating both sides
% of the identity using MATLAB.
%
a = [1,1,1]; %a generic vector for vector a 
b = [1,2,3]; % a generic vector for vector b
lhs = dot(cross(a,b),cross(a,b)) %calculating the left hand side of the expression
rhs = (norm(a))^2 * (norm(b))^2 - dot(a,b)^2 %calculating the right hand side of the expression
%
% Because the left hand side is equal to the right hand side this identity
% is true.
%% Problem B.12
% Keri coded part a and b and commented part a and b. 
%
% (a) Find the volume of the parallelepiped determined by the three vectors:
% a = (8324, 5789, 2098),
% b = (9265, ?246, 8034),
% c = (4321, ?765, 7903).
%
a = [8324, 5789, 2098];
b = [9265, ?246, 8034];
c = [4321, ?765, 7903];
volume = dot(a,cross(b,c))
%%
% (b)  Now consider all parallelepipeds whose base is determined by the vectors
% a = (2, 0, ?1) and b = (0, 2, ?1), and whose height is variable c = (x, y,z).
% Assume that x, y, and z are positive and c = 1. Use the triple product to compute a formula for the volume of the parallelepiped involving x, y, and z. Compute the maximum value of that volume in terms of x and y as follows. It is clear
% from the following formula:
% c · (a × b) = c a × b cos ?,
% where ? is the angle between c and the line perpendicular to the plane determined by a and b, that the maximum occurs when c is perpendicular to both
% a and b. Use the dot product to determine the vector c yielding the maximum
% value. (We will see in Chapter 7, Optimization in Several Variables, how to
solve multivariable max-min problems.)