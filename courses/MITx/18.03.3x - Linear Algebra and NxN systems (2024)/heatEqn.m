%Solve heat equation using forward time, centered space scheme
close all; clearvars;

%Define simulation parameters----------------------------------------------
x = linspace(0,5,20);     %Spatial grid
dt = 0.06;                 %Time step        
tMax = 20;                  %Simulation time
nu = 0.5;                  %Constant of proportionality

fLeft = @(t) 0;                    %Left boundary condition
fRight = @(t) sin(2*pi*t/5);      %Right boundary condition
fInitial = @(x) 0*x;               %Initial condition

%Run simulation------------------------------------------------------------
dx = x(2)-x(1);
r = nu*dt/dx^2;
disp(['r = ',num2str(r)]);

%Create tri-diagonal matrix
n = length(x);
A = spdiags([r*ones(n,1),(1-2*r)*ones(n,1),r*ones(n,1)],[-1,0,1],n,n);

%Impose inital conditions
u = fInitial(x); u(1) = fLeft(0); u(end) = fRight(0);

t = 0:dt:tMax;  %Time vector

for i=1:length(t)
    
    u(i+1,:) = (A*u(i,:)')'; %Find solution at next time step
    u(i+1,1) = fLeft(t(i));  %Impose left B.C.
    u(i+1,end) = fRight(t(i)); %Impose right B.C.
    
    %Plot solution
    plot(x,u(i+1,:),'linewidth',2); 
    xlabel('$x$','interpreter','latex') 
    ylabel('$u$','interpreter','latex')
    title(['$t=$',num2str(t(i),'%.3f')],'interpreter','latex')
    ylim([-1.5,1.5]);
    pause(0.01);
    
end


