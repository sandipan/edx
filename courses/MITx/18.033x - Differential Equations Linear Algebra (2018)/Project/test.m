a = sym('a', 'positive')
b = sym('b', 'positive')
syms x y z
eqns = [x*(1-x-a*y-b*z) == 0, y*(1-y-b*x-a*z) == 0, z*(1-z-a*x-b*y) == 0];
vars = [x y z];
[solx, soly, solz] = solve(eqns, vars)

syms a b
x = 1 / (a + b + 1);
y = 1 / (a + b + 1);
z = 1 / (a + b + 1);
[V, D] = eig([1-2*x-a*y-b*z,-a*x,-b*x;-b*y,1-2*y-b*x-a*z,-a*y;-a*z,-b*z,1-2*z-a*x-b*y]);
D
%real(a*1i + b*1i + 3^(1/2)*a - 3^(1/2)*b - 2i)/(2*(a*1i + b*1i + 1i))
%real(a*1i + b*1i - 3^(1/2)*a + 3^(1/2)*b - 2i)/(2*(a*1i + b*1i + 1i))

x = 1 - a;
y = 1 - b;
z = 0;
[V, D] = eig([1-2*x-a*y-b*z,-a*x,-b*x;-b*y,1-2*y-b*x-a*z,-a*y;-a*z,-b*z,1-2*z-a*x-b*y]);
D


%Read image
I = imread('free.jpg');

L = [0.1384,2.67];  %(x,y) coordinate of left endpoint of cable
R = [5.644,1.62]; %(x,y) coordinate of right endpoint of cable
len = 6.38;      %length of cable 

