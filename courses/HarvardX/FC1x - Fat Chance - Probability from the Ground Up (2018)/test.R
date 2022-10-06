# Birthday
n=1:50
p = rep(0,50)
for (i in 1:50) { p[i] = 1-prod(1-((1:i)-1)/365)}
plot(n,p,pch=19)
lines(n,p) 

2*1/36 + 3*2/36 + 4*3/36 + 5*4/36 + 6*5/36 + 7*6/36 + 8*5/36 + 9*4/36 + 10*3/36 + 11*2/36 + 12*1/36

50*1/7^3 + 10*6/7^3 + 2*3*6/7^3

max(10*12/52+sum(2*(1:10)*4/52), 20*12/52+5*5*4/52+10*5*4/52)

n <- 0:10
p <- (5^n - 3^n)/6^n #2*(2/3)^n - (1/2)^n
E <- 10000*p - 0*(1-p)
plot(n,E-3000,pch=19)
lines(n,E-3000)
grid()
n <- 0:10
p <- (4^n - 3^n)/6^n #2*(2/3)^n - (1/2)^n
plot(n,p,pch=19)
lines(n,p)
grid()


EV <- function(x, p) {
  e <- sum(p*x)
  v <- sum(p*x^2) - sum(p*x)^2
  return(list(e,v))
}

EV(c(10,-1),c(1/13,12/13))
EV(1:6,rep(1/6,6))
lapply(EV(0:1,c(5/6,1/6)), function(x) 100*x)
lapply(EV(0:1,c(.4,.6)), function(x) 100*x)
pbinom(50, 100, .4, lower.tail = FALSE)
pnorm((50-40)/sqrt(24), lower.tail = FALSE)
#sum(dbinom(25:100, 100, 1/6))
pbinom(25, 100, 1/6, lower.tail = FALSE)
pnorm((25-100/6)/sqrt(100*5/36), lower.tail = FALSE)