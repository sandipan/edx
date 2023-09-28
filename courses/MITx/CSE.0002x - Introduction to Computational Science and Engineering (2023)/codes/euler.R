Euler_update <- function(xn, delta_t, f) {
  return (xn + delta_t * f(xn))
}

Improved_Euler_update <- function(xn, delta_t, f) {
  k1 <- f(xn) * delta_t
  k2 <- f(xn + k1) * delta_t
  return (xn + 1/2 *  (k1 + k2))
}

Runge_Kutta_4_update <- function(xn, delta_t, f) {
  k1 <- f(xn) * delta_t
  k2 <- f(xn + k1/2) * delta_t
  k3 <- f(xn + k2/2) * delta_t
  k4 <- f(xn + k3) * delta_t
  return (xn + 1/6 * (k1 + 2*k2 + 2*k3 + k4))
}

logistic_function <- function(x, r=1) {
  return (r * x * (1 - x))
}

analytic_solution <- function(x0, ts, r=1) {
  return (1 / (1 + (1-x0)/x0*exp(-r*ts)))  
}

solve_logistic <- function(N0, r = 1, delta_t = 0.01, times = 1000, update_fn=Euler_update) {
  t <- rep(0, times)
  N <- rep(N0, times)
  
  for (i in seq(2, times)) {
    # Euler
    t[i] <- t[i-1] + delta_t
    N[i] <- update_fn(N[i-1], delta_t, logistic_function)
  }
  
  return (list(t, N))
}

solution_df <- NULL
N0 <- 0.1
for (delta_t in c(0.01,0.1,0.5,1,1.25)) {
  sol <- solve_logistic(N0, delta_t=delta_t, times=10/delta_t, update_fn = Improved_Euler_update)
  solution_df <- rbind(solution_df, data.frame(delta_t=delta_t, t=sol[[1]], N_t=sol[[2]]))
}
solution_df$delta_t <- as.factor(solution_df$delta_t)
ts <- seq(0,10,0.01)
solution_df <- rbind(solution_df, data.frame(delta_t='analytic', t=ts, N_t=analytic_solution(N0, ts)))

library(dplyr)
solution_df %>% ggplot(aes(t, N_t, col=delta_t)) + geom_line(lwd=1) + theme_bw() + ggtitle('Improved Euler method')


Runge_Kutta_4_update <- function(xn, delta_t, f) {
  xn <- as.numeric(xn)
  k1 <- f(xn) * delta_t
  k2 <- f(xn + k1/2) * delta_t
  k3 <- f(xn + k2/2) * delta_t
  k4 <- f(xn + k3) * delta_t
  return (xn + 1/6 * (k1 + 2*k2 + 2*k3 + k4))
}

f <- function(v) {
  x <- v[1]
  y <- v[2]
  return (c(alpha * x - beta * x * y, delta * x * y - gamma * y))
}

solve_Lotka_Volterra <- function(v0, delta_t=0.01, niter=10000) {
  ts <- c(0)
  vs <- data.frame(prey=v0[1], predtor=v0[2])
  for (i in seq(2, niter)) {
    ts <- c(ts, ts[i-1] + delta_t)
    v <- Runge_Kutta_4_update(vs[i-1, ], delta_t, f)
    vs <- rbind(vs, data.frame(prey=v[1], predtor=v[2]))
  }
  vs['t'] <- ts
  return (vs)
}

alpha <- 1.1 
beta <- 0.4 
delta <- 0.1
gamma <- 0.4
solution_df <- solve_Lotka_Volterra(c(10,10))
library(tidyverse)
solution_df %>% gather('var', 'val', -t) %>% ggplot(aes(t, val, col=var)) + 
  geom_line(lwd=1) + theme_bw() + ggtitle('Solution with Runge-Kutta order-4')


(15^3-5^3)/(60)

1/10 * (2/3) * ((15^2/2)^(3/2)-(5^2/2)^(3/2))

mean(replicate(1000, {runif(1,5,15)}))
mean(replicate(10000, {(runif(1,5,15))^2/2}))
integrate(function(x) sqrt(x)/10/sqrt(2), 5^2/2, 15^2/2)

hist(replicate(1000, mean(replicate(1000, {(runif(1,5,15))^2/2}))), 
     xlab='sample mean', main='Simulation result')
abline(v=54.16667, col='red', lty='dashed')

# beta = inv(X'X)(X'y) = solve(X'X, X'y)
# X = QR
# inv(X'X)(X'y) = inv(R'Q'QR)(R'Q'y) = inv(R'R)(R'Q'y) = inv(R)inv(R')(R')(Q'y) 
# = inv(R)(Q'y) = solve(R, Q'y)
 

