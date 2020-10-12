%% Problem 5.1
% Haoze code this problem
% Examine the level curve of the function f(x,y)=(x^2+y^2)^2-x^2+y^2

% (a): Graph f and its contour plot.
myfunc=@(x,y) (x^2+y^2)^2-x^2+y^2;
figure; fsurf(myfunc, [-2 2 -2 2]);
list0=-4:0.5:4; figure; fcontour(myfunc,[-2 2 -2 2], 'LevelList',list0);

%%
% (b): Draw three distincts level curves. The red line represents the level
% curve of negative value; the green line represents the level curve at value
% 0; the blue line represents the level curve of postive value. 
list1=[-0.2,-0.1]; 
list2=0;
list3=[0.1,0.2,1,4,10];
figure; fcontour(myfunc,[-2 2 -2 2], 'LevelList',list1, 'LineColor','r')
hold on
fcontour(myfunc,[-2 2 -2 2], 'LevelList',list2, 'LineColor','g')
hold on
fcontour(myfunc,[-2 2 -2 2], 'LevelList',list3, 'LineColor','b')
hold on


%%
% (c): Compute the gradient of f, and determine where it vanishes. Note
% that there are totally 5 solution for 0 gradient, and 3 of them are real
% solution. (0,0) is at the center of the level curve, and it is a saddle;
% the other two represent local minimum.

syms x y;
gradmyfunc=jacobian(myfunc(x,y));
S=solve(gradmyfunc==[0,0],[x y]);
x0=S.x;
y0=S.y;
plot(x0(1),y0(1),'.k','MarkerSize',5)
plot(x0(2),y0(2),'.k','MarkerSize',5)
plot(x0(3),y0(3),'.k','MarkerSize',5)

%the following two are not real solution
plot(x0(4),y0(4),'.k','MarkerSize',5)
plot(x0(5),y0(5),'.k','MarkerSize',5)

%%
% (d): Draw the gradient field of f. We notice that all vectors are
% perpendicular to the level curve. At the origin, the function value
% decreases when x-coordinate is to change; and it increases when y-
% coordinate is to change. For example, when x get greater, f would be 
% smaller than 0, so we need to let y be a liitle greater to make f still
% be 0. Hence, it forms a level curve like the symbol of infinity. 

[X, Y]=meshgrid(-2:0.2:2, -2:0.2:2);
U=4.*X.*(X.^2 + Y.^2) - 2.*X;
V=2.*Y + 4.*Y.*(X.^2 + Y.^2);
L=sqrt(U.^2+V.^2);
hold on; gradientfield = quiver(X, Y, U./L, V./L, 0.5);
axis equal tight

%% Problem 5.6
% Haoze code this problem.
% Draw the gradient field of the following functions
% (a): f(x,y,z)=x^2+y^2+z^2. f=1

syms x y z; h= x^2+y^2+z^2;
fimplicit3(h-1,'EdgeColor','none','FaceAlpha',.5); axis equal

[X,Y]=meshgrid(-1:0.15:1,-1:0.15:1);
Z=sqrt(1-X.^2-Y.^2);
[U,V,W]=surfnorm(X,Y,Z);
hold on; quiver3(X,Y,Z,U,V,W,1,'b')
Z1=-sqrt(1-X.^2-Y.^2);
[U,V,W]=surfnorm(X,Y,Z1);
hold on; quiver3(X,Y,Z1,U,V,W,1,'b')

view(45,20)

%%
%(b): f(x,y,z)=x^3-3xy^2+z, f=0

syms x y z; h= x^3-3*x*y^2+z;
fimplicit3(h,'EdgeColor','none','FaceAlpha',.7); axis equal

[X,Y]=meshgrid(-1:0.2:1,-1:0.2:1);
Z=3.*X.*Y.^2-X.^3;
[U,V,W]=surfnorm(X,Y,Z);
hold on; quiver3(X,Y,Z,U,V,W,0.5,'r')

view(90,30)

%%
%(c): f(x,y,z)=xyz, f=1

syms x y z; h= x*y*z;
fimplicit3(h,'EdgeColor','none','FaceAlpha',.7); axis equal

[X,Y]=meshgrid(-2:0.2:2,-2:0.2:2);
Z=1./(X.*Y);
[U,V,W]=surfnorm(X,Y,Z);
hold on; quiver3(X,Y,Z,U,V,W,0.5, 'r')


