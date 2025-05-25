t = [0:0.01:500];
v0 = 0.05;
V0 = 5;
k = 2.2;
y0 = [0.05 0.025 0 0];
%Numerically solve DE
[t,y] = ode45(@(t,y)dydt,t,y0);

%Plot steady state solution
plot(t, y); 

function dydt = f(t, y)
	V = V0 + v0*t;
	tau = v0/V;
	ra = -k*y(1)*y(2);
	CB0 = y0(2) - y(2);
	A = diag([-tau, -tau, -tau, -tau]);
	r = [ra; ra + tau*CB0; -ra; -ra];
	dydt = A*y + r;
end