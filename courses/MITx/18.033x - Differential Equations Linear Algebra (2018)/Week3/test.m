% Input the 2x2 matrix describing your linear system as a variable A
A = [-1,1;1,-1];
% Input your initial conditions as a column vector x0
x0 = [0;1];
% Use eig(A) to find the eigenvalues and eigenvectors of A. 
% Then define the eigenvectors as column vectors v1 and v2, and the eigenvalues as lambda1, lambda2
% so that A*v1 = lambda1*v1, etc.
[V,D] = eig(A);
v1 = V(:,1);
v2 = V(:,2);
lambda1 = D(1,1);
lambda2 = D(2,2);
% Calculate the column vector c = [c1;c2] from the initial conditions using inv(V)
c = inv(V)*x0;
c1 = c(1,1); c2 = c(2,1);

%%% Define a row vector t with 100 equally spaced entries, 
%%% beginning with 0 and ending at 4.
t = linspace(0,4);
%%% Define two row vectors h1 and h2, with entries corresponding 
%%% to h1(t) and h2(t) evaluated at each time in t.
h = c1*v1*exp(lambda1*t) + c2*v2*exp(lambda2*t);
h1 = h(1,:);
h2 = h(2,:);
%%% Now use plot to plot the two vectors against time on the same figure
%
plot(t,h1) %tell MATLAB to plot h1 here
%
hold on % You need to put this command in between the plot commands so that the curves appear on the same figure
%
plot(t,h2) %tell MATLAB to plot h2 here
%
% Don't worry about the following commands, they are just formatting commands for the figure
set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')
title('Time series')


% Input the 3x3 matrix describing your linear system as a variable A
A = [-2,1,1;1,-2,1;1,1,-2];
% Input your initial conditions as a column vector x0
x0 =[0;1;0];
% Use eig(A) to find the eigenvalues and eigenvectors of A 
% Define the eigenvectors as column vectors v1, v2 and v3,
% and the eigenvalues as lambda1, lambda2, lambda3
% so that A*v1 = lambda1*v1, etc.
[V,D] = eig(A);
v1 = V(:,1);
v2 = V(:,2);
v3 = V(:,3);
lambda1 = D(1,1);
lambda2 = D(2,2);
lambda3 = D(3,3);
% Calculate the column vector c = [c1;c2;c3] from the initial conditions using inv(V)
c = inv(V)*x0;
c1 = c(1,1); c2 = c(2,1); c3 = c(3,1);
%%% Define a row vector t with 100 equally spaced entries, 
%%% beginning with 0 and ending at 4.
t = linspace(0,4);
%%% Define three row vectors h1, h2 and h3, with entries corresponding 
%%% to h1(t), h2(t) and h3(t) evaluated at each time in t.
h = c1*v1*exp(lambda1*t) + c2*v2*exp(lambda2*t) + c3*v3*exp(lambda3*t);
h1 = h(1,:);
h2 = h(2,:);
h3 = h(3,:);
%%% Now use plot to plot the three vectors against time on the same figure
plot(t, h1);
hold on
plot(t, h2);
plot(t, h3);
set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')
title('Time series')



% Input the 3x3 matrix describing your linear system as a variable A
A = [-2,1,0;1,-2,1;0,1,-1];
% Input your initial conditions as a column vector x0
x0 =[1/2,0,1/2];
% Use eig(A) to find the eigenvalues and eigenvectors of A 
% Define the eigenvectors as column vectors v1, v2 and v3,
% and the eigenvalues as lambda1, lambda2, lambda3
% so that A*v1 = lambda1*v1, etc.
[V,D] = eig(A);
v1 = V(:,1);
v2 = V(:,2);
v3 = V(:,3);
lambda1 = D(1,1);
lambda2 = D(2,2);
lambda3 = D(3,3);
% Calculate the column vector c = [c1;c2;c3] from the initial conditions using inv(V)
c = inv(V)*x0';
c1 = c(1,1); c2 = c(2,1); c3 = c(3,1);
%%% Define a row vector t with 100 equally spaced entries, 
%%% beginning with 0 and ending at 4.
t = linspace(0,4);
%%% Define three row vectors h1, h2 and h3, with entries corresponding 
%%% to h1(t), h2(t) and h3(t) evaluated at each time in t.
h = c1*v1*exp(lambda1*t)+c2*v2*exp(lambda2*t)+c3*v3*exp(lambda3*t);
h1 = h(1,:);
h2 = h(2,:);
h3 = h(3,:);
%%% Now use plot to plot the three vectors against time on the same figure
plot(t, h1);
hold on
plot(t, h2);
plot(t, h3);
set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')
title('Time series')