m <- 100
n <- 6
set.seed(1)
X <- matrix(rnorm(m*n), nrow=m)
beta <- matrix(sample(1:(n+1),n+1), ncol=1)
y <- X1%*% beta + rnorm(m)
X1 <- cbind(rep(1,m), X) # add intercept

library(microbenchmark)
library(ggplot2)
q <- qr(X1)
Q <- qr.Q(q)
R <- qr.R(q)
autoplot(
  microbenchmark(solve(t(X1)%*%X1, t(X1)%*%y),
                 solve(R, t(Q)%*%y), times=1000L)
)

lm(y~X)$coeff
as.numeric(solve(t(X1)%*%X1, t(X1)%*%y))
q <- qr(X1)
as.numeric(solve(qr.R(q), t(qr.Q(q))%*%y))
as.numeric(qr.solve(X1, y))


n <- 5
p <- 0.57
x <- 0:5
df <- data.frame(x=x, observerd=c(25,165,429,500,339,92), expected=1550*dbinom(x, n, p))
pchisq(sum((df$observerd - df$expected)^2 /df$expected), df=length(x)-1,lower.tail = FALSE)

chisq.test(c(25,165,429,500,339,92), p = dbinom(x, n, p))



## GP
library(plgp)
library(mvtnorm)

f <- function(x) {
  return (cos(x))
}

eps <- sqrt(.Machine$double.eps) 

set.seed(1)
n <- 6 #20 #8
#X <- matrix(seq(0, 2*pi, length=n), ncol=1)
X <- matrix(sort(runif(n, 0, 2*pi)), ncol=1)
y <- f(X)

s <- 1 # scale hyperparameter with exponential Kernel
D <- distance(X) # Euclidean
Sigma <- exp(-D / s) + diag(eps, ncol(D)) # make the covriance PSD

Y <- rmvnorm(1, sigma=Sigma)
plot(X, Y, type="l")

Y <- rmvnorm(3, sigma=Sigma)
matplot(X, t(Y), type="l", ylab="Y")

N <- 100

XX <- matrix(seq(-0.5, 2*pi + 0.5, length=N), ncol=1)
DXX <- distance(XX)
SXX <- exp(-DXX) + diag(eps, ncol(DXX))

DX <- distance(XX, X)
SX <- exp(-DX)

Si <- round(solve(Sigma), 1)
mu_post <- SX %*% Si %*% y
Sigma_post <- SXX - SX %*% Si %*% t(SX)

YY <- rmvnorm(N, mu_post, Sigma_post)

q1 <- mup + qnorm(0.05, 0, sqrt(diag(Sigma_post)))
q2 <- mup + qnorm(0.95, 0, sqrt(diag(Sigma_post)))

matplot(XX, t(YY), type="l", col="lightgray", lty=1, xlab="x", ylab="y", main='Prediction with GP posterior')
points(X, y, col='blue', pch=20, cex=2)
lines(XX, f(XX), col="blue", lwd=2)
lines(XX, mup, col='red', lwd=2)
lines(XX, q1, lwd=2, lty=2, col=2)
lines(XX, q2, lwd=2, lty=2, col=2)
grid()
legend(x = "topleft", 
       legend=c("original", "predicted", "95% CI"), 
       col = c("blue","red", "red"),
       lty = c(1, 1, 2))

set.seed(11)
n <- 2000
RTs <- brms::rshifted_lnorm(n, meanlog = log(1.3), sdlog = 0.1, shift = 0.5)
acc <- sapply(RTs,
              FUN = function(x){
                  rbinom(
                    n = 100,
                    # multiplying by 0.3 should give me a correlation around 0.3... am I right?
                    prob = boot::inv.logit(x * 0.3), 
                    size = 1
                  )
              }
)
cor(RTs, colMeans(acc))


k <- 1:4
n <- 1000
x <- sample( LETTERS[k], n, replace=TRUE, prob=c(0.1, 0.2, 0.65, 0.05) ) 
y <- as.vector(sapply(k,function(x) rnorm(round(n/length(k)),mean=x,sd=2)))

library(ggplot2)
library(gridExtra)

correlate.data <- function(x, y, r) {
  ix <- sort(x, index.return=TRUE)$ix
  iy <- sort(y, index.return=TRUE)$ix
  n <- length(x)
  rc <- cor(x, y)
  while ((rc < r) && ( n > 1)) {
    i <- which(ix == n)
    j <- which(iy == n)
    tmp <- y[i]
    y[i] <- y[j]
    y[j] <- tmp
    n <- n - 1
    rc <- cor(x, y)
    print(rc)
  }
  
}

