# L7.6 Quiz
integrate(function(x)(2/3)*exp(-(2/3)*x),lower = 0.5, upper=2.5)
exp(-1/3)-exp(-5/3)
1 - exp(-1)
integrate(function(x)(2/3)*exp(-(2/3)*x),lower = 0, upper=1.5)
1/12
p <- seq(0,1,length=5)
a <- -(1/5)*log(1-p)
f <- function(x) {
  ifelse((x > 0) & (x < 1), x, ifelse((x > 1) & (x < 2), 2-x, 0))
}
integrate(f, 0, 3/4) # 9/16/2
integrate(f, 0, 5/4)
integrate(f, 0, -0.5) 
integrate(f, 0, 1/2) # 1/8
integrate(f, 0, 1.5)
integrate(f, 0, 2.5)
# montecarlo
x <- runif(100000, 0, 4)
y <- runif(100000, 0, 4)
a <- 6 #2 # 4
sum(x+y<=a) / length(x)
hist(x+y)
w = x + y
sum(w > 2.9 & w < 3.1) / length(x)

exp(-7/10)
integrate(function(x)7*exp(-7*x), 1/10, Inf)
3*exp(-3/3)
7*exp(-7*0.1)

integrate(function(x) x^3/4, 0, 1)
1/16
5*exp(-5*1)
2*(5-2.5)/225 # 1/45

8*exp(-8*0.5)
exp(-8/10)


# L8,.7
10*exp(-1)
7*exp(-0.7)
exp(-1.05) # integrate(function(y) 7*exp(7/10-7*y), 1/4, Inf)

integrate(function(x) x*10*exp(-10*x), 0, Inf)
integrate(function(y) y*(70/3)*(exp(-7*y)-exp(-10*y)), 0, Inf)
integrate(function(x) x^2*10*exp(-10*x), 0, Inf)
0.02 - 0.1^2
integrate(function(x) (x-1/10)^2*10*exp(-10*x), 0, Inf)

integrate(function(y) (70/3)*(exp(-7*y-3/10)-exp(-10*y)), 1/4, Inf)$value / integrate(function(x) 10*exp(-10*x), 1/10, Inf)$value
integrate(function(x) (10)*(exp(-10*x)-exp(-3*x-7/3)), 1/10, Inf)$value / integrate(function(x) 10*exp(-10*x), 1/10, Inf)$value


integrate(function(x) x*(1-x/2), 0, 2)

integrate(function(y) 5*exp(-5*y), 0, Inf)
e_y <- integrate(function(y) y*5*exp(-5*y), 0, Inf)$value
e_y2 <- integrate(function(y) y^2*5*exp(-5*y), 0, Inf)$value
e_y2 - e_y^2
integrate(function(y) (y-e_y)^2*5*exp(-5*y), 0, Inf)

# MCI
N <- 10000
x <- runif(N, 0, 5)
y <- runif(N, 0, 8)
mean(x)
mean(y)
mean(x*y)
mean(x)*mean(y)

# L9.6
N <- 10000
x <- runif(N, 0, 5)
y <- runif(N, 0, 2)
mean(y >= x - 3)
mean(y >= x - 3) * 5 * 2 # 8
mean((x > y) & (y >= x - 3)) / mean(y >= x - 3)  
mean((x + y <= 3) & (y >= x - 3)) / mean(y >= x - 3)  

N <- 10000
#x <- runif(N, 0, 5)
#y <- runif(N, 0, 5)
#mean(max(x, y))
mean(replicate(N, {
  x <- runif(1, 0, 5)
  y <- runif(1, 0, 5)
  max(x,y)
}))

(1/2)*(1-exp(-2))
integrate(function(x) exp(-x)/2, 0, 2) 

exp(-5)
N <- 10000
mean(replicate(N, {
  x <- rexp(1, 2)
  y <- rexp(1, 3)
  min(x,y) > 1
}))

exp(-2)
N <- 100000
res <- t(replicate(N, {
  x <- rexp(1, 2)
  c(x > 4, x > 3)
}))
#head(res)
res1 <- res[res[,2],]
nrow(res1[res1[,1],]) / nrow(res1)
mean(rexp(N, 2) > 1)

N <- 100000
res <- t(replicate(N, {
  x <- runif(1, 0, 10)
  c(x > 4, x > 3)
}))
#head(res)
res1 <- res[res[,2],]
nrow(res1[res1[,1],]) / nrow(res1)
mean(runif(N, 0, 10) > 1)

N <- 10000
mean(replicate(N, {
  x <- rexp(1, 1/5)
  y <- rexp(1, 1/5)
  #x < (1/2)*y
  2*x < y
}))

