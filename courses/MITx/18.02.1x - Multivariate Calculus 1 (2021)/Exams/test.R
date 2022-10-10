x <- seq(-10,10, 0.01)
y <- 3*x/2 - 3/4
plot(x, y, type='lines')
for (c in -15:15) {
  y <- 3*x/2 - 3/4 + 3*c
  lines(x, y)
}

x <- seq(-1,1, 0.01)
c <- 0
y <- sqrt((1-c)^2/4-x^2)
plot(x, y, type='lines', ylim = c(-1,1))
lines(x, -y)
for (c in seq(-2, 0.99, 0.05)) {
  y <- sqrt((1-c)^2/4-x^2)
  lines(x, y)
  lines(x, -y)
}

x <- seq(-1,1, 0.01)
c <- 0
y <- sqrt(c-x^2)
plot(x, y, type='lines', ylim = c(-1,1))
lines(x, -y)
for (c in seq(-2, 0.99, 0.05)) {
  y <- sqrt(c-x^2)
  lines(x, y)
  lines(x, -y)
}

x <- seq(0, 3, 0.01)
c <- 0
y <- (1 - x + c) / 2 
plot(x, y, type='lines', ylim=c(-0.5,1.5))
for (c in 0:2) {
  y <- (1 - x + c) / 2 
  lines(x, y, col=c+1, lwd=2)
}
abline(h=0)
abline(v=0)

f <- function(x, y) {
  return (x^2 + y^2)
  #return (x*y - x^2)
  #return (-2*x*x + y^3/4 + x^4/2 -3/4)
  #return (sin(x*y^2+y)+2*exp(x))
}

fl <- function(x, y, fx=-2, fy=2, dx=0.1, dy=0.1) {
  return (f(x, y) + fx*dx + fy*dy)
}

f(0.1, 0.2)
fl(0, 0, 2, 1, 0.1, 0.2)
fl(0, 0, 2, 1, 0, -0.01)
fl(0, 0, 2, 1, 0.003333333, -0.006666667)


er <- function(a, p) {
  return ((a - p)/a)
}

f(-1, 1.1)
fl(-1, 1, 0, 0.1)
er(f(-1, 1.1), fl(-1, 1, 0, 0.1))

f(-0.9, 1)
fl(-1, 1, 0.1, 0)
er(f(-0.9, 1), fl(-1, 1, 0.1, 0))

f(-0.9, 1.1)
fl(-1, 1, dx=0.1, dy=0.1)
er(f(-0.9, 1.1), fl(-1, 1, dx=0.1, dy=0.1))

f(2, 1)
fl(-1, 1, 0.1, 0.1)
er(f(-0.9, 1.1), fl(-1, 1, 0.1, 0.1))

f(0,-1)
f(1,1)


