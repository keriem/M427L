%% 3.1 (h)
%Haoze code this problem

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

