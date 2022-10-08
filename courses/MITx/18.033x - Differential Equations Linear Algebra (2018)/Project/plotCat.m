function [x,y] = plotCat(c,x0,p)

%Plot catenoid with rider at position x=x0.
x1 = linspace(0,x0,100);
x2 = linspace(x0,p.D,100);

y1 = c(1) + c(3)/p.W*cosh(p.W/c(3)*(x1-c(5)));
y2 = c(2) + c(4)/p.W*cosh(p.W/c(4)*(x2-c(6)));

x = [x1,x2];
y = [y1,y2];

end

