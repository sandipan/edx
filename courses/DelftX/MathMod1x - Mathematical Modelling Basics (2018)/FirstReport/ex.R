# alpha = 0

beta <- 25 * 10^(-6) #0.00002
N <- 4500 #1000  
length <- 5
I <- seq(0, 5000, 250)
t <- seq(0, 125, 5)
t_I <- expand.grid(t=t, I=I) 
angles <- atan(beta*t_I$I*(N-t_I$I)) #atan2(0.7*t_P$P-20, t_P$t)
plot(t_I, pch=19, ylab='I(t)')
arrows(t_I$t, t_I$I, t_I$t+10*length*cos(angles), t_I$I+40*length*sin(angles), 
       length=0.1, lwd=2, col="blue")

I <- seq(0, 5000, 1)
plot(I, beta*I*(N-I), type='l', col='blue', xlab='I(t)', ylab='dI(t)/dt')
abline(h=0)
abline(v=0, lty=2)
abline(v=N, lty=2)
points(0, 0, pch=19, col='red')
points(N, 0, pch=19, col='red')
arrows(0, 0, N/5, 0, length=0.2)
arrows(0, 0, 4*N/5, 0, length=0.2)
arrows(5000, 0, 4800, 0, length=0.2)

N <- 4500 
beta <- 25 * 10^(-6)
C <- log(N/10-1)
t <- seq(0, 125, 1)
I <- N / (1+exp(C-beta*N*t))
dIdt <- beta*I*(N-I)
plot(t, dIdt, type='l', col='blue', xlab='t', ylab='dI(t)/dt')
imax = which.max(dIdt)
t[imax]
abline(v = t[imax], lty=2)
points(t[imax], dIdt[imax], pch=19, col='red')
#grid(10,10)

t <- seq(0, 300, 1)
I <- N / (1+exp(C-beta*N*t))
plot(t, N-I, type='l')
plot(t, N-I, type='l', log='y')
abline(v=272.333984375, lty=2)

library(ggplot2)
beta <- 0.00002
I <- seq(0, 1000, 1)
DIdt <- beta*I*(N-I)
df <- data.frame(I=I, DIdt=DIdt, beta=beta) 
betas <- c(0.0002, 0.002, 0.02, 0.2)
for (beta in betas) {
  df <- rbind(df, data.frame(I=I, DIdt=DIdt, beta=beta))
}
ggplot(df, aes(I, DIdt, col=beta)) + geom_point() + ylab(expression(frac('dI', 'dt'))) + theme_bw()

N <- 4500 
beta <- 25 * 10^(-6)
C <- log(N/1-1)
t <- 0:150
df <- NULL
for (beta in 20:29) {
  beta <- beta * 10^(-6)
  df <- rbind(df, data.frame(t, I=N / (1+exp(C-beta*N*t)), beta=beta))
}
df$beta <- as.factor(df$beta)
ggplot(df, aes(t, I, col=beta)) + geom_line(lwd=1.1) + ylab('I(t)') + theme_bw()

# beta = 0

library(ggplot2)
N <- 4500 
t <- 0:50
df <- NULL
for (alpha in c(140, 155, 167, 180, 200)) {
  alpha <- alpha * 10^(-3)
  df <- rbind(df, data.frame(t, I=N * exp(-alpha*t), R = N - N * exp(-alpha*t),  alpha=alpha))
}
df$alpha <- as.factor(df$alpha)
ggplot(df, aes(t, I, col=alpha)) + geom_line(lwd=1.1) + ylab('I(t)') + theme_bw()
ggplot(df, aes(t, R, col=alpha)) + geom_line(lwd=1.1) + ylab('R(t)') + theme_bw()

alpha <- 167
I <- seq(0, 20, 1)
plot(I, N * exp(-alpha*I), type='l', col='blue', xlab='I(t)', ylab='dI(t)/dt')


alpha <- 0.005
length <- 1
I <- seq(0, 1000, 20)
t <- seq(0, 20, 0.4)
t_I <- expand.grid(t=t, I=I/50) 
angles <- atan(-alpha*I) #atan2(0.7*t_P$P-20, t_P$t)
plot(t_I, pch=19)
arrows(t_I$t, t_I$I, t_I$t+length*cos(angles), t_I$I+length*sin(angles), 
       length=0.1, lwd=2, col="blue")

library(ggplot2)
alpha <- 0.005
I <- seq(0, 1000, 1)
DIdt <- -alpha*I
df <- data.frame(I=I, DIdt=DIdt, alpha=alpha) 
alphas <- c(0.0002, 0.002, 0.02, 0.2)
for (alpha in alphas) {
  df <- rbind(df, data.frame(I=I, DIdt=DIdt, alpha=alpha))
}
ggplot(df, aes(I, DIdt, col=alpha)) + geom_point() + ylab(expression(frac('dI', 'dt'))) + theme_bw()

