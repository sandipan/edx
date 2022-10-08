library(Rglpk)
library(pracma)

# Week 1

setwd('C:\\courses\\Edx\\Current\\MITx 15.053x Optimization Methods in Business Analytics\\Week1')

obj <- c(1,2,4,8,16,32)
n <- length(obj)
obj <- c(obj, -obj)
#mat <- matrix(c(rep(c(1,rep(0,5)),2),
#                rep(c(0,1,rep(0,4)),2),  
#                rep(c(rep(0,2),1,rep(0,3)),2),  
#                rep(c(rep(0,3),1,rep(0,2)),2),  
#                rep(c(rep(0,4),1,0),2),  
#                rep(c(rep(0,5),1),2), 
#                c(1,2,4,8,16,32,-1,-2,-4,-8,-16,-32)),
#              nrow=7, byrow=T)  
constraints <- c()
for (i in 1:n) {
  constraints <- c(constraints, rep(c(rep(0,i-1), 1, rep(0, n-i)),2))
}
constraints <- c(constraints, obj)
mat <- matrix(constraints, nrow=n+1, byrow=T)
dir <- c(rep("==", n), ">=")
rhs <- c(rep(1, n), 0)
types <- rep("B", n*2)
max <- FALSE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max, types=types)

csvfile <- 'test25.csv'
df <- read.csv(csvfile)
obj <- df[,1]
n <- length(obj)
obj <- c(obj, -obj)
constraints <- c()
for (i in 1:n) {
  constraints <- c(constraints, rep(c(rep(0,i-1), 1, rep(0, n-i)),2))
}
constraints <- c(constraints, obj)
mat <- matrix(constraints, nrow=n+1, byrow=T)
dir <- c(rep("==", n), ">=")
rhs <- c(rep(1, n), 0)
types <- rep("B", n*2)
max <- FALSE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max, types=types)

fun <- function(x) sqrt(x^2+16) + sqrt((x-8)^2+16)/0.8
x0 = 2
res <- lsqnonlin(fun, x0)
res$x

y <- c(5, 6, 7, 9, 11, 16, 20, 22, 23, 24, 99)
fun <- function(x) sum(abs(y-x))
x0 = 20
res <- lsqnonlin(fun, x0)
res$x
median(y)

y <- c(5, 6, 7, 9, 11, 16, 20, 22, 23, 24, 99)
fun <- function(x) sum((y-x)^2)
x0 = 20
res <- lsqnonlin(fun, x0)
res$x
mean(y)

obj <- c(4,6,10)
mat <- matrix(c(c(1/7000,1/5000,1/3000),
              c(0.040,0.055,0.210),  
              c(1,0,0),  
              c(1,0,0),  
              c(0,0,1),  
              c(0,1,0),  
              c(0,0,1)),  
              nrow=7, byrow=T)  
dir <- c("<=", "<=", ">=", "<=", ">=", "<=", "<=")
rhs <- c(5, 6000, 5000, 6000, 6000, 15000, 8000)
types <- rep("I", 3)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max, types=types)

obj <- c(7000*4/8-3000*10/8,5000*6/8-3000*10/8,3000*10/8)
mat <- matrix(c(c(1,0,0),
                c(0,1,0),  
                c(35-78.75,34.375-78.75,78.75),  
                c(875,0,0),  
                c(-375,-375,375),  
                c(875,0,0),  
                c(0,625,0),
                c(-375,-375,375)),  
              nrow=8, byrow=T)  
dir <- c("<=", "<=", "<=", ">=", ">=", "<=", "<=", "<=")
rhs <- c(40, 40, 6000, 5000, 6000, 6000, 15000, 8000)
#types <- rep("I", 3)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)#, types=types)

obj <- c(7.9-0.6,6.9-0.6,5.0-0.6,7.9-0.52,6.9-0.52,5.0-0.52)
mat <- matrix(c(c(1,1,1,0,0,0),
                c(0,0,0,1,1,1),  
                c(-0.15,0,0,0.85,0,0),  
                c(0,-0.6,0,0,0.4,0)),  
              nrow=4, byrow=TRUE)  
dir <- c("<=", "<=", "<=", "<=")
rhs <- c(4000, 5000, 0, 0)
max <- TRUE
res <- Rglpk_solve_LP(obj, mat, dir, rhs, max = max)
sum(obj*res$solution)
res


# Week 2

setwd('C:\\courses\\Edx\\Current\\MITx 15.053x Optimization Methods in Business Analytics\\Week2')

#q = (1 - p/p1) / (1 - p2/p1)
(1-2/0.5) / (1-3/0.5) #x
(1-1.1/2) / (1-0.5/2) #y
(1-0.6)*c(0.5,2) + 0.6*c(3,0.5)

palette(heat.colors(100))
x <- seq(0,1, 0.01)
plot(x, x, type='l')
for (a in seq(0.1,2,0.2)) {
  lines(x, x^a, col=as.integer(10*a))
}

plot(c(-1, 1), c(-1, 1), type='n')
plot(c(-5, 5), c(-5, 5), type='n')
points(0,0, pch=19)

conditions <- function(x,y) {
  c1 <- (y < 1 + x)
  c2 <- (y > -x)
  c3 <- (0 <    x)
  c4 <- (y >    0)
  return(c1 & c2 & c3 & c4)
}

x <- seq(-1.2,1.2,length=100)
y <- seq(-1.2,1.2,length=100)
z <- expand.grid(x=x,y=y)
z <- z[conditions(z$x,z$y),]
points(z, col="yellow")

abline(h=0)
abline(v=0)
abline(1,1)
abline(0,-1)
#abline(1,2, col='red')
#abline(1,-1, col='red')
#abline(1,2/3, col='red') #1/10
x1 <- seq(-1, 1, length=100)
C <- 15
lines(x1, 5 + sqrt(C-x1^2), col='red')
lines(x1, 5 - sqrt(C-x1^2), col='red')

library(ggplot2)
ggplot(z, aes(x,y))+geom_point(col="yellow", alpha=.5)+
  geom_hline(yintercept = 0)+
  geom_vline(xintercept = 0)+
  geom_abline(intercept=1,   slope=1)+
  geom_abline(intercept=0,   slope=-1)+
  geom_abline(intercept=1,   slope=2, col='red')+
  xlim(-1.2,1.2)+ylim(-1.2,1.2)


plot(c(0, 12), c(0, 12), type='n')
point(0,0, pch=19)

conditions <- function(x,y) {
  c1 <- (y < 4 + x)
  c2 <- (y < 8 - x)
  c3 <- (x <    5)
  c4 <- (y <    6)
  c5 <- (x >    0)
  c6 <- (y >    0)
  return(c1 & c2 & c3 & c4 & c5 & c6)
}

x <- seq(0,12,length=120)
y <- seq(0,12,length=120)
z <- expand.grid(x=x,y=y)
z <- z[conditions(z$x,z$y),]
points(z, col="yellow")

abline(h=0)
abline(v=0)
abline(h=6)
abline(v=5)
abline(4,1)
abline(8,-1)
alpha <- 18 #12 #0 # 1.5 #0 #-1
abline(alpha/2, -3/2, col='green')
abline(7,-1/2, col='red')

