# Prob 3
pnorm(0.6*sqrt(6), lower.tail=F)

#simulation
usamp <- function() {
S <- 0
for (i in 1:50) { S <- S + runif(1, -0.5, 0.5)}
S
}
mean(replicate(10000, usamp())>=3)
hist(replicate(10000, usamp()))

th <- 100
esamp <- function() {
  w <- rexp(10, 1)
  x <- th + w
  thc <- min(x)  
  thc
}
n <- 10000
thc <- replicate(n, esamp())
#mean(thc)
#c <- qnorm(0.95)*sd(thc)
c <- qexp(.95) / 10
#mean((thc - th)) # & (th <= thc))
#qexp(.95)
mean((thc - c <= th)) # & (th <= thc))
hist(thc - th)

dpois(3, 1.5)
mean(replicate(100000, {rexp(11, 8)[11]}))
library(Rlab)
mean(replicate(100000, {r <- rexp(1, 8); b <- rbern(1, 3/8); if(b == 0) NA else r}), na.rm=T) #b <- rbinom(1, 0, 3/8)}))

dbinom(5, 7, 3/8) #21*3^5*25/8^7