1/exp(1)
N <- 10000
mean(replicate(N, {
  x <- rexp(1, 1)
  y <- rexp(1, 1)
  abs(x - y) > 1
}))

1-exp(-1/2)
(1-exp(-1/2))^3
exp(-3/2)
3*exp(-1)*(1-exp(-1/2))
3*exp(-1/2)*(1-exp(-1/2))^2
N <- 10000
mean(replicate(N, {
  x <- rexp(1, 1/2)
  y <- rexp(1, 1/2)
  z <- rexp(1, 1/2)
  # x < 1 
  #x < 1 & y < 1 & z < 1
  #x >= 1 & y >= 1 & z >= 1
  #(x < 1 & y >= 1 & z >= 1) | (x >= 1 & y < 1 & z >= 1) | (x >= 1 & y >= 1 & z < 1)
  (x < 1 & y < 1 & z >= 1) | (x >= 1 & y < 1 & z < 1) | (x < 1 & y >= 1 & z < 1)
}))
dbinom(0:3, size=3, 1-exp(-1/2))

3*exp(-3)
9*exp(-3)
integrate(function(x) 9*x*exp(-3*x), 0, 1/2)
#1 - (9/8)*exp(-3/4)
x <- seq(0,1,0.01)
plot(x, 9*x*exp(-3*x))
#integrate(function(x) 9*x*exp(-3*x), 0, Inf)

N <- 10000
mean(rexp(N, 3) > rexp(N, 3))
p <- 1 - exp(-3/10)
mean(replicate(N, {
  u <- rexp(1, 3)
  v <- rexp(1, 3)
  #u > 1/10 & v > 1/10
  u <= 1/10 & v <= 1/10
}))
(1-pexp(1/10, 3))^2
2*pexp(1/10, 3)*(1-pexp(1/10, 3))
pexp(1/10, 3)^2
dbinom(0:2, 2, p)

(1/2)*(1/5)^3*exp(-1/5)
mean(replicate(N, {
  x <- rexp(1, 1/5)
  y <- rexp(1, 1/5)
  z <- rexp(1, 1/5)
  #x+y+z==1 
  #abs(x + y + z - 1) < 0.05
  #x+y+z
  ((x+y+z) - 15)^2
}))
75/3600

mean(rbeta(N, 8, 2))
7.2*(0.9)^7
(0.9)^(8-1)*(0.1)^(2-1) / beta(8,2)

a <- 8
b <- 2
integrate(function(x) x^(a-1)*(1-x)^(b-1) / beta(a,b), 0.9, 1)
1 - pbeta(0.9, a, b)
integrate(function(x) x^(a-1)*(1-x)^(b-1) / beta(a,b), 0.9, 1)$value / integrate(function(x) x^(a-1)*(1-x)^(b-1) / beta(a,b), 0.8, 1)$value
(1 - pbeta(0.9, a, b)) / (1 - pbeta(0.8, a, b))

pbeta(0.15, 2, 20)
x <- seq(0,1,0.01)
plot(x, dbeta(x, 2, 20))

# L10.5
pnorm(2,1.2,0.5)-pnorm(1,1.2,0.5)
pnorm(1.6)-pnorm(-0.4)
integrate(function(x) exp(-((x-1.2)/0.5)^2/2)/sqrt(2*pi*0.25), 1, 2)
pnorm(1,1.2,0.5)+pnorm(1.4,1.2,0.5, lower.tail = FALSE)
1 - (pnorm(1.4,1.2,0.5)-pnorm(1,1.2,0.5))
1 - integrate(function(x) exp(-((x-1.2)/0.5)^2/2)/sqrt(2*pi*0.25), 1, 1.4)$value
pnorm(0,1.2,0.5, lower.tail = FALSE)
integrate(function(x) exp(-((x-1.2)/0.5)^2/2)/sqrt(2*pi*0.25), 0, Inf)

qnorm(0.9)
qnorm(0.95)
qnorm(0.975)

(a = -0.5*qnorm(.9) + 1.2)
(b = 0.5*qnorm(.9) + 1.2)
(c=qnorm(0.65)/2)
pnorm(0.1926602+1.2, 1.2, 0.5) - pnorm(-0.1926602+1.2, 1.2, 0.5)
qnorm(0.10, 1.2, 0.5)
qnorm(0.10, 1.2, 0.5, lower.tail = FALSE)

