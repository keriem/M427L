%% Problem B.14
% Haoze coded this section and commented.
v_1=[5.3, 7.4, 9.5]; %the vector from (-1,-2,-3) to the point
v_2=[1, 2, 3]; %the vector representing the direction of the line
stheta = norm(cross(v_1,v_2))/norm((v_1.*v_2)); %sin(theta) where theta is the angle between two vectors
dist = norm(v_1).*stheta; %the distance is represented as the shorter side of the triangle


%% Problem B.17
% Haoze coded this section and commented.
p = [0 0 500/301]; %choose an arbitrary point on the plane. 
v1= [100 201 349]-p; %the vector from p to P.
v2= [-213 -438 301]; %a normal vector
prj= (dot(v1,v2)/norm(v2)^2)*v2; % the projection of v1 on v2 
dist1= norm(prj);

%% Problem B.18
% Haoze coded this section and commented.
syms x y;
fmesh(10-2*x+3*y);
hold on;
fmesh(5+5/3*x+2/3*y);%plot two surfaces

m= [2,-3,1]; 
n= [-5,-2,3]; %the normal vectors of two planes
c= cross(m,n); %the vector of the intersection line

p0= [2,1,9]; %this is an arbitrary point on the intersection line
syms t
x=p0(1)+c(1)*t;
y=p0(2)+c(2)*t;
z=p0(3)+c(3)*t; % the parametric form of the line
fplot3(x,y,z,'r')


