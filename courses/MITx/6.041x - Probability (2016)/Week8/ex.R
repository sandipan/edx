toss.num.Heads <- function(n, p) {
  return(sum(ifelse(runif(n)<=p, 'H', 'T')=='H'))
}

num.iter <- 10000
n <- 50
p <- 0.4
heads <- c()
for (i in 1:num.iter) {
  heads <- c(heads, toss.num.Heads(n, p))
}
p <- 0.6
for (i in 1:num.iter) {
  heads <- c(heads, toss.num.Heads(n, p))
}
hist(heads)
mean(heads)
var(heads)
hist(heads, probability = TRUE)
points(seq(0,n,0.1),dnorm(seq(0,n,0.1), mean=25, sd=6))
lines(seq(0,n,0.1),dnorm(seq(0,n,0.1), mean=25, sd=6))

mn <- c()
sn <- 0
for (i in 1:10000) {
  sn <- sn + runif(1, -1,1)
  mn <- c(mn, sn / i)
}
plot(mn)

mn <- c()
sn <- 0
for (i in 1:10000) {
  sn <- max(sn, runif(1, -1,1))
  mn <- c(mn, sn)
}
plot(mn)

mn <- c()
sn <- 0
for (i in 1:10000) {
  sn <- sn * runif(1, -1,1)
  mn <- c(mn, sn)
}
plot(mn)