% Create symbols used in defining A and b
R = sym('R');
C = sym('C');
L1 = sym('L1');
L2 = sym('L2');
w = sym('w');
t = sym('t');

%Define the matrix A and the vector b below. 
%Note that b should be a column vector for the differential equation to make sense.

A = [0,1/C,-1/C;-1/L1,0,0;1/L2,0,-R/L2];
b = [0;sin(w*t)/L1;0];


%We've set the values of a and mu as
%specified in the problem for you.
a = 1.0;
mu = 0.5;
%Enter the matrix A as defined above, 
% the initial value vector x0, and create
% a row vector t of 400 equally spaced 
%time values as t ranges from 0.5 to 1.5;
A = [-a-mu,a,0;a,-2*a,a;0,a,-a];
x0 = [2/3;0;1/3];
t = linspace(0.5,1.5,400);
%At each time t, define x in terms of the exponenetial matrix expm(A), t, and the initial value.
for m=1:length(t)
    x(:,m) = expm(A*t(m))*x0;
end
%Let h1 be the height of fluid in tank 1.
%Let h2 be the height of fluid in tank 2.
%Let h3 be the height of fluid in tank 3.
%Define h1, h2, and h3 in terms of x.
h1 = x(1,:);
h2 = x(2,:);
h3 = x(3,:);
%Plot h1, h2 and h3 (do not edit code for plotting)
plot(t,h1,t,h2,t,h3,'LineWidth',2)
set(gca,'fontsize',18)
legend('h1','h2','h3')
xlabel('Time')
ylabel('Volume')
title('Time series')
%Determine the time tmax when the height in tank 2 is a maximum.
%Hint: look up the function max() in the matlab documentation.

[vmax,tmaxi] = max(h2);
tmax = t(tmaxi);


A = [ -2 1 0; 1 -2 1; 0 1 -1];
x0 = [0.5;0;0.5];
t = linspace(0,4,100);
% Store the eigenvectors and eigenvalues in matrices V and D respectively.
[V,D] = eig(A);

%Define I to be the index of the largest eigenvalue of A. That is the largest eigenvalues is D(I,I).
% Hint try using sort() or max() and look into the MATLAB documentation for help.

[~, ind] = sort(diag(D),'descend');

I = ind;

% Defined lambda to be the maximum eigenvalue, and v to be the maximum eigenvector.


lambda = D(I(1),I(1));
v = V(:,I(1));
% 
C = inv(V)*x0;
c = C(I(1),1);
asymp = c*exp(lambda*t)*v(1,1);
% use the matrix exponential to find the solution for the given initial condition
for m=1:length(t)
    x(:,m) = expm(A*t(m))*x0;
end
%

plot(t,x(1,:))
hold on
plot(t,asymp)
legend('x','asymp')
set(gca,'fontsize',18)
xlabel('Time')
ylabel('Volume')


%Numerically solve DE and time how long it takes
x0 = [0;1];
tspan = [0,5];
A = [0,1;-1,-2];
tic;
[t,x] = ode45(@(t,x) [x(2);-x(1)-2*x(2)],tspan,x0);
timeElapsed = toc;
disp(['It took ODE45 ',num2str(timeElapsed,3), ' seconds to compute the solution']);

%Enter analytic solution (Hint: it is in the text above.)
xTrue = t.*exp(-t);

