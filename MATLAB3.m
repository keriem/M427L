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
% Chloe coded this problem.
% Plot the vector field F?(x, y) = 0.2(x + y)i + 0.2(x ? y)j

[x,y]=meshgrid(-5:1:5,-5:1:5); % assigning the grid to plot
quiver(x,y,0.2*(x+y),0.2*(x-y),0) % plotting the vector field

%% Problem C: 1d
% A hyperbolic helix: r(t)=(?(1+t^2/2), t/?2, arcsinh(t/?2)), t ? R

syms t u;

helix = [sqrt(1+(t^2)/2), t/sqrt(2), asinh(t/sqrt(2))];
changeHelix = subs(helix, t, sqrt(2)*sinh(u));
fplot3(changeHelix(1),changeHelix(2),changeHelix(3), [-3,3])

realdot = @(x,y) x*transpose(y); % Different functions used to calculate our computations
vectorlength = @(x) sqrt(simplify(realdot(x,x)));
unitvector = @(x) simplify(x/vectorlength(x));
velocity = @(r, t) diff(r, t);
acceleration = @(r, t) simplify(diff(velocity(r, t), t));
thirdder = @(r, t) simplify(diff(acceleration(r, t), t));
speed = @(r, t) vectorlength(velocity(r, t));
vta = @(r, t) simplify(cross(velocity(r, t), acceleration(r, t)));
UT = @(r, t) unitvector(velocity(r, t));
UN = @(r, t) unitvector(diff(UT(r, t), t));
UB = @(r, t) simplify(cross(UT(r, t), UN(r, t)));
curvature = @(r, t) simplify(vectorlength(vta(r, t))/speed(r, t)^3);
torsion = @(r, t) simplify(realdot(vta(r, t), thirdder(r, t))/realdot(vta(r, t), vta(r, t)));

T = UT(changeHelix,u)
N = UN(changeHelix,u) % Calculating the Frenet Frame using the above functions
B = UB(changeHelix,u)
helixSpeed = speed(changeHelix,u) % Calculating the speed using the above functions
helixCurvature = curvature(changeHelix,u) % Calculating the curvature using the above functions
helixTorsion = torsion(changeHelix,u) % Calculating the torsion using the above functions

% The curvature and torsion is never going to be undefined as the graph is
% always a smooth curve with no points or peaks. The curvature and torsion 
% is going to be greatest around t=0 since this is where the curve turns the
% most. The name of the curve is appropriate because the shape is similar
% and related to that of a hyperbola.

%% Problem C: 1f
% Chloe coded this problem.
% Vivani's curve: r(t)=(1+cost, sint, 2sin(t/2)), ?? ? t ? ?

syms t;
vivani = [1+cos(t), sin(t), 2*sin(t/2)];

fplot3(vivani(1),vivani(2),vivani(3), [-pi,pi]) % Plotting Vivani's curve from Ch. 2
hold on
fplot3(sym(0), 2*cos(t/2), 2*sin(t/2), [-pi,pi])
fplot3(2*cos(t/2), sym(0), 2*sin(t/2), [-pi,pi])
fplot3(2*cos(t/2), 2*sin(t/2), sym(0), [-pi,pi])
fplot3(1+cos(t), sin(t), sym(0), [-pi, pi])
fplot3(sym(0), sym(0), t, [0 2]);
fplot3(sym(0), t, sym(0), [0 2]);
fplot3(t, sym(0), sym(0), [0 2])
title(''); xlabel(''); ylabel(''); xlabel('');
grid off; axis off;
view([10,3,1])

realdot = @(x,y) x*transpose(y); % Different functions used to calculate our computations
vectorlength = @(x) sqrt(simplify(realdot(x,x)));
unitvector = @(x) simplify(x/vectorlength(x));
velocity = @(r, t) diff(r, t);
acceleration = @(r, t) simplify(diff(velocity(r, t), t));
thirdder = @(r, t) simplify(diff(acceleration(r, t), t));
speed = @(r, t) vectorlength(velocity(r, t));
vta = @(r, t) simplify(cross(velocity(r, t), acceleration(r, t)));
UT = @(r, t) unitvector(velocity(r, t));
UN = @(r, t) unitvector(diff(UT(r, t), t));
UB = @(r, t) simplify(cross(UT(r, t), UN(r, t)));
curvature = @(r, t) simplify(vectorlength(vta(r, t))/speed(r, t)^3);
torsion = @(r, t) simplify(realdot(vta(r, t), thirdder(r, t))/realdot(vta(r, t), vta(r, t)));

T = UT(vivani,t)
N = UN(vivani,t) % Calculating the Frenet Frame using the above functions
B = UB(vivani,t)
vivaniSpeed = speed(vivani,t) % Calculating the speed using the above functions
vivaniCurvature = curvature(vivani,t) % Calculating the curvature using the above functions
vivaniTorsion = torsion(vivani,t) % Calculating the torsion using the above functions

% The curvature and torsion is never going to be undefined as the graph is 
% always curved with no sharp points or peaks.

%% Problem C : 1h
% Haoze code this problem

syms t real; 
limacon=[2*cos(t)*cos(t)+cos(t),2*cos(t)*sin(t)+sin(t),0];
helplot=fplot3(limacon(1),limacon(2),limacon(3),[0,4*pi]);
view([1,1,1])

realdot = @(x,y) x*transpose(y);
vectorlength = @(x) sqrt(simplify(realdot(x,x)));
unitvector = @(x) simplify(x/vectorlength(x));