obj <- c(1,2)
mat <- matrix(c(1,-1,
                1, 1,
                1, 0,
                0, 1),
              nrow=4, byrow=T)  
dir <- c('>=', rep('<=',3))
rhs <- c(-4,8,5,6)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)


obj <- c(1, 2, 1.2, 3, 2, 3)
mat <- matrix(c(1,0,1,0,1,0,
                0,1,0,1,0,1,
                1,2,0,0,0,0,
                0,0,1.2,3,0,0,
                0,0,0,0,2,3),
              nrow=5, byrow=T)  
dir <- c(rep('<=',5))
rhs <- c(24,24,15,24,18)
max <- TRUE
res <- Rglpk_solve_LP(obj, mat, dir, rhs, max = max)
sum(res$solution*obj)
res

obj <- c(1, rep(0, 6))
mat <- matrix(c(-1,1,0,1,0,1,0,
                -1,0,1,0,1,0,1,
                0,1,2,0,0,0,0,
                0,0,0,1.2,3,0,0,
                0,0,0,0,0,2,3),
              nrow=5, byrow=T)  
dir <- c(rep('<=',2),rep('==',3))
rhs <- c(0,0,15,24,18)
max <- FALSE
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max)
sum(res$solution*obj)
res

obj <- c(2,3)
mat <- matrix(c(4,6,
                6,2,
                1,2),
              nrow=3, byrow=T)  
dir <- rep('>=',3)
rhs <- c(30, 20, 12)
max <- FALSE
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max)
sum(res$solution*obj)
res

df <- read.csv('fooddata.csv', check.names = FALSE, stringsAsFactors = FALSE)
df
obj <- as.integer(df[2:nrow(df),2])
mat <- t(sapply(df[2:nrow(df),3:ncol(df)], as.integer))
dir <- c('>=',"<=", ">=", ">=")
rhs <- c(50, 20, 300, 60)
max <- FALSE
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max)
sum(res$solution*obj)
res

# Week 3
setwd('C:\\courses\\Edx\\Current\\MITx 15.053x Optimization Methods in Business Analytics\\Week3')

obj <- c(1,3,5,4,2,2,1,5,3)
mat <- matrix(c(1,1,1,0,0,0,0,0,0,
                0,0,0,1,1,1,0,0,0,
                0,0,0,0,0,0,1,1,1,
                1,0,0,1,0,0,1,0,0,
                0,1,0,0,1,0,0,1,0,
                0,0,1,0,0,1,0,0,1),
              nrow=6, byrow=T)  
dir <- rep('==',6)
rhs <- rep(1,6)
max <- TRUE
types <- rep("B", 9)
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max) # LP
sum(res$solution*obj)
res

obj <- c(1,3,5,4,2,2,1,5,3)
mat <- matrix(c(1,1,1,0,0,0,0,0,0,
                0,0,0,1,1,1,0,0,0,
                0,0,0,0,0,0,1,1,1,
                1,0,0,1,0,0,1,0,0,
                0,1,0,0,1,0,0,1,0,
                0,0,1,0,0,1,0,0,1,
                0,0,1,0,-1,0,0,0,0,
                0,0,0,0,-1,0,0,0,1),
              nrow=8, byrow=T)  
dir <- c(rep('==',6), rep('<=',2))
rhs <- c(rep(1,6), rep(0,2))
max <- TRUE
types <- rep("B", 9)
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max) # LP
sum(res$solution*obj)
res

df <- read.csv('compatibility_score_debug_integers.csv', header=FALSE)
df <- read.csv('compatibility_score_integers.csv', header=FALSE)
m <- nrow(df)
n <- ncol(df)
obj <- as.vector(as.matrix(t(df))) #rep(1, m*n)
#mat <- NULL
mat <- matrix(rep(0, (m+n)*m*n), nrow=m+n)
for (i in 1:m) {
  mat[i, (i-1)*n+(1:n)] <- 1
  #row <- rep(0, m*n)
  #row[(i-1)*n+(1:n)] <- 1
  #mat <- rbind(mat, row)
}
for (j in 1:n) {
  mat[m+j, seq(j,j+(m-1)*n,m)] <- 1
  #row <- rep(0, m*n)
  #row[seq(j,j+(m-1)*n,m)] <- 1
  #mat <- rbind(mat, row)
}
mat <- as.matrix(mat)
dir <- rep('==', m+n)
rhs <- rep(1, m+n)
max <- TRUE
types <- rep('B', m*n)
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
res

df <- read.csv('compatibility_score_debug_integers.csv', header=FALSE)
df <- read.csv('compatibility_score_integers.csv', header=FALSE)
m <- nrow(df)
n <- ncol(df)
obj <- as.vector(as.matrix(t(df))) #rep(1, m*n)
row_indices <- c()
col_indices <- c()
val_indices <- c()
#mat <- matrix(rep(0, (m+n)*m*n), nrow=m+n)
for (i in 1:m) {
  #mat[i, (i-1)*n+(1:n)] <- 1
  row_indices <- c(row_indices, rep(i,n))
  col_indices <- c(col_indices, (i-1)*n+(1:n))
  val_indices <- c(val_indices, rep(1,n))
}
for (j in 1:n) {
  #mat[m+j, seq(j,j+(m-1)*n,m)] <- 1
  row_indices <- c(row_indices, rep(m+j,n))
  col_indices <- c(col_indices, seq(j,j+(m-1)*n,m))
  val_indices <- c(val_indices, rep(1,n))
}
#mat <- as.matrix(mat)
mat <- simple_triplet_matrix(row_indices, col_indices, val_indices)
dir <- rep('==', m+n)
rhs <- rep(1, m+n)
max <- TRUE
types <- rep('B', m*n)
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
bounds <- list(upper=list(ind=1:(m*n), val=rep(1,m*n)))
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max) # LP
res


library('gurobi')
#df <- read.csv('compatibility_score_debug_integers.csv', header=FALSE)
df <- read.csv('compatibility_score_integers.csv', header=FALSE)
m <- nrow(df)
n <- ncol(df)
model <- list()
model$obj <- as.vector(as.matrix(t(df))) #rep(1, m*n)
#mat <- NULL
row_indices <- c()
col_indices <- c()
val_indices <- c()
#mat <- matrix(rep(0, (m+n)*m*n), nrow=m+n)
for (i in 1:m) {
  #mat[i, (i-1)*n+(1:n)] <- 1
  row_indices <- c(row_indices, rep(i,n))
  col_indices <- c(col_indices, (i-1)*n+(1:n))
  val_indices <- c(val_indices, rep(1,n))
}
for (j in 1:n) {
  #mat[m+j, seq(j,j+(m-1)*n,m)] <- 1
  row_indices <- c(row_indices, rep(m+j,n))
  col_indices <- c(col_indices, seq(j,j+(m-1)*n,m))
  val_indices <- c(val_indices, rep(1,n))
}
#mat <- as.matrix(mat)
mat <- simple_triplet_matrix(row_indices, col_indices, val_indices)
model$A <- mat
model$sense <- rep('=', m+n)
model$rhs <- rep(1, m+n)
model$modelsense <- 'max'
model$vtype <- rep('B', m*n)
params <- list(OutputFlag=0)
result <- gurobi(model, params)
print('Solution:')
print(result$objval)
print(result$x)

library('gurobi')

model <- list()

