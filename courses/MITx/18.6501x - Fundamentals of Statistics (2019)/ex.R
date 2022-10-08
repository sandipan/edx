library(ggplot2)
#library(tidyr)
library(tidyverse)
library(animation)
library(FNN)
library(gridExtra)
library(scales)
library(latex2exp)

test <- function() {
  N <- 100000
  saveGIF({
    ns <- c(100, 500, 1000, 2500, 5000, 7500, 10000, 20000)
    alpha <- 0.05
    p <- 0.5
    # kls <- rep(NA, length(ns))
    # i <- 1
    for (n in ns) {
      print(n)
      X_n_bar <- apply(replicate(N, rbinom(n, 1, p)), 2, mean)
      z <- rnorm(N)
      df <- data.frame(bernoulli=sqrt(n)*(X_n_bar-p)/sqrt(p*(1-p)), normal=z)
      #kls[i] <- KL.divergence(df$bernoulli, df$normal)
      #i <- i + 1
      pl <- df %>% gather(key=distr, value=val) %>% ggplot(aes(val, fill=distr)) + 
        geom_histogram(aes(y = (..count..)/sum(..count..)), binwidth=0.01, alpha=0.25, position="identity") + 
        #geom_vline(xintercept = p, color='blue') +
        scale_y_continuous() + #labels = percent_format()) +
        xlab('value') + ylab('proportion') + xlim(-5, 5) +
        ggtitle(TeX(sprintf('$\\lim _{n \\rightarrow \\infty} \\frac{\\sqrt{n}(\\bar{X_n}-p)}{\\sqrt{p(1-p)}} \\; \\; \\overset{(d)}{\\rightarrow} \\;\\; \\aleph(0,1),\\;\\; (n=%d)$',n)))
      #for (i in 1:10) {
      #  pl <- pl + geom_rect(aes(xmin=X_n_bar[i]-qnorm(1-alpha/2)*sqrt(X_n_bar[i]*(1-X_n_bar[i])/n), xmax=X_n_bar[i]+qnorm(1-alpha/2)*sqrt(X_n_bar[i]*(1-X_n_bar[i])/n),ymin=0,ymax=1), fill='blue', alpha=0.25)
      #}
      print(pl)
      
    }
  })
}

log0 <- function(x) {
  return(ifelse(x<=0, 0, log(x)))
}

thetas <- seq(0,1,0.01)
K <- 3
n <- 1000
N <- c(339, 455, 180, 26)
saveGIF({
  ddf <- NULL
  for (theta in thetas) {
    df <- data.frame(j=0:K, MLE=dbinom(0:K, K, theta), Data=N/n)
    ddf <- rbind(ddf, data.frame(theta_MLE = theta, TV=sum(abs(df$MLE - df$Data))/2, KL=sum(df$Data*(log0(df$Data) - log0(df$MLE)))))
    print(
      grid.arrange(df %>% gather(key=distribution, value=prob, -j) %>% ggplot(aes(j, prob, fill=distribution)) + 
      ylim(0,1) +
      geom_bar(position = "dodge", stat = 'identity') + 
      guides(fill=guide_legend(title=TeX(sprintf('$\\hat{\\theta}_{MLE}=%0.2f$', theta)))) +
      theme_bw(),
      ddf %>% gather(key='type',value='distance',-theta_MLE) %>% ggplot(aes(theta_MLE, distance, color=type)) + geom_line() + 
        xlab(TeX('$\\hat{\\theta}_{MLE}$')) + ggtitle(TeX('$Dist(Data, Binom(K, \\hat{\\theta}_{MLE}))$')),
      nrow=2))
  }
}, interval=0.1)


T_KS <- function(n, M, alpha) {
  quantile(replicate(M, {u <- sort(runif(n)); max(abs((0:(n-1))/n-u), abs((1:n)/n-u))}), 1-alpha)
}
T_KS(10, 1000000, c(0.05, 0.1))

T_KS <- function(ns, M, alpha) {
  df <- NULL
  for (n in ns) {
    df <- rbind(df, quantile(replicate(M, {u <- sort(runif(n)); max(abs((0:(n-1))/n-u), abs((1:n)/n-u))}), 1-alpha))
  }
  df <- as.data.frame(df)
  names(df) <- alpha
  df <- cbind.data.frame(n=ns, df)
  df
}
T_KS(8:10, 10^6, c(0.1, 0.05, 0.02, 0.01))

x = c(0.28,0.2,0.01,0.80,0.1)
u = runif(100000)
qqplot(u, sort(x))
qqline(u)

N <- 10000
a <- 5
b <- 1
prior <- rbeta(N, a, b)
plot(density(prior))
n <- 100
data <- rbinom(n/5, 1, 0.8)
data <- c(data, rbinom(n/5, 1, 0.6))
data <- c(data, rbinom(n/5, 1, 0.4))
data <- c(data, rbinom(n/5, 1, 0.2))
data <- c(data, rbinom(n/5, 1, 0.1))
saveGIF({
  for (i in 1:n) {
    print(i)
    data1 <- data[1:i]
    posterior <- rbeta(N, a+sum(data1), b+i-sum(data1))
    print(ggplot() + geom_density(aes(prior, fill='prior'), alpha=0.3) +
      geom_density(aes(data1, fill='data'), alpha=0.3) +
      geom_density(aes(posterior, fill='posterior'), alpha=0.3) +
      ylim(0,8) +
      xlab('prob') + 
      guides(fill=guide_legend(title='certainty')))
  }
}, interval=0.01)


a <- 2
l <- rexp(1, a)


x = c(-5,0,2,3)
y = c(-10,3,11,14)
b = (mean(x*y)-mean(x)*mean(y)) / (mean(x^2)-mean(x)^2)
a = mean(y) - b*mean(x)
print(c(a,b))
lm(y~x)

104.9/(1000-2)
qt(1-0.001/2, 125-5)
qnorm(1-0.1/2)

0.005/3

# PCA

x1 = c(8,4,7)
x2 = c(2,8,1)
x3 = c(3,1,1)
x4 = c(9,7,4)
X = cbind(x1, x2, x3, x4)
Xbar = rowMeans(X)
cov(X)
Xbar %*% t(Xbar)
X %*% t(X)
XXt = matrix(rep(0,length(Xbar)^2), ncol=length(Xbar))
for (i in 1:ncol(X)) {
  XXt = XXt + X[,i]%*%t(X[,i])
  print(XXt)
  print(X[,i]%*%t(X[,i]))
}
XXt = XXt / ncol(X)
XXt - Xbar %*% t(Xbar)

n <- 3
I_n <- diag(n)
V1_n <- matrix(rep(1,n), ncol=1)
H <- I_n - (V1_n %*% t(V1_n)) / n
x <- c(2, -1, -2)
H %*% x
H %*% H %*% x

u <- c(1/sqrt(5), 2/sqrt(5))
X1 <- c(1,2)
X2 <- c(3,4)
X3 <- c(-1,0)
(u%*%X1)*u
(u%*%X2)*u
(u%*%X3)*u

X <- c(u%*%X1,
       u%*%X2,
       u%*%X3)
var(X)
mean((X-mean(X))^2)
X <- rbind(X1, X2, X3) 
#m <- colMeans(X)
#colMeans((X-m)^2)
S <- (t(X)%*%(I_n-(V1_n %*% t(V1_n)) / n)%*%X)/n
t(u)%*%S%*%u