# Week 1

z <- c(1:4)
z*200+3
z*rep(200,4)+rep(3,4)
my_matrix <- matrix(1:6, nrow=3, byrow = TRUE)
names_of_students <- c("lisa", "juan", "diana")
0/0
NA+1
age <- c(12,28,35,27,NA,25,32,45,31,23,NA,34)
age[-c(5,11)]
age[!is.na(age)]
age[c(1,2,3,4,6,7,8,9,10,12)]
age[c(-5,-11)]
m <- matrix(paste(letters,1), nrow=2)
sapply(m, class)
v <- c(1,'a','b', 2.0)
class(v)


# Week 2

p_C <- 0.01
p_pos_C <- 0.94 #0.85
p_pos_Cbar <- 0.04 #0.05
p_pos <- p_pos_C * p_C + p_pos_Cbar * (1-p_C)
p_C_pos <- p_pos_C * p_C / p_pos

P_I_FS <- 0.8 
P_I_O <- 0.5
P_FS <- 2/7
P_O <- 1 - P_FS
P_FS_I = P_I_FS*P_FS / (P_I_FS*P_FS + P_I_O*P_O)

1/(1+0.05*(1-0.019)/(0.99*0.019))

p_pos_zbar <- 0.05
p_pos_z <- 0.99

pr <- 0.001
post <- 0.001

for (test in 1:5) {
  prior <- post
  post <- round(1 / (1 + p_pos_zbar * (1 - prior) / (p_pos_z * prior)),3)
  print(paste('test', test, 'posterior:', post))
}

my_binomial <- rbinom(1000,size=8,prob=0.2)
hist(my_binomial)
my_binomial <- rbinom(1000,size=8,prob=0.5)
k <- 0:8
cdf <- rep(0.0, times=9)
for (i in 0:8) {
  j <- i + 1
  cdf[j] <- (sum(my_binomial <= i)/1000)
}
plot(cdf, type='l')
lines(pbinom(0:8,size=8,prob=0.5), col='red', lty=2)


res <- replicate(1000, {
  x <- rbinom(100000, size=8, prob=0.5)
  y <- rbinom(100000, size=8, prob=0.2)
  sum(x+y==0)/100000
})
mean(res)

round((1-0.5)^8 * (1-0.2)^8,6)
dbinom(0, size=8, prob=0.5) * dbinom(0, size=8, prob=0.2)

library(scatterplot3d)
x <- rbinom(1000, size=8, prob=0.5)
y <- rbinom(1000, size=8, prob=0.2)
k <- c(rep(0:8, times=9),rep(0:8, each=9))
k <- matrix(k, ncol=2, byrow=FALSE)
z <- k[,1] + k[,2]
cdf <- rep(0.0, times=81)
for (i in 1:81) {
  cdf[i] <- sum(x+y <= z[i]) / 1000
}
scatterplot3d(k[,1], k[,2], cdf, highlight.3d = TRUE, col.axis = 'blue', pch=20, xlab='x', yab='y', zlab='x+y')

# Week 3

choose(13,5)*choose(39,5)/choose(52,10)
pnorm(1)
qnorm(pnorm(0.75,lower.tail=TRUE),lower.tail=TRUE)
pnorm(qnorm(2.1, lower.tail=TRUE)) 
qnorm(0.20, 500, 10.6)
qnorm(0.80, 500, 10.6)

setwd('C:\\courses\\Edx\\Current\\MITx 14.310x Data Analysis for Social Scientists\\Week3')
library(utils)
gender_data <- read.csv('GenderStat_Data.csv')
teenager_fr <- subset(gender_data, Indicator.Code == "SP.ADO.TFRT") 
rm(gender_data)
names(teenager_fr)
mean(teenager_fr$X1975, na.rm = TRUE)
round(mean(teenager_fr$X1960, na.rm = TRUE),2)
round(sd(teenager_fr$X1960, na.rm = TRUE),2)
round(mean(teenager_fr$X2000, na.rm = TRUE),2)
round(sd(teenager_fr$X2000, na.rm = TRUE),2)