#model$A          <- matrix(c(1,2,3,1,1,0), nrow=2, ncol=3, byrow=T)
model$A          <- as.simple_triplet_matrix(matrix(c(1,2,3,1,1,0), nrow=2, ncol=3, byrow=T))
model$obj        <- c(1,1,2)
model$modelsense <- "max"
model$rhs        <- c(4,1)
model$sense      <- c('<', '>')
model$vtype      <- 'B'

params <- list(OutputFlag=0)

result <- gurobi(model, params)

print('Solution:')
print(result$objval)
print(result$x)

# Week 4
setwd('C:\\courses\\Edx\\Current\\MITx 15.053x Optimization Methods in Business Analytics\\Week4')
df <- read.csv('R4P1Data.csv', header=FALSE)

obj <- df[1,1:6]
mat <- df[2:4,1:6]
mat <- rbind(mat, c(0,0,0,-1,-1,1))
mat <- rbind(mat, c(0,1,0,0,1,0))
dir <- rep('<=',5)
rhs <- c(df[2:4,7], 0, 1)
max <- TRUE
types <- rep("B", 6)
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
#res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max) # LP
res

obj <- c(rep(450,5), rep(2,5), 0, rep(0,5))
mat <- matrix(c(0,0,0,0,0,1,1,0,0,0,0, rep(0,5),
                0,0,0,0,0,1,0,1,0,0,0, rep(0,5),
                0,0,0,0,0,0,1,1,0,0,0, rep(0,5),
                0,0,0,0,0,0,1,0,1,0,0, rep(0,5),
                0,0,0,0,0,0,0,1,0,1,0, rep(0,5),
                0,0,0,0,0,0,0,0,1,1,0, rep(0,5),
                300,0,0,0,0,-1,0,0,0,0,0, rep(0,5),
                0,300,0,0,0,0,-1,0,0,0,0, rep(0,5),
                0,0,300,0,0,0,0,-1,0,0,0, rep(0,5),
                0,0,0,300,0,0,0,0,-1,0,0, rep(0,5),
                0,0,0,0,300,0,0,0,0,-1,0, rep(0,5),
                0,0,0,0,0,1,0,0,0,0,-300, rep(0,5),
                0,0,0,0,0,0,0,0,1,0,300, rep(0,5),
                0,0,0,0,0,-0.6,0,0.4,0,0,0, rep(0,5),
                0,0,0,0,0,0,0,0,0,0,0, rep(1,5),
                0,0,0,0,0,1,0,0,0,0,0, 150,0,0,0,0,
                0,0,0,0,0,0,1,0,0,0,0, 0,150,0,0,0,
                0,0,0,0,0,0,0,1,0,0,0, 0,0,150,0,0,
                0,0,0,0,0,0,0,0,1,0,0, 0,0,0,150,0,
                0,0,0,0,0,0,0,0,0,1,0, 0,0,0,0,150),
              nrow=20, byrow=T)  
dir <- c(rep('>=',15), rep("<=",5))
rhs <- c(250,300,150,200,350,180, rep(0,5), 0, 300, 0, 3, rep(300,5))
max <- FALSE
types <- c(rep("B", 5), rep("C", 5), "B", rep("B", 5))
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
#res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max) # LP
#sum(res$solution*obj)
res

50 + 70 + 120 + 18 + 15 + 25

45 + 60 + 100 + 1 + 480 

a <- c(50, 70, 120)
d <- c(400,600,200,800,
       240, 440, 100, 660,
       80, 120, 40, 100) 
      #matrix(c(400,600,200,800,
      #        240, 440, 100, 660,
      #        80, 120, 40, 100), nrow=3, byrow=TRUE)   
b <- c(18, 15, 25)
s <- rep(0,12) # matrix(rep(1,12), nrow=3)
x <- rep(0,12) # matrix(rep(0,12), nrow=3)
z <- rep(0,12) # matrix(rep(0,12), nrow=3)
r <- c(5,4,2)
         # s                                     # z                          # x  
obj <- c(rep(b[1],4), rep(b[2],4), rep(b[3],4),  rep(0,12),                   rep(0,12)) #rowSums(s)) 
mat <- matrix(c(rep(0,12),                       45,0,0,0,60,0,0,0,100,0,0,0, 1,0,0,0,1,0,0,0,1,0,0,0,
                rep(0,12),                       0,45,0,0,0,60,0,0,0,100,0,0, 0,1,0,0,0,1,0,0,0,1,0,0,
                rep(0,12),                       0,0,45,0,0,0,60,0,0,0,100,0, 0,0,1,0,0,0,1,0,0,0,1,0,
                rep(0,12),                       0,0,0,45,0,0,0,60,0,0,0,100, 0,0,0,1,0,0,0,1,0,0,0,1,
                0,0,0,1, rep(0,8),               rep(0,12),                   rep(0,12),
                rep(0,4), 0,0,0,1, rep(0,4),     rep(0,12),                   rep(0,12),
                rep(0,8), 0,0,0,1,               rep(0,12),                   rep(0,12)),
              nrow=7, byrow=T)  
dir <- c(rep('<=',4), rep('==',3))
rhs <- c(rep(480,4), rep(0,3)) # 480 500

for (i in 1:3) {
  for(t in 1:4) {
      row <- rep(0, 3*12)
      if (t > 1) {
        row[(i-1)*4+(t-1)] <- 1
      }
      row[24+(i-1)*4+t] <- r[i]
      row[(i-1)*4+t] <- -1
      mat <- rbind(mat, row)
      dir <- c(dir, '==')
      rhs <- c(rhs, d[(i-1)*4+t])
  }
}

for (i in 1:3) {
  for(t in 1:4) {
    row <- rep(0, 3*12)
    row[24+(i-1)*4+t] <- 1
    row[12+(i-1)*4+t] <- -100000
    mat <- rbind(mat, row)
    dir <- c(dir, '<=')
    rhs <- c(rhs, 0)
  }
}


a <- c(50, 70, 120)
d <- c(400,600,200,800,
       240, 440, 100, 660,
       80, 120, 40, 100) 
#matrix(c(400,600,200,800,
#        240, 440, 100, 660,
#        80, 120, 40, 100), nrow=3, byrow=TRUE)   
b <- c(18, 15, 25)
s <- rep(0,12) # matrix(rep(1,12), nrow=3)
x <- rep(0,12) # matrix(rep(0,12), nrow=3)
z <- rep(0,12) # matrix(rep(0,12), nrow=3)
r <- c(5,4,2)
max <- FALSE
types <- c(rep("C", 12), rep("B",12), rep("C",12))
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
#res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max) # LP
#sum(res$solution*obj)
res
sum(a[1]*d[1:4]) + sum(a[2]*d[5:8]) + sum(a[3]*d[9:12]) - res$optimum

                                                                                                        # u  
