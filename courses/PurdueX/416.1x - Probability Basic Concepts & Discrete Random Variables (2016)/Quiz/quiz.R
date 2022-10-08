# L1.12 Quiz
dbinom(x = 2, size = 9, prob = 0.5)*0.5*2^10 # choose(9,2)

#dbinom(x = 3, size = 10, prob = 0.5) # choose(10,3)*(1/2)^10
1-sum(dbinom(x = 0:2, size = 10, prob = 0.5))
1-sum(0.5*dbinom(x = 2, size = 2:8, prob = 0.5))
#dbinom(x = 2, size = 9, prob = 0.5)

3*(1/4) - 3*(1/8) + 1/16
1-0.4375

9^5
9*8*7*6*5 #choose(9,5)
6^5
6*5*4*3*2

x <- 0:3
choose(3, x)*choose(6, 5-x) / choose(9, 5)
sum(choose(3, x)*choose(6, 5-x) / choose(9, 5))

# L2.10 Quiz
(1-.13)^5
45 / (45+42)

(5/12)^2*(7/12)
1 - (7/12) - (5/12)*(7/12) # sum((5/12)^(2:1000)*(7/12))

N <- 10000
sum(replicate(N, {
  n <- 0
  while(TRUE) {
    rolls <- sample(1:6, 2, replace=TRUE)
    n <- n + 1
    if (sum(rolls)<=7) break
  }
  n == 3
}))/N

N <- 10000
sum(replicate(N, {
  n <- 0
  while(TRUE) {
    rolls <- sample(1:6, 2, replace=TRUE)
    n <- n + 1
    if (sum(rolls)<=7) break
  }
  n >= 3
}))/N

N <- 10000
sum(replicate(N, {
  n <- 0
  while(TRUE) {
    rolls <- sample(1:6, 2, replace=TRUE)
    n <- n + 1
    if (sum(rolls)<=7) break
  }
  sum(rolls) == 7
}))/N # 2/7

N <- 10000
sum(replicate(N, {
  m <- ''
  while(TRUE) {
    m <- sample(c('C','P','B','R','O'), 1, prob=c(.11,.15,.17,.29, 1-sum(c(.11,.15,.17,.29))))
    if (m != 'O') break
  }
  m == 'R'
}))/N # 29 / (11+15+17+29)

N <- 10000
sum(replicate(N, {
  d <- c()
  while(TRUE) {
    d <- c(sample(1:4, 2, replace=TRUE), sample(1:6,1))
    if (sum(d) == 5) break
  }
  d[1] == d[2]
}))/N # 1/3

N <- 10000
n <- 0
n1 <- 0
for (i in 1:N) {
  d <- sample(1:6, 2, replace=TRUE)
  if (d[1] + d[2] >= 8) {
    n <- n + 1
    if (d[1] == 4 | d[2] == 4) {
      n1 <- n1 + 1
    }
  }
}
n1 / n
# 1/3

.9*.15 / (.9*.15+.18*.21+0*.24+.1*.4)

N <- 10000
n <- 0
n1 <- 0
for (i in 1:N) {
  d1 <- sample(1:4, 1)
  d2 <- sample(1:6, 1)
  if (d1 != 4) {
    n <- n + 1
    if (d1 + d2 >= 5) {
      n1 <- n1 + 1
    }
  }
}
n1 / n
# 2/3

N <- 10000
n <- 0
n1 <- 0
for (i in 1:N) {
  d1 <- sample(1:4, 1)
  d2 <- sample(1:4, 1)
  d3 <- sample(1:6, 1)
  if (d1+d2+d3 == 5) {
    n <- n + 1
    #if (d1 != 2 & d2 != 2) {
    #if ((d1 != 2 & d2 == 2) | (d1 == 2 & d2 != 2)) {
    if (d1 == 2 & d2 == 2) {
      n1 <- n1 + 1
    }
  }
}
n1 / n
# 2/3

N <- 100000
k <- 10 #3 #52 #1
mean(replicate(N, {
  shuffled <- sample(c(rep('Q',4), rep('C', 48)), 52) 
  chosen <- sample(c(rep('Q',4), rep('C', 48)), 52)              
  chosen[k] == 'Q'
})) # 1/13 1/13 1/13

