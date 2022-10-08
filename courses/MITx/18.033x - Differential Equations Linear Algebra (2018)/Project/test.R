a <- 3
b <- 1
x <- seq(-1,4, 0.1)
x1 <- (a - b*x)*x
plot(x, x1, type='l')
abline(v=c(0,3))
abline(h=0)


t <- 1000
x <- 100
y <- 100

a <- 1 #0.5
b <- 1 #2
eta <- 1e-4
lx <- c(x)
ly <- c(y)
for (i in 1:t) {
  x1 <- (x - x^2 - a*x*y)
  y1 <- (3*y - 2*y^2 - b*x*y)
  x <- x + eta*x1
  y <- y + eta*y1
  lx <- c(lx, x)
  ly <- c(ly, y)
}
plot(0:t, ly, type='l')
lines(0:t, lx, col='red')

x <- seq(-1, 5, len=200)
y <- seq(-1, 5, len=200)
r <- outer(x, y, FUN=function(i,j) {i - j^2 - a*i*j})
contour(r, drawlabels = FALSE)


library(ggquiver)
#expand.grid(x=seq(0,pi,pi/12), y=seq(0,pi,pi/12)) %>%
#  ggplot(aes(x=x,y=y,u=cos(x),v=sin(y))) +
#  geom_quiver()

expand.grid(x=seq(0,2,0.1), y=seq(0,2,0.1)) %>%
  ggplot(aes(x=x,y=y,u=x-x^2-a*x*y,v=3*y-2*y^2-b*x*y)) +
  geom_quiver(vecsize=NULL)


# 1,0
sapply(seq(0,2,0.1), function(x) x-x^2)
sapply(seq(-1,1,0.1), function(y) 3*y-2*y^2-b*y)

# 0,3/2
sapply(seq(-0.1,1,0.1), function(x) x-x^2-a*x*3/2)
sapply(seq(0,5/2,0.1), function(y) 3*y-2*y^2)

t <- seq(0,10,.01)
plot(t,1.5/(1+exp(-3*t)),type='l',col='red', ylim=c(0,2))
lines(t,1.5*1/(1+exp(-t)),col='green')