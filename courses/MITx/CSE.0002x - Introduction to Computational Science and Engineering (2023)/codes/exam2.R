alpha <- 0.02
x <- c(0.6, 0.2)
gradJ(x)

gradJ <- function(x) {
    return (c(2*pi*cos(2*pi*x[1]),-2*pi*sin(2*pi*x[2])))
}
x <- x - alpha*gradJ(x)
x

x <- c(0.6, 0.2)
for (i in 1:100) {
  x <- x - alpha*gradJ(x)
  print(x)
}

N <- 10000
res <- replicate(N, {
  x <- ifelse(runif(1) < 0.25, runif(1), runif(1, 10, 11))
  x
})
hist(res)
mean(res)
sd(res)

31/4
sqrt(301/4 - (31/4)^2)


N <- 10000
res <- replicate(N, {
  x <- c()
  for (i in 1:1000) {
    x <- c(x, ifelse(runif(1) < 0.25, runif(1), runif(1, 10, 11)))
  }
  mean(x)
})
hist(res)

mean(res)
sd(res)
quantile(res, c(0.025, 0.975))

m <- 31/4
se <- 3^(5/2)/4 / sqrt(1000)
c(m - 1.96*se, m + 1.96*se)
quantile(res, c(0.001, 0.995))



N <- 10000
res <- replicate(N, {
  mean(rnorm(1000, 8, 0.4))
})
hist(res)

mean(res)
sd(res)
quantile(res, c(0.025, 0.975))
quantile(res, c(0.001, 0.995))

m <- 8
se <- 0.4 / sqrt(1000)
c(m - 1.96*se, m + 1.96*se)
