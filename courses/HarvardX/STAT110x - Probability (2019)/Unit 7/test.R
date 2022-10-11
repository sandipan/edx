stationary1 <- function(P) {
  Q <- P
  i <- 1
  while (i <= 100000) {
    Q <- Q%*%P
    i <- i + 1
  }
  return(Q[1,])
}

stationary2 <- function(P) {
  n <- ncol(P)
  s_pi <- matrix(rep(1/n, n), nrow=1)
  i <- 1
  while (i <= 100000) {
    s_pi <- s_pi%*%P
    i <- i + 1
  }            
  return(s_pi)
}

stationary3 <- function(P) {
  E <- eigen(t(P))$vector
  return(t(t(E) / rowSums(t(E)))[,1])
}

P <- matrix(c(1/3,1/2,2/3,1/2), nrow=2)
P <- matrix(c(0.5,0.25,0,0,0.5,0.75,0,0,0,0,0.25,0.75,0,0,0.75,0.25), nrow=4)
P <- matrix(rep(0,7*7),nrow=7)
for (i in 1:7) {
  P[i, i%%7+1] <- 1/2
  j <- i-1
  if (j == 0) {
    j <- 7
  } 
  P[i, j] <- 1/2
}
P <- matrix(rep(0,7*7),nrow=7)
for (i in 1:7) {
  if (i == 1) {
    P[i,i+1] <- 1
  } else if (i == 7) {
    P[i,i-1] <- 1
  } else {
    P[i,i+1] = P[i,i-1] <- 1/2
  }
}
P <- matrix(c(0,1/15,1/72,2/3,6/15,16/72,1/3,8/15,55/72),nrow=3)
P <- matrix(rep(0,7*7),nrow=7)
P[1,1] <- 0.2
P[1,2] = P[1,3] <- 0.4
P[2,1] <- 0.2
P[2,4] = P[2,5] <- 0.4
P[3,1] <- 0.2
P[2,6] = P[2,7] <- 0.4
P[4,4] = P[5,5] = P[6,6] = P[7,7] <- 0.8
P[4,2] = P[5,2] = P[6,3] = P[7,3] <- 0.2

P <- matrix(rep(0,6*6),nrow=6)
P[1,1] = P[1,2] <- 0.5
P[2,1] = P[2,3] <- 0.5
P[3,3] <- 0.5
P[3,4] <- 0.3
P[3,5] <- 0.2
P[4,3] <- 0.3
P[4,6] <- 0.7
P[5,5] <- 0.8
P[5,3] <- 0.2
P[6,6] <- 0.3
P[6.4] <- 0.7

stationary1(P)
stationary2(P)
stationary3(P)