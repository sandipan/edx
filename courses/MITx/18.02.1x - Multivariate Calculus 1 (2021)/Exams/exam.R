matrix(c(-1,-3),nrow=1)%*%matrix(c(3,-1),ncol=1)

crossvec <- function(x,y){
  if(length(x)!=2 |length(y)!=2) stop('bad vectors')
  cv <-  x[1]*y[2]-x[2]*y[1]
  return(invisible(cv))
}

print(crossvec(c(-3,1), c(-2,1)))

library(rSymPy)  
x <- Var("x")
y <- Var("y")
sympy("diff(1/(2*x**2-3*y**2), x, y, 1)") 
sympy("diff(x*y**3-x**2*y-x+5, x, 1)") 
sympy("diff(x*y**3-x**2*y-x+5, y, 1)") 

x <- 2 #2.01
y <- 1
y^3-2*x*y-1
3*x*y^2-x^2
x*y^3-x^2*y-x+5

matrix(c(-3,-6,8,7),nrow=2)%*%c(5, 3)

A <- matrix(c(9,-8,-10,9),nrow=2)
solve(A)
A %*% solve(A)
solve(A, c(-9,9))


library(plot3D)
#M <- mesh(seq(1.995, 2.005, 0.005),seq(-1.005, -0.995, 0.005))
M <- mesh(seq(1.5, 2.5, 0.005),seq(0.5, 1.5, 0.005))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
z <- x*y^3-x^2*y-x+5  #x^2 + x*y + y^2 -3*x #x*y^3-x^2*y-x+5 # #x*y^3- x^2*y -x + 5 #abs(x) - abs(y) #2*x^2+y^2 #x^2 + 2*y^2 #x - y #x == y #
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)
contour2D(z, x=seq(1.5, 2.5, 0.005), y=seq(0.5, 1.5, 0.005))#, levels=seq(-5,0,0.01))

M <- mesh(seq(-3, 3, length.out = 100),seq(-3, 3, length.out = 100))
x <- M$x  
y <- M$y
contour2D(x^2-x*y+2*y^2,x=seq(-3, 3, length.out = 100),y=seq(-3, 3, length.out = 100), levels=seq(0,8, 2))
abline(8/5,3/5)
abline(h=1)
abline(v=-1)

M <- mesh(seq(-3, 3, length.out = 100),seq(-3, 3, length.out = 100))
#M <- mesh(seq(2.18, 2.19, length.out = 100),seq(1.74, 1.75, length.out = 100))
x <- M$x  
y <- M$y
contour2D(x^2+x*y+y^2,x=seq(-3, 3, length.out = 100),y=seq(-3, 3, length.out = 100), levels=seq(-8,8, 1))
contour2D(2*x-y,x=seq(-3, 3, length.out = 100),y=seq(-3, 3, length.out = 100), levels=seq(28/sqrt(21)-12, 28/sqrt(21), 1), add=TRUE)
#contour2D(x^2+x*y+y^2,x=seq(2.18, 2.19, length.out = 100),y=seq(1.74, 1.75, length.out = 100))
#contour2D(2*x-y,x=seq(2.18, 2.19, length.out = 100),y=seq(1.74, 1.75, length.out = 100), add=TRUE)
28/sqrt(21)

x <- -2 + 0.01
y <- 1 #- 0.01
z <- x*y^3- x^2*y -x + 5
z

x0 <- 2
y0 <- 3
dx <- 0.1
dy <- 0.1
x0 / y0
(x0 + dx) / (y0 + dy)
6.1/9
fx <- 1/y0
fy <- -x0 / y0^2
x0/y0 + fx*dx + fy*dy


library(plot3D)
M <- mesh(seq(0, 5, length.out = 100),seq(0.1, 5, length.out = 100))
x <- M$x  
y <- M$y
#x <- seq(-5,5,0.1)
#y <- seq(-5,5,0.1)
surf3D(x, y, x/y, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120)
z <- 2/3 + x/3 - 2*y/ 9#x/y #x == y #
surf3D(x, y, z, colvar = z, colkey = TRUE, 
       box = TRUE, bty = "b", phi = 40, theta = 120, add=TRUE)
contour2D(z)

m <- -Inf
mx <- -Inf
my <- -Inf
for (x in seq(0,2.3,1000)) {
  #for (y in seq(-5,5,1000)) {
    #if (all.equal(x^2+x*y+y^2-4, 0, tolerance=0.1) == TRUE) {
    y <- (-x - sqrt(16-3*x^2)) / 2
    if (2*x-y > m) {
        mx <- x
        my <- y
        m <- 2*x-y
    }
    y <- (-x + sqrt(16-3*x^2)) / 2
    if (2*x-y > m) {
      mx <- x
      my <- y
      m <- 2*x-y
    }
    #}
  #}
}

x <- c(-1,1,0)
y <- c(1,-1,2)
lm(y~x)
plot(x, y)
abline(2/3, -1)

t = seq(0,2,0.01)
x = 2*t
y = t^2
plot(x, y)
abline(-1,1)

L = 2
theta = pi/4
x = sqrt(2)*cos(theta)+L*cos(2*theta)
y = sqrt(2)*sin(theta)+L*sin(2*theta)
x_L = cos(2*theta)
x_theta = -sqrt(2)*sin(theta)-2*L*sin(2*theta)
y_L = sin(2*theta)
y_theta = sqrt(2)*cos(theta)+2*L*cos(2*theta)
M = matrix(c(x_L, x_theta, y_L, y_theta), nrow=2, byrow=TRUE)
M
solve(M, c(0.1, 0))

x
y
sqrt(2)*cos(theta-0.02)+(L+0.02)*cos(2*(theta-0.02))
sqrt(2)*sin(theta-0.02)+(L+0.02)*sin(2*(theta-0.02))

sqrt(2)*cos(theta)+(L+0.2)*cos(2*(theta))

sqrt(2)*cos(theta)+(L+0.02)*cos(2*(theta))
sqrt(2)*sin(theta)+(L+0.02)*sin(2*(theta))

sqrt(2)*cos(theta+0.01)+(L)*cos(2*(theta+0.01))
sqrt(2)*sin(theta+0.01)+(L)*sin(2*(theta+0.01))
