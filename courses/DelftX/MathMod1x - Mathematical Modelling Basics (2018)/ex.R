## Week1

x = seq(0,20,0.01)
k = 0.17
Ir = exp(-k*x)
plot(x, Ir, type='l')

10*exp(k*5)

exp(k*5)^4
exp(k*20)

th <- seq(5,20,5)
spf <- c(9,15,22,30)
m <- lm(spf~th)

length <- 0.5
P <- seq(0, 75, 5)
t <- seq(0, 10, 1)
t_P <- expand.grid(t=t, P=P) 
angles <- atan(0.7*t_P$P-20) #atan2(0.7*t_P$P-20, t_P$t)
plot(t_P, pch=19)
arrows(t_P$t, t_P$P, t_P$t+length*cos(angles), t_P$P+5*length*sin(angles), 
       length=0.1, lwd=2, col="blue")

length <- 1
P <- seq(0, 60, 2.5)
t <- seq(0, 60, 2.5)
t_P <- expand.grid(t=t, P=P) 
angles <- atan(0.15*(0.7*t_P$P-20)^2*(t_P$P/10-5)*(t_P$P/10-1)) #atan2(0.7*t_P$P-20, t_P$t)
plot(t_P, pch=19)
arrows(t_P$t, t_P$P, t_P$t+length*cos(angles), t_P$P+length*sin(angles), 
       length=0.1, lwd=2, col="blue")

length <- 5
Z <- seq(0, 100, 5)
t <- seq(0, 100, 5)
V <- 25
C <- 1
Q <- 10
U <- 5
Ze <- V*(C+U/Q)
t_Z <- expand.grid(t=t, Z=Z) 
angles <- atan((-Q/V)*t_Z$Z+C*Q+U) #atan2(0.7*t_P$P-20, t_P$t)
plot(t_Z, pch=19)
arrows(t_Z$t, t_Z$Z, t_Z$t+length*cos(angles), t_Z$Z+length*sin(angles), 
       length=0.1, lwd=2, col="blue")
points(t_Z$t, rep(Ze, length(t_Z$t)), col='red', pch=19)

plot(2-exp(-(0:100)), type='l')

plot(V*C+(U/Q)*exp(-(0:100)), type='l')

polyroot(c(15000,-525,0.7)) #uniroot

P <- seq(0, 1000, 0.1)
Dpdt <- 0.7*P*(750-P)-15000
plot(P, Dpdt, type='l')

length <- 25 #5
t <- seq(0, 75, 3)
P <- seq(0, 750, 30) #P(0)
t_P <- expand.grid(t=t, P=P) 
Dpdt <- 0.7*t_P$P*(1-t_P$P/750)-20
angles <- atan(Dpdt) #atan2(0.7*t_P$P-20, t_P$t)
plot(t_P, pch=19)
arrows(t_P$t, t_P$P, t_P$t+length*cos(angles), t_P$P+length*sin(angles), 
       length=0.1, lwd=2, col="blue")


integrate(function(P) 1/(0.7*P*(1-P/750)-20), 30, 720)

length <- 0.5
k <- 1/5
t <- seq(0, 1000, length=50)
P <- seq(0.02, 1, length=50)
t_P <- expand.grid(t=t, P=P) 
angles <- atan(k*t_P$P*(1-t_P$P))
plot(t_P, pch=19)
arrows(t_P$t, t_P$P, t_P$t+length*cos(angles), t_P$P+22*length*sin(angles), 
       length=0.1, lwd=2, col="blue")

t <- seq(0, 200, 0.1)
X <- 1/(1+49*exp(-k*t))
plot(t, X, type='l')

0.7*30*(1-30/750)-20 # f(0,P)
30 + 7*(0.7*30*(1-30/750)-20) # P(7) 
31.12 + 7*(0.7*31.12*(1-31.12/750)-20) # P(14) = P(7) + dt* f(7,P) 

P <- 30
t <- 0
Ps <- c(P)
ts <- c(t)
dt <- 1
while (t <= 50) {
  print(paste(t, P))
  dPdt <- dt*(0.7*P*(1-P/750)-20)
  P <- P + dPdt  
  t <- t + dt
  Ps <- c(Ps, P)
  ts <- c(ts, t)
}
plot(ts, Ps, pch=19, main='Euler Method', xlab='Time', ylab='Population', col='red')
lines(ts, Ps, col='blue', lwd=2)
grid(10,10)

