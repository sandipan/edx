# 1

n <- 10000
mean(replicate(10000, rnorm(1)^2))
var(replicate(10000, rnorm(1)^2))

n <- 100
mean(replicate(1000, sum(rnorm(n)^2)))
var(replicate(1000, sum(rnorm(n)^2)))
mean(rchisq(1000, df=n))
var(rchisq(1000, df=n))
hist(replicate(1000, sum(rnorm(n)^2)), col='red')
hist(rchisq(1000, df=n), col='green', add=TRUE)

n <- 10000
mean(replicate(1000, mean(rnorm(n)^2)))
var(replicate(1000, mean(rnorm(n)^2)))

n <- 10000
mean(replicate(1000, sqrt(n)*(mean(rnorm(n)^2)-1)))
var(replicate(1000, sqrt(n)*(mean(rnorm(n)^2)-1)))
hist(replicate(1000, sqrt(n)*(mean(rnorm(n)^2)-1)), col='red')
hist(rnorm(1000, 0, sqrt(2)), col='green', add=TRUE)


qchisq(0.95, 1)
qchisq(0.95, 100)/100
qchisq(0.95, 10^6)/10^6

n <- 100
1 + sqrt(2/n)*qnorm(0.95)

n <- 10^6
1 + sqrt(2/n)*qnorm(0.95)

ntrial <- 1000#00
n <- 10^6 #100 #1
quantile(replicate(ntrial, {mean(rnorm(n)^2)}), probs=c(0.95))

n <- 10000
mean(replicate(1000, exp(mean(rnorm(n)^2))))
exp(1)

n <- 10000
mean(replicate(10000, sqrt(n)*(exp(mean(rnorm(n)^2))-exp(1))))
var(replicate(10000, sqrt(n)*(exp(mean(rnorm(n)^2))-exp(1))))
exp(1)^2*var(replicate(10000, rnorm(1)^2))
hist(replicate(10000, sqrt(n)*(exp(mean(rnorm(n)^2))-exp(1))), col='red')
hist(rnorm(10000, 0, sqrt(exp(1)^2*var(replicate(10000, rnorm(1)^2)))), col='green', add=TRUE)


0.63*0.15

# 2

mu <- 3 #2
fun1 <- function(x) x*exp(-(x-mu)^2/(2*mu^2*x))/sqrt(2*pi*x^3)
integrate(fun1, 0, Inf)
fun2 <- function(x) x^2*exp(-(x-mu)^2/(2*mu^2*x))/sqrt(2*pi*x^3)
integrate(fun2, 0, Inf)$value - integrate(fun1, 0, Inf)$value^2


nsamples <- 1000
x <- runif(nsamples)
f <- function(x, lambda) { 
  return(1-exp(-lambda*x))
}
my.uniroot <- function(x) uniroot(f, c(0, 10), tol = 0.0001, lambda = x)$root
# find the root within (0,1) 
z <- vapply(x, my.uniroot, numeric(1))
hist(z)

# 3
setwd('C:/Courses/Edx/Current/MITx 18.6501x Fundamentals of Statistics/Final')
df <- read.csv('data_gerber_trunc.csv')
m <- lm(voting ~ civicduty + hawthorne + self + neighbors, data=df)
summary(m)
c(0,0,0,-1,1) %*% vcov(m) %*% c(0,0,0,-1,1)

#4
library(rSymPy)
p <- Var("p")
q <- Var("q")
r <- Var("r")
sympy("Matrix([[-q,-p,1]])*Matrix([[p*(1-p),r-p*q,r-p*r], [r-p*q,q*(1-q),r-q*r], [r-p*r,r-q*r,r*(1-r)]])*Matrix([[-q],[-p],[1]])")
sympy("Matrix([[-q,-p,1]])*Matrix([[p*(1-p),0,p*q-p*p*q], [0,q*(1-q),p*q-q*p*q], [p*q-p*p*q,p*q-q*p*q,p*q*(1-p*q)]])*Matrix([[-q],[-p],[1]])")

205 + 179
205 + 301

T = (205-506*384/1000)^2/(506*384/1000) + (301-506*616/1000)^2/(506*616/1000) + (179-494*384/1000)^2/(494*384/1000) + (315-494*616/1000)^2/(494*616/1000)
T
1-pchisq(T, df=(2-1)*(2-1))

tbl = matrix(c(205,301,179,315), ncol=2, byrow=TRUE)
r <- chisq.test(tbl, correct = FALSE)
r$observed
r$expected
r$statistic
r

library(rmutil)

y = rexp(1000, 1)
qqnorm(y)
qqline(y)

qt(1-0.025, 5-1)

x = rlaplace(1000)
y = rep(0, length(x))
for (i in 1:length(x)) {
  y[i] = mean(abs(x-x[i]))
}
plot(x,y)
abline(v=median(x))
abline(v=mean(x), col='red')
print(mean(abs(x-mean(x))))
print(mean(abs(x-median(x))))


t.test2 <- function(m1,m2,s1,s2,n1,n2,m0=0,equal.variance=FALSE)
{
  if( equal.variance==FALSE ) 
  {
    se <- sqrt( (s1^2/n1) + (s2^2/n2) )
    # welch-satterthwaite df
    df <- ( (s1^2/n1 + s2^2/n2)^2 )/( (s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1) )
    print(df)
  } else
  {
    # pooled standard deviation, scaled by the sample sizes
    se <- sqrt( (1/n1 + 1/n2) * ((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2) ) 
    df <- n1+n2-2
  }      
  t <- (m1-m2-m0)/se 
  dat <- c(m1-m2, se, t, 2*pt(-abs(t),df))    
  names(dat) <- c("Difference of means", "Std Error", "t", "p-value")
  return(dat) 
}
# you'll find this output agrees with that of t.test when you input x1,x2
t.test2(1.2, 1.0, sqrt(0.5), sqrt(0.5), 5, 5)


W = 5*(0.90 - 0)^2 / (1.31-0.90^2)
print(W)
print(1-pchisq(W, df=1))
T = sqrt(5)*(0.90-0) / sqrt(5*(1.31-0.90^2)/4)
print(T^2)
print(1-pt(T, df=4))

S = 0.625
T = 0.9 / sqrt(0.625)
2*(1-pt(T, df=4))
print(0.9-qt(0.025, df=4)*sqrt(5*(1.31-0.90^2)/4)/sqrt(5))
print(0.9+qt(0.025, df=4)*sqrt(5*(1.31-0.90^2)/4)/sqrt(5))
print(0.90-2.776445*sqrt(S)/sqrt(5))
print(0.90+2.776445*sqrt(S)/sqrt(5))

theta=3
integrate(function(x)(x^3/theta)*exp(-x^2/(2*theta)), 0, Inf)
qchisq(1-0.07, df=1)

th = (1.09+0.86^2)/2
1-pchisq(500*(th-1)^2/th^2, df=1) 
1-pchisq(2*500*(th-1-log(th)), df=1) 

x <- matrix(c(0,1,0,1,0,0,3,0), ncol=2, byrow=T)
y <- c(10,9,7,-1)
print(solve(t(x)%*%x)%*%(t(x)%*%y))
plot(x[,1],x[,2], col=y-min(y), pch=19)