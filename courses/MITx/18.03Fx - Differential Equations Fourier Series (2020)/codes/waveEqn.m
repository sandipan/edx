%Solve wave equation using centered time, centered space scheme
close all; clearvars;

%Define simulation parameters----------------------------------------------
x = linspace(0,1,100);     %Spatial grid
dt = 0.5;                 %Time step
tMax = 200;                  %Simulation time
c = 0.015;                  %Wave speed

fLeft = @(t) 0;                        %Left boundary condition
fRight = @(t) 0.1*sin(t/10);     %Right boundary condition
fPosInitial = @(x) exp(-200*(x-0.5).^2);  %Initial position
fVelInitial = @(x) 0*x;                   %Initial velocity

%Run simulation------------------------------------------------------------
dx = x(2)-x(1);
r = c*dt/dx;
disp(['r = ',num2str(r)]);

%Create tri-diagonal matrix
n = length(x);
A = spdiags([r^2*ones(n,1),2*(1-r^2)*ones(n,1),r^2*ones(n,1)],[-1,0,1],n,n);

%Impose initial condition
u = fPosInitial(x); u(1) = fLeft(0); u(end) = fRight(0);

t = 0:dt:tMax;  %Time vector

for i=1:length(t)
    
    %Find solution at next time step
    if i == 1
        u(2,:) = 1/2*(A*u(1,:)')' + dt*fVelInitial(x);
    else
        u(i+1,:) = (A*u(i,:)')'-u(i-1,:);
    end
    
    u(i+1,1) = fLeft(t(i)); %Impose left B.C.
    u(i+1,end) = fRight(t(i)); %Impose right B.C.
    
    %Plot solution
    plot(x,u(i+1,:),'linewidth',2);
    xlabel('$x$','interpreter','latex') 
    ylabel('$u$','interpreter','latex')
    title(['$t=$',num2str(t(i),'%.3f')],'interpreter','latex')
    ylim([-1.5,1.5]);
    pause(0.01);
    
end