pnorm(27.5/6.9) - pnorm(17.5/6.9)
pnorm(100, 72.5, 6.9) - pnorm(90, 72.5, 6.9)
pnorm(17.5/6.9) - pnorm(7.5/6.9)
pnorm(90, 72.5, 6.9) - pnorm(80, 72.5, 6.9)
pnorm(7.5/6.9) - pnorm(-2.5/6.9)
pnorm(80, 72.5, 6.9) - pnorm(70, 72.5, 6.9)
pnorm(-2.5/6.9) - pnorm(-12.5/6.9)
pnorm(70, 72.5, 6.9) - pnorm(60, 72.5, 6.9)

pnorm((9/2.54-4)/0.75)
pnorm(9/2.54, 4, 0.75)
0.75*qnorm(1.9/2)
pnorm(4+1.23364,4,0.75)-pnorm(4-1.23364,4,0.75)

2*pnorm(sqrt(0.1))-1
N <- 10000
mean(replicate(N, {
  X <- sum(rnorm(40, 0.20, 0.05)) 
  #X
  #(X - 8)^2
  7.9 < X & X < 8.1
}))
(b = sqrt(0.1)*qnorm(1.95/2))
pnorm(8 + b, 8, sqrt(0.1)) - pnorm(8 - b, 8, sqrt(0.1))

pnorm(349000, 5000*70, sqrt(5000*8^2), lower.tail = FALSE)
pnorm(5000*70+500, 5000*70, sqrt(5000*8^2)) - pnorm(5000*70-500, 5000*70, sqrt(5000*8^2))

N <- 10000
mean(replicate(N, {
  X <- sum(rnorm(10, 4, 0.75)) / 10
  #X
  (X - 4)^2 # (0.75/sqrt(10))^2
}))
pnorm(4.5, 4, 0.75/sqrt(10)) - pnorm(3.5, 4, 0.75/sqrt(10))
(a = 0.75*qnorm(1.9/2)/sqrt(10))
pnorm(4 + a, 4, 0.75/sqrt(10)) - pnorm(4 - a, 4, 0.75/sqrt(10))

N <- 10000
mean(replicate(N, {
  X <- sum(rnorm(5, 6, 0.8))
  Y <- sum(rnorm(20, 1.4, 0.3))
  #X + Y
  (X + Y - 58)^2 # 5*0.8^2+20*0.3^2
}))
pnorm(60, 30 + 28, sqrt(5*0.8^2+20*0.3^2))
pnorm(62, 30 + 28, sqrt(5*0.8^2+20*0.3^2)) - pnorm(58, 30 + 28, sqrt(5*0.8^2+20*0.3^2))

pgamma(1200, 500, 2/5)
#integrate(function(x) (1/2.5)^500*x^499*exp(-x/2.5) / factorial(499), 0, 1200)
N <- 10000
mean(replicate(N, {
  X <- sum(rexp(500, 2/5))
  X <= 1200
}))

1 - pnorm(10/8)
pnorm(80, 70, 8, lower.tail = FALSE)
sum(dbinom(0:500, 5000, 0.1056))
#sum(dbinom(0:5000, 5000, 0.1056))

N <- 1000000
mean(rpois(N, 5000) < rpois(N, 4900))

pnorm(2, lower.tail = FALSE)
N <- 10000
mean(replicate(N, {
  sum(runif(300, 0, 10)) > 1600
}))


# L11.6

7 - (5/2)*exp(1)
integrate(function(x) (1/2)*x*(1-x^2)*exp(1-x), 0, 1)$value
#integrate(function(x) x*exp(-x), 0, 1)$value == 1 - 2*exp(-1)
all.equal.numeric(integrate(function(x) x*exp(-x), 0, 1)$value, 1 - 2*exp(-1))
all.equal.numeric(integrate(function(x) x^3*exp(-x), 0, 1)$value, 6 - 16*exp(-1))

E <- function(X, p_X) {
  return(sum(X*p_X))  
}
X <- 0:3
p_X <- choose(3,X)*choose(6,5-X)/choose(9,5) 
E(X, p_X)
E(X^2, p_X) # 5*3/9
E(X^2, p_X) - E(X, p_X)^2 # 5*(3/9)*(6/9)*(4/8)

X <- 3:4
p_X_Y_3 <- c(1/3,2/3)
E(X, p_X_Y_3)
Y <- 1:3
p_Y_X_3 <- c(2/5,2/5,1/5)
E(Y, p_Y_X_3)
N <- 10000
mean(replicate(N, {
  d1 <- sample(1:4, 1)
  d2 <- sample(1:4, 1)
  X <- max(d1, d2)
  Y <- min(d1, d2)
  #if (Y==3) {
  #  X
  #} 
  if (X==3) {
    Y
  } else {
    NA
  }  
}), na.rm=TRUE)

N <- 100000
X <- runif(N,0,2)
Y = 4
mean(X[Y + 4*X <= 8]) 
Y <- runif(N,0,8)
X = 1
mean(Y[Y + 4*X <= 8]) 