N <- 1000000
n <- 0
n1 <- 0
for (i in 1:N) {
  shuffled <- sample(c(rep('Q',4), rep('C', 48)), 52) 
  chosen <- sample(c(rep('Q',4), rep('C', 48)), 52)  
  #if (chosen[1] == 'Q') {
  if (chosen[1] == 'Q' & chosen[7] == 'Q') {
      n <- n + 1
    if (chosen[19] == 'Q') {
      n1 <- n1 + 1
    }
  }
}
n1 / n # 1/17

# L3.8 Quiz
N <- 10000
mean(replicate(N, {
  d <- sample(c(rep('R',3),rep('G',3),rep('B',3)), 3)
  #sum(d == 'R')
  sum(d == 'R') == 3 #2 #1 #0
})) # 5/21 15/28 3/14 1/84
sum(c(5/21, 15/28, 3/14, 1/84))

N <- 10000
mean(replicate(N, {
  marbels <- c(rep('R',2),rep('G',2),rep('B',2),rep('Y',2))
  n <- 1
  while (TRUE) {
    d <- sample(1:length(marbels), 1)
    if (marbels[d] == 'R') break
    n <- n + 1
    marbels <- marbels[-d]
  }
  n == 7 #6 #5 #4 #3 #2 #1
})) # 1/4, 3/14, 5/28, 1/7, 3/28, 1/14, 1/28
sum(c(1/4, 3/14, 5/28, 1/7, 3/28, 1/14, 1/28))

1 - (8/13)^2

N <- 10000
mean(replicate(N, {
  n <- 1
  while (TRUE) {
    d <- sample(1:6, 1)
    if (d == 5) break
    n <- n + 1
  }
  n %% 2 == 0
})) # 5/11

N <- 10000
mean(replicate(N, {
  n <- 1
  while (TRUE) {
    d <- sample(1:6, 1)
    if (d == 5) break
    n <- n + 1
  }
  n %% 3 == 0
})) # (5/6)^2*(1/6) / (1-(5/6)^3)

sum(dbinom(0:4, size=4, prob=1/2)^2)
(factorial(8) / factorial(4)^2) * (1/2)^8
N <- 10000
mean(replicate(N, {
  a <- sample(0:1, 4, replace=TRUE)
  b <- sample(0:1, 4, replace=TRUE)
  (sum(a) == sum(b))
}))

N <- 10000
mean(replicate(N, {
  a <- sample(1:6, 1)
  b <- sample(1:4, 1)
  (a<b)
})) # 1/4

N <- 10000
mean(replicate(N, {
  d <- sample(c(rep('R',3),'G','B'), 5)
  #all(which(d == 'R') < which(d == 'G')) & all(which(d == 'R') < which(d == 'B'))
  #!all(which(d == 'R') < which(d == 'G')) & all(which(d == 'R') < which(d == 'B'))
  #!all(which(d == 'R') < which(d == 'G')) & !all(which(d == 'R') < which(d == 'B'))
  all(which(d == 'R') < which(d == 'G'))
})) # 2/20 3/20 3/20 12/20 1/4
sum(c(2/20, 3/20, 3/20, 12/20))

# L4.7 Quiz
E <- function(X, p_X) {
  return(sum(X*p_X))  
}

X <- 1:0
p_X <- c(1/4,3/4)
print(E(X,p_X))

N <- 10000
sum(replicate(N, {
  d <- sample(c(rep('R',3),'B','G'), 5)
  all(which(d=='R') < which(d=='G'))
}))/N 

X <- 0:3
p_X <- dbinom(X, size=3, prob=.6)
p_X
E(X, p_X)
3*.6
E(X^2, p_X)
E(X^2, p_X) - E(X, p_X)^2
3*.6*.4


N <- 10000
mean(replicate(N, {
  d <- sample(0:1,3,prob=c(0.4,0.6), replace=TRUE)
  sum(d)
}))


X <- 0:2
p_X <- c(1/3,1/2,1/6)
print(E(X,p_X))
print(E(X^2,p_X))
print(E(X^2,p_X)-E(X,p_X)^2)

X1 <- 0:1
p_X1 <- c(2/3,1/3)
X2 <- 0:1
p_X2 <- c(1/2,1/2)
print(E(X1,p_X1)+E(X2,p_X2))

N <- 10000
sum(replicate(N, {
  red1 <- (sample(c(rep('R',2),rep('G',2),rep('B',2)),1) == 'R') 
  red2 <- (sample(c(rep('R',3),rep('B',3)),1) == 'R')
  red1 + red2
})) / N