obj <- c(rep(b[1],4), rep(b[2],4), rep(b[3],4),  rep(0,12),                   rep(0,12),                rep(0,4)) #rep(50,4)) #rowSums(s)) 
mat <- matrix(c(rep(0,12),                       45,0,0,0,60,0,0,0,100,0,0,0, 1,0,0,0,1,0,0,0,1,0,0,0,  -120,0,0,0,
                rep(0,12),                       0,45,0,0,0,60,0,0,0,100,0,0, 0,1,0,0,0,1,0,0,0,1,0,0,  0,-120,0,0,
                rep(0,12),                       0,0,45,0,0,0,60,0,0,0,100,0, 0,0,1,0,0,0,1,0,0,0,1,0,  0,0,-120,0,
                rep(0,12),                       0,0,0,45,0,0,0,60,0,0,0,100, 0,0,0,1,0,0,0,1,0,0,0,1,  0,0,0,-120,
                0,0,0,1, rep(0,8),               rep(0,12),                   rep(0,12),                rep(0,4),
                rep(0,4), 0,0,0,1, rep(0,4),     rep(0,12),                   rep(0,12),                rep(0,4),
                rep(0,8), 0,0,0,1,               rep(0,12),                   rep(0,12),                rep(0,4),
                rep(0,12),                       rep(0,12),                   rep(0,12),                rep(1,4),
                rep(0,12),                       rep(0,12),                   rep(0,12),                 1,1,0,0,
                rep(0,12),                       rep(0,12),                   rep(0,12),                 0,1,1,0,
                rep(0,12),                       rep(0,12),                   rep(0,12),                 0,0,1,1),     
              nrow=11, byrow=T)  
dir <- c(rep('<=',4), rep('==',3), "<=", rep("<=",3))
rhs <- c(rep(480,4), rep(0,3), 2, rep(1, 3)) # 480

for (i in 1:3) {
  for(t in 1:4) {
    row <- rep(0, 3*12+4)
    if (t > 1) {
      row[(i-1)*4+(t-1)] <- 1
    }
    row[24+(i-1)*4+t] <- r[i]
    row[(i-1)*4+t] <- -1
    mat <- rbind(mat, row)
    dir <- c(dir, '==')
    rhs <- c(rhs, d[(i-1)*4+t])
  }
}

for (i in 1:3) {
  for(t in 1:4) {
    row <- rep(0, 3*12+4)
    row[24+(i-1)*4+t] <- 1
    row[12+(i-1)*4+t] <- -100000
    mat <- rbind(mat, row)
    dir <- c(dir, '<=')
    rhs <- c(rhs, 0)
  }
}

#for(t in 1:4) {
#  row <- rep(0, 3*12)
#  row[12+(1-1)*4+t] <- 45
#  row[12+(2-1)*4+t] <- 50
#  row[12+(3-1)*4+t] <- 100
#  row[24+(1-1)*4+t] <- 1
#  row[24+(2-1)*4+t] <- 1
#  row[24+(3-1)*4+t] <- 1
#  row[36+t] <- -120
#  mat <- rbind(mat, row)
#  dir <- c(dir, '<=')
#  rhs <- c(rhs, 480)
#}

max <- FALSE
types <- c(rep("C", 12), rep("B",12), rep("C",12), rep("B",4))
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
#res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max) # LP
#sum(res$solution*obj)
res
sum(a[1]*d[1:4]) + sum(a[2]*d[5:8]) + sum(a[3]*d[9:12]) - res$optimum - 12*50


# Sudoku
obj <- rep(0, 9^3)
a <- matrix(rep(0, 9^2), nrow=9)
a[1,c(1,2,5)] <- c(5,3,7)
a[2,c(1,4,5,6)] <- c(6,1,9,5)
a[3,c(2,3,8)] <- c(9,8,6)
a[4,c(1,5,9)] <- c(8,6,3)
a[5,c(1,4,6,9)] <- c(4,8,3,1)
a[6,c(1,5,9)] <- c(7,2,6)
a[7,c(2,7,8)] <- c(6,2,8)
a[8,c(4,5,6,9)] <- c(4,1,9,5)
a[9,c(5,8,9)] <- c(8,7,9)

# C1
mat <- NULL
dir <- c()
rhs <- c()
for (i in 1:9) {
  for(j in 1:9) {
   if (a[i,j] > 0) {
     row <- rep(0, 9^3)
     row[9^2*(i-1)+9*(j-1)+a[i,j]] <- 1
     mat <- rbind(mat, row)
     dir <- c(dir, '==')
     rhs <- c(rhs, 1)
   }
  }
}
# C2
# dim(mat)
# sum(a > 0)
for (j in 1:9) {
  for (k in 1:9) {
    row <- rep(0, 9^3)
    for (i in 1:9) {
      row[9^2*(i-1)+9*(j-1)+k] <- 1
    }
    mat <- rbind(mat, row)
    dir <- c(dir, '==')
    rhs <- c(rhs, 1)
  }
}
# C3
# dim(mat)
for (i in 1:9) {
  for (k in 1:9) {
    row <- rep(0, 9^3)
    for (j in 1:9) {
      row[9^2*(i-1)+9*(j-1)+k] <- 1
    }
    mat <- rbind(mat, row)
    dir <- c(dir, '==')
    rhs <- c(rhs, 1)
  }
}
# C4
# dim(mat)
for (i in 1:9) {
  for (j in 1:9) {
    row <- rep(0, 9^3)
    for (k in 1:9) {
      row[9^2*(i-1)+9*(j-1)+k] <- 1
    }
    mat <- rbind(mat, row)
    dir <- c(dir, '==')
    rhs <- c(rhs, 1)
  }
}
# dim(mat)
# C5
for (i in 0:2) {
  for (j in 0:2) {
    for (k in 1:9) {
      row <- rep(0, 9^3)
      for (a in 1:3) {
        for (b in 1:3) {
          row[9^2*(3*i+a-1)+9*(3*j+b-1)+k] <- 1
        }
      }
      mat <- rbind(mat, row)
      dir <- c(dir, '==')
      rhs <- c(rhs, 1)
    }
  }
}
# dim(mat)
max <- TRUE
types <- rep("B", 9^3)
res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max, types=types) # IP
#res <- Rglpk_solve_LP(obj, mat, dir=dir, rhs, max = max) # LP
#sum(res$solution*obj)
res

sum(res$solution > 0)

a <- matrix(rep(0, 9^2), nrow=9)
a[1,c(1,2,5)] <- c(5,3,7)
a[2,c(1,4,5,6)] <- c(6,1,9,5)
a[3,c(2,3,8)] <- c(9,8,6)
a[4,c(1,5,9)] <- c(8,6,3)
a[5,c(1,4,6,9)] <- c(4,8,3,1)
a[6,c(1,5,9)] <- c(7,2,6)
a[7,c(2,7,8)] <- c(6,2,8)
a[8,c(4,5,6,9)] <- c(4,1,9,5)
a[9,c(5,8,9)] <- c(8,7,9)

library(grid)
library(gridExtra)
table <- tableGrob(a)

grid.newpage()
h <- grobHeight(table)
w <- grobWidth(table)
title <- textGrob("Title", y=unit(0.5,"npc") + 0.5*h, 
                  vjust=0, gp=gpar(fontsize=20))
footnote <- textGrob("footnote", 
                     x=unit(0.5,"npc") - 0.5*w,
                     y=unit(0.5,"npc") - 0.5*h, 
                     vjust=1, hjust=0,gp=gpar( fontface="italic"))
gt <- gTree(children=gList(table, title, footnote))
grid.draw(gt)

