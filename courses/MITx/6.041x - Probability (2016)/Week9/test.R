x=0:100
plot(0, xlim=c(0, 100), ylim=c(0,1))
for (k in seq(1, 100, 20)) {
  lines(x, x^(k-1)*exp(-x)/factorial(k-1))  
}