#integrate(function(P) 1/(0.7*P*(1-P/700)-20), 30, 720,subdivisions=10000000L)
integrate(function(P) 1000/(P*(700-P)-20000), 30, 670,subdivisions=10000000L) + 
  integrate(function(P) 1000/(P*(700-P)-20000), 670.2, 720)#,subdivisions=10000000L)

## Week3
F <- function(X) {
  return (data.frame(P=0.7*X$P-0.007*X$P^2-0.04*X$P*X$G, 0.008*X$P*X$G-0.25*X$G)) 
}

t <- 0
del_t <- 1/8 #1
X_t <- data.frame(P=20, G=5)
X <- X_t
print(cbind(t, X_t))
while (t <= 100) {
  X_t <- X_t + del_t * F(X_t)
  t <- t + del_t
  X <- rbind(X, X_t)
  print(cbind(t, X_t))
}
X$t <- 0:(nrow(X)-1)
library(ggplot2)
ggplot(X, aes(P, G)) + geom_point(col='blue') + xlim(c(0,70)) + ylim(c(0,20)) + theme_bw()
#library(reshape2)
#df <- melt(X, id='t')
library(tidyr)
X %>% gather(variable, value, -t) %>% ggplot(aes(t, value, col=variable)) + geom_point() + geom_line() + facet_wrap(~variable, scales = 'free_y', ncol = 1)
colMeans(X)
X %>% summarise(P=max(P))
X[which(X$P==max(X$P)),]
X[which(X$G==max(X$G)),]

#X$t <- X$t/8
#res <- nls(P ~ A+B*exp(-mu*t)*sin(w*(t-phi)),
#                 data = X,
#                 start = list(A = 31, B = 10, 
#                              mu = 1, #1/100, 
#                              w = 2*pi/10, phi = -pi/2),
#                 algorithm = "plinear") #"port")
#res

20
2*pi/20

w <- 0.03936
2*pi/w

P <- 31 # at inf
G <- 12 # at inf
alpha <- 0.7*P*(1-P/100) / (P*G)
0.7*P*(1-P/100) # per day eaten
0.7*P*(1-P/100) / G

w <- NULL
del_t <- 1
while (del_t >= 1/2^5) {
  t <- 0
  X_t <- data.frame(P=20, G=5)
  while (t < 6) {
    X_t <- X_t + del_t * F(X_t)
    t <- t + del_t
  }
  w <- rbind(w, data.frame(dt=del_t, wdt=X_t[1]))
  del_t <- del_t / 2
}
abs(w$P -lag(w$P,1))

for (del_t in c(1/8, 1/4)) {
  t <- 0
  X_t <- data.frame(P=20, G=5)
  X <- X_t
  while (t < 10) {
    X_t <- X_t + del_t * F(X_t)
    t <- t + del_t
    X <- rbind(X, X_t)
  }
  print(t)
  print(del_t)
  print(X_t)
}

w <- NULL
del_t <- 1
while (del_t >= 1/2^5) {
  t <- 0
  X_t <- data.frame(P=20, G=5)
  while (t < 12) {
    X_t <- X_t + del_t * F(X_t)
    t <- t + del_t
  }
  w <- rbind(w, data.frame(dt=del_t, wdt=X_t[2]))
  del_t <- del_t / 2
}
abs(w$G -lag(w$G,1))

solve(matrix(c(1/100,4/70,8/250,0), ncol=2, byrow=TRUE), matrix(rep(1,2),nrow=2))

beta <- 0.008
alpha <- 0.04
#-(0.007/(4*beta))/2
#(0.007/(4*beta))^2 + 4*((0.7/4)*(1-0.01/(4*beta)))
A <- -(0.007/(4*beta))
B <- -alpha / (4*beta)
C <- 0.7*beta*(1-1/(400*beta))/alpha
A/2
A^2 + 4*B*C
(0.007/(4*beta))^2  + 0.007/(4*beta) - 0.7
0.007/(4*(sqrt(0.95)-1/2))

