ra <- 80/60
ta <- 1/ra
rp <- 100/60
tp <- 1/rp
CVa <- 65/80
CVp <- 35/100
u <- ra/rp # utilization
tq <- tp*(CVa^2+CVp^2)*u/(2*(1-u)) # expected waiting time
CT <- tp + tq # expected cycle time
WIP <- ra*CT # expected no of orders with Little's law
WIPq <- ra*tq # expected no of orders in the queue


ra <- 35/60
ta <- 1/ra
rp <- 45/60
tp <- 1/rp
CVa <- 1
CVp <- 1
u <- ra/rp # utilization
tq <- tp*(CVa^2+CVp^2)*u/(2*(1-u)) # expected waiting time
CT <- tp + tq # expected cycle time
WIP <- ra*CT # expected no of orders with Little's law
WIPq <- ra*tq # expected no of orders in the queue

library(triangle)
nk <- 8 #4 #6 #8 #16
wt.times <- replicate(1000, {
  ar.times <- cumsum(rexp(1000, 0.5))
  freetimes <- rep(0, nk)
  wt.times <- c()
  for (ar.time in ar.times) {
    next.time <- min(freetimes)
    j <- which.min(freetimes)
    if (next.time <= ar.time) {
      wt.times <- c(wt.times, 0)
    } else {
      wt.times <- c(wt.times, next.time - ar.time)
    }
    tp <- rtriangle(1, 0.5, 15, 5)
    freetimes[j] <- ar.time + tp
  }
  mean(wt.times)
})
mean(wt.times)
