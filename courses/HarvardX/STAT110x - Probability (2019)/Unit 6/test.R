mean(replicate(100000, {
  N <- 100
  a <- runif(1, 0, N)
  b <- runif(1, 0, N-a)
  a < N/2 & b < N/2 & a + b > N/2 & a > 0 & b > 0
  #c <- N - a - b
  #a + b > c && b + c > a && c + a > b  
}))


e = 0
n = 20
N = 23
for (k in 0:11) {
  e = e + k*choose(n,k)*2*choose(n-k,N-2*k) / choose(2*n,N)
}

n = 20
te = 0
for (N in 0:2*n) {
  e = 0
  for (k in 0:11) {
    e = e + k*choose(n,k)*2*choose(n-k,N-2*k) / choose(2*n,N)
  }  
  te = te + e*choose(2*n,N)/2^40
}


mean(replicate(1000000, {
  a <- runif(2, 0, 20)
  abs(a[1]-a[2]) > 5
}))
