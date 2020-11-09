%% 8.2 c

syms x y

f1 = @(x,y) (x.^2 + y.^2);

xmin1 = 3/sqrt(2);
xmax1 = 3;
ymin1 = 0;
ymax1 = @(x) sqrt(9-x.^2);

q1 = integral2(f1, xmin1, xmax1, ymin1, ymax1)

%% 8.2 d

syms x y

f2 = @(x,y) ((x.^2+y.^2).^3/2);

xmin2 = 0;
xmax2 = 1;
ymin2 = @(x) sqrt(x-x.^2);
ymax2 = @(x) sqrt(1-x.^2);

q2 = integral2(f2, xmin2, xmax2, ymin2, ymax2)

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