#for (index in 1:length(res$solution)) {
#  if (res$solution[index] == 1){
#    i <- as.integer(index / 9^2)
#    j <- as.integer((index - 9^2*i) / 9)
#    k <- index - 9^2*i - 9*j
#    k <- ifelse(k == 0, 9, k)
#    print(paste(index, i+1,j+1,k))
#    if (i < 9) {
#      a[i+1,j+1] <- k
#    }
#  }
#}

for (i in 1:9) {
  for (j in 1:9) {
    for (k in 1:9) {
      if (res$solution[9^2*(i-1)+9*(j-1)+k] == 1) {
        a[i,j] <- k
      }
    }
  }
}

A = a[5,2] #2
B = a[3,6] #2
C = a[9,7] #1
A + B + C


library(grid)
library(gridExtra)
table <- tableGrob(a)

grid.newpage()
h <- grobHeight(table)
w <- grobWidth(table)
title <- textGrob("Title", y=unit(0.5,"npc") + 0.5*h, 
                  vjust=0, gp=gpar(fontsize=20))
footnote <- textGrob("footnote", 
                     x=unit(0.5,"npc") - 0.5*w,
                     y=unit(0.5,"npc") - 0.5*h, 
                     vjust=1, hjust=0,gp=gpar( fontface="italic"))
gt <- gTree(children=gList(table, title, footnote))
grid.draw(gt)


# Week 5

obj <- c(5,4.5,6)
mat <- matrix(c(c(6,5,8),
                c(10,20,10),  
                c(1,0,0)),  
              nrow=3, byrow=T)  
dir <- c("<=", "<=", "<=")
rhs <- c(60, 150, 8)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)

obj <- c(5,4.5,6)
mat <- matrix(c(c(6,5,8),
                c(10,20,22),  
                c(1,0,0)),  
              nrow=3, byrow=T)  
dir <- c("<=", "<=", "<=")
rhs <- c(60, 150, 8)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)


obj <- c(1,0)
mat <- matrix(c(c(-1,1),
                c(1,1),  
                c(-1,1)),  
              nrow=3, byrow=T)  
dir <- c("<=", "<=", ">=")
rhs <- c(2, 8, -4)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)

plot(c(-5, 8), c(-5, 5), type='n')
points(0,0, pch=19)

conditions <- function(x,y) {
  c1 <- (y - x <= 2)
  c2 <- (y + x <= 8)
  c3 <- (y - x >= -4)
  c4 <- (x >= 0)
  c5 <- (y >= 0)
  return(c1 & c2 & c3 & c4 & c5)
}

x <- seq(-5,8,length=100)
y <- seq(-5,5,length=100)
z <- expand.grid(x=x,y=y)
z <- z[conditions(z$x,z$y),]
points(z, col="yellow")

abline(h=0)
abline(v=0)
abline(2,1)
abline(8,-1)
abline(-4,1)
abline(v=2, col='red')
abline(v=4, col='red')
abline(v=6, col='red')

obj <- c(1,0)
mat <- matrix(c(c(-1,1),
                c(1,1),  
                c(-1,1)),  
              nrow=3, byrow=T)  
dir <- c("<=", "<=", ">=")
rhs <- c(2, 8, -4 + 2) #1 # shaddow price
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)


obj <- c(5,4.5,6)
mat <- matrix(c(c(6,5,8),
                c(10,20,10),  
                c(1,0,0)),  
              nrow=3, byrow=T)  
dir <- c("<=", "<=", "<=")
rhs <- c(60, 150, 8)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)

obj <- c(5,4.5,6)
mat <- matrix(c(c(6,5,8),
                c(10,20,10),  
                c(1,0,0)),  
              nrow=3, byrow=T)  
dir <- c("==", "==", "<=")
rhs <- c(60, 150, 8)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)

obj <- c(200,300,100,292,88)
mat <- matrix(c(c(0,2,3,0,0),
                c(0,0,0,2,3),  
                c(3,1,3,1,3),
                c(3,6,2,6,2),
                c(5,4,0,4,0),
                c(1,0,0,0,0),
                c(0,1,0,1,0),
                c(0,0,1,0,1)
              ),  
              nrow=8, byrow=T)  
dir <- c(rep("<=",5), rep(">=",3))
rhs <- c(c(40,35,60,200,160),c(10,10,5))
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)

obj <- c(200,300,100,292,88, 584.001) #584.005 584.01 584.0125 584.025 584.05 584.1 584.125 584.25 584.5 584 585 588 590 575 550  600 700
mat <- matrix(c(c(0,2,3,0,0,0),
                c(0,0,0,2,3,0),  
                c(3,1,3,1,3,2),
                c(3,6,2,6,2,2),
                c(5,4,0,4,0,1),
                c(1,0,0,0,0,0),
                c(0,1,0,1,0,0),
                c(0,0,1,0,1,0)
),  
nrow=8, byrow=T)  
dir <- c(rep("<=",5), rep(">=",3))
rhs <- c(c(40,35,60,200,160),c(10,10,5))
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)


obj <- c(-10,-4)
mat <- matrix(c(c(2,1),
                c(1,2),  
                c(1,1)),  
              nrow=3, byrow=T)  
dir <- c("<=", "<=", ">=")
rhs <- c(4, 4, 1)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)

plot(c(-1, 5), c(-5, 5), type='n', xlab='x1', ylab='x2')
points(0,0, pch=19)

conditions <- function(x,y) {
  c1 <- (y + 2*x <= 4)
  c2 <- (y + 0.5*x <= 2)
  c3 <- (y + x >= 1)
  c4 <- (x >= 0)
  c5 <- (y >= 0)
  return(c1 & c2 & c3 & c4 & c5)
}

x <- seq(-1,5,length=100)
y <- seq(-1,5,length=100)
z <- expand.grid(x=x,y=y)
z <- z[conditions(z$x,z$y),]
points(z, col="yellow")

abline(h=0)
abline(v=0)
abline(4,-2)
abline(2,-1/2)
abline(1,-1)
abline(1, -2.5, col='red')

obj <- c(-10,-4)
mat <- matrix(c(c(2,1),
                c(1,2),  
                c(1,1)),  
              nrow=3, byrow=T)  
dir <- c("<=", "<=", ">=")
rhs <- c(4, 4, 2)
max <- TRUE
Rglpk_solve_LP(obj, mat, dir, rhs, max = max)


# Week 6

dist(rbind(c(8,2),c(5,6)))


# Example problem, number 71 from the Hock-Schittkowsky test suite.
#
# \min_{x} x1*x4*(x1 + x2 + x3) + x3
# s.t.
# x1*x2*x3*x4 >= 25
# x1^2 + x2^2 + x3^2 + x4^2 = 40
# 1 <= x1,x2,x3,x4 <= 5
#
# we re-write the inequality as
# 25 - x1*x2*x3*x4 <= 0
#
# and the equality as
# x1^2 + x2^2 + x3^2 + x4^2 - 40 = 0
#
# x0 = (1,5,5,1)
#
# optimal solution = (1.00000000, 4.74299963, 3.82114998, 1.37940829)

