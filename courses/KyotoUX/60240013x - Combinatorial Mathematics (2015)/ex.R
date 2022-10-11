numPath <- function(m, n) {
  B <- matrix(rep(1, m*n), ncol=n, byrow=T)
  i <- 2
  while (i <= m) {
    j <- 2
    while (j <= n) {
      B[i,j] <- B[i-1,j] + B[i, j-1]
      j = j + 1
    }
    i = i + 1
  }
  return(B[m,n])
}

print(numPath(3,4)*numPath(4,6)) # OA -> AP
print(numPath(3,4)*numPath(4,5)) # OA -> AB -> BP
print(numPath(3,4)*numPath(2,4)*numPath(3,3)) # OA -> AC -> CP


polMult <- function(pol1, pol2, max = NA) {
  h <- hash(0, 0)
  for (d1 in keys(pol1)) {
    for (d2 in keys(pol2)) {
      sumdeg <- as.character(as.integer(d1) + as.integer(d2))
      prodcoeff <- as.integer(pol1[[d1]]) * as.integer(pol2[[d2]])
      #print(paste(d1, d2, sumdeg, pol1[[d1]], pol2[[d2]], prodcoeff))  
      #required <- is.na(max) | (sumdeg <= max)
      #if (required) {
        if (!has.key(sumdeg, h)) {
          h[sumdeg] <- 0
        }
        h[sumdeg] <- as.integer(h[[sumdeg]]) + prodcoeff
      #}
    }
  }
  return(h)
}

#polMult(polMult(hash(c(0, 1), c(1, 1)), hash(c(0, 1), c(1, 1))), hash(c(0, 1), c(1, 1)))
#polMult(polMult(hash(c(0, 1, 2, 3), c(1, 3, 3, 1)), 
#                hash(c(0, 2, 4, 6, 8), c(1, 4, 6, 4, 1))), 
#                hash(c(0, 4, 8), c(1, 2, 1)))
polMult(polMult(hash(c(0, 1, 2, 3), c(1, 1, 1, 1)), 
                hash(c(0, 2, 4, 6, 8), c(1, 1, 1, 1, 1))), 
                hash(c(0, 4, 8), c(1, 1, 1)))
polMult(hash(0:10, rep(1,11)), 
                hash(seq(0, 10, 2), rep(1, 6)))

partition <- function(n) {
  res <- hash(0, 1)
  for (i in 1:n) {
    j <- 0
    pow <- c()
    while (j <= n) {
      pow <- c(pow, j)
      j <- j + i
    }
    pol <- hash(pow, rep(1, length(pow)))
    #print(pol)
    res <- polMult(res, pol) #, n)
    print(res)
    print(res[[as.character(i)]])
  }
  #print(res)
  #return(res[[as.character(n)]])
}

partition(10) #100)

n <- 20
f <- c(1,1)
for (i in 3:n) {
  f[i] <- f[i-1] + f[i-2]
}
print(f)
for (i in 2:(n-1)) {
  print(f[i]^2 - f[i+1]*f[i-1])
}

numsol = 0
for (x1 in 1:6){
  for (x2 in 0:7){
    for (x3 in 4:8){
      for (x4 in 2:6){
        if (x1 + x2 + x3 + x4 == 20) {
          numsol = numsol + 1
        }     
      }
    }
  } 
}
print(numsol)

numsol = 0
for (x1 in 0:20){
  for (x2 in 0:20){
    for (x3 in 0:20){
      for (x4 in 0:20){
        if (x1 + x2 + x3 + x4 == 20) {
          numsol = numsol + 1
        }     
      }
    }
  } 
}
print(numsol)

count <- 0
for (n in 1:1000) {
  if (n %% 3 != 0 & n %% 5 != 0 & n %% 7 != 0) {
    count <- count + 1
  }
}
print(count)
#1000-(333+200+142-66-47-28+9)

count <- 0
for (n in 1:1000) {
  if (n %% 3 != 0 & n %% 5 != 0 & n %% 7 != 0 & n %% 2 == 0) {
    count <- count + 1
  }
}
print(count)