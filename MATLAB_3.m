%% MATLAB Project 3
% Task #5, Problem Set C: #1d,f

%% Task #5
% Plot the vector field F̄(x, y) = 0.2(x + y)i + 0.2(x − y)j

[x,y]=meshgrid(-5:1:5,-5:1:5); % assigning the grid to plot
quiver(x,y,0.2*(x+y),0.2*(x-y),0) % plotting the vector field

%% C: #1d
% A hyperbolic helix: r(t)=(√(1+t^2/2), t/√2, arcsinh(t/√2)), t ∈ R

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

%% C: #1f
% Vivani's curve: r(t)=(1+cost, sint, 2sin(t/2)), −π ≤ t ≤ π

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