Y <- 0:2
p_Y <- c(15/28,3/7,1/28)
print(E(Y,p_Y))
print(E(Y^2,p_Y))
print(E(Y^2,p_Y)-E(Y,p_Y)^2)

Y <- 0:2
p_Y <- c(15/28,3/7,1/28)

X <- 0:3
p_X <- c(6/126, 45/126, 60/126, 15/126)
print(E(X,p_X))
print(E(X^2,p_X))
print(E(X^2,p_X)-E(X,p_X)^2)

N <- 10000
mean(replicate(N, {
  d <- sample(c(rep('R',3),rep('G',3),rep('B',3)), 5)
  sum(d == 'R')
}))

# L5.6
sum(dbinom(0:3,size=3,prob=.9)^2)
(1-sum(dbinom(0:3,size=3,prob=.9)^2))/2

N <- 10000
mean(replicate(N, {
  X <- sum(sample(0:1,3,prob=c(0.1,0.9), replace=TRUE))
  Y <- sum(sample(0:1,3,prob=c(0.1,0.9), replace=TRUE))
  #X==Y
  #X<Y
  X>Y
}))

N <- 10000
mean(replicate(N, {
  X <- sum(sample(c(rep('R',2),rep('G',2),rep('B',2)),5,replace=TRUE)=='R')
  Y <- sum(sample(0:1,5,replace=TRUE))
  (X-Y)^2
})) # -5/6
#3.0371-(-5/6)^2 # 85/36

N <- 10000
mean(replicate(N, {
  X <- 1
  while(sample(1:0, 1, prob=c(1/3,2/3))!=1) {
    X <- X + 1
  }
  #X
  X %% 2 == 0
})) # 2/5

N <- 10000
mean(replicate(N, {
  X <- 1
  while(sample(1:0, 1, prob=c(1/3,2/3))!=1) {
    X <- X + 1
  } 
  X %% 4 == 0
})) # q <- 2/3; q^3 / ((1+q)*(1+q^2))



N <- 10000
mean(replicate(N, {
  X <- 1
  while(sample(1:0, 1, prob=c(1/4,3/4))!=1) {
    X <- X + 1
  } 
  Y <- 1
  while(sample(1:0, 1, prob=c(2/3,1/3))!=1) {
    Y <- Y + 1
  } 
  X == Y
})) # 2/9

N <- 10000
mean(replicate(N, {
  X <- 1
  while(sample(1:0, 1, prob=c(1/4,3/4))!=1) {
    X <- X + 1
  } 
  Y <- 1
  while(sample(1:0, 1, prob=c(2/3,1/3))!=1) {
    Y <- Y + 1
  } 
  X > Y
})) # 2/3


N <- 10000
mean(replicate(N, {
  X <- 1
  while(sample(1:0, 1, prob=c(4/5,1/5))!=1) {
    X <- X + 1
  } 
  Y <- 1
  while(sample(1:0, 1, prob=c(4/5,1/5))!=1) {
    Y <- Y + 1
  } 
  X + Y == 5
})) # 64/5^5

N <- 10000
mean(replicate(N, {
  X <- 1
  while(sample(1:0, 1, prob=c(4/5,1/5))!=1) {
    X <- X + 1
  } 
  Y <- 1
  while(sample(1:0, 1, prob=c(4/5,1/5))!=1) {
    Y <- Y + 1
  } 
  Z = 2*Y-3*X
  (Z + 1.2487)^2
})) # 65/16

N <- 10000
mean(replicate(N, {
  X <- 1
  while(sample(1:0, 1, prob=c(3/5,2/5))!=1) {
    X <- X + 1
  } 
  X > 10
})) # (2/5)^10

N <- 10000
mean(replicate(N, {
  X <- 1
  while(sample(1:0, 1, prob=c(3/5,2/5))!=1) {
    X <- X + 1
  } 
  Y <- 1
  while(sample(1:0, 1, prob=c(3/5,2/5))!=1) {
    Y <- Y + 1
  } 
  X + Y > 10
})) # (32/5)*(2/5)^9

N <- 10000
mean(replicate(N, {
  r <- 5
  s <- 0
  X <- 0
  while(s != r) {
    s <- s + (sample(1:0, 1, prob=c(0.9,0.1)) == 1)
    X <- X + 1
  }
  X <= 8
})) # p <- 0.9; q <- 1 - p; p^5 * (1 + 5*q + 15*q^2 + 35*q^3)