plot.data <- function(x, y) {
  p1 <- ggplot() + geom_histogram(aes(x)) + ggtitle('hist(RT)') + xlab('RT')
  p2 <- ggplot() + geom_histogram(aes(y)) + ggtitle('hist(acc)') + xlab('acc')
  p3 <- ggplot() + geom_point(aes(x, y)) + 
    geom_smooth(aes(x, y), method = lm) + xlab('RT') + ylab('acc') + 
    ggtitle(paste('cor(RT,acc) =', cor(x,y)))
  p <- grid.arrange(p1, p2, p3, ncol = 3)
  print(p)
}

library(animation)

gen.correlated.binary.data <- function(x, r) {
  n <- length(x)
  xs <- sort(x)
  ys <- c(rep(0, n-1), 1)
  rc <- cor(xs, ys)
  i <- n
  ix <- sample(1:n, n, replace=FALSE) 
  #saveGIF({
      while ((rc < r) & (i > 1)) {
        ys[i] <- 1
        i <- i - 1
        #plot.data(xs[ix], ys[ix])
        rc <- cor(xs[ix], ys[ix])
        print(rc)
      }
    #}, delay=1
  #)
  x <- xs[ix] # shuffle
  y <- ys[ix] # shuffle
  print(cor(x, y))
  plot.data(x, y)
  
  return(list(x=x, y=y))
}

n <- 2000
RTs <- brms::rshifted_lnorm(n, meanlog = log(1.3), sdlog = 0.1, shift = 0.5)
acc <- sapply(RTs,
              FUN = function(x){
                rbinom(
                  n = 1,
                  prob = boot::inv.logit(x), 
                  size = 1
                )
              }
)

set.seed(1)
cor(RTs,acc)
res <- gen.correlated.binary.data(RTs, 0.3) #0.5
RTs <- res$x
acc <- res$y
cor(RTs,acc)

x = c(0.00,0.05,0.10,0.15,0.20,0.25,0.30,0.35,0.40,0.45,0.50,0.55,0.60,0.65,0.70,0.75,0.80,0.85,0.90,0.95,1.00)
f = c(0.000000000,1.221759375,1.968300000,2.349028125,2.457600000,2.373046875,2.160900000,1.874315625,1.555200000,1.235334375,0.937500000,0.676603125,0.460800000,0.292621875,0.170100000,0.087890625,0.038400000,0.012909375,0.002700000,0.000178125,0.000000000)
F = cumsum(f) / sum(f)

k <- 5
m <- lm(F ~ poly(x, degree=k))
F_x <- function(x) {
  predict(m, newdata=data.frame(x=x))
}

inverse = function (f, lower = -Inf, upper = Inf) {
  function (y) uniroot((function (x) f(x) - y), lower = lower, upper = upper)[1]$root
}

#square_inverse = inverse(function (x) x^2, 0.1, 100)
#square_inverse(4)

quantile = inverse(function(x) F_x(x), 0, 1)
quantile(0.95)

library(ggplot2)

x1 <- seq(0,1, 0.01)
F1 <- F_x(x1)
ggplot() + geom_point(aes(x, F)) +
  geom_line(aes(x1, F1))

q <- c()
df <- NULL
for (k in 2:9) {
  m <- lm(F ~ poly(x, degree=k))
  F_x <- function(x) {
    predict(m, newdata=data.frame(x=x))
  }
  df <- rbind(df, data.frame(x=x1, k=as.character(k), F_x=F_x(x1)))
  q <- c(q, inverse(function(x) F_x(x), 0, 1)(0.95))
}
ggplot() + geom_point(aes(x, F)) + geom_line(data=df, aes(x, F_x, col=k)) +
  ylab('F_X(x)') + 
  geom_hline(yintercept = 0.95) +
  geom_vline(aes(xintercept = q), lty=2) + theme_bw() #aes(yintercept = q, col=q))
  
set.seed(45)
N <- 10000 # population size
X <- runif(N, min = -1, max=1)
mu <- mean(X)
mu
sigma <- sd(X)

set.seed(45)
mean(replicate(100,
          {
            n <- 100
            x <- sample(X, n)
            xbar <- mean(x) # sample size
            se <- sigma / sqrt(n)
            alpha <- 0.05
            z_alpha <- qnorm(1-alpha/2) 
            CI <- c(xbar - z_alpha*se, xbar + z_alpha*se) 
            (0 > CI[1]) & (0 < CI[2]) # 0 inside CI 
          }))

