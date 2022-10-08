x=seq(0,0.5,0.01)
plot(x, 4*x*(1-x), type='l',xlim=c(0,1))
x1=seq(0.5,1, 0.01)
lines(x1, 4*(1-x1)^2)