X <- 0:2
p_X_Y <- c(6/15,8/15,1/15)
E(X, p_X_Y)
X <- 0:1
p_X_Y <- c(10/15,5/15)
E(X, p_X_Y)
X <- 0
p_X_Y <- 1
E(X, p_X_Y)

N <- 10000
mean(replicate(N, {
  sum(sample(c(rep('R',2), rep('N',4)), 2) == 'R')
}))
mean(replicate(N, {
  sum(sample(c('R', rep('N',5)), 2) == 'R')
}))
mean(replicate(N, {
  sum(sample(rep('N',6),2) == 'R')
}))

10*exp(-10*0.1)
7*exp(7*0.2-7*0.1)
7*exp(7*0.1-7*0.2)
integrate(function(x) (x+1/7)*10*exp(-10*x), 0, Inf) # 17/70

0.8/0.95
1-(5/7)^2

N <- 100000
mean(replicate(N, {
  A <- sample(c(rep('G',10), rep('R',10)))
  i <- seq(1,19,2)
  X <- sum(A[i]!=A[i+1])
  (X - 5.26526)^2
}))

100/19 + 90*10*9/(19*17) - (100/19)^2

Y <- 0:2
p_Y <- c(15/28,12/28,1/28)
E(Y, p_Y)

X <- 0:2
p_X <- c(15/28,12/28,1/28)
E(X, p_X)
E(X^2, p_X) - E(X, p_X)^2
(-3/28) / 0.3214286

N <- 100000
mean(replicate(N, {
  C <- sample(c(rep('R',2), rep('N',6)),4)
  Y <- sum(C[1:2] == 'R')
  X <- sum(C[3:4] == 'R')
  #Y
  #X
  #(Y-0.5)^2
  (X-0.5)^2
  #X*Y
  #(X-0.5)*(Y-0.5) 
  #(X-0.5)*(Y-0.5) / (X-0.5)^2
})) # 3/14 #0.14004 - 0.25 # -3/28
-3/28 / 0.32066


# L12.5
order.stat.density <- function(j, n, f, F) {
  function(x) (factorial(n)/(factorial(j-1)*factorial(n-j)))*f(x)*(F(x))^(j-1)*(1-F(x))^(n-j)
}

order.stat.density(1, 3, function(x) 1/10, function(x) x/10)(5) # 3/40
order.stat.density(2, 3, function(x) 1/10, function(x) x/10)(5) # 3/20
order.stat.density(3, 3, function(x) 1/10, function(x) x/10)(5) # 3/40

#integrate(function(y) order.stat.density(1, 3, function(x) 1/10, function(x) x/10)(y), 0, 10) #pdf
integrate(function(y) y*order.stat.density(1, 3, function(x) 1/10, function(x) x/10)(y), 0, 10)
integrate(function(y) y*order.stat.density(2, 3, function(x) 1/10, function(x) x/10)(y), 0, 10)
integrate(function(y) y*order.stat.density(3, 3, function(x) 1/10, function(x) x/10)(y), 0, 10)

order.stat.density(1, 2, function(x) (4-x)/8, function(x) (8*x-x^2)/16)(2)
order.stat.density(2, 2, function(x) (4-x)/8, function(x) (8*x-x^2)/16)(2)

integrate(function(y) y*order.stat.density(1, 2, function(x) (4-x)/8, function(x) (8*x-x^2)/16)(y), 0, 4)
integrate(function(y) y*order.stat.density(2, 2, function(x) (4-x)/8, function(x) (8*x-x^2)/16)(y), 0, 4)

2*15^2
450 - 15^2

sum(sapply(0:3, function(x) (27/40)*(1/3)^x))
sum(sapply(0:3, function(x) x*(27/40)*(1/3)^x))

9 / 20

N <- 10000
mean(replicate(N, {
  X <- runif(1, 0.5, 2.2)
  Y <- (2/5)*X + 0.1
  #Y
  (Y - 0.64)^2
})) # sqrt(0.0388664) # 0.68 / sqrt(12) # 1.7 / sqrt(75)

N <- 10000
mean(replicate(N, {
  X <- runif(100, 0.5, 2.2)
  Y <- sum((2/5)*X + 0.1)
  Y
  (Y - 64)^2
})) # sqrt(3.861482) # 100*0.1962991^2

N <- 10000
res <- replicate(N, {
  X <- runif(1, 0, 3)
  Y <- (X+3)*(X-3)
  Y
  #(Y - 0.64)^2
}) 
min(res)
max(res)
mean(res)

integrate(function(y)y/(6*sqrt(y+9)), -9, 0)