sort(unique(teenager_fr$Country.Code))
low_income <- subset(teenager_fr, Country.Code=='LIC')
middle_income <- subset(teenager_fr, Country.Code=='MIC')
high_income <- subset(teenager_fr, Country.Code=='HIC')

plot_frame <- matrix(NA, 5, 55)
for (i in 5:59) {
  k <- i - 4
  j <- i + 1955
  plot_frame[1, k] <- j
  plot_frame[2, k] <- mean(teenager_fr[,i], na.rm=TRUE)
  plot_frame[3,k] <- low_income[,i]
  plot_frame[4,k] <- middle_income[,i]
  plot_frame[5,k] <- high_income[,i]
}
xlim <- range(c(plot_frame[1,]))
ylim <- range(c(plot_frame[2,],plot_frame[3,],plot_frame[4,],plot_frame[5,]))
plot(plot_frame[1,], plot_frame[2,], type='l', col='black', xlim=xlim, ylim=ylim, main='Evolution of Adolescent Fertility Rate',
     xlab='year', ylab='rate')
lines(plot_frame[1,],plot_frame[3,],col='red')
lines(plot_frame[1,],plot_frame[4,],col='blue')
lines(plot_frame[1,],plot_frame[5,],col='yellow')

p1 <- hist(teenager_fr$X1960)
p2 <- hist(teenager_fr$X2000)
plot(p2, col=rgb(1,0,1,1/4),xlim=c(0,250),main='Change in the Contribution', xlab='values')
plot(p1, col=rgb(0,0,1,1/4),xlim=c(0,250),add=TRUE)
legend('topright', ncol=2, legend=c('2000', '1960'), fill=c(rgb(1,0,1,1/4),rgb(0,0,1,1/4)),text.width=20)
png('histogram')

?hist # break

p1 <- hist(teenager_fr$X1960, freq=FALSE, breaks=20)
p2 <- hist(teenager_fr$X2000, freq=FALSE, breaks=20)
p1$counts <- p1$density
p2$counts <- p2$density
p3 <- density(teenager_fr$X1960, na.rm=TRUE)
p4 <- density(teenager_fr$X2000, na.rm=TRUE)
plot(p2, col=rgb(1,0,1,1/4),xlim=c(0,250),main='Change in the Contribution', xlab='values')
plot(p1, col=rgb(0,0,1,1/4),xlim=c(0,250),add=TRUE)
lines(p4, col=rgb(1,0,1,1/4),xlim=c(0,250),lwd=5)
lines(p3, col=rgb(0,0,1,1/4),xlim=c(0,250),lwd=5)
legend('topright', ncol=2, legend=c('2000', '1960'), fill=c(rgb(1,0,1,1/4),rgb(0,0,1,1/4)),text.width=20)

?density
plot(density(c(-20, rep(0,98), 20), bw=0.1), xlim = c(-4, 4), col='blue')  # IQR = 0
lines(density(c(-20, rep(0,98), 20), bw=1), xlim = c(-4, 4), col='red')  # IQR = 0

par(mfrow=c(1,2))
plot(ecdf(teenager_fr$X1960))
plot(ecdf(teenager_fr$X2000), col='blue')

# Week 4

rm(list = ls())
library(utils)
library(plot3D)
M <- mesh(seq(0,1,length=100),seq(0,1,length=100))
x <- M$x
y <- M$y
z <- 6/5*(M$x+M$y^2)
persp3D(x,y,z,xlab='X variable',ylab='Y variable',zlab='Z variable')

n <- 3 #10
cols <- palette(rainbow(n))
x <- seq(0,1,0.01)
plot(x, y=(x+1)/(1/2+1), col=cols[1], type='l')
for (y in 2:n) {
  lines(x, y=(x+y^2)/(1/2+y^2), col=cols[y])
}

M <- mesh(seq(0,1,length=100),seq(0,1,length=100))
x <- M$x
y <- M$y
z <- (M$x+M$y^2) / (1/2+M$y^2)
persp3D(x,y,z,xlab='X variable',ylab='Y variable',zlab='Z variable')
library(rgl)
plot3d(x,y,z,xlab='X variable',ylab='Y variable',zlab='Z variable', col=rainbow(12))