N <- 10000
n6 <- 0
n8 <- 0
for (i in 1:N) {
  r <- 5
  s <- 0
  X <- 0
  while(s != r) {
    s <- s + (sample(1:0, 1, prob=c(0.9,0.1)) == 1)
    X <- X + 1
  }
  if (X <= 8) {
    n8 <- n8 + 1
    if (X <= 6) {
      n6 <- n6 + 1     
    }
  }
} 
n6 / n8 # p <- 0.9; q <- 1 - p; (1 + 5*q) / (1 + 5*q + 15*q^2 + 35*q^3)

N <- 10000
mean(replicate(N, {
  r <- 5
  s <- 0
  X <- 0
  while(s != r) {
    s <- s + (sample(1:0, 1, prob=c(0.9,0.1)) == 1)
    X <- X + 1
  }
  #X
  (X - 50/9)^2
})) # p <- 0.9; q <- 1 - p; 5 / p; 5 * q / p ^2

N <- 10000
mean(replicate(N, {
  X <- sum(sample(0:1, 5, prob = c(0.65, 0.35), replace=TRUE))
  Y <- sum(sample(0:1, 5, prob = c(0.65, 0.35), replace=TRUE))
  #X + Y
  #X + Y == 5
})) # 10 * 0.35
#dbinom(0:10, size=10, prob=0.35)

probs <- c()
for (i in 0:10) {
  N <- 10000
  probs <- c(probs, mean(replicate(N, {
    X <- sum(sample(0:1, 5, prob = c(0.65, 0.35), replace=TRUE))
    Y <- sum(sample(0:1, 5, prob = c(0.65, 0.35), replace=TRUE))
    X+Y==i
  })))
}
sum(probs)
plot(0:10, probs, pch=19)

probs <- c()
for (i in -5:10) {
  N <- 10000
  probs <- c(probs, mean(replicate(N, {
    X <- sum(sample(0:1, 5, prob = c(0.65, 0.35), replace=TRUE))
    Y <- sum(sample(0:1, 5, prob = c(0.65, 0.35), replace=TRUE))
    2*X-Y==i
  })))
}
sum(probs)
plot(probs, pch=19)
points(dbinom(0:15, size=15, prob=0.5), col='red', pch=19)

p <- 0.6
q <- 1-p
x <- 3:6
p1 <- 1 - sum(choose(x-1, 3-1)*p^3*q^(x-3))
p1
N <- 10000
mean(replicate(N, {
  r <- 0
  x <- 0
  while (r < 3) {
    if (sample(1:0, 1, prob = c(p, q)) == 1) {
      r <- r + 1
    }
    x <- x + 1
  }
  x > 6
})) # p1

x <- 3:4
p2 <- 1 - sum(choose(x-1, 3-1)*p^3*q^(x-3))
p1 / p2

N <- 10000
n4 <- 0
n6 <- 0
for (i in 1:N) {
  r <- 0
  x <- 0
  while (r < 3) {
    if (sample(1:0, 1, prob = c(p, q)) == 1) {
      r <- r + 1
    }
    x <- x + 1
  }
  if (x > 4) {
    n4 <- n4 + 1
  }
  if (x > 6) {
    n6 <- n6 + 1
  }
} 
n6 / n4 # p1 / p2

p <- 3/5
q <- 2/5

N <- 10000
mean(replicate(N, {
  X <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X <- X + 1
  }
  #X
  X > 10
})) # 1/p # q^10


N <- 10000
mean(replicate(N, {
  X <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X <- X + 1
  }
  Y <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    Y <- Y + 1
  }
  X + Y > 10
})) 
z <- 2:10
1-sum((z-1)*p^2*q^(z-2))
prob <- 0
for (x in 1:9) {
  for (y in 1:(10-x)) {
    prob <- prob + q^(x-1)*p*q^(y-1)*p
  }
}
1-prob

N <- 10000
mean(replicate(N, {
  X <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X <- X + 1
  }
  Y <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    Y <- Y + 1
  }
  Z <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    Z <- Z + 1
  }
  X + Y + Z > 10
})) 
prob <- 0
for (x in 1:8) {
  for (y in 1:(9-x)) {
    for (z in 1:(10-x-y)) {
      print(paste(x,y,z, x+y+z, x+y+z<=10))
      prob <- prob + q^(x-1)*p*q^(y-1)*p*q^(z-1)*p
    }
  }
}
1-prob

