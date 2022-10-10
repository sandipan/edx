n <- 10^6
k <- 5
apply(
  replicate(n, {
  outcome <- sample(1:6, k, replace = TRUE)
  c(all(outcome == rep(6,k)),
  all(outcome == c(6,1,1,6,1)))
  }), 1, mean)

apply(
  replicate(n, {
    cards <- c(rep('B',26), rep('R',26))
    outcome <- sample(cards, 10, replace = FALSE)
    c(all(outcome == rep('B', 10)),
      all(outcome == c('B','R','R','B','R','B','R','B','R','R')))
  }), 1, mean)

prod(26:17)/prod(52:43)
prod(c(26,26,25,25,24,24,23,23,22,21))/prod(52:43)

n <- 10^7
cards <- c(rep('A',4),rep('N',48))
mean(
  replicate(n, {
    outcome <- sample(cards, 2, replace = FALSE)
    any(outcome == 'A')
  }))
13*17 - 4*47
13*17
(13*17 - 4*47)/(13*17)
33/221

1- 48*47/(52*51)


n <- 10^6
cards <- c(rep('D',13),rep('N',39))
mean(
  replicate(n, {
    outcome <- sample(cards, 2, replace = FALSE)
    ifelse(any(outcome == 'D'), 100, -10)
  }))
1310/34
15/34*100 + 19/34*(-10)
15*100 - 19*10
34

n <- 10^7
mean(
  replicate(n, {
    outcome <- sample(0:1, 10, replace = TRUE)
    coutcome <- cumsum(outcome)
    value <- 0
    if (coutcome[10] == 10) {
      value <- value + 100000
    } else if (coutcome[1] == 1) {
      value <- value + 2^1
    } else  {
      for (i in 1:9) {
         if (coutcome[i] == 0 && outcome[i+1] == 1) {
          value <- value + 2^(i+1)
          break
        }
      }
    }
    value
}))

10^5/2^10 + 10 - 1/2^9

10^5 + 10*2^10 - 2
2^10
(10^5 + 10*2^10 - 2) / 2^10


n <- 10^7
mean(
  replicate(n, {
    outcome <- sample(0:1, 10, replace = TRUE)
    coutcome <- cumsum(outcome)
    value <- 0
    if (coutcome[10] == 0) {
      value <- value + 100000
    } else if (coutcome[1] == 1) {
      value <- value + 2^1
    } else  {
      for (i in 1:9) {
        if (coutcome[i] == 0 && outcome[i+1] == 1) {
          value <- value + 2^(i+1)
          break
        }
      }
    }
    value
  }))

10^5/2^10 + 10
10^5 + 10*2^10
2^10
(10^5 + 10*2^10)/2^10
3445/32

n = 0
for (i in 1000:9999) {
  if (i %% 7 == 0 & i %% 10 == 0) {
    n  = n + 1
  }
}


n = 0
for (i in 1:1536) {
  s = paste(i)
  for (j in 1:nchar(s)) {
    if (substring(s,j,j) == '6')
      n  = n + 1
  }
}

N <- 100000
n <- 100
nums <- replicate(N, {
  num <- 0
  for (i in 1:n) {
    #if (sample(0:1, 1) == 1) {
    if (runif(1) > 0.5) {
        num <- num + 2^(-i)
    }
  }
  #num
  sqrt(num)
})
hist(nums, breaks = seq(0,1,2^(-(n+1))), probability = TRUE)
hist(nums, breaks = seq(0,1,0.001), probability = TRUE)

N <- 100000
n <- 10
nums <- replicate(N, {
  num <- 0
  for (i in 1:n) {
    O <- sample(0:1, prob=c(1/5,4/5))
    E <- sample(0:1, prob=c(1/8,7/8))
    if (i %% 2 == 0 && E == 1) {
      num <- num + 2^(-i)
    } else if (i %% 2 == 1 && O == 1) {
      num <- num + 2^(-i)
    }
  }
  num
  #sqrt(num)
})
mean(nums < 1/2)
mean(nums > 15/16)
hist(nums, breaks = seq(0,1,2^(-(n+1))), probability = TRUE)

n <- 100 #15 #10
nums <- replicate(N, {
  num <- 0
  for (i in 1:n) {
    if (sample(0:1, 1) == 1) {
      num <- num + 2^(-i)
    }
  }
  num
  #sqrt(num)
})
mean(nums %in% 2^(-(1:n)))

primes = c(2,3,5,7,11,13,17,19,23,29)

turing2code <- function(str) {
  str <- gsub('_','0',str)  
  str <- gsub('r','0',str)  
  str <- gsub('\\*','1',str)  
  str <- gsub('l','2',str)  
  code <- 1
  for (i in 1:nchar(str)) {
    d <- as.integer(substr(str, i, i))
    code <- code * primes[i] ^ (d+1)
  }
  code
}

turing2code('111*0')
turing2code('11_*0')
turing2code('1_1*0')
turing2code('0__l0')
turing2code('01_r0')