y <- 1/2
integrate(function(x) (x+y^2)/(1/2+y^2), 0, 1/2)

x <- seq(0,1,0.01)
plot(x, (3*x^2+2*x)/5, col='red', type='l')
y <- seq(0,1,0.01)
lines(y, (3*y+2*y^3)/5, col='green')

y <- seq(0,1,0.01)
plot(y, 6/5*(1/2+y^2), col='green', type='l')
x <- seq(0,1,0.01)
lines(x, 6/5*(x+1/3), col='red')

n <- 5
plot(0, 0, xlim=c(0,n+1), ylim=c(0,1))
for (i in 1:n) {
  points(i, max(runif(i)),col='red', pch=19)
  points(i, min(runif(i)), col='blue', pch=8)
}

### test qnorm for conversion of distribution

# Week 5
for (n in seq(2,10,2)) {
  # posted price
  p <- (1/(n+1))^(1/n) # optimal price
  #print(round(p,2))
  #print(round(1-p^n,2)) # probability
  #print(round(round(p,2)*round(1-p^n,2),2)) # expected profit
  # auction
  print(round((n-1)/(n+1),2))
}

#dbinom(0, size=8, prob=0.4) #(0.6)^8
dbinom(2, size=8, prob=0.4)
8*0.4

0.4*2
0.4^2*1.5 + 0.4*0.6*2

2/25

#####
rm(list=ls())
number_of_bidders <- 2
number_of_simulations <- 1000
set.seed(1)
valuations1 <- matrix(runif(number_of_bidders*number_of_simulations, min=0, max=1), nrow=number_of_simulations)

n <- 2
p <- (1/(n+1))^(1/n) # optimal price
p*(1-p^n)

max(valuations1)

#####
number_of_bidders <- 2
N <- number_of_bidders
V <- 10 #10000

er <- c()
tr <- c()
for (V in c(10,100,1000,10000)) {

  set.seed(5)
  valuations <- matrix(runif(N*V, min=0, max=1), nrow=V)
  maximum_valuation <- apply(valuations, 1, max)
  optimal_price <- 1/((N+1)^(1/N))
  expected_revenue <- (N/(N+1))*1/((N+1)^(1/N))
  
  revenue <- optimal_price*(maximum_valuation >= optimal_price)
  er <- c(er, mean(revenue))
  tr <- c(tr, expected_revenue)
}

plot(er, type='l')
lines(tr, col='red')

n <- 2
(n-1)/(n+1)

pp <- c()
a <- c()
# Week 5
for (n in 1:10) {
  # posted price
  p <- (1/(n+1))^(1/n) # optimal price
  pp <- c(pp, p*(1-p^n)) # expected profit
  # auction
  a <- c(a, (n-1)/(n+1))
}
plot(pp, pch=19)
points(a, pch=19, col='red')

#####
setwd('C:/courses/Edx/Current/MITx 14.310x Data Analysis for Social Scientists/Week5')
df <- read.csv('Cartier+3-day+auctions.csv')
dim(df)
length(unique(df$auctionid))

cartier_data <- read.csv('Cartier+3-day+auctions.csv')
cartier_data$auctionid <- as.character(cartier_data$auctionid)
unique_bids <- unique(cartier_data$auctionid)
ratio <- rep(NA, times=length(unique_bids))
number_of_bidders <- rep(NA, times=length(unique_bids))
number_of_bids <- rep(NA, times=length(unique_bids))
for (i in 1:length(unique_bids)) {
  temp <- subset(cartier_data, cartier_data$auctionid == unique_bids[i]) 
  bid2 <- temp$bid[rank(temp$bid, ties.method='first') == length(temp$bid)-1]
  bid3 <- temp$bid[rank(temp$bid, ties.method='first') == length(temp$bid)-2]
  ratio[i] <- bid2 / bid3
  number_of_bidders[i] <- length(unique(temp$bidder))
  number_of_bids[i] <- length(temp$bid)
}
data_clean <- data.frame(unique_bids, ratio, number_of_bidders, number_of_bids)
#dim(cartier_data)[1] == sum(data_clean$number_of_bids)

