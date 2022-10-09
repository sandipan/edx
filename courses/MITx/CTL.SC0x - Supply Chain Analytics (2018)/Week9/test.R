setwd('C:\\Courses\\Edx\\Current\\MITX Supply Chain\\Week9')
df <- read.csv('dryer.csv')
names(df) <- c('x', 'y')
summary(lm(y~x, df))
predict(lm(y~x, df), data.frame(x=31))

df <- read.csv('res.csv')
obs <- apply(df[-1], 1, mean)
ex <- c(15,30,30,30,15,15,15)
chi2 <- sum((obs-ex)^2/ex)
pchisq(chi2, length(obs)-1, lower.tail = FALSE)
res <- chisq.test(x=obs, p=ex/sum(ex), correct = FALSE)
res$statistic
res$p.value
res$observed
res$expected

mean(replicate(200, {mean(apply(cbind(round(rnorm(1000, 220, 50)),round(runif(1000, 170,300))), 1, min))}))
qnorm(0.975)*sd(replicate(200, {mean(apply(cbind(round(rnorm(1000, 220, 50)),round(runif(1000, 170,300))), 1, min))}))/sqrt(200)
qt(0.975,200-1)*sd(replicate(200, {mean(apply(cbind(round(rnorm(1000, 220, 50)),round(runif(1000, 170,300))), 1, min))}))/sqrt(200)
hist(replicate(200, {mean(apply(cbind(round(rnorm(1000, 220, 50)),round(runif(1000, 170,300))), 1, min))}), xlab='mean', main='Histogram')
qnorm(0.975)*sd(replicate(200, {mean(apply(cbind(rnorm(1000, 220, 50),runif(1000, 170,300)), 1, min))}))/sqrt(200)


mean(replicate(200, {mean(apply(cbind(round(rnorm(1000, 900, 200)),round(runif(1000, 500, 1200))), 1, min))}))
qnorm(0.99)*sd(replicate(200, {mean(apply(cbind(round(rnorm(1000, 900, 200)),round(runif(1000, 500, 1200))), 1, min))}))/sqrt(200)
qt(0.99,200-1)*sd(replicate(200, {mean(apply(cbind(round(rnorm(1000, 900, 200)),round(runif(1000, 500, 1200))), 1, min))}))/sqrt(200)
hist(replicate(200, {mean(apply(cbind(round(rnorm(1000, 900, 200)),round(runif(1000, 500, 1200))), 1, min))}), xlab='mean', main='Histogram')
qnorm(0.99)*sqrt(199/200)*sd(replicate(200, {mean(apply(cbind(round(rnorm(1000, 900, 200)),round(runif(1000, 500, 1200))), 1, min))}))/sqrt(200)
qnorm(0.99)*sd(replicate(200, {mean(apply(cbind(rnorm(1000, 900, 200),runif(1000, 500, 1200)), 1, min))}))/sqrt(200)

