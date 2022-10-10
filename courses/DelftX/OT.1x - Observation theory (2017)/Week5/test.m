%% load the observation files
data=load('distances.mat');

y1 = data(:,1);
y2 = data(:,2);

%% Calculate the sample standard deviations of the observables and their sum
sig_y1 = std(y1)
sig_y2 = std(y2)

%% calculate the sum of the observations and its standard deviation sig_ys
ys     = y1 + y2;
sig_ys = ... % please complete this line

%% calculate the sum of the observations and its standard deviation sig_yd
yd     = ... % please complete this line, use a semicolon (;) at the end
sig_yd = ... % please complete this line



%% import data
%% y=importdata('W6_syntheticdata2.txt');
y = load("-ascii", "W6_syntheticdata2.txt");

%% number of observations
m=length(y);

%% vector of times (in years)
t=[1:20]';

%% standard deviation of measurments (in cm)
stdy= repmat(5, m, 1); %[cm]

%% covariance matrix of observations
Qy=stdy.^2.*eye(m);

%% Design matrix A (for the quadratic model)
A=[ones(m,1), t, t.^2];

%% Estimate the BLUE: xhat, yhat, and ehat
xhat=inv(A'*inv(Qy)*A)*(A'*inv(Qy)*y);
yhat=A*xhat;
ehat=y-yhat;

%% Comute the covariance matrices of xhat, yhat, and ehat 
Qxhat=inv(A'*inv(Qy)*A);
Qyhat=A*Qxhat*A';
Qehat=Qy-diag(Qyhat);

%% Compute the scaling dactor for confidence interval  (for example for 95% interval, the scaling factor should be 1.96)
conf_level= 0.95;
alpha=0.03/2; % for example for 95% interval, alpha is 0.5
cint_scale=norminv(1-alpha); % use norminv 

%% Compute the lower/upper bound of confidence intervals

xhat_L=xhat-cint_scale*sqrt(diag(Qxhat));
xhat_U=xhat+cint_scale*sqrt(diag(Qxhat));

yhat_L=yhat-cint_scale*sqrt(diag(Qyhat));
yhat_U=yhat+cint_scale*sqrt(diag(Qyhat));

ehat_L=ehat-cint_scale*sqrt(diag(Qehat));
ehat_U=ehat+cint_scale*sqrt(diag(Qehat));


%% plot observations (y), and adjusted observations (yhat)
figure;
h1=plot(t,y,'r.','markersize',25,'DisplayName','observations (y)');
hold on;grid on
h2=plot(t,yhat,'k','linewidth',3,'DisplayName','estimated model (yhat)');
h3=plot(t,yhat_L,'b--','linewidth',1,'DisplayName',[num2str(conf_level*100) '% conf. (L)']);
h4=plot(t,yhat_U,'g--','linewidth',1,'DisplayName',[num2str(conf_level*100) '% conf. (U)']);
xlim([0 max(t)+1])
xlabel('time [years]','FontSize',25)
ylabel('Sea level [cm]','FontSize',25)
set(gca,'XTick',[0:2:max(t)+1]);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',20)
legend([h1,h2,h3,h4],'location','northwest')
title('original and modeled observations and the confidence interval')

%% plot residuals (with error bars)
figure; 
h1=errorbar(t,ehat,ehat_L-ehat,ehat_U-ehat, ...
    'r.','markersize',25,'DisplayName',['residuals and their ' num2str(conf_level*100) '% conf. interval']);
hold on;grid on
xlim([0 max(t)+1])
xlabel('time [years]','FontSize',25)
ylabel('Residuals [cm]','FontSize',25)
set(gca,'XTick',[0:2:max(t)+1]);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',20)
legend(h1,'location','southwest')
title(['residuals and their ' num2str(conf_level*100) '% conf. interval (visualized as error bars)'])

Qxhat(2,3) / (sqrt(Qxhat(2,2))*sqrt(Qxhat(3,3)))