%Plot results
%Do not edit the code below.
figure(1)
plot(t,x(:,1),'bo','markersize',10); hold on;
plot(t,xTrue,'r','linewidth',3);
legend('Numerical Solution','Exact Solution','location','northeast');
xlabel('$t$','interpreter','latex'); ylabel('$x(t)$','interpreter','latex')
title('Comparison of Solutions','interpreter','latex')
set(gca,'fontsize',25)

figure(2)
plot(t,abs(x(:,1)-xTrue)./xTrue,'r','linewidth',3); 
xlabel('$t$','interpreter','latex'); ylabel('$|x(t)-x_{true}|/x_{true}$','interpreter','latex')
title('Relative Error','interpreter','latex')
set(gca,'fontsize',25)


%Numerically solve DE and time how long it takes
x0 = -2;                               %The initial condition, x(0)
tspan = [0,2];                        %The time interval, tspan
tic;                                  %Start timer
[t,x] = ode45(@(t,x) t*x^2,tspan,x0); %Use ODE45 to compute numerical solution
timeElapsed = toc;                    %Stop timer
disp(['It took ODE45 ',num2str(timeElapsed,3), ' seconds to compute the solution']);

%Enter analytic solution
xTrue = -2./(1+t.^2);

%Plot results
%You do not need to edit any of the code below which creates the plots for you.
figure(1)
plot(t,x,'bo','markersize',10); hold on;
plot(t,xTrue,'r','linewidth',3);
legend('Numerical Solution','Exact Solution','location','northwest');
xlabel('$t$','interpreter','latex'); ylabel('$x(t)$','interpreter','latex')
title('Comparison of Solutions','interpreter','latex')
set(gca,'fontsize',25)

figure(2)
plot(t,abs(x-xTrue)./xTrue,'ro-','linewidth',3,'markersize',10); 
xlabel('$t$','interpreter','latex'); ylabel('$|x(t)-x_{true}|/x_{true}$','interpreter','latex')
title('Relative Error','interpreter','latex')
set(gca,'fontsize',25)


%%%%
%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2 = 1;
b1 = 0.001;
b2 = 0.01;

%Numerically solve DE
x0 = [0;0;0;0];
tspan = [0,7000];
A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
[t,x] = ode45(@(t,x) A*x,tspan,x0);
%%%%

%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2 = 0;
b1 = 0.001;
b2 = 0;
om = 0.95;

%Numerically solve DE
x0 = [0;0;0;0];
tspan = [0,7000];
A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
[t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tspan,x0);

%Plot steady state solution
lt = length(t);
per = 2*pi/om;
[~,idx] = min(abs(t-(t(end)-5*per)));
plot(t(idx:lt),x(idx:lt,1),'b','linewidth',3); hold on;
plot(t(idx:lt),x(idx:lt,2),'r','linewidth',3); 
xlim([t(idx),t(lt)]); xlabel('$t$','interpreter','latex'); ylabel('$x(t)$','interpreter','latex');
legend('Building','TMD','location','northeast'); title('Steady State Solution');
set(gca,'fontsize',25)
disp(['Amplitude of building''s oscillation: ',num2str(max(x(idx:lt,1)),4)]);

%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2 = 0.02;
b1 = 0.001;
b2 = 0.02;
om = 0.95;

%Numerically solve DE
x0 = [0;0;0;0];
tspan = [0,7000];
A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
[t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tspan,x0);

%Plot steady state solution
lt = length(t);
per = 2*pi/om;
[~,idx] = min(abs(t-(t(end)-5*per)));
plot(t(idx:lt),x(idx:lt,1),'b','linewidth',3); hold on;
plot(t(idx:lt),x(idx:lt,2),'r','linewidth',3); 
xlim([t(idx),t(lt)]); xlabel('$t$','interpreter','latex'); ylabel('$x(t)$','interpreter','latex');
legend('Building','TMD','location','northeast'); title('Steady State Solution');
set(gca,'fontsize',25)
disp(['Amplitude of building''s oscillation: ',num2str(max(x(idx:lt,1)),4)]);


