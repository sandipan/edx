term <- function(A, n) {
  if (n == 0) {
    return(1) # I2
  } else {
    R = diag(2)
    d <- 1
    for (i in 1:n) {
      R = (R %*% A)  
      d = d * i
    }
    #return(c(R[1,2], d, R[1,2]/d))
    return(R[1,2]/d)
  }
}

A=matrix(c(3,0,2,3),nrow=2)
vterm <- Vectorize(term, "n")
sum(vterm(A, 0:200))

#term(A, 10)