velocity = @(r, t) diff(r, t);
acceleration = @(r, t) simplify(diff(velocity(r, t), t));
thirdder = @(r, t) simplify(diff(acceleration(r, t), t));
speed = @(r, t) vectorlength(velocity(r, t));
vta = @(r, t) simplify(cross(velocity(r, t), acceleration(r, t)));
UT = @(r, t) unitvector(velocity(r, t));
UN = @(r, t) unitvector(diff(UT(r, t), t));
UB = @(r, t) simplify(cross(UT(r, t), UN(r, t)));
curvature = @(r, t) simplify(vectorlength(vta(r, t))/speed(r, t)^3);
torsion = @(r, t) simplify(realdot(vta(r, t), thirdder(r, t))...
/realdot(vta(r, t), vta(r, t)));

velocity(limacon,t);
s=speed(limacon,t);
acceleration(limacon,t);
T=UT(limacon,t);
N=UN(limacon,t);
B=UB(limacon,t);


fprintf("The speed is %s\n",s);
fprintf("The Fernet frame is UT=(%s,%s,%s),\n UN=(%s,%s,%s),\n and UB=(%s,%s,%s)\n",T(1),T(2),T(3)...
    ,N(1),N(2),N(3),B(1),B(2),B(3));

c=curvature(limacon,t);
fprintf("The curvature is %s\n",c);


t=torsion(limacon,t);
fprintf("The torsion is %s\n",t);

% The curvature and torsion is always defined as the graph is 
% curved smoothly.
%% Problem H: 8.2 c
% Shruthi coded this problem.

syms x y

f1 = @(x,y) (x.^2 + y.^2);

xmin1 = 3/sqrt(2);
xmax1 = 3;
ymin1 = 0;
ymax1 = @(x) sqrt(9-x.^2);

q1 = integral2(f1, xmin1, xmax1, ymin1, ymax1)

%% Problem H: 8.2 d
% Shruthi coded this problem 

syms x y

f2 = @(x,y) ((x.^2+y.^2).^3/2);

xmin2 = 0;
xmax2 = 1;
ymin2 = @(x) sqrt(x-x.^2);
ymax2 = @(x) sqrt(1-x.^2);

q2 = integral2(f2, xmin2, xmax2, ymin2, ymax2)
%% Problem H: 8.11
% Keri coded this problem.
%
% Use the viewSolid program from Chapter 8 to sketch the region
% over which each of the following triple integrals extends, and then evaluate the
% integrals.
%
% (b) $\int_{0}^{1} \int_{0}^{ \sqrt{1-y^2}} \int_{x^2+y^2-1}^{1-x^2-y^2} e^y \sqrt{1-y^2} dz dx dy$
%
syms x y z
figure;
fun = @(x,y,z) exp(y).*sqrt(1-y.^2);
viewSolid('x', 0, 1, 'y', @(x)0*x, @(x) sqrt(1-x.^2), 'z', @(x,y) x.^2+y.^2-1, @(x,y) 1-x.^2-y.^2)
answer1=integral3(fun,0,1, @(x) x*0, @(x) sqrt(1-x.^2),@(x,y) x.^2+y.^2-1, @(x,y) 1-x.^2-y.^2)
fprintf('The value of the evaluated integral is %f',answer1)
%%
% (d) $\int_{0}^{1} \int_{0}^{ x^2} \int_{0}^{x^3-y^3} x^2y^2e^z dz dy dx$
syms x y z
figure;
fun = @(x,y,z) exp(z).*x.^2.*y.^2;
viewSolid('x', 0, 1, 'y', @(x)0.*x, @(x) x.^2, 'z', @(x,y) 0.*x.*y, @(x,y) x.^3-y.^3)
answer2=integral3(fun,0,1,@(x)0.*x, @(x) x.^2,@(x,y) 0.*x.*y, @(x,y) x.^3-y.^3)
fprintf('The value of the evaluated integral is %f',answer2)
%% Problem H: 8.12 b
% Keri coded part b, Shruthi coded part d.
%
% In each part of this problem, use the viewSolid program from
% Chapter 8 to sketch the region D over which the integral extends, and then evaluate
% the triple integral. You should be able to determine the limits of integration directly
% from the description of D. In (c) and (d), it may help to think about planes that contain
% three of the given points
%
% (b) $\int \int \int{D}{} yxdV$ where D is the region in the first octant bounded above by the
% sphere $x^2 + y^2 + z^2 = 9$, below by the plane $z = 0$, and on the sides by the
% planes $x = 0$, $y = 0$, and the cylinder $x^2 + y^2 = 4$
%
syms x y z
figure;
fun = @(x,y,z)y.*x;
viewSolid('x', 0, 1, 'y', @(x)0.*x, @(x) sqrt(4-x.^2), 'z', @(x,y) 0.*x.*y, @(x,y) sqrt(9-x.^2-y.^2))
answer3=integral3(fun,0,1,@(x)0.*x, @(x) sqrt(4-x.^2),@(x,y) 0.*x.*y, @(x,y) sqrt(9-x.^2-y.^2))
fprintf('The value of the evaluated integral is %f',answer3)
%% Problem H: 8.12 d
% Shruthi coded this problem 

syms x y z

f3 = @(z) (ln(z)/z);

xmin3 = 1;
xmax3 = @(z) z;
ymin3 = 0;
ymax3 = @(z) (2-z);
zmin3 = 1;
zmax3 = 2;

q3_1 = int(log(z)/z, x, xmin3, xmax3);
q3_2 = int(q3_1, y, ymin3, ymax3);
q3 = int(q3_2, z, zmin3, zmax3)