if (FALSE) {
  beta <- 0.02
  alpha <- 0.05
  S <- seq(0, 1000, 10)
  I <- seq(0, 1000, 10)
  df <- expand.grid(S=S, I=I)
  df$DSdt <- -beta*df$S*df$I
  df$DIdt <- beta*df$S*df$I-alpha*df$I
  df$DRdt <- alpha*df$I
  library(tidyr)
  df %>% gather(variable, value, -I, -S) %>% ggplot(aes(I, S, col=value)) + geom_point() + 
    facet_wrap(~variable, scales = 'free') + 
    #scale_color_brewer(palette="Spectral") + 
    scale_colour_gradientn(colours=rainbow(100)) +
    theme_bw()
  
  library(scatterplot3d)
  #colors <- c("#999999", "#E69F00", "#56B4E9")
  par(mfrow=c(2,2))
  scatterplot3d(df[,1:3], pch = 16, color='red')
  scatterplot3d(df[,c(1:2, 4)], pch = 16, color='green')
  scatterplot3d(df[,c(1:2, 5)], pch = 16, color='blue')
  
}

F <- function(X) {
  #return (data.frame(S=-beta*X$S*X$I, I=beta*X$S*X$I-alpha*X$I, R=alpha*X$I)) 
  return (data.frame(S=-beta*X$S*X$I-mu*X$S+mu*N, I=beta*X$S*X$I-alpha*X$I-mu*X$I, R=alpha*X$I-mu*X$R)) 
}

N <- 4500
beta <- 25*10^(-5)
alpha <- 167*10^(-3) # 0.05
mu <- 1
t <- 0
del_t <- 1/2^9 #8 #1
X_t <- data.frame(S=4499, I=1, R=0)
X <- X_t
print(cbind(t, X_t))
while (t <= 50) {
  X_t <- X_t + del_t * F(X_t)
  t <- t + del_t
  X <- rbind(X, X_t)
  #print(cbind(t, X_t))
}
X$t <- 0:(nrow(X)-1)
library(ggplot2)
library(gridExtra)
grid.arrange(
  ggplot(X, aes(S, I)) + 
    geom_point(col='blue') + 
    geom_line() + #arrow = arrow(length = unit(0.5, "cm"))) + 
    theme_bw(),
  ggplot(X, aes(S, R)) + 
    geom_point(col='blue') + 
    geom_line() + #arrow = arrow(length = unit(0.5, "cm"))) + 
    theme_bw(), 
  ggplot(X, aes(R, I)) + 
    geom_point(col='blue') + 
    geom_line() + #arrow = arrow(length = unit(0.5, "cm"))) + 
    theme_bw(), 
  ncol = 2)
X$t <- X$t / 2^8
X %>% gather(variable, value, -t) %>% 
  ggplot(aes(t, value, col=variable)) + 
  geom_point() + geom_line() + 
  facet_wrap(~variable, scales = 'free_y', ncol = 1)

library(scatterplot3d)
scatterplot3d(X$S, X$I, X$R, pch = 19, color='blue', xlab='S', ylab='I', zlab='R')
colfunc <- colorRampPalette(c("blue", "red"))
palette(colfunc(1000)) # plot(1:1000, 1:1000, col=1:1000)
scatterplot3d(X$S, X$I, X$R, pch = 19, color=X$t+1, xlab='S', ylab='I', zlab='R')

library(rgl)
plot3d(X$S, X$I, X$R, pch = 19, col=X$t+1, xlab='S', ylab='I', zlab='R')

I_0 <- 10
S_0 <- 4490
S <- seq(4490, 0, -100)
R_0 <- 1/seq(1000, 5000, 500)
df <- NULL
for (i in 1:length(R_0)) {
  I <- I_0 + S_0 - S + (1/R_0[i]) * log(S/S_0) 
  df <- rbind(df, data.frame(S=S, I=I, R_0=R_0[i]))
}
df <- df[df$I > 0, ]
df$R_0 <- as.factor(round(df$R_0,6))
library(ggplot2)
ggplot(df, aes(S, I, col=R_0)) + geom_line() + xlab('S(t) (in 1000 persons)') + ylab('I(t) (in 1000 persons)')
  
#library(reshape2)
#df <- melt(X, id='t')
library(tidyr)
X %>% gather(variable, value, -t) %>% ggplot(aes(t, value, col=variable)) + geom_point() + geom_line() + facet_wrap(~variable, scales = 'free_y', ncol = 1)
colMeans(X)
X %>% summarise(P=max(P))
X[which(X$P==max(X$P)),]
X[which(X$G==max(X$G)),]