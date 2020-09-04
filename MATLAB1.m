%% Matlab Homework Problem Set 1 
% Keri Christian, Brynn 
% Chapter 1 1-9, 11
% Chapter 2 2,5,11-14,17,18
%% Problem A.1
% 
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