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
tvec = linspace(0,7000,35000);
A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
[t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tvec,x0);

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


url = 'https://courses.edx.org/asset-v1:MITx+18.033x+1T2018+type@asset+block@Reference.mat';
websave('Reference.mat', url);

load('Reference.mat')

%Define parameters 
m1 = 1;
m2 = 0.05;
k1 = 1;
k2 = 0.02
b1 = 0.001;
b2 = 0.02
%om = 1;

k2Sweep = linspace(0, 1, 200);
b2Sweep = linspace(0, 1, 200);

for iter=1:5
	for i=1:length(k2Sweep)
		k2 = k2Sweep(i);
		x0 = [0;0;0;0];
		tvec = linspace(0,7000,35000);
		A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
		[t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tvec,x0);
		lt = length(t);
		per = 2*pi/om;
		[~,idx] = min(abs(t-(t(end)-5*per)));
		ampBuilding(i) = max(x(idx:lt,1));
	end
	[m, I] = min(ampBuilding);
	k2 = k2Sweep(I)
	for i=1:length(b2Sweep)
		b2 = b2Sweep(i);
		x0 = [0;0;0;0];
		tvec = linspace(0,7000,35000);
		A = [0,0,1,0;0,0,0,1;-(k1+k2)/m1,k2/m1,-(b1+b2)/m1,b2/m1;k2/m2,-k2/m2,b2/m2,-b2/m2];
		[t,x] = ode45(@(t,x) A*x + [0;0;sin(om*t)/m1;0],tvec,x0);
		lt = length(t);
		per = 2*pi/om;
		[~,idx] = min(abs(t-(t(end)-5*per)));
		ampBuilding(i) = max(x(idx:lt,1));
	end
	[m, I] = min(ampBuilding);
	b2 = b2Sweep(I)
end



%Define parameters 
v0 = 0.05;
V0 = 5;
k = 2.2;
y0 = [0.05 0.025 0 0];
t = [0:0.01:300];

%Numerically solve DE
[t,y] = ode45(@(t,y) diag([-v0/(V0 + v0*t),-v0/(V0 + v0*t),-v0/(V0 + v0*t),-v0/(V0 + v0*t)])*y + [-k*y(1)*y(2);-k*y(1)*y(2) + v0/(V0 + v0*t)*(y0(2) - y(2));--k*y(1)*y(2);--k*y(1)*y(2)],t,y0);

%Plot steady state solution
plot(t, y); 
legend('C_A','C_B', 'C_C', 'C_D');
xlabel('t');