load('Reference.mat')

%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2 = 0.02;
b1 = 0.001;
b2 = 0.02;
omSweep = linspace(0.7,1.3,50);

%Numerically solve DE at each forcing frequency
for i=1:length(omSweep)

    om = omSweep(i);
    
    %Copy code to solve DE here
    x0 = [0;0;0;0];
    tspan = [0,7000];
    A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
    [t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tspan,x0);

    %Compute steady state solution and extract building oscillation amplitude 
    lt = length(t);
    per = 2*pi/om;
    [~,idx] = min(abs(t-(t(end)-5*per)));
    ampBuilding(i) = max(x(idx:lt,1));

end

%Plot
plot(OmRef,ampRef,'r'); hold on;
plot(omSweep,ampBuilding,'k');
xlim([0.7,1.3]); ylabel('Max. Amp. of Building'); xlabel('$\Omega$');
legend('Without TMD','With TMD')

url = 'https://courses.edx.org/asset-v1:MITx+18.033x+1T2018+type@asset+block@Reference.mat';
websave('Reference.mat', url);

load('Reference.mat')

%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2Sweep = linspace(0.0449,0.04451,10); % 0.01, 0.1, 100
b1 = 0.001;
b2 = 0.02;
omSweep = linspace(0.7,1.3,50);

%Numerically solve DE at each forcing frequency
for j=1:length(k2Sweep)
	k2 = k2Sweep(j)
	ampBuilding = zeros(1,length(omSweep));	
	for i=1:length(omSweep)
		om = omSweep(i);
	
		%Copy code to solve DE here
		x0 = [0;0;0;0];
		tspan = [0,7000];
		A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
		[t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tspan,x0);

		%Compute steady state solution and extract building oscillation amplitude 
		lt = length(t);
		per = 2*pi/om;
		[~,idx] = min(abs(t-(t(end)-5*per)));
		ampBuilding(i) = max(x(idx:lt,1));
	end
	ampBuildingk2(j) = max(ampBuilding)
end


%[C, I] = min(ampBuildingk2)
%k2Sweep(I)


%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2 = 0.045; % 0.01 0.045 0.08
b1 = 0.001;
b2 = 0.03; % 0.005 0.013 0.03
omSweep = linspace(0.7,1.3,50);

%Numerically solve DE at each forcing frequency
for i=1:length(omSweep)

    om = omSweep(i);
    
    %Copy code to solve DE here
    x0 = [0;0;0;0];
    tspan = [0,7000];
    A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
    [t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tspan,x0);

    %Compute steady state solution and extract building oscillation amplitude 
    lt = length(t);
    per = 2*pi/om;
    [~,idx] = min(abs(t-(t(end)-5*per)));
    ampBuilding(i) = max(x(idx:lt,1));

end

%Plot
plot(OmRef,ampRef,'r'); hold on;
plot(omSweep,ampBuilding,'k');
xlim([0.7,1.3]); ylabel('Max. Amp. of Building'); xlabel('$\Omega$');
legend('Without TMD','With TMD')



load('Reference.mat')

%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2 = 0.045;
b1 = 0.001;
b2Sweep = linspace(0.011,0.013,10); % 0.01, 0.1, 100
omSweep = linspace(0.7,1.3,50);

%Numerically solve DE at each forcing frequency
for j=1:length(b2Sweep)
	b2 = b2Sweep(j)
	ampBuilding = zeros(1,length(omSweep));	
	for i=1:length(omSweep)
		om = omSweep(i);
	
		%Copy code to solve DE here
		x0 = [0;0;0;0];
		tspan = [0,7000];
		A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
		[t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tspan,x0);

		%Compute steady state solution and extract building oscillation amplitude 
		lt = length(t);
		per = 2*pi/om;
		[~,idx] = min(abs(t-(t(end)-5*per)));
		ampBuilding(i) = max(x(idx:lt,1));
	end
	ampBuildingb2(j) = max(ampBuilding)
end


