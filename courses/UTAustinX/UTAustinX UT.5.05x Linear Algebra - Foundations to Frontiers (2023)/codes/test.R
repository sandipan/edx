x <- c(-1,1,0,2)
y <- c(2,-3,0,-5)
A <- matrix(c(rep(1,4), x), nrow=4)
b <- matrix(y, ncol=1)
solve(t(A)%*%A, t(A)%*%b)
lm(y~x)

(-0.75-0.50)/2

(-0.0625+0.1) / (-0.062+0.1)

A <- matrix(c(1,1,-2,1,-1,4), ncol=2)
b <- matrix(c(1,2,7), ncol=1)
A %*% solve(t(A) %*% A, t(A) %*% b) 
b - A %*% solve(t(A) %*% A, t(A) %*% b) 

s5 <- sqrt(5)
Q <- matrix(c(-2/s5,1/s5,0,0,1/s5,-2/s5,1/s5,0,1/111/s5,1/111*(-2)/s5,1/111*(-9/s5),1/111), ncol=3)
R <- matrix(c(s5,0,0,2/s5,1/s5,0,0,4/s5,111/s5), ncol=3)
Q %*% R

A <- matrix(c(2,1,0,0,1,0,1,0,1,-2,-1,1), ncol=3)
Q <- qr.Q(qr(A))
R <- qr.R(qr(A)) #, complete=T)
