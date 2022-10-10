%% times of observation [years]
t    = [0 1 2 3 4 5]';
%% number of observations 
m  = length(t);
%% 3 sets of observed heights [m]
y1   = [  101.726   99.300   95.774   94.411   91.486   89.969]';
y2   = [  101.726   99.300   95.774   101.411   91.486   89.969]';
y3   = [  101.726   99.300   95.774   101.411   98.486   96.969]';

%% covariance matrix Qyy
Qyy = diag([1.2^2 1.2^2 0.3^2 0.3^2 0.3^2 0.3^2]);

%% design matrix
A   = [ones(m,1) t];
n   = 2;

%% calculate the BLUE for 5 different cases, and the overall model test

%% Case 1: using model E{y1}=A*x, D{y1}=Qyy
xhat1 = (A'/Qyy*A)\A'/Qyy*y1;
T1    = (y1-A*xhat1)'/Qyy*(y1-A*xhat1);
%% Case 2: using model E{y2}=A*x, D{y2}=Qyy
xhat2 = (A'/Qyy*A)\A'/Qyy*y2;
T2    = (y2-A*xhat2)'/Qyy*(y2-A*xhat2);
%% Case 3: using model E{y3}=A*x, D{y3}=Qyy
xhat3 = (A'/Qyy*A)\A'/Qyy*y3;
T3    = (y3-A*xhat3)'/Qyy*(y3-A*xhat3);
%% Case 4: using model E{y1}=A*x, D{y1}=1.2^2 *eye(m) 
%% variances of last two observations too small
Qyy4  = 0.3^2 * eye(m);
xhat4 = (A'/(Qyy4)*A)\A'/(Qyy4)*y1;
T4    = (y1-A*xhat4)'/(Qyy4)*(y1-A*xhat4);
%% Case 5: using model E{y1}=[ones(m,1)]*x, D{y1}=Qyy (wrong A-matrix)
A5    = [ones(m,1) t.^2];
xhat5 = (A5'/Qyy*A5)\A5'/Qyy*y1;
T5    = (y1-A5*xhat5)'/Qyy*(y1-A5*xhat5);

%% compute the threshold value for the overall model test, with alpha = 0.05
K     = chi2inv(0.95,m-n);



figure
subplot(321)
plot(t,y1,'xb')
hold on
plot(t,A*xhat1,'r')
legend('observations','fitted line')
set(gca,'xlim',[0 5.1],'ylim',[85 105])
xlabel('time [months]')
ylabel('height [meter]')
title('case 1')
text(0.5,87,['T = ' num2str(T1) ', K = ' num2str(K)])

subplot(322)
plot(t,y2,'xb')
hold on
plot(t,A*xhat2,'r')
set(gca,'xlim',[0 5.1],'ylim',[85 105])
xlabel('time [months]')
ylabel('height [meter]')
title('case 2')
text(0.5,87,['T = ' num2str(T2) ', K = ' num2str(K)])

subplot(323)
plot(t,y3,'xb')
hold on
plot(t,A*xhat3,'r')
set(gca,'xlim',[0 5.1],'ylim',[85 105])
xlabel('time [months]')
ylabel('height [meter]')
title('case 3')
text(0.5,87,['T = ' num2str(T3) ', K = ' num2str(K)])


subplot(324)
plot(t,y1,'xb')
hold on
plot(t,A*xhat4,'r')
set(gca,'xlim',[0 5.1],'ylim',[85 105])
xlabel('time [months]')
ylabel('height [meter]')
title('case 4')
text(0.5,87,['T = ' num2str(T4) ', K = ' num2str(K)])

subplot(325)
plot(t,y1,'xb')
hold on
plot(t,A*xhat5,'r')
set(gca,'xlim',[0 5.1],'ylim',[85 105])
xlabel('time [months]')
ylabel('height [meter]')
title('case 5')
text(0.5,87,['T = ' num2str(T5) ', K = ' num2str(K)])



% Import IJmuiden data
% Data  = importdata('Ijmuiden.txt');  
Data = dlmread('Ijmuiden.txt', ';');
     
%% vector of observations y, and times of observations T
y     = Data(:,2);
T     = Data(:,1);

%% number of observations and number  of unknowns
m     = length(y); % number of observations
n     = 4; % number of unknowns

%% vector DT contains the time differences 
%% with respect to first time of observation
DT   = T - T(1); % in years

%% 1. Define the design matrix A and covariance matrix Qyy
A    = [ones(m,1), DT, sin(2*pi*DT), cos(2*pi*DT)]; % design matrix (assume x=[l0 r a_s a_c]')
Qyy  = diag(repmat(50^2,m,1));       % covariance matrix of observations in [mm^2]

%% 2. ESTIMATE xhat (expression already given)
xhat = inv(A'*inv(Qyy)*A)*(A'*inv(Qyy)*y);  % BLUE of the parameters             

%% 3. CALCULATE yhat 
yhat = A*xhat;  % BLUE of the adjusted model 

%% 4. CALCULATE ehat
ehat = y-yhat;     % BLUE of residuals (ehat)      

%% 5. CALCULATE the test statistic Tq
Tq= (y-A*xhat)'/Qyy*(y-A*xhat);   % overall model test statsitic

%% 6. CALCULATE the critical value K
alpha=0.05; % level of significance of the OMT
K=chi2inv(1-alpha,m-n);  % critical value for OMT


%% Plot the results
subplot(211)
plot(T, y); 
hold on;
plot(T, yhat, 'Color', 'red');
set(gca,'ylim',[-500 500])
title('monthly sea level data in IJmuiden (blue) over 10 years, fitted with the trendline (red)')
xlabel('Year'); 
ylabel('Sea level (mm)');

subplot(212)
plot(T, ehat,'m'); 
set(gca,'ylim',[-500 500])
title('residuals after fitting the trendline')
xlabel('Year'); 
ylabel('Sea level (mm)');