res <- replicate(100,
          {
            n <- 100
            x <- sample(X, n)
            xbar <- mean(x) # sample size
            se <- sigma / sqrt(n)
            alpha <- 0.05
            z_alpha <- qnorm(1-alpha/2) 
            CI <- c(xbar - z_alpha*se, xbar + z_alpha*se) 
            c(xbar, CI)
          })
df <- as.data.frame(t(res))
names(df) <- c('xbar', 'CI.low', 'CI.up')
head(df)
df$y <- 1:nrow(df)

ggplot(df) + 
  geom_errorbar(aes(xmin=CI.low, xmax=CI.up, y=y), colour="black", width=.1, position=position_dodge(0.1)) +
  geom_point(aes(xbar, y), size=3) + 
  geom_vline(xintercept = 0, color='red', lty=2, lwd=1.25) +
  ggtitle('95% CI for mean, test H0: mu = 0')

library(class)

voting <- read.csv("WJBrennan_voting.csv", header = TRUE)
voting_pre1980 <- voting[c(1:3368),c(2:10)]
voting_post1980 <- voting[c(3369:4746),c(2:10)]
unique(voting$vote)
df <- as.data.frame(t(colMeans(voting_pre1980[,-9])))
df$vote <- 'minority'
voting_pre1980 <- rbind(voting_pre1980, df)
model.knn <- knn(voting_pre1980[,-9], voting_post1980[,-9], voting_pre1980[,9], k = 3, prob=TRUE)

# fitting multiple poission distribution

#quakes data
xf <- c(13, 14, 8, 10, 16, 26, 32, 27, 18, 32, 36, 24, 22, 23, 22, 18, 25, 21, 21, 14, 8, 11, 14, 23, 18, 17, 19, 20, 22, 19, 13, 26, 13, 14, 22, 24, 21, 22, 26, 21, 23, 24, 27, 41, 31, 27, 35, 26, 28, 36, 39, 21, 17, 22, 17, 19, 15, 34, 10, 15, 22, 18, 15, 20, 15, 22, 19, 16, 30, 27, 29, 23, 20, 16, 21, 21, 25, 16, 18, 15, 18, 14, 10, 15, 8, 15, 6, 11, 8, 7, 18, 16, 13, 12, 13, 20, 15, 16, 12, 18, 15, 16, 13, 15, 16, 11, 11)


udist <- function(n) rep(1/n, n) 

#natural to working
n2wp <- function(p) {
  m <- length(p)
  log(p[2:m]/(1 - sum(p[2:m])))
}

#working to natural
w2np <- function(lp) {
  rv <- exp(lp)/(1 + sum(exp(lp)))	
  c(1 - sum(rv), rv)
}

#optimisation function
of <- function(pv, m, x) {
  if (m == 1) 
    return(-sum(dpois(x, exp(pv), log=TRUE)))
  #convert working parameters to natural paramters
  pr <- exp(pv[1:m])
  probs <- w2np(pv[(m+1):(2*m - 1)])
  #calculate -ve log likelihood
  -sum(log(outer(x, pr, dpois) %*% probs))
}

#initial estimates and probabilities for 2, 3 and 4 distributions
#the lambda values I just guess, and use an uniform distribution
#for the initial mixing distribution.
pv <- c(log(c(10, 20)), n2wp(udist(2)))
pv <- c(log(c(10, 15, 20)), n2wp(udist(3)))
pv <- c(log(c(5, 15, 20, 30)), n2wp(udist(4)))

#number of distributions to fit
m <- (length(pv) + 1)/2

#fit using nlm
fv <-nlm(of, pv, m, xf, print.level=0) 
rv <- fv$est

#lambda estimates
exp(rv[1:m])
#mixing distribution
w2np(rv[(m+1):(2*m-1)])

install.packages("ggcorrplot")

set.seed(11)
n <- 50
data <- data.frame(Bootcamp = sample(c('Cybersecurity', 'Data Science', 'Software Engineering'), n, replace = T))
for (column in c('software', 'web', 'data', 'security', 'engineer', 'developer', 'analyst')) {
  data[column] = rbinom(n, 1, runif(1))
}
head(data)
bootcamp <- as.data.frame(model.matrix(~ Bootcamp + 0, data))
head(bootcamp)
job <- data[,2:ncol(data)]
corr <- cor(bootcamp, job)
                         
library(ggcorrplot)
ggcorrplot(corr, lab = TRUE)