mean(data_clean$ratio)
median(data_clean$number_of_bidders)
max(data_clean$number_of_bids)

plot(data_clean$number_of_bids / data_clean$number_of_bidders, type = 'l')
lines(data_clean$ratio, col='red')

#####
integrate(function(x) x*(3/2)*(x-1)^2, 0, 2)
integrate(function(x) x*2*x^(2-1), 0, 1)

# Week 6
100 * (1-0.15) / 0.15

s <- sample(c(rep(1, 100-6), rep(0,6)), 100)
K <- 32 #22 #12 #5
mean(replicate(10^6, all(sample(s, K)==1)))

for (K in 1:52) {
  p <- choose(6,0)*choose(94,K)/choose(100,K) + choose(6,1)*choose(94,K-1)/choose(100,K)
  print(paste(K,p))
}

for (lambda in c(6,7,8,9)) {
  print(paste(lambda, 1-exp(-lambda)*(1+lambda)))
}

plot(dpois(1:100, 10))
points(dpois(1:100, 20), col='red')
points(dpois(1:100, 30), col='blue')

300 + 10*10-100*0.5+50*1
300 + 10*8-100*1/2 +50*1/4
312.5 + 10*8 -100*1/2

# Week 7
10 + qnorm(0.025)*2
10 - qnorm(0.025)*2

k <- 1.65
2*(1-pnorm(k))

1-pnorm(k)
1-pnorm(2*k/5, sd=2/5)

2*(1-pnorm(2*k/5, sd=2/5))
2*(1-pnorm(5*k/2, sd=2/5))
1-pnorm(2*k/5, sd=2/5)

# Week 8
beta <- 0.9
gamma <- 0.5
alpha <- 0.05
tau <- 1 # incorrect
sigma <- 0.5 # incorrect
(qnorm(beta) + qnorm(1-alpha/2))^2 / (tau^2*gamma*(1-gamma)/sigma^2)

# Week 9
r <- 2
n <- 500
k <- 4
qf(0.05/2, df1=r,df2=n-(k+1), lower.tail=FALSE)
SSR_R <- 198.3
SSR_U <- 183.2
((SSR_R-SSR_U)/r)/(SSR_U/(n-(k+1)))  
  
setwd('C:/courses/Edx/Current/MITx 14.310x Data Analysis for Social Scientists/Week9')
df <- read.csv('nlsw88.csv')
head(df)

m <- lm(lwage ~ yrs_school, df)
confint(m, level = 0.9)
sum(residuals(m))
mean(df$yrs_school)
mean(df$lwage)
predict(m, newdata=data.frame(yrs_school=mean(df$yrs_school)))

m <- lm(lwage ~ black, df)
m
mean(df$lwage[df$black==0]) # beta0
mean(df$lwage[df$black==1])-mean(df$lwage[df$black==0]) # beta1
summary(m)

m <- lm(lwage ~ yrs_school+ttl_exp, df)
m
summary(m)

df$school_exp <- df$yrs_school + 2*df$ttl_exp
m2 <- lm(lwage ~ school_exp, df)
m2
anova(m, m2)
anova(m2, m)

# Week 10
#linearHypothesis
1.038206 - 0.315742
0.002893 - (-0.300283)
0.002893 - (-0.300283) - 0.203320

setwd('C:/courses/Edx/Current/MITx 14.310x Data Analysis for Social Scientists/Week10')
df <- read.csv('fastfood.csv')
head(df)
sum(df[df$state==0,]$empft)
library(dplyr)
df %>% group_by(state) %>% summarise(n=n())
df %>% group_by(state,chain) %>% summarise(s=mean(empft))
df %>% group_by(state) %>% summarise(s=mean(empft))
10.31579 - 7.71519

lm(empft ~ state, df)
summary(lm(wage_st ~ state, df))
#4.62863     -0.02123
summary(lm(empft2-empft ~ state, df))

library(rdd)
df <- read.csv('indiv_final.csv')
#nrow(df[df$myoutcomenext==1,]) / nrow(df) # sum(df$myoutcomenext) / length(df$myoutcomenext)
sum(df$difshare > 0) / nrow(df)
res <- DCdensity(df$difshare, ext.out=TRUE)
names(res)
round(res$theta,4)
res$p