del_t <- 1
while (del_t >= 10^-3) {
  t <- 0
  X_t <- data.frame(V=0, I=0)
  X <- X_t
  while (t < 10) {
    X_t <- X_t + del_t * F(X_t)
    t <- t + del_t
    X <- rbind(X, X_t)
  }
  X$t <- 0:(nrow(X)-1)
  X %>% gather(variable, value, -t) %>% ggplot(aes(t, value, col=variable)) + 
    geom_point() + geom_line() + facet_wrap(~variable, scales = 'free_y', ncol = 1) +
    ggtitle(paste('del_t', del_t))
  print(cbind(del_t, t*del_t, X_t))
  del_t <- del_t / 10
}

C1 <- 0.633 # 0.5
R <- 5 #4 #3 #2.46094#2.421879 #2.34375 #2.1875 #1.875 #1.25 #2.5 #5 #10 #0.1
F <- function(X) {
  return (data.frame(V=X$I/C1, I=5/4-R*X$I/4-X$V/4)) 
}

del_t <- 0.001 #0.002 #0.001 #0.02 #0.01
t <- 0
X_t <- data.frame(V=0, I=0)
X <- X_t
X <- as.data.frame(matrix(rep(0,50/0.001), ncol=2))
names(X) <- c('V', 'I')
i <- 2
while (t < 50) { #2.2) {
  X_t <- X_t + del_t * F(X_t)
  t <- t + del_t
  X[i,] <- X_t
  i <- i + 1
  #X <- rbind(X, X_t)
}
X$t <- (0:(nrow(X)-1)) * del_t
tail(X)
X %>% gather(variable, value, -t) %>% ggplot(aes(t, value, col=variable)) + 
  geom_point() + geom_line() + facet_wrap(~variable, scales = 'free_y', ncol = 1) +
  scale_x_continuous(breaks=seq(0,50,1))
  ggtitle(paste('del_t', del_t))
print(cbind(del_t, t*del_t, X_t))

# 1.720827 - 1.721773

C1 <- 0.633 # 0.5
R <- 0.0 
F <- function(X) {
  return (data.frame(V=X$I/C1, I=5/4-R*X$I/4-X$V/4)) 
}

del_t <- 0.01 #0.001 #0.002 #0.001 #0.02 #0.01
t <- 0
X_t <- data.frame(V=0, I=0)
X <- X_t
X <- as.data.frame(matrix(rep(0,1000/0.01), ncol=2)) #1000
names(X) <- c('V', 'I')
i <- 2
while (t < 1000) { #2.2) { # 1000
  X_t <- X_t + del_t * F(X_t)
  t <- t + del_t
  X[i,] <- X_t
  i <- i + 1
  #X <- rbind(X, X_t)
  #if (t %% 10 == 0) {
  #  print(t)
  #}
}
X$t <- (0:(nrow(X)-1)) * del_t
tail(X)
X %>% gather(variable, value, -t) %>% ggplot(aes(t, value, col=variable)) + 
  geom_point() + geom_line() + facet_wrap(~variable, scales = 'free_y', ncol = 1)# +
#  scale_x_continuous(breaks=seq(0,50,1))
ggtitle(paste('del_t', del_t))
print(cbind(del_t, t*del_t, X_t))

# 1.720827 - 1.721773

P <- 31.25 #0
G <- 12.03 #0
alpha <- 1 #0.04
beta <- 2 #0.008
J <- matrix(c(0.7-0.014*P-0.04*G,-alpha*P, 0.008*G, beta*P-0.25), ncol=2, byrow=TRUE)
eigen(J)

R <- 0.1
L <- 4 * 10^(-9)
C <- 0.5 * 10^(-9)
VB <- 5
lambda_re <- -R/(2*L)
lambda_im <- sqrt(R^2/L^2 - 4 / (L*C)) / 2
lambda_re / 10^9
2*pi*sqrt(2)

C <- 4 / (L*((2*pi/5)^2*10^18-R^2/L^2))

R <- 10
C <- 0.633 * 10^(-9)
lambda_r <- -R/(2*L)
lambda_ir <- sqrt(R^2/L^2 - 4 / (L*C)) / 2
lambda_re / 10^9
lambda_ir / 10^9

R <- sqrt(4*L/C)