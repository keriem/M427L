%% 8.2 c

syms x y

xmin1 = 3/sqrt(2);
xmax1 = 3;
ymin1 = 0;
ymax1 = @(x) sqrt(9-x.^2);

q1_1 = int(x.^2 + y.^2, ymin1, ymax1);
q1_2 = int(q1_1, xmin1, xmax1)

polarRegion(q1_1, q1_2, 0, 2*pi)
%% 8.2 d

syms x y

f2 = @(x,y) ((x.^2+y.^2).^3/2);

xmin2 = 0;
xmax2 = 1;
ymin2 = @(x) sqrt(x-x.^2);
ymax2 = @(x) sqrt(1-x.^2);

q2_1 = int(((x.^2+y.^2).^3/2), ymin2, ymax2);
q2_2 = int(q2_1, xmin2, xmax2)


%% 8.12 d

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

viewSolid('x', xmin3, xmax3, 'y', ymin3, ymax3, 'z', zmin3, zmax3)

%% Function

function polarRegion(R1, R2, a, b)
tt = linspace(a,b);
polarplot(tt, R1(tt)), hold on
polarplot(tt, R2(tt), 'Linewidth', 2)
ttt = linspace(a, b, 20);
rcoord = [R1(ttt); R2(ttt)];
polarplot([ttt;ttt], rcoord), hold off
end

function viewSolid(xvar,a,b, yvar,f,g, zvar,F,G)
% This function script draws a solid region.
% The inputs xvar, yvar, and zvar are strings indicating how the
% axes should be labeled. In general, they should be ?x?, ?y?,
% and ?z?, but perhaps permuted. Then a, b are limits
% of integration (constants) for the variable called xvar,
% f and g are functions of xvar that are limits of integration
% for the variable called yvar, and F and G are functions of xvar
% and yvar that are limits of integration for the variable called
% zvar. Note that f, g, F, and G should be handles for
% vectorized functions or anonymous functions.
for counter=0:20
xx = a + (counter/20)*(b-a);
YY = f(xx)*ones(1, 21)+((g(xx)-f(xx))/20)*(0:20);
XX = xx*ones(1, 21);
% The next lines inserted to make bounding curves thicker.
widthpar=0.5;
if counter==0, widthpar=2; end
if counter==20, widthpar=2; end
% Plot curves of constant x on surface patches.
plot3(XX, YY, F(XX, YY).*ones(1,21), 'r', 'LineWidth', widthpar);
hold on
plot3(XX, YY, G(XX, YY).*ones(1,21), 'b', 'LineWidth', widthpar);
end;
% Now do the same thing in the other direction.
XX = a*ones(1, 21)+((b-a)/20)*(0:20);
% Normalize sizes of vectors.
YY=0:2; ZZ1=0:20; ZZ2=0:20;
for counter=0:20,
% The next lines inserted to make bounding curves thicker.
widthpar=0.5;
if counter==0, widthpar=2; end
if counter==20, widthpar=2; end
for i=1:21,
YY(i)=f(XX(i))+(counter/20)*(g(XX(i))-f(XX(i)));
ZZ1(i)=F(XX(i),YY(i));
ZZ2(i)=G(XX(i),YY(i));
end;
plot3(XX, YY, ZZ1, 'r', 'LineWidth',widthpar);
plot3(XX, YY, ZZ2, 'b', 'LineWidth',widthpar);
end;
% Now plot vertical lines.
for u = 0:0.2:1,
x=(a + (b-a)*u)*ones(1,6); y = f(a + (b-a)*u)*ones(1,6) ...
+(g(a + (b-a)*u)-f(a + (b-a)*u))*(0:0.2:1);
plot3([x; x], [y; y], [F(x,y); G(x, y)], 'c');
end;
xlabel(xvar); ylabel(yvar); zlabel(zvar); hold off
end