p <- 7/10
q <- 3/10
N <- 100000
res <- replicate(N, {
  X1 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X1 <- X1 + 1
  }
  X2 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X2 <- X2 + 1
  }
  X3 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X3 <- X3 + 1
  }
  r <- 0
  Y <- 0
  while (r != 3) {
    if (sample(1:0, 1, prob=c(p,q)) == 1) {
      r <- r + 1    
    }
    Y <- Y + 1
  }
  Z = 3*X1
  c(X1 + X2 + X3, Y, 3*X1) 
})
hist(res[1,], col=rgb(1,0,0,0.2))
hist(res[2,], col=rgb(0,0,1,0.2),add=TRUE)
hist(res[3,], col=rgb(0,1,0,0.2),add=TRUE)
df <- NULL
df <- rbind(df, data.frame(val=res[1,], type='x'))
df <- rbind(df, data.frame(val=res[2,], type='y'))
df <- rbind(df, data.frame(val=res[3,], type='Z'))
library(ggplot2)
ggplot(df, aes(val, fill=type)) + geom_histogram(position = 'dodge')


p <- 1/6
q <- 1-p
N <- 100000
res <- replicate(N, {
  X1 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X1 <- X1 + 1
  }
  X2 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X2 <- X2 + 1
  }
  X3 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X3 <- X3 + 1
  }
  X4 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X4 <- X4 + 1
  }
  X5 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X5 <- X5 + 1
  }
  X6 <- 1
  while (sample(1:0, 1, prob=c(p,q)) != 1) {
    X6 <- X6 + 1
  }
  seen <- rep(0,6)
  X <- 0
  while (!all(seen==1)) {
    seen[sample(1:6, 1)] <- 1
    X <- X + 1
  }
  c(X1 + X2 + X3 + X4 + X5 + X6, X) 
})
df <- NULL
df <- rbind(df, data.frame(val=res[1,], type='SXi'))
df <- rbind(df, data.frame(val=res[2,], type='Y'))
library(ggplot2)
ggplot(df, aes(val, fill=type)) + geom_histogram(position = 'dodge')
apply(res, 1, mean)
sum(6/(6:1))


N <- 100000
mean(replicate(N, {
  shuffled <- sample(c(rep('R',5),rep('G',5),rep('B',5)),15)
  X <- 0
  for (i in 1:15) {
    if ((shuffled[i] != shuffled[i%%15+1]) && (shuffled[i] != shuffled[ifelse(i==1, 15, i-1)])) {
    #if ((shuffled[i] == shuffled[i%%15+1]) && (shuffled[i] == shuffled[ifelse(i==1, 15, i-1)])) {
    #if (((shuffled[i] == shuffled[i%%15+1]) && (shuffled[i] != shuffled[ifelse(i==1, 15, i-1)])) ||
    #    ((shuffled[i] != shuffled[i%%15+1]) && (shuffled[i] == shuffled[ifelse(i==1, 15, i-1)]))) {
        X <- X + 1
    }
  }
  X
})) 

#library(combinat)
#permn(c(rep('R',5),rep('G',5),rep('B',5)))

# L6.5
N <- 10000
mean(replicate(N, {
  X <- rpois(1, 2)
  Y <- rpois(1, 2)
  #X + Y
  X + Y <= 3
})) # exp(-4)*71/3
x <- seq(0,10,0.01)
plot(x, dpois(x, 5.3), type='l')

N <- 10000
mean(replicate(N, {
  X <- rpois(1, 5)
  X * (X-1) * (X-2)
})) # 5^3

(1 - ppois(4, 2.2)) / (1- ppois(2, 2.2))
sum(exp(-2.2)*2.2^(5:100)/factorial(5:100)) / sum(exp(-2.2)*2.2^(3:100)/factorial(3:100))

ppois(1, 2.2) / ppois(3, 2.2)
sum(exp(-2.2)*2.2^(0:1)/factorial(0:1)) / sum(exp(-2.2)*2.2^(0:3)/factorial(0:3))

dpois(4,5*10^6/(2*10^6))
exp(-2.5)*(2.5)^4/factorial(4)

p_X <- seq(17,1,-1) / seq(20,4,-1)
sum(p_X)
N <- 10000
mean(replicate(N, {
  X <- sample(c(rep('C',3), rep('N',17)), 20)
  #which(X=='C')[1]-1
  (which(X=='C')[1]-1 - 17/4)^2
})) # 17 * (1/4) # 17 * (1/4) + 17*16*(1/10) - (17/4)^2