%Show image and indicate endpoints
imagesc([0,5.7736],[0,3.2477],flipud(I));set(gca,'YDir','normal');
axis equal; ylim([[0,3.2477]]); xlim([0,5.7736]); box on; hold on;
xlabel('$x$ (meters)','interpreter','latex'); ylabel('$y$ (meters)','interpreter','latex');
plot(L(1),L(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);
plot(R(1),R(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);

%Define system of 3 equations to solve (c is vector containing 3 unknowns)
% Set F1 to be the function that guarantees the left endpoint boundary condition.
F1 = @(c) L(2) - c(3) - c(2)*cosh((L(1)-c(1))/c(2));   %%Catenary passes through left endpoint
% Set F2 to be the function that guarantees the right endpoint boundary condition.
F2 = @(c) R(2) - c(3) - c(2)*cosh((R(1)-c(1))/c(2));   %%Catenary passes through right endpoint
F3 = @(c) c(2)*(sinh((R(1)-c(1))/c(2))-sinh((L(1)-c(1))/c(2))) - len;  %Arc length is constant value len
cOut = fsolve(@(c) [F1(c);F2(c);F3(c)],[-1,1,1]); %[-1,1,1] is initial guess for [c(1),c(2),c(3)] 
%negative sign ensures that we choose the lower of two possible catenarys

%Plot theoretical shape of cable
xPlot = linspace(L(1),R(1),50);
yPlot = cOut(3) + cOut(2)*cosh((xPlot-cOut(1))/cOut(2));
plot(xPlot,yPlot,'r:','linewidth',2,'markersize',10);
set(gcf, 'Position', [10 10 1000 1000]);



%Read image
I = imread('up.jpg');

%Endpoints
L = [0.1464,2.533]; %(x,y) coordinate of left endpoint of cable
R = [5.366,1.522]; %(x,y) coordinate of right endpoint of cable
M = [2.509,1.669]; %(x,y) coordinate of rider
len = 6.05;     %length of cable 
 
%Show image and indicate endpoints and rider
imagesc([0,5.5098],[0,3.0993],flipud(I));set(gca,'YDir','normal');
axis equal; ylim([[0,3.0993]]); xlim([0,5.5098]); box on; hold on;
xlabel('$x$ (meters)','interpreter','latex'); ylabel('$y$ (meters)','interpreter','latex');
plot(L(1),L(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);
plot(R(1),R(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);
plot(M(1),M(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);

%Define system of 6 equations to solve (c is vector containing 6 unknowns)
F1 = @(c) L(2) - c(3) - c(2)*cosh((L(1)-c(1))/c(2)); %Left cable must pass through left endpoint L
F2 = @(c) M(2) - c(3) - c(2)*cosh((M(1)-c(1))/c(2)); %Left cable must pass through rider at M
F3 = @(c) M(2) - c(6) - c(5)*cosh((M(1)-c(4))/c(5)); %Right cable must pass through rider at M
F4 = @(c) R(2) - c(6) - c(5)*cosh((R(1)-c(4))/c(5)); %Right cable must pass through right endpoint R
F5 = @(c) c(2)*(sinh((M(1)-c(1))/c(2))-sinh((L(1)-c(1))/c(2))) + c(5)*(sinh((R(1)-c(4))/c(5))-sinh((M(1)-c(4))/c(5))) - len; %Left + right arclength = total arclength
F6 = @(c) c(2)*cosh((M(1)-c(1))/c(2))- c(5)*cosh((M(1)-c(4))/c(5));  %Tension must be continuous at rider   
cOut = fsolve(@(c) [F1(c);F2(c);F3(c);F4(c);F5(c);F6(c)],[-1,1,1,-1,1,1]); 

%Plot theoretical shape of cable

%Left cable
xPlot = linspace(L(1),M(1),25);
yPlot = cOut(3) + cOut(2)*cosh((xPlot-cOut(1))/cOut(2));
plot(xPlot,yPlot,'r:','linewidth',4,'markersize',10);

%Right cable
xPlot = linspace(M(1),R(1),25);
yPlot = cOut(6) + cOut(5)*cosh((xPlot-cOut(4))/cOut(5));
plot(xPlot,yPlot,'b:','linewidth',4,'markersize',10);


%Read image
I = imread('down.jpg');

%Endpoints
L = [0.1464,2.533]; %(x,y) coordinate of left endpoint of cable
R = [5.366,1.522]; %(x,y) coordinate of right endpoint of cable
M = [2.492,0.6204]; %(x,y) coordinate of rider
len = 6.095;     %length of cable 
 
%Show image and indicate endpoints and rider
imagesc([0,5.5098],[0,3.0993],flipud(I));set(gca,'YDir','normal');
axis equal; ylim([[0,3.0993]]); xlim([0,5.5098]); box on; hold on;
xlabel('$x$ (meters)','interpreter','latex'); ylabel('$y$ (meters)','interpreter','latex');
plot(L(1),L(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);
plot(R(1),R(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);
plot(M(1),M(2),'o','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',8);

%Define system of 6 equations to solve (c is vector containing 6 unknowns)
F1 = @(c) L(2) - c(3) - c(2)*cosh((L(1)-c(1))/c(2)); %Left cable must pass through left endpoint L
F2 = @(c) M(2) - c(3) - c(2)*cosh((M(1)-c(1))/c(2)); %Left cable must pass through rider at M
F3 = @(c) M(2) - c(6) - c(5)*cosh((M(1)-c(4))/c(5)); %Right cable must pass through rider at M
F4 = @(c) R(2) - c(6) - c(5)*cosh((R(1)-c(4))/c(5)); %Right cable must pass through right endpoint R
F5 = @(c) c(2)*(sinh((M(1)-c(1))/c(2))-sinh((L(1)-c(1))/c(2))) + c(5)*(sinh((R(1)-c(4))/c(5))-sinh((M(1)-c(4))/c(5))) - len; %Left + right arclength = total arclength
F6 = @(c) c(2)*cosh((M(1)-c(1))/c(2))- c(5)*cosh((M(1)-c(4))/c(5));  %Tension must be continuous at rider   
cOut = fsolve(@(c) [F1(c);F2(c);F3(c);F4(c);F5(c);F6(c)],[-1,1,1,-1,1,1]); 

%Plot theoretical shape of cable

%Left cable
xPlot = linspace(L(1),M(1),25);
yPlot = cOut(3) + cOut(2)*cosh((xPlot-cOut(1))/cOut(2));
plot(xPlot,yPlot,'r:','linewidth',4,'markersize',10);

%Right cable
xPlot = linspace(M(1),R(1),25);
yPlot = cOut(6) + cOut(5)*cosh((xPlot-cOut(4))/cOut(5));
plot(xPlot,yPlot,'b:','linewidth',4,'markersize',10);

%Straight lines for reference
plot([L(1),M(1)],[L(2),M(2)],'k','linewidth',2);
plot([M(1),R(1)],[M(2),R(2)],'k','linewidth',2);