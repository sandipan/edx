E <- read.table(text='15.0005	15.0754	14.8532
                      15.0001	15.0300	14.8077
                      14.9980	14.9899	15.0756
                      14.9996	14.9376	14.8973
                      14.9999	15.0263	15.0530', header=FALSE)
colMeans(E)
sapply(E, sd)

setwd('C:/courses/Edx/Current/Observation Theory/Week1')
df <- read.csv('laser_measurements.csv')
y_La  <- df[,1]
y_Lb  <- df[,2]

m <- 150
# measurement error laser device a and b
e_a = y_La - m  # Replace 0 with formula to compute measurement error of laser a
e_b = y_Lb - m  # Replace 0 with formula to compute measurement error of laser b
# NOTE: leave the semi-colon after your expression! This will avoid that Matlab
# will show the output (in both cases a vector of 1000x1).

par(mfrow=c(2,1))
plot(e_a, ylab='measurement error Laser a [mm]', type='l', col='blue')
grid(25,5)

plot(e_b, ylab='measurement error Laser b [mm]', type='l', col='blue')
grid(25,5)

e1 <- read.csv('e_1.csv', header=FALSE) 
e2 <- read.csv('e_2.csv', header=FALSE) 
e3 <- read.csv('e_3.csv', header=FALSE) 

library(R.matlab)
e <- readMat('A1_errors.mat')
lapply(e, mean)
lapply(e, sd)
lapply(e, var)
e <- do.call(cbind, e)
colMeans(e)
apply(e, 2, sd)
apply(e, 2, var)
cor(e)
cov(e)
cor(e)*outer(apply(e, 2, sd),apply(e, 2, sd),'*')
round(cov(e),2)

matplot(e, type='l')

A <- matrix(c(-1,1,0,0,-1,1,1,0,-1), ncol=3, byrow=TRUE)
det(A)
library(Matrix)
rankMatrix(A)
rankMatrix(matrix(c(2,-1,1,0,1,0,-1,1,-2,1,0,-1), ncol=4, byrow=TRUE))
rankMatrix(matrix(c(2,-1,1,0,1,0,-1,1,-3,1,0,-1), ncol=4, byrow=TRUE))
rankMatrix(matrix(c(1,-1,1,0,2,0,-1,1,-4,1,0,-1), ncol=4, byrow=TRUE))
rankMatrix(matrix(c(0,-1,1,0,1,0,-1,1,-1,1,0,-1), ncol=4, byrow=TRUE))
#det(matrix(c(-1,1,0,0,-1,1,2,1,-2), ncol=3, byrow=TRUE))
#det(matrix(c(-1,1,0,0,-1,1,2,1,-3), ncol=3, byrow=TRUE))
#det(matrix(c(-1,1,0,0,-1,1,1,2,-4), ncol=3, byrow=TRUE))
#det(matrix(c(-1,1,0,0,-1,1,0,1,-1), ncol=3, byrow=TRUE))

rankMatrix(matrix(c(2.2,4.3,-6.7,1,-1,0,0,1,-1), ncol=3)) # not consistent
A <- matrix(c(1,0,-1,1,0,-1), ncol=2, byrow=TRUE)
y <- c(2.2,4.3,-6.7)
x <- solve(t(A)%*%A)%*%(t(A)%*%y)
x <- solve(crossprod(A))%*%(t(A)%*%y)
y - A%*%x

y <- c(10.1, 9.8, 10.2, 10.3)
A <- matrix(rep(1,4), ncol=1)
x <- solve(crossprod(A))%*%(t(A)%*%y)
y - A%*%x

W <- diag(c(1,1,2,2))

t(A)%*%W%*%A
x <- solve(t(A)%*%W%*%A)%*%(t(A)%*%W%*%y)
y - A%*%x

A <- matrix(c(1,0,1,1,1,2), ncol=2, byrow=TRUE)
W <- diag(c(1,1,2))
y <- c(1.10, 3.20, 6.03)
t(A) %*% W %*% A
x <- solve(t(A) %*% W %*% A) %*% (t(A) %*% W %*% y)
e <- y - A %*%x
t(e)%*%W%*%e

y <- c(5.2, 4.6, 5.5, 5.4)
A <- matrix(c(1,0, 1,1, 1,2, 1,3), ncol=2, byrow=TRUE)
x <- solve(crossprod(A))%*%(t(A)%*%y)
e <- y - A%*%x
t(e)%*%e

A <- matrix(c(1,0, 1,0, 1,1, 1,1), ncol=2, byrow=TRUE)
x <- solve(crossprod(A))%*%(t(A)%*%y)
e <- y - A%*%x
t(e)%*%e

A <- matrix(c(1,0, 1,0, 1,1, 1,1), ncol=2, byrow=TRUE)
W <- diag(1:4)
t(A) %*% W %*% A
x <- solve(t(A) %*% W %*% A) %*% (t(A) %*% W %*% y)
e <- y - A %*%x
t(e)%*%W%*%e

# Week 4 BLUE
A <- matrix(c(10,20), ncol=1)
Q <- matrix(c(4,0, 0,4), ncol=2, byrow=TRUE)
y <- c(548, 1098)
t(A) %*% solve(Q) %*% A
x <- solve(t(A) %*% solve(Q) %*% A) %*% (t(A) %*% solve(Q) %*% y)
e <- y - A %*%x
t(e)%*%solve(Q)%*%e

Q <- matrix(c(1,0, 0,4), ncol=2, byrow=TRUE)
x <- solve(t(A) %*% solve(Q) %*% A) %*% (t(A) %*% solve(Q) %*% y)

A <- matrix(c(1,1,1), ncol=1)
Q <- diag(c(0.5,0.01,1.0),3)
y <- c(45.3, 45.5, 44.2)
t(A) %*% solve(Q) %*% A
x <- solve(t(A) %*% solve(Q) %*% A) %*% (t(A) %*% solve(Q) %*% y)
e <- y - A %*%x
t(e)%*%solve(Q)%*%e

a <- function(x) r*sin(x)
da <- function(x) r*cos(x)
x0 <- pi/6
eps <- 0.0001
y <- 1.02
r <- 2
x1 <- a(x0)
while (TRUE) {
  dely <- y - a(x0)
  delx <- dely / da(x0)
  x1 <- x0 + delx
  x0 <- x1
  if (delx < eps) {
    break
  }
}

m_x <- 10
s_x <- 1
a <- 0.99
m_x + qnorm((1+a)/2)*s_x
m_x - qnorm((1+a)/2)*s_x

m_x <- 2
s_x <- 5
a <- 0.683
m_x + qnorm((1+a)/2)*s_x
m_x - qnorm((1+a)/2)*s_x

m_x <- 500
s_x <- 8
a <- 0.997
m_x + qnorm((1+a)/2)*s_x
m_x - qnorm((1+a)/2)*s_x

m_x <- 20
s_x <- sqrt(30)
a <- 0.954
m_x + qnorm((1+a)/2)*s_x
m_x - qnorm((1+a)/2)*s_x

library(ellipse)
plot(ellipse(matrix(c(25,12,12,9),nrow=2)))
plot(ellipse(matrix(c(9,12,12,25),nrow=2)))

x0 <- c(20,10)
C <- matrix(c(25,12,12,9),nrow=2)
x <- expand.grid(x1=seq(0,40,0.1),x2=seq(0,20,0.1))
eps <- 0.05 #1
ex <- x[apply(x, 1, function(x)abs(matrix(x-x0, nrow=1)%*%solve(C)%*%matrix(x-x0,nrow=2)-1)<eps),]
plot(ex, pch=19)

library(devtools);#install_github('vqv/ggbiplot')
library(ggbiplot)
pca = prcomp(iris[,1:4]) 
ggbiplot(pca,groups = iris$Species,ellipse = T,ellipse.prob = .95)


library(mvtnorm) # References rmvnorm()
library(ellipse) # References ellipse()
set.seed(17)
# Set the covariance matrix
sigma2 <- matrix(c(5, 2, 2, 5), ncol=2)
# Set the means
mu <- c(5,5)
# Get the correlation matrix
P <- cov2cor(sigma2)
# Generate the data
p <- rmvnorm(n=50, mean=mu, sigma=sqrt(sigma2))
# Plot the data
plot(p)
# Plot the ellipse
lines( ellipse( P, centre = c(5,5)) , col='red')

evals <- eigen(P)$values
evecs <- eigen(P)$vectors
# Angles of a circle
a <- seq(0, 2*pi, len=100)
# Get critical value
c2 <- qchisq(0.95, 2)
c <- sqrt(c2)
xT <- c * sqrt(evals[1]) * cos(a)
yT <- c * sqrt(evals[2]) * sin(a)
M <- cbind(xT, yT)
transM <- evecs %*% t(M)
transM <- t(transM)
lines(transM + mu)

s0 = 0.1*100
#qnorm(0.975)*(s0/sqrt(m)) = 2 => sqrt(m) = qnorm(0.975)*s0/2
(qnorm(0.975)*s0/2)^2
(1.96*s0/2)^2



# import data
setwd('C:/courses/Edx/Current/Observation Theory/Week5')
y=as.numeric(as.matrix(read.table('W6_syntheticdata2.txt')))

# number of observations
m=length(y)

# vector of times (in years)
t=matrix(1:20, ncol=1)

# standard deviation of measurments (in cm)
stdy=rep(5, m) #[cm]

# covariance matrix of observations
Qy=stdy^2*diag(m)

# Design matrix A (for the quadratic model)
A=cbind(rep(1,m), t, t^2)

# Estimate the BLUE: xhat, yhat, and ehat
xhat=solve(t(A)%*%solve(Qy)%*%A)%*%(t(A)%*%solve(Qy)%*%y)
yhat=A%*%xhat
ehat=y-yhat

# Comute the covariance matrices of xhat, yhat, and ehat 
Qxhat=solve(t(A)%*%solve(Qy)%*%A)
Qyhat=A%*%Qxhat%*%t(A)
Qehat=Qy-diag(Qyhat)

# Compute the scaling dactor for confidence interval  (for example for 95% interval, the scaling factor should be 1.96)
conf_level= 0.97
alpha=0.03/2 # for example for 95% interval, alpha is 0.05
cint_scale=qnorm(1-alpha) # % use norminv 

# Compute the lower/upper bound of confidence intervals

xhat_L=xhat-cint_scale*sqrt(diag(Qxhat))
xhat_U=xhat+cint_scale*sqrt(diag(Qxhat))

yhat_L=yhat-cint_scale*sqrt(diag(Qyhat))
yhat_U=yhat+cint_scale*sqrt(diag(Qyhat))

ehat_L=ehat-cint_scale*sqrt(diag(Qehat))
ehat_U=ehat+cint_scale*sqrt(diag(Qehat))


# plot observations (y), and adjusted observations (yhat)
#figure;
plot(t,y,col='red',pch=19,cex=2,
     xlim=c(0,max(t)+1), 
     xlab='time [years]', ylab='Sea level [cm]', 
     main='original and modeled observations and the confidence interval') # 'observations (y)'
grid(10, 10)
lines(t,yhat,col='black',lwd=3) # 'estimated model (yhat)'
lines(t,yhat_L,col='blue', lty=2, lwd=1) # paste(conf_level*100, 'conf. (L)')
lines(t,yhat_U,col='green', lty=2, lwd=1) # paste(conf_level*100, 'conf. (U)')
legend('topleft', legend=c('observations (y)','estimated model (yhat)',
       paste(conf_level*100, 'conf. (L)'), paste(conf_level*100, 'conf. (U)')),
       col=c('red', 'black', 'blue', 'green'),
       pch=c(19,NA,NA,NA),lty=c(NA,1,2,2))

# plot residuals (with error bars)
#figure; 
plot(t, ehat, col='red',
     xlim=c(0, max(t)+1),
     ylim=c(min(ehat_L), max(ehat_U)),
     pch=19, xlab="time [years]", ylab="Residuals [cm]",
     main=paste('residuals and their', conf_level*100, '% conf. interval'))
grid(10, 10)
arrows(t, ehat_L, t, ehat_U, length=0.05, angle=90, code=3, col='red')

#-0.029904306 / (sqrt(0.66558442)*sqrt(0.001424015))

qnorm(0.975)*5/sqrt(10)
1.96*5/sqrt(10)

qchisq(0.95, 20-2)
qchisq(0.95, 82-2)
qchisq(0.95, 20-3)
qchisq(0.95, 20-10)
qchisq(0.999, 20-2)


## Week 3

# times of observation [months]
t = 0:5
# observed heights [m]
y = c(100.9, 99.6, 98.7, 99.9, 99.4, 99.5)

#number of observations 
m  = length(t)

# design matrices for the two models
A1 = cbind(1, t, t^2)
A2 = cbind(1, t, cos(2*pi*t/12))

# what is the least squares solution for each of the models:
xhat1 = solve(crossprod(A1))%*%(t(A1)%*%y) 
xhat2 = solve(crossprod(A2))%*%(t(A2)%*%y)

# what is the sum of squared residuals for each of the models:
eTe1  = crossprod(y - A1%*%xhat1)
eTe2  = crossprod(y - A2%*%xhat2)

#figure
plot(t,y,col='blue', pch=8, xlim=c(0, 5.1), xlab='time [months]', ylab='height [meter]')
points(t, A1%*%xhat1, col='red', pch=19)
points(t, A2%*%xhat2, col='cyan', pch=19)
lines(t, A1%*%xhat1, col='red', pch=19)
lines(t, A2%*%xhat2, col='cyan', pch=19)
legend('topright', legend=c('observations', 'model 1','model 2'), col=c('black','red','cyan'), pch=c(8,NA,NA), lwd=c(NA,2,2))

## Week 4
# Times of observation [seconds]
t = 1:8
# Observed altitude [m]
y = c(79.06, 126.13, 179.90, 218.77, 258.74, 266.91, 274.91, 280.61)

# Number of observations 
m = length(t)

# Design matrices for the two models
A = cbind(1, t, 0.5*t^2)

# Covariance matrix
Q = 100*t*diag(m)

# What is the bset linear unbiased estimation of the model parameters
xhat = solve(t(A)%*%solve(Q)%*%A)%*%(t(A)%*%solve(Q)%*%y) 
        
#figure, 
plot(t,y,col='blue',cex=1.5,xlim=c(0, max(t)+1),
     ylim=c(0, 1.4*max(y)),
     xlab='time [s]',
     ylab='altitude [m]', pch=19) 
grid(10, 10)
lines(t,A%*%xhat,col='red',lwd=2)
legend('topright', legend=c('observations','model'), col=c('blue','red'), pch=c(19,NA), lwd=c(NA,2))


# week 6

qchisq(0.975, 95-5)
qchisq(0.999, 95-5)



# Import IJmuiden data
Data  = read.csv('Ijmuiden.txt', sep=';', header=FALSE)       
# vector of observations y, and times of observations T
y     = Data[,2]
T     = Data[,1]

# number of observations and number  of unknowns
m     = length(y) # number of observations
n     = 4 # number of unknowns

# vector DT contains the time differences 
# with respect to first time of observation
DT   = T - T[1] # in years

# 1. Define the design matrix A and covariance matrix Qyy
A    = cbind(rep(1,m), DT, sin(2*pi*DT), cos(2*pi*DT)) # design matrix (assume x=[l0 r a_s a_c]')
Qyy  = diag(rep(50^2,m))       # covariance matrix of observations in [mm^2]

# 2. ESTIMATE xhat (expression already given)
xhat = solve(t(A)%*%solve(Qyy)%*%A)%*%(t(A)%*%solve(Qyy)%*%y)  # BLUE of the parameters             

# 3. CALCULATE yhat 
yhat = A%*%xhat  # BLUE of the adjusted model 

# 4. CALCULATE ehat
ehat = y-yhat    # BLUE of residuals (ehat)      

# 5. CALCULATE the test statistic Tq
Tq = t(y-A%*%xhat)%*%solve(Qyy)%*%(y-A%*%xhat)   # overall model test statsitic

# 6. CALCULATE the critical value K
alpha=0.05 # level of significance of the OMT
K=qchisq(1-alpha,m-n)  # critical value for OMT


# Plot the results
par(mfrow=c(2,1))
plot(T, y, type='l', ylim=c(-500,500), 
     xlab='Year', ylab='Sea level (mm)',
     main='monthly sea level data in IJmuiden (blue) over 10 years, fitted with the trendline (red)') 
lines(T, yhat, col='red')

plot(T, ehat, type='l',ylim=c(-500,500), 
     xlab='Year', ylab='Sea level (mm)',
     main='residuals after fitting the trendline') 