library('nloptr')
#
# f(x) = x1*x4*(x1 + x2 + x3) + x3
#
eval_f <- function( x ) {
  return( list( "objective" = x[1]*x[4]*(x[1] + x[2] + x[3]) + x[3],
                "gradient" = c( x[1] * x[4] + x[4] * (x[1] + x[2] + x[3]),
                                x[1] * x[4],
                                x[1] * x[4] + 1.0,
                                x[1] * (x[1] + x[2] + x[3]) ) ) )
}
# constraint functions
# inequalities
eval_g_ineq <- function( x ) {
  constr <- c( 25 - x[1] * x[2] * x[3] * x[4] )
  grad <- c( -x[2]*x[3]*x[4],
             -x[1]*x[3]*x[4],
             -x[1]*x[2]*x[4],
             -x[1]*x[2]*x[3] )
  return( list( "constraints"=constr, "jacobian"=grad ) )
}
# equalities
eval_g_eq <- function( x ) {
  constr <- c( x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 - 40 )
  grad <- c( 2.0*x[1],
             2.0*x[2],
             2.0*x[3],
             2.0*x[4] )
  return( list( "constraints"=constr, "jacobian"=grad ) )
}
# initial values
x0 <- c( 1, 5, 5, 1 )
# lower and upper bounds of control
lb <- c( 1, 1, 1, 1 )
ub <- c( 5, 5, 5, 5 )
local_opts <- list( "algorithm" = "NLOPT_LD_MMA",
                    "xtol_rel" = 1.0e-7 )
opts <- list( "algorithm" = "NLOPT_LD_AUGLAG",
              "xtol_rel" = 1.0e-7,
              "maxeval" = 1000,
              "local_opts" = local_opts )
res <- nloptr( x0=x0,
               eval_f=eval_f,
               lb=lb,
               ub=ub,
               eval_g_ineq=eval_g_ineq,
               eval_g_eq=eval_g_eq,
               opts=opts)
print( res )

library('nloptr')
#
# f(x) = 9*sqrt((x1-8)^2+(x2-2)^2) + 7*sqrt((x1-3)^2+(x2-10)^2) + 2*sqrt((x1-8)^2+(x2-15)^2) + 5*sqrt((x1-14)^2+(x2-13)^2)
#
eval_f <- function( x ) {
  return( list( "objective" = x[1]*x[4]*(x[1] + x[2] + x[3]) + x[3],
                "gradient" = c( x[1] * x[4] + x[4] * (x[1] + x[2] + x[3]),
                                x[1] * x[4],
                                x[1] * x[4] + 1.0,
                                x[1] * (x[1] + x[2] + x[3]) ) ) )
}
# constraint functions
# inequalities
eval_g_ineq <- function( x ) {
  constr <- c( 25 - x[1] * x[2] * x[3] * x[4] )
  grad <- c( -x[2]*x[3]*x[4],
             -x[1]*x[3]*x[4],
             -x[1]*x[2]*x[4],
             -x[1]*x[2]*x[3] )
  return( list( "constraints"=constr, "jacobian"=grad ) )
}
# equalities
eval_g_eq <- function( x ) {
  constr <- c( x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 - 40 )
  grad <- c( 2.0*x[1],
             2.0*x[2],
             2.0*x[3],
             2.0*x[4] )
  return( list( "constraints"=constr, "jacobian"=grad ) )
}
# initial values
x0 <- c( 1, 5, 5, 1 )
# lower and upper bounds of control
lb <- c( 1, 1, 1, 1 )
ub <- c( 5, 5, 5, 5 )
local_opts <- list( "algorithm" = "NLOPT_LD_MMA",
                    "xtol_rel" = 1.0e-7 )
opts <- list( "algorithm" = "NLOPT_LD_AUGLAG",
              "xtol_rel" = 1.0e-7,
              "maxeval" = 1000,
              "local_opts" = local_opts )
res <- nloptr( x0=x0,
               eval_f=eval_f,
               lb=lb,
               ub=ub,
               eval_g_ineq=eval_g_ineq,
               eval_g_eq=eval_g_eq,
               opts=opts)
print( res )



library('nloptr')
#
# f(x) = sqrt(x2)
#
eval_f <- function( x ) {
  return(sqrt(x[2]))
}

# constraint functions
# inequalities
eval_g_ineq <- function( x ) {
  constr <- c( (5*x[1]/2)^3 - x[2], (-3*x[1]/2+1)^3 - x[2])
  return(constr)
}
# equalities
# None
# initial values
x0 <- c( 1, 1)
# lower and upper bounds of control
lb <- c( -Inf, 0 )
ub <- c( Inf, Inf )
local_opts <- list( "algorithm" = "NLOPT_LD_MMA",
                    "xtol_rel" = 1.0e-7 )
opts = list("algorithm"="NLOPT_LN_COBYLA",
            "xtol_rel"=1.0e-5, "maxeval"=500)

res <- nloptr( x0=x0,
               eval_f=eval_f,
               lb=lb,
               ub=ub,
               eval_g_ineq=eval_g_ineq,
               #eval_g_eq=eval_g_eq,
               opts=opts)
print( res )

####
objvals <- c()
for (theta in 0:5) {
  
  #theta <- 1
  eval_f <- function( x ) {
    return(-(20*x[1]+16*x[2]-theta*(2*x[1]^2+x[2]^2+(x[1]+x[2])^2)))
  }
  
  # constraint functions
  # inequalities
  eval_g_ineq <- function( x ) {
    constr <- c(x[1]+x[2]-5)
    return(constr)
  }
  # equalities
  # None
  # initial values
  x0 <- c( 1, 1)
  # lower and upper bounds of control
  lb <- c( 0, 0 )
  ub <- c( 5, 5 )
  local_opts <- list( "algorithm" = "NLOPT_LD_MMA",
                      "xtol_rel" = 1.0e-7 )
  opts = list("algorithm"="NLOPT_LN_COBYLA",
              "xtol_rel"=1.0e-5, "maxeval"=500)
  
  res <- nloptr( x0=x0,
                 eval_f=eval_f,
                 lb=lb,
                 ub=ub,
                 eval_g_ineq=eval_g_ineq,
                 #eval_g_eq=eval_g_eq,
                 opts=opts)
  objvals <- c(objvals,  -res$objective)
  print(paste(theta, -res$objective))  
}
plot(0:5, objvals, pch=19, xlab=expression(theta)) # ?plotmath

#####
eval_f <- function( x ) {
  return(x[3]) # t
}

# constraint functions
# inequalities
eval_g_ineq <- function( x ) {
  constr <- c(sqrt(x[1]^2+x[2]^2)-x[3], 1-x[1]-x[2])
  return(constr)
}
# equalities
# None
# initial values
x0 <- c( 1, 1, 1)
# lower and upper bounds of control
lb <- c( 0, 0, -Inf )
ub <- c( 1, 1, Inf )
local_opts <- list( "algorithm" = "NLOPT_LD_MMA",
                    "xtol_rel" = 1.0e-7 )
opts = list("algorithm"="NLOPT_LN_COBYLA",
            "xtol_rel"=1.0e-5, "maxeval"=500)

res <- nloptr( x0=x0,
               eval_f=eval_f,
               lb=lb,
               ub=ub,
               eval_g_ineq=eval_g_ineq,
               #eval_g_eq=eval_g_eq,
               opts=opts)
print(res)

######
# does not work ???
eval_f <- function( x ) {
  return(100*(x[2]-(1/2+x[1])^2)^2+(1-x[1])^2)
}

