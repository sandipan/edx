Newton <- function(x0, F, JF, niter=n) {
  xs <- data.frame(p=x0[1], q=x0[2])
  x <- x0  # Set Newton initial solution to u0
  for (k in 1:niter) {
    x <- x - solve(JF(x), F(x))
    xs <- rbind(xs, data.frame(p=x[1], q=x[2]))
  }
  return (xs)
}

f <- function(u) {
  x <- u[1]
  y <- u[2]
  return (c((x+3)^2 + (y-50)^2 - 1681, (x-11)^2 + (y+2)^2 - 169)) #, (x-13)^2 + (y-34)^2 - 625))
}

jacobian_f <- function(u) {
  x <- u[1]
  y <- u[2]
  return (matrix(c(2*(x+3), 2*(y-50), 2*(x-11), 2*(y+2)), nrow=2, byrow=T)) #, 2*(x-13), 2*(y-34)), nrow=3, byrow=T))
}


f <- function(x) {
  p <- x[1]
  q <- x[2]
  return (c(p + p*exp(lambda*(1-2*q))-1, q + q*exp(lambda*(10*p-1))-1)) #??
}

jacobian_f <- function(x) {
  p <- x[1]
  q <- x[2]
  return (matrix(c(1+exp(lambda*(1-2*q)), -2*p*lambda*exp(lambda*(1-2*q)), 10*q*lambda*exp(lambda*(10*p-1)), 1+exp(lambda*(10*p-1))), nrow=2, byrow=T))
}

library(tidyverse)
library(ggquiver)
n <- 5
lambda <- 1
sdf <- Newton(c(0.1,0.3), f, jacobian_f)
sdf$iter <- 0:n
sdf <- sdf[c('iter', 'p', 'q')]
sdf$p1 <- c(sdf$p[2:(n+1)], sdf$p[n+1])
sdf$q1 <- c(sdf$q[2:(n+1)], sdf$q[n+1])
library(animation)
saveGIF({
  for (i in 1:(n+1)) {
    #if (i == 1) {
    #  print(sdf[1:i,] %>% ggplot(aes(p, q)) + geom_point(col='red') + xlim(0.050,0.35) + ylim(0.05, 0.35) + ggtitle(paste('Newton\'s method iteration ', (i-1))))
    #} else {
      #print(sdf[1:i,] %>% ggplot(aes(p, q)) + geom_point(col='red') + geom_quiver(aes(u=p1,v=q1)) + xlim(0.050,0.35) + ylim(0.05, 0.35) + ggtitle(paste('Newton\'s method iteration ', (i-1))))
    print(sdf[1:i,] %>% ggplot(aes(p, q)) + geom_point(col='red') + geom_line(lty=2) + xlim(0.050,0.35) + ylim(0.05, 0.35) + ggtitle(paste('Newton\'s method iteration ', (i-1))))
    #}
  }
}, interval=1)