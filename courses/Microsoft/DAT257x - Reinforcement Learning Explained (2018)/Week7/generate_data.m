## This file generates a set of 2-dimensional points x in between plus and
## minus 1.5 and a corresponding set of values y which is 0 when x is
## inside the unit circle and 1 when x is outside the unit circle.

				# Generate data:
x = 3*rand(100,2)-1.5;
y = (x(:,1).^2 + x(:,2).^2) > 1;

				# Plot data:
clg
y0 = find(y==0);
y1 = find(y==1);
plot(x(y0,1),x(y0,2),'ro')
hold on
plot(x(y1,1),x(y1,2),'bx')
t = -1:0.01:1;
circle = sqrt(1-t.^2);
plot(t,circle,'b')
plot(t,-circle,'b')

				# Save data: (uncomment required line)
dat = [y x];
#save -ascii "circletrain.dat" dat
#save -ascii "circletest.dat" dat
