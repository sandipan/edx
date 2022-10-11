n <- seq(1,10,1)
f <- (1/(90-n^2*pi^2))
plot(n, f, type = 'l')

library(rSymPy)  
t <- Var("t")
n <- Var("n")

sympy("integrate((t*cos(n*pi*t/2)),(t,0,1))")
sympy("integrate((1*cos(n*pi*t/2)),(t,1,2))")


(integrate(function(t) t, 0,1)$value + integrate(function(t) t/t, 1, 2)$value)/2 # a0/2
for (n in 1:5) {
  print(paste(n, integrate(function(t) t*cos(n*pi*t/2), 0,1)$value + integrate(function(t) 1*cos(n*pi*t/2), 1,2)$value)) # a_n
}

sympy("integrate((1*sin(n*pi*t/2)),(t,0,1))")
sympy("integrate((0*sin(n*pi*t/2)),(t,1,2))")

for (n in 1:5) {
  print(paste(n, integrate(function(t) sin(n*pi*t/2), 0,1)$value + 0)) # b_n
}

for (n in 1:5) {
  print(paste(n, integrate(function(t) sin(n*pi*t/2), 0,1)$value/(-n*pi/2))) # a_n
}

n <- 1:100

#integrate(function(t) sum(cos(n*t)/n)*cos(3*t), 0, pi)

integrate(function(t) cos(3*t)*cos(3*t)/3, 0, pi)

integrate(function(t) (cos(t)/1+cos(2*t)/2+cos(3*t)/3+cos(4*t)/4+cos(5*t)/5+cos(6*t)/6+cos(7*t)/7+cos(8*t)/8+cos(9*t)/9+cos(10*t)/10)*cos(3*t), 0, pi)

n <- seq(1,20,1)
f <- 1/(n*sqrt((100-n^2)^2+(0.01*n)^2))
plot(n, f, type = 'l')