df1 <- df[abs(df$difshare) <= 0.50, ]
df1$difshare_gt_0 <- +(df1$difshare > 0)
m1 <- lm(myoutcomenext ~ difshare_gt_0, df1)
m2 <- lm(myoutcomenext ~ difshare_gt_0 + difshare, df1)
m3 <- lm(myoutcomenext ~ difshare_gt_0 + difshare + difshare_gt_0 : difshare, df1)
m4 <- lm(myoutcomenext ~ difshare_gt_0 + difshare + I(difshare^2), df1)
m5 <- lm(myoutcomenext ~ difshare_gt_0 + difshare + I(difshare^2) + difshare_gt_0 : difshare + difshare_gt_0 : I(difshare^2), df1)
m6 <- lm(myoutcomenext ~ difshare_gt_0 + difshare + I(difshare^2) + I(difshare^3), df1)
m7 <- lm(myoutcomenext ~ difshare_gt_0 + difshare + I(difshare^2) + I(difshare^3) + difshare_gt_0 : difshare + difshare_gt_0 : I(difshare^2) + difshare_gt_0 : I(difshare^3), df1)
summary(m1)$coef
summary(m2)$coef
summary(m3)$coef
summary(m4)$coef
summary(m5)$coef
summary(m6)$coef
summary(m7)$coef

res <- RDestimate(myoutcomenext ~ difshare, df1) 
names(res)
res$est
par(mfrow=c(1,3))
plot(res)
res$est <- res$est[-1]
res$bw <- res$bw[-1]
res$se <- res$se[-1]
res$z <- res$z[-1]
res$p <- res$p[-1]
res$obs <- res$obs[-1]
res$ci <- res$ci[-1,]
plot(res)
res$est <- res$est[-1]
res$bw <- res$bw[-1]
res$se <- res$se[-1]
res$z <- res$z[-1]
res$p <- res$p[-1]
res$obs <- res$obs[-1]
res$ci <- res$ci[-1,]
plot(res)


# Week 11
n <- 11 #10
X <- matrix(rnorm(10*n), nrow=10)
y <- rnorm(10)
solve(t(X)%*%X)
lm(y~X)

# Week 12
library(car)
library(rdd)
setwd('C:/courses/Edx/Current/MITx 14.310x Data Analysis for Social Scientists/Week12')
df <- read.csv('census80.csv')
head(df)
summary(df)
df$IV1 <- ifelse(df$ageq2nd == df$ageq3rd, 1, 0)
df$IV1[is.na(df$IV1)] <- 0
sum(df$IV1==1, na.rm = TRUE) / nrow(df)
df$IV2 <- ifelse(df$sex1st == df$sex2nd, 1, 0)
sum(df$IV2==1, na.rm = TRUE) / nrow(df)
df$c3 <- +(!is.na(df$ageq3rd))
m <- lm(weeksm ~ c3 + blackm + hispm + othracem, data=df)
lm <- lm(workedm ~ c3 + blackm + hispm + othracem, data=df)

m1 <- lm(c3 ~ IV1 + blackm + hispm + othracem, data=df)
m2 <- lm(c3 ~ IV2 + blackm + hispm + othracem, data=df)

m3 <- lm(workedm ~ IV1, data=df)

ivreg(workedm ~ c3 + blackm + hispm + othracem | IV1 + blackm + hispm + othracem, data=df)
ivreg(workedm ~ c3 + blackm + hispm + othracem | IV2 + blackm + hispm + othracem, data=df)



# final

((1+15)/2)/32 + (1/0.05)/40 + 0.1*0.80
mean(runif(10000,1,15)) / 32 + mean(rexp(10000,0.05)) / 40 + 0.1 * 0.80

1 - pnorm(22, 20, 3)
#1 - pnorm((22-20)/3)

(1 - pnorm(22, 20, 3))^3