library(plot3D)
M <- mesh(seq(0, 10, length.out = 100),seq(0, 10, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x^2 - y^2 #x == y #
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 10)
z1 <- x == y
surf3D(x, y, z1, colkey = FALSE, 
       box = TRUE, phi = 40, theta = 10, add=TRUE, alpha=0.2)

library(plot3D)
M <- mesh(seq(-1, 1, length.out = 100),seq(-1, 1, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- log(1-x^2 - y) #x == y #
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)

library(plot3D)
M <- mesh(seq(-1, 1, length.out = 100),seq(-1, 1, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x^2*y - 1 #x == y #
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)

x <- seq(-1,1, 0.01)
y <- 1/x^2
plot(x, y, type='lines', ylim=c(-10,10))
y <- 1/x^2
lines(x, y)
y <- -1/x^2
lines(x, y)

ti <- seq(-3, 3, 0.01)
x <- ti + asin(0)
plot(ti, x, type='lines')
for (c in seq(-1,1,0.1)){
  x <- ti + asin(c)
  lines(ti, x, col=abs(c)+1)
  x <- ti + asin(c) + 2*pi
  lines(ti, x, col=abs(c)+1)
  x <- ti + asin(c) - 2*pi
  lines(ti, x, col=abs(c)+1)
}


library(animation)
saveGIF({
  x <- seq(-6*pi, 6*pi, 0.01)
  for (t in seq(0, 10, 0.1)) {
    y <- sin(x - t)
    plot(x, y, type='line')
    y <- sin(x - 10*t)
    lines(x, y, col='red')
  }
})


library(plot3D)
M <- mesh(seq(0, 2, length.out = 100),seq(0, 2, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x*y^2 - x^3/3 #x == y #
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)
contour2D(z)

M <- mesh(seq(-10, 10, length.out = 100),seq(-10, 10, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x^2 + x  + y^2 #x == y #
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)
contour2D(z)

M <- mesh(seq(-20, 20, length.out = 100), seq(-20, 20, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x^4 + y^4 - x*y #x == y #
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)
contour2D(z)

M <- mesh(seq(-20, 20, length.out = 100), seq(-20, 20, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- y
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)
contour2D(z)


M <- mesh(seq(-2, 2, length.out = 100), seq(-2, 2, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x*y
contour2D(z)


#x <- c(0,2,4)
#y <- c(1,1,3)

#x <- c(32,64,96,118,126,144,152.5,158)  
#y <- c(99.5,104.8,108.5,100,86,64,35.3,15)

#x <- c(2004, 2006, 2008, 2010)
#y <- c(4.4, 39.41, 54.83, 50.31)

x4 <- sum(x^4)
x3 <- sum(x^3)
x2 <- sum(x^2)
x1 <- sum(x)
yx1 <- sum(y*x)
yx2 <- sum(y*x^2)
y1 <- sum(y)
A <- matrix(c(x4, x3, x2,
              x3, x2, x1,
              x2, x1, length(x)), nrow=3, byrow=TRUE)
b <- c(yx2,
       yx1,
       y1)

#coef <- pinv(A) %*% b #solve(A, b)
coef <- solve(A, b) #solve(t(A)%*%A, t(A)%*%b)
m <- lm(y ~ x + I(x^2))
coef1 <- m$coef 
pred <- predict(m, list(x=2012))
actual <- 35.17 
error <- 100*abs(actual - pred) / actual
error

coef
rev(coef1)

plot(x, y, xlim=c(min(x), max(x)), ylim=c(min(y), max(y)+10), pch=19)
xx <- seq(min(x), max(x), 0.01)
lines(xx, coef[1]*xx^2+coef[2]*xx+coef[3], col='red', lwd=3, lty=5)
lines(xx,  coef1[3]*xx^2+ coef1[2]*xx+ coef1[1], col='blue')
legend('topright', legend=c("solve", "lm"),
       col=c("red", "blue"), lty=c(5,1), lwd=c(3,1), cex=0.8,
       title="quadratic fit", text.font=4)


x <- c(1,1,2) #c(2004, 2006, 2008, 2010)
y <- c(1,3,4) #c(4.4, 39.41, 54.83, 50.31)

x <- x / 1000

x <- c(36.2, 49.8, 64.6, 98.3)	# t
y <- c(156, 175, 214, 228)      # R
x <- x / 1000
# R = wt^p
# ln(R) = ln(w) + p.ln(t)

lx <- log(x)
ly <- log(y)

m <- lm(ly~lx)
coef1 <- m$coef

p <- coef1[2]
w <- exp(coef1[1])
rho <- 1.225
w^5*rho / (4 *10^8)


plot(x, y, pch=19)
x1 <- seq(min(x), max(x), 0.01)
y1 <- w*x1^p
lines(x1, y1)

x2 <- sum(x^2)
x1 <- sum(x)
yx1 <- sum(y*x)
y1 <- sum(y)

A <- matrix(c(x2, x1,
              x1, length(x)), nrow=2, byrow=TRUE)
b <- c(yx1,
       y1)

coef <- solve(A, b)
m <- lm(y~x)
coef1 <- m$coef

exp(coef1[1])*x^coef1[2]
y

pred <- coef[1]*2014 + coef[2]
pred

predict(m, newdata=list(x=2014))

actual <- 14.38
error <- 100*abs(actual - pred) / actual
error


M <- mesh(seq(0, 2, length.out = 100), seq(0, 2, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x*y-x^2/2-y^3/3+2
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)
contour2D(z)

x <- 1.73080  #0.359229
y <- 1.43761  #0.932835
z <- x^2/3 + y^2/4 - 3*x*y + x + 2*y

(2940  - 35*24) / 200
2940 / 35

c(80*0+100*24, 80*24+100*10.5,80*24+100*0)


M <- mesh(seq(-5, 5, length.out = 1000), seq(-5, 5, length.out = 1000))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x^2-6*x+y^2-6*y+x*y
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)
contour2D(z, x=seq(-5, 5, length.out = 1000), y=seq(-5, 5, length.out = 1000))

x <- c(-1,-1,-5,-5,5,5,7,7)
y <- c(-7,7,-5,5,-5,5,-1,1)
z <- x^2-6*x+y^2-6*y+x*y


N = matrix(c(26,5,12,22,2,11,39,7,5),nrow=3)
M = matrix(c(6,4,2,0,12,0,6,0,6), nrow=3)
N %*% M

solve(matrix(c(1,0,0,-1),nrow=2))
solve(matrix(c(0,1,1,0),nrow=2))

solve(matrix(c(-1-sqrt(2),sqrt(2),-1,0),nrow=2)) %*% matrix(c(0, 0.2), nrow=2)

set.seed(123)
N <- 10000
ns <- replicate(N,
          {
            n <- 0
            nT <- 1
            nH <- 0
            while (nT != nH) {
              toss <- sample(0:1, 1, prob = c(0.3, 0.7))
              if (toss == 1) {
                nH <- nH + 1
              } else {
                nT <- nT + 1
              }
              n <- n + 1
            }
            n
          })
mean(ns)


#load library
library(stringr)

#define number of flips
n <- 10^7

#flip the coin many times
set.seed(1)
flips = sample(c(0,1), replace=TRUE, size=n)

#count the percent of times HEAD-HEAD-HEAD-HEAD appears 
str_count(paste(flips, collapse=""), '1111') / n

#count the percent tof times HEAD-HEAD-HEAD-TAIL appears
str_count(paste(flips, collapse=""), '1110') / n

n <- 100
set.seed(1)
data_frame <- data.frame(A=sample(c(T, F), n, replace = T), B=runif(n), Class=sample(0:1, n, replace = T))
model <- glm(formula = Class ~ .,data=data_frame,family = "binomial")
threshold <- 0.6
ifelse(predict(model,type="response")>threshold,1,0)
model2 <- glm(formula = Class ~ B,data=data_frame[data_frame$A == F,],family = "binomial")
ifelse(predict(model2,type="response")>threshold,1,0)