# constraint functions
# inequalities
# None
# equalities
# None
# initial values
x0 <- c( 1, 1)
# lower and upper bounds of control
lb <- c( 0, 0)
ub <- c( Inf, Inf)
local_opts <- list( "algorithm" = "NLOPT_LD_MMA",
                    "xtol_rel" = 1.0e-7 )
opts = list("algorithm"="NLOPT_LN_COBYLA",
            "xtol_rel"=1.0e-5, "maxeval"=500)
res <- nloptr( x0=x0,
               eval_f=eval_f,
               lb=lb,
               ub=ub,
               #eval_g_ineq=eval_g_ineq,
               #eval_g_eq=eval_g_eq,
               opts=opts)
print(res)
print(res$objective)
print(res$solution)

# works
optim(par=c(1,1), fn=eval_f, lower=c(0,0), method='L-BFGS-B')
# does not work
library(pracma)
lsqnonlin(fun=eval_f, x0=c(1,1))

#####
eval_f <- function( x ) {
  return((2*x[1]+3*x[2]+4*x[3])^2)
}
grad_f <- function(x) {
  return(c(2*(2*x[1]+3*x[2]+4*x[3]),3*(2*x[1]+3*x[2]+4*x[3]),4*(2*x[1]+3*x[2]+4*x[3])))
}

# constraint functions
# inequalities
eval_g_ineq <- function( x ) {
  constr <- c(10*x[1]+11*x[2]+12*x[3]-60, 
              21*x[1]+22*x[2]+23*x[3]-150,
              -21*x[1]-22*x[2]+23*x[3]+110)
  return(constr)
}
# equalities
eval_g_eq <- function( x ) {
  constr <- c(19*x[1] + 34*x[2] - 32*x[3] - 180)
  return(constr)
}
# initial values
x0 <- c( 1, 1, 1)
# lower and upper bounds of control
lb <- c( 0, 0, -Inf )
ub <- c( 1, 1, Inf )
local_opts <- list( "algorithm" = "NLOPT_LD_AUGLAG",
                    "xtol_rel" = 1.0e-7 )
opts = list("algorithm"="NLOPT_LD_MMA", "check_derivatives"=TRUE)

res <- nloptr( x0=x0,
               eval_f=eval_f,
               eval_grad_f=grad_f,
               lb=lb,
               ub=ub,
               eval_g_ineq=eval_g_ineq,
               eval_g_eq=eval_g_eq,
               opts=opts#,
               #local_opts=local_opts
               )
print(res)


data = data.frame(
  ID=c('x1','x1','x1','x1','x1','x2','x2','x2','x2','x2','x3'),
  year=c('2015','2015','2016','2016','2016','2015','2015','2015','2015','2016','2015'),
  income=c('300','700','1000','90','100','2000','150','500','45','100','111'),
  type=c('A','C','A','B','B','A','B','C','C','B','C')
)

data$income = as.integer(as.character(data$income))
h <- ggplot(data, aes(fill=type,x=income))
h+geom_histogram()

data %>% group_by(ID,year) %>% summarize(income=sum(income), type=paste0(type, collapse=',')) %>%
  ggplot(aes(fill=type,x=income))+geom_histogram()

df <- data %>% group_by(ID, year, type) %>% summarise(income=sum(income), count = n()) #%>%  mutate(count = count / sum(count)) 
df1 <- df %>% group_by(ID,year) %>% summarize(income=sum(income), type=type, count=count)

df1 %>% ggplot(aes(fill=type, x=income, y=count)) + geom_bar(stat='identity', width = 25)


df <- data %>% group_by(ID, year, type) %>% summarise(income=sum(income), count = n()) %>% 
               group_by(ID,year) %>% summarize(income=sum(income), type=type, count=count)
df
df %>% ggplot(aes(fill=type, color=type, x=income, y=count)) + 
      geom_bar(stat='identity', width = 50, alpha=0.5) #, position='identity', binwidth = 50

bins <- seq(min(df$income), max(df$income), 50)
df$bin <- sapply(df$income, function(x) max(which(bins <= x)))

df %>%  group_by(bin) %>%
  mutate(income = mean(income), bin=bin) %>% 
  ggplot(aes(fill=type, color=type, x=income, y=count)) + 
  geom_bar(stat='identity', width = 50) #, position='identity', binwidth = 50

#df %>% inner_join(df1)


  ggplot(aes(fill=type,x=income))+geom_histogram()
  
  if (n %% 2 == 0) {
    matrix(rep(c(rep(1:0, n/2), rep(0:1,n/2)), n/2), nrow=n)
  } else {
    matrix(c(rep(0:1, n*n/2),0), nrow=n)
  }
  
  
library(mlbench)  
data(BreastCancer)

setwd('C:/Work/TCS')
df <- read.csv('breast-cancer-wisconsin.data', header = FALSE)
df

df[df == '?'] = NA
df$V7 = as.integer(df$V7)
df$V7[is.na()]




mat <- matrix(c(0,1,1,1,0,1,1,1,0),ncol=3)
mat1 <- Matrix::bdiag(mat,mat,mat)
mat2 <- Matrix::bdiag(mat,mat,mat)
identity_mat <- Matrix::.symDiagonal(9)

microbenchmark::microbenchmark(
  qr(mat1),
  #mat1 + Matrix::Matrix(diag(nrow(mat1))),
  Matrix::diag(mat2) <- 1,
  mat1 + identity_mat
)


library(xts)
library(qrmdata)
library(qrmtools)
SP500.X <- returns(SP500["2015"])
SP500.X <- SP500.X[SP500.X != 0]
L <- -SP500.X # consider -log-returns of S&P 500 here
r <- 0.01 # probability to determine large losses
u <- quantile(L, probs = 1 - r) # determine empirical (1-r)-quantile
xtr.L <- L[L > u] # exceedances over the chosen empirical quantile = largest so-many losses
plot(as.numeric(xtr.L), type = "h", xlab = "Time",
     ylab = substitute("Largest"~r.*"% of losses ("*n.~"losses)",
                       list(r. = 100 * r, n. = length(xtr.L))))

## Now consider spacings (certainly not exponentially distributed)
spcs <- as.numeric(diff(time(xtr.L)))
qq_plot(spcs, FUN = function(p) qexp(p, rate = r)) # r = exceedance probability


p <- c(5/12,1/4,1/4,1/12)
sum(p)
sum(p*log2(1/p))

p <- c(5/12,1/12,1/2)
sum(p)
sum(p*log2(1/p))


library(rSymPy)

X = matrix(c(1,1,1,1,2,3),nrow=3)
solve(t(X) %*% X)

y1 <- Var("y1")
y2 <- Var("y2")
y3 <- Var("y3")
s <- Var("s")

Inv <- function(x) Sym("(", x, ").inv()")

#X <- Matrix(List(1,1),List(1,2),List(1,3))
X <- Matrix(List(1),List(2),List(3))
tX <- Matrix(List(1,2,3))
S <- Matrix(List(s,0,0),List(0,2*s,0),List(0,0,3*s))
y <- Matrix(List(y1, y2, y3))


a <- Var("a")
b <- Var("b")
M <- Matrix(List(1,0,0,0),List(b,0,a,0),List(0,a,0,b),List(0,0,a,b))


