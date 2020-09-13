%1.2a
x=linspace(-1/2,1/2);
y=x.^3-4*x.^2+1;
axis([-2 2 -2 2]);
plot(x,y);

%1.2b
syms x
eqn = x^3 - 4*x^2  == -1;
z = solve(eqn, x,"MaxDegree",3);

%1.2c
a=double(z);
f = @(x)x.^3 - 4*x.^2 +1;
x0= fzero(f,0 );
x1= fzero(f,2 );
x2= fzero(f,4 );

%1.2d
area= integral(f,x0,x1);
fprintf('area=%f \n', area);

%1.2e
syms f(x)
f(x) = x.^3 - 4*x.^2 +1;
df = diff(f,x);










