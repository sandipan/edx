% Times of observation [seconds]
t = [1,2,3,4,5,6,7,8]';
% Observed altitude [m]
y = [79.06, 126.13, 179.90, 218.77, 258.74, 266.91, 274.91, 280.61]';

% Number of observations 
m = length(t);

% Design matrices for the two models
A = [ones(m,1), t, 0.5*t.^2];

% Covariance matrix
Q = 100*t.*eye(m);

% What is the bset linear unbiased estimation of the model parameters
xhat = (A'*inv(Q)*A) \ A'*inv(Q)*y %inv(A'*inv(Q)*A)*(A'*inv(Q)*y);

figure, plot(t,y,'.b','markersize',20), hold on; grid on
plot(t,A*xhat,'r','linewidth',2)
set(gca,'xlim',[0 max(t)+1])
set(gca,'ylim',[0 1.4*max(y)])
xlabel('time [s]')
ylabel('altitude [m]')
legend('observations','model')