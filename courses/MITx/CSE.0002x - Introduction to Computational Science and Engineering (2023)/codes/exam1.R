library(ggplot2)
df <- data.frame(dt=c(0.2,0.1), emax=c(0.01,0.005))
ggplot(df, aes(x=dt, y=emax)) + coord_trans(y ='log10', x='log10') + geom_point() + geom_line() + 
  xlim(1e-2, 1) + ylim(1e-5, 1)

solve(matrix(c(2,-1,3,0,5,7,0,0,-4), nrow=3, byrow=T), c(6,6,8))

f <- function(x) {
  return (x^4 - 3*x^3 + 3*x^2 - 3*x + 2)
}

df <- function(x) {
  return (4*x^3 - 9*x^2 + 6*x - 3)
}

Newton <- function(x0, f, df, niter=100) {
  xs <- c()
  x <- x0  # Set Newton initial solution to u0
  for (k in 1:niter) {
    x <- x - f(x) / df(x)
    xs <- c(xs, x)
  }
  return (xs)
}

Newton(1.5, f, df)
Newton(2.5, f, df)