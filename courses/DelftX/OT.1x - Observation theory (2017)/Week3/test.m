%% times of observation [months]
t = [0 1 2 3 4 5]';
%% observed heights [m]
y = [100.9 99.6 98.7 99.9 99.4 99.5]';

%% number of observations 
m  = length(t);


%% design matrices for the two models
A1 = [ones(1,m)', t, t.^2];
A2 = [ones(1,m)', t, cos(2*pi*t/12)];

%% what is the least squares solution for each of the models:
xhat1 = inv(A1'*A1)*(A1'*y) 
xhat2 = inv(A2'*A2)*(A2'*y)

%% what is the sum of squared residuals for each of the models:
eTe1  = (y - A1*xhat1)'*(y - A1*xhat1)
eTe2  = (y - A2*xhat2)'*(y - A2*xhat2)

figure
plot(t,y,'xb')
hold on
plot(t,A1*xhat1,'r')
plot(t,A2*xhat2,'c')
set(gca,'xlim',[0 5.1])
xlabel('time [months]')
ylabel('height [meter]')
legend('observations','model 1','model 2')