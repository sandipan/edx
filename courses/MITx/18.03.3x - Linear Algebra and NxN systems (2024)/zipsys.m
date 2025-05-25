clearvars; 
close all;

%% Define parameters and initial conditions

%Cable parameters
p.H = 20;     %Vert. diff. between posts
p.D = 500;    %Horiz. diff. between posts
p.sl = 3;    %Difference between arc length and hypotenuse
p.W = 2;   %Weight of cable per unit length
p.arc = p.sl + sqrt(p.H^2+p.D^2);  %Arc length

%Rider parameters
p.m = 50;    %Mass of rider
p.Cd = 0.36*(0.04*p.m^(2/3));   %Drag coefficient for air drag. F_D = -Cd*v^2

%Other parameters
p.g = 9.81;   %Gravitational acceleration

%Numerical solver parameters
dt = 0.05;  %Time step
plotStep = 5; %Plot every plotStep steps
opts = optimoptions(@lsqnonlin,'Display','off'); %Options for non-linear solver

%Initial conditions
%c0 = [10.0000   10.0000  490.5000  490.5000  249.0000  250.0000];
c0 = 1000*[ -1.3259   -1.3259    2.5139    2.6148    0.4701    0.2806];  %Initial guess for non-linear catenary solver, c = [A1,A2,Tx1,Tx2,delta1,delta2]
X0 = [5,p.H-2,0,0];    %Initial position of rider X = [x,y,u,v]
X0(2) = fzero(@(H) startPos(H,p,X0,opts,c0),X0(2)) ; %Find intial equilibrium height of rider


%% Solve equations of motion using Runga Kutta 4th order (RK4)

%Solve for initial shape of catenoids
[cOut,~,~,exitFlag] = lsqnonlin(@(c) catSys(c,X0(1:2),p) ,c0 ,[-inf,-inf,0,0,-inf,-inf],[inf,inf,inf,inf,inf,inf],opts);

if exitFlag < 1
    error('Non-linear catenary solver has failed to find a solution')
end

c0 = cOut;

%Set up plots
[x,y] = plotCat(cOut,X0(1),p);
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,1,1)
p11 = plot(x,y,'k'); xlabel('$x$ [m]','interpreter','latex'); ylabel('$y$ [m]','interpreter','latex'); hold on;
p12 = plot(X0(1),X0(2),'b');
p13 = plot(X0(1),X0(2),'o','MarkerFaceColor','b','MarkerEdgeColor','none'); hold off;
ylim([-30,p.H+30])
legend({'Cable','Rider Trajectory','Rider'})
subplot(2,1,2)
p21 = plot(sqrt(X0(3)^2+X0(4)^2),'b');
xlabel('$t$ [sec]','interpreter','latex'); ylabel('Velocity [m/s]');
xlim([1 100]); ylim([0 20]);
drawnow

%Run RK4
stopFlag = 0;
i = 1;
X(1,:) = X0;
t(1) = 0;

while stopFlag == 0
    
    a1 = dt*zipRHS(X(i,:),p,c0,opts);
    a2 = dt*zipRHS(X(i,:)+a1/2,p,c0,opts);
    a3 = dt*zipRHS(X(i,:)+a2/2,p,c0,opts);
    a4 = dt*zipRHS(X(i,:)+a3,p,c0,opts);
    
    X(i+1,:) = X(i,:) + (a1 + 2*a2 + 2*a3 + a4)/6;
    t(i+1) = t(i)+dt;
    
    %Update guess for catenary
    [c0,~,~,exitFlag] = lsqnonlin(@(c) catSys(c,X(i+1,:),p) ,c0 ,[-inf,-inf,0,0,-inf,-inf],[inf,inf,inf,inf,inf,inf],opts);
    
    if exitFlag < 1
        error('Non-linear catenary solver has failed to find a solution')
    end
    

        
    [x,y] = plotCat(c0,X(i+1,1),p);

    p11.XData = x;
    p11.YData = y;
    p12.XData = X(:,1);
    p12.YData = X(:,2);
    p13.XData = X(i+1,1);
    p13.YData = X(i+1,2);
    p21.XData = t;
    p21.YData = sqrt(X(:,3).^2+X(:,4).^2);

    drawnow limitrate

    
    i = i+1;
    
    %Exit conditions
    if X(i,1) > 0.9*p.D   %End of zipline
        break
    elseif i>100
        if (min( X(i-10,3) == 0) == 1) && (min( X(i-10,4) == 0) == 1)    %Rider has stopped
            break
        end
    end
    
    if (t(i)>100)
        stopFlag=1;
    end
    
end

%Final plot
[x,y] = plotCat(c0,X(i,1),p);

p11.XData = x;
p11.YData = y;
p12.XData = X(:,1);
p12.YData = X(:,2);
p13.XData = X(i,1);
p13.YData = X(i,2);
p21.XData = t;
p21.YData = sqrt(X(:,3).^2+X(:,4).^2);


