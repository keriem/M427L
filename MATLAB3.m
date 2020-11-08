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
% Chloe coded this problem
% A hyperbolic helix: r(t)=(?(1+t^2/2), t/?2, arcsinh(t/?2)), t ? R

syms t u;
%t=sqrt(2)*sinh(u);

helix = [sqrt(1+(t^2)/2), t/sqrt(2), asinh(t/sqrt(2))];
%fplot3(helix(1),helix(2),helix(3), [-10,10])

changeHelix = subs(helix, t, sqrt(2)*sinh(u));
fplot3(changeHelix(1),changeHelix(2),changeHelix(3), [-10,10])

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

T = UT(helix,t)
N = UN(helix,t) % Calculating the Frenet Frame using the above functions
B = UB(helix,t)
helixSpeed = speed(helix,t) % Calculating the speed using the above functions
helixCurvature = curvature(helix,t) % Calculating the curvature using the above functions
helixTorsion = torsion(helix,t) % Calculating the torsion using the above functions

% do we calculate with respect to t or to u?

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

%% 8.2
%

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
%% Problem H: 8.12
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