Inv(tX*Inv(S)*X)

X1 <- Matrix(List(7/3,-1),List(-1,1/2))
tX *Inv(S) * y

Inv(tX*Inv(S)*X) * (tX * Inv(S) * y)

T <- matrix(rep(0,64),nrow=8)
T[1,1] = T[1,2] = 1/2
T[2,3] = T[2,5] = 1/2
T[3,4] = T[3,7] = 1/2
T[4,1] = T[4,2] = 1/2
T[5,8] = 1
T[6,7] = 1
T[7,5] = 1
T[8,6] = T[8,8] = 1/2

S <- T

for (i in 1:100)
  S <- S %*% T

x1 <- Var("x1")
x2 <- Var("x2")
sympy("simplify(-0.1*(x1-17)*(x1-17)+8.6+0.12*(x2-17.5)*(x2-17.5)-6.2)+x1*x1+x2*x2-2*x1*x2")


x <- -(1:100)/10
y <- 100 + 10 * exp(x / 2) + rnorm(x)/10
nlmod <- nls(y ~  Const + A * exp(B * x), trace = TRUE)

plot(x,y, main = "nls(*), data, true function and fit, n=100")
curve(100 + 10 * exp(x / 2), col = 4, add = TRUE)
lines(x, predict(nlmod), col = 2)

n <- 1:100
T <- 5*n*(log(10*n))+2+10*runif(1)
nlmod <- nls(T/n ~  Const + A * log(n), start = list(A = 1, Const=1), trace=TRUE)#, algorithm='plinear')
summary(nlmod)
plot(n,T/n, pch=19, main='NLS fit', ylab='T(n)/n')
#curve(100 + 10 * n * log(n) + 0.5 * n, col = 4, add = TRUE)
lines(n, predict(nlmod,n), col = 2, lwd=2)
legend("bottomright", legend=c("T(n)/n", "fitted"),
       col=c("black", "red"), pch=c(19,NA), lty=c(NA,1), lwd=2)

library(pracma)

p <- rep(0, 19)
for (k in 0:18) {
  p[k+1] <- mean(replicate(10000,
            {
              H = rep(0, 4)
              for (i in 1:18) {
                j = sample(1:4, 1)
                H[j] <- H[j] + 1
              }
              H[1] == k
            }))
  print(p[k+1])
}


p1 <- rep(0,19)
for (k in 0:18) {
  p1[k+1] <- nchoosek(18,k)*(1/4)^k*(3/4)^(18-k)
}

p
p1


dput(head(moneyball_training_data))

moneyball_training_data <- structure(list(INDEX = 1:6, TARGET_WINS = c(39L, 70L, 86L, 70L, 
                                            82L, 75L), TEAM_BATTING_H = c(1445L, 1339L, 1377L, 1387L, 1297L, 
                                                                          1279L), TEAM_BATTING_2B = c(194L, 219L, 232L, 209L, 186L, 200L
                                                                          ), TEAM_BATTING_3B = c(39L, 22L, 35L, 38L, 27L, 36L), TEAM_BATTING_HR = c(13L, 
                                                                                                                                                    190L, 137L, 96L, 102L, 92L), TEAM_BATTING_BB = c(143L, 685L, 
                                                                                                                                                                                                     602L, 451L, 472L, 443L), TEAM_BATTING_SO = c(842L, 1075L, 917L, 
                                                                                                                                                                                                                                                  922L, 920L, 973L), TEAM_BASERUN_SB = c(NA, 37L, 46L, 43L, 49L, 
                                                                                                                                                                                                                                                                                         107L), TEAM_BASERUN_CS = c(NA, 28L, 27L, 30L, 39L, 59L), TEAM_BATTING_HBP = c(NA_integer_, 
                                                                                                                                                                                                                                                                                                                                                                       NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_
                                                                                                                                                                                                                                                                                         ), TEAM_PITCHING_H = c(9364L, 1347L, 1377L, 1396L, 1297L, 1279L
                                                                                                                                                                                                                                                                                         ), TEAM_PITCHING_HR = c(84L, 191L, 137L, 97L, 102L, 92L), TEAM_PITCHING_BB = c(927L, 
                                                                                                                                                                                                                                                                                                                                                                        689L, 602L, 454L, 472L, 443L), TEAM_PITCHING_SO = c(5456L, 1082L, 
                                                                                                                                                                                                                                                                                                                                                                                                                            917L, 928L, 920L, 973L), TEAM_FIELDING_E = c(1011L, 193L, 175L, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                         164L, 138L, 123L), TEAM_FIELDING_DP = c(NA, 155L, 153L, 156L, 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 168L, 149L)), row.names = c(NA, 6L), class = "data.frame")

labs(caption = "")

ggplot(data = TEAM_PITCHING_SO_linear_model, aes(x = .resid)) +
  geom_histogram() +
  xlab("Residuals") +
  labs(title = "", subtitle = "Histogram - Linear Model") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  labs(caption = "")

TEAM_FIELDING_E_linear_model <- lm(TARGET_WINS ~ TEAM_FIELDING_E, moneyball_training_data)

ggplot(data = TEAM_FIELDING_E_linear_model, aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  xlab("Fitted values") +
  ylab("Residuals") +
  labs(title = "", subtitle = "Scatterplot - Linear Model") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  labs(caption = "")

ggplot(data = TEAM_FIELDING_E_linear_model, aes(x = .resid)) +
  geom_histogram() +
  xlab("Residuals") +
  labs(title = "", subtitle = "Histogram - Linear Model") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  labs(caption = "")

TEAM_FIELDING_DP_linear_model <- lm(TARGET_WINS ~ TEAM_FIELDING_DP, moneyball_training_data)

ggplot(data = TEAM_FIELDING_DP_linear_model, aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  xlab("Fitted values") +
  ylab("Residuals") +
  labs(title = "", subtitle = "Scatterplot - Linear Model") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  labs(caption = "")

ggplot(data = TEAM_FIELDING_DP_linear_model, aes(x = .resid)) +
  geom_histogram() +
  xlab("Residuals") +
  labs(title = "", subtitle = "Histogram - Linear Model") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  labs(caption = "")


x <- seq(-10,10,0.01)
y <- -2*x/3
m <- -2/3
T <- matrix(c((1-m^2)/(1+m^2),2*m/(1+m^2),2*m/(1+m^2),(m^2-1)/(1+m^2)), nrow=2)
p <- matrix(c(5,10, 1, 1), nrow=2, byrow=T)
p1 <- T %*% p
plot(x,y, type='l', xlim=c(-10,10), ylim=c(-10,10))
for (i in 1:nrow(p)) {
  points(p[1,i],p[2,i],pch=19)
  points(p1[1,i],p1[2,i],pch=19, col='red')
}
#abline(h=0)
#abline(v=0)


x <- seq(-10,10,0.01)
y <- -2*x/3
m <- -2/3
T <- matrix(c((1-m^2)/(1+m^2),2*m/(1+m^2),2*m/(1+m^2),(m^2-1)/(1+m^2)), nrow=2, byrow=T)
p <- c(1,2)
p1 <- T %*% p
plot(x,y, type='l')
points(p[1],p[2],pch=19)
points(p1[1],p1[2],pch=19, col='red')
#abline(h=0)
#abline(v=0)