N <- 10000
mean(replicate(N, {
  X <- sample(c(rep('C',3), rep('R',10), rep('B',2), rep('M',5)), 4)
  #all(sort(X) == c('B', 'C', 'M', 'R'))
  #length(unique(X)) == 1
  #length(unique(X)) == 3
  length(unique(X)) == 2
})) # 20/323 # (choose(10,4) + choose(5,4)) / choose(20,4)
# (45*(3*5+5*2+3*2) + 10*(3*2+10*3+10*2) + 3*(5*2+10*5+10*2) + 1*(5*3+10*5+10*3)) / choose(20,4)
# 1 - 20/323 - (choose(10,4) + choose(5,4)) / choose(20,4) - (45*(3*5+5*2+3*2) + 10*(3*2+10*3+10*2) + 3*(5*2+10*5+10*2) + 1*(5*3+10*5+10*3)) / choose(20,4)

N <- 10000
m <- mean(replicate(N, {
  X <- sample(seq(2,100,2), 1)
  X
}))
E <- function(X, p_X) {
  return(sum(X*p_X))  
}
X <- seq(2,100,2)
p_X <- rep(1/50, 50)
E(X, p_X)
E(X^2, p_X) - E(X, p_X)^2
N <- 10000
mean(replicate(N, {
  X <- sample(seq(2,100,2), 1)
  (X-m)^2
}))

dbinom(4, 10, 15000/50000)

N <- 10000
mean(replicate(N, {
  X <- sum(sample(c(rep(0,3), rep(1,3)), 2))
  Y <- sum(sample(c(rep(0,3), rep(1,3)), 2))
  X == Y
})) # 11/25

n <- 100
sum((3/4)^(1:n)-(1/4)^(1:n))
sum(((3/4)*(1/3))^(0:(n-1)))*(1/4)*(2/3)

N <- 10000
mean(replicate(N, {
  #X <- sample(c(rep('G',7), rep('N',13)), 4) # hypergeometric
  X <- sample(c(rep('G',7), rep('N',13)), 4, replace=TRUE) # binomial
  #sum(X == 'G')
  (sum(X=='G')-7/5)^2
})) # 4*7/20 4*(7/20)*(13/20)*(16/19)
    # 4*7/20 4*(7/20)*(13/20)

E <- function(X, p_X) {
  return(sum(X*p_X))  
}
X <- seq(0,10,2)
#p_X <- c(1/32, 5/32, 10/32, 10/32, 5/32, 1/32)
p_X <- c(
  choose(10,5) / choose(20,10),
  (2*factorial(10)/(factorial(4)*factorial(4)*factorial(2)) + 2*factorial(10)/(factorial(4)*factorial(4))) / choose(20,10),
  (8*factorial(10)/(factorial(3)*factorial(3)*factorial(3)) + 6*factorial(10)/(factorial(3)*factorial(3)*factorial(2)*factorial(2)) + 2*factorial(10)/(factorial(3)*factorial(3)*factorial(4))) / choose(20,10),
  choose(10,6)*2^6*choose(4,2) / choose(20,10),
  choose(10,8)*2^8*choose(2,2) / choose(20,10),
  2^10 / choose(20,10)
)
E(X, p_X)
E(X^2, p_X) - E(X, p_X)^2
N <- 10000
res <- replicate(N, {
  B <- c(rep('G', 10), rep('R',10))
  X <- sample(B, 20)
  Y <- sum(sapply(seq(1,19,2), function(i) X[i]!=X[i+1]))
  Y == 2 #== 10
  #(Y-5)^2
})
hist(res)
mean(res)
# X  Px
# 0 choose(10,5) / choose(20,10)
# 2 choose(10,2)*2^2*choose(8,4) / choose(20,10)
# 4 choose(10,4)*2^4*choose(6,3) / choose(20,10)
# 6 choose(10,6)*2^6*choose(4,2) / choose(20,10)
# 8 choose(10,8)*2^8*choose(2,2) / choose(20,10)
# 10 2^10 / choose(20,10)

#2^10 / choose(20,10) # 2^10 * factorial(10) / factorial(20)
#choose(10,5) / choose(20,10)

N <- 100000
mean(replicate(N, {
  shuffled <- sample(c(rep('R',10),rep('G',10)),20)
  X <- sum(sapply(seq(1,19,2), function(i) shuffled[i] != shuffled[i+1]))
  #X
  (X - 5.26)^2
})) 