# wrong: integrate(function(x) pnorm(x,12,2)*(1-pnorm(x,20,3)), -Inf, Inf)
1 - pnorm(0, 20-12, sqrt(9+4))
N <- 100000
mean(rnorm(N, 20, 3) > rnorm(N, 12, 2))

#integrate(function(x) dnorm(x,12,2), -Inf, Inf)

tstat <- -0.0081/0.0024
-0.0081 - qnorm(0.05)*0.0024
-0.0081 + qnorm(0.05)*0.0024

4.3 + qnorm(.025)*sqrt(2.7)/sqrt(10)
4.3 - qnorm(.025)*sqrt(2.7)/sqrt(10)

4.3 + qt(.025, 10-1)*sqrt(2.7)/sqrt(10)
4.3 - qt(.025, 10-1)*sqrt(2.7)/sqrt(10)

4.3 + qt(.025, 10-1)*sqrt(2.7)/sqrt(10)
4.3 - qt(.025, 10-1)*sqrt(2.7)/sqrt(10)

for (n in 10:50)
print(paste(n, -2*qt(.025, n-1)*sqrt(2.7)/sqrt(n)))
-2*qnorm(.025)*sqrt(2.7)/sqrt(44)
-2*qnorm(.025)*sqrt(2.7)/sqrt(43)
-2*qnorm(.025)*sqrt(2.7)/sqrt(42)
-2*qnorm(.025)*sqrt(2.7)/sqrt(41)

ct <- matrix(c(85, 99, 100, 76, 26, 45, 97, 72), 2, 4, byrow=TRUE,
              dimnames = list(income = c("Treatment", "Control"),
                              region = c("R1", "R2", "R3", "R4")))
summary(fisher.test(ct, conf.int=TRUE))

perms <- chooseMatrix(8,4)
A <- matrix(c(.85, .99, 1, .76, .26, .45, .97, .72), nrow=8, ncol=1, byrow=TRUE)
treatment_avg <- (1/4)*perms%*%A
control_avg <- (1/4)*(1-perms)%*%A
test_statistic <- abs(treatment_avg-control_avg)
rownumber <- apply(apply(perms, 1, 
                         function(x) (x == c(0, 1, 0, 0, 0, 1, 1, 1))), 
                   2, sum)
rownumber <- (rownumber == 8)
observed_test <- test_statistic[rownumber == TRUE]
#*change information here for students
larger_than_observed <- (test_statistic >= observed_test)
#numbers in which the statistic exceeds the value in the observed data
sum(larger_than_observed)
df <- data.frame(perms,control_avg,treatment_avg,test_statistic)
52/70

0.80 - 0.58
(1.2^2/4000)*(2.3^2/4000)

#*change information here for students
larger_than_observed <- (test_statistic >= observed_test)
#numbers in which the statistic exceeds the value in the observed data
sum(larger_than_observed)
df <- data.frame(perms,control_avg,treatment_avg,test_statistic)


#*change information here for students
larger_than_observed <- (test_statistic >= observed_test)
#numbers in which the statistic exceeds the value in the observed data
sum(larger_than_observed)
df <- data.frame(perms,control_avg,treatment_avg,test_statistic)

#x <- rnorm(100)
#y <- rnorm(100)
#summary(lm(y~x))$coef
#confint(lm(y~x))
#tstat <- 0.01533641/0.1097563
#tstat + qt(.025, 100-2)*0.1097563
#tstat - qt(.025, 100-2)*0.1097563

setwd('C:/courses/Edx/Current/MITx 14.310x Data Analysis for Social Scientists/Final')
df <- read.csv('qian.csv')
head(df)
nrow(df)
summary(df)
df$post <- ifelse(df$biryr >= 1979, 1, 0)
sum(df$post==1)
df$post_teasown <- df$post*df$teasown
mean(df$post_teasown)
m <- lm(sex ~ teasown + post + post_teasown, data=df)
summary(m)
summary(lm(sex ~ teasown + post + post:teasown, data=df))
round(m$coefficients, 3)
round(summary(m)$coef, 3)
round(summary(m)$r.squared, 3)
summary(lm(sex ~ post + post:teasown, data=df))
summary(lm(sex ~ post + post_teasown, data=df))
