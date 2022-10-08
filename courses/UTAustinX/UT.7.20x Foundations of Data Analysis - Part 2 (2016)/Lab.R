# Week 1

# Pre Lab
library(SDSFoundations)
survey <- StudentSurvey
head(survey)
nrow(survey)
length(unique(survey$ID))
s10 <- head(survey, 10)
nrow(s10[s10$name_letters > 5,])
survey[survey$happy < 40,]$name_letters
sapply(survey, class)

#survey <- read.csv("StudentSurvey.csv")
names(survey)
head(survey)
nrow(survey)
nrow(subset(head(survey, 10), name_letters > 5))
survey[survey$happy < 40, ][1,]$name_letters
class(survey$name_letters)

round(mean(survey$name_letters),2)
sum(survey$name_letters - mean(survey$name_letters)) / length(survey$name_letters)
sum((survey$name_letters - mean(survey$name_letters))^2) / length(survey$name_letters)
sd(survey$name_letters)

# Calculate the population parameters
hist(survey$name_letters)
fivenum(survey$name_letters)
mean(survey$name_letters)
sd(survey$name_letters)

(367 - 257) / 257
e <- 76.64 * (1.46)^14
l <- 3273.31 / (1 + 43.59 * 1.57^(-14))
actual <- 4379
actual - e
actual - l

years <- c(1, 3)
wolves <- c(25, 45)
linFit(years, wolves)
expFit(years, wolves)
15 + (2002 - 1996)*10
print(linFitPred(years, wolves, 2002 - 1996))
18.6339*(1.34164)^(2002 - 1996)
print(expFitPred(years, wolves, 2002 - 1996))
actual <- 147 
a =  18.6339 
b =  1.34164 
x=log(325/a)/log(b)
18.6339*(1.34164)^(10)
C = 2000
a = 152.10
b = 2.17
C/2
log(a) / log(b)
C / (1 + a*b^(-(2010-2001)))

# Calculate the population parameters
hist(survey$name_letters)
fivenum(survey$name_letters)
mean(survey$name_letters)
sd(survey$name_letters)
# Draw 1,000 samples of n=5 and find the mean of each sample.
xbar5 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =5)
xbar5[i] <-  mean(x)}
# Graph the histogram of 1,000 sample means.
hist(xbar5,xlim=c(2,10))
# Calculate the mean and sd of the sampling distribution.
mean(xbar5)
sd(xbar5)
# Compare to the std dev predicted by the CTL.
sd(survey$name_letters)/sqrt(5)
#Repeat for samples of size n=15
xbar15 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =15)
xbar15[i] <- mean(x)}
hist(xbar15,xlim=c(2,10))
mean(xbar15)
sd(xbar15)
sd(survey$name_letters)/sqrt(15)
#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =25)
xbar25[i] <- mean(x)}
hist(xbar25,xlim=c(2,10))
mean(xbar25)
sd(xbar25)
sd(survey$name_letters)/sqrt(25)
mean(xbar15) - sd(survey$name_letters)/sqrt(15)
mean(xbar15) + sd(survey$name_letters)/sqrt(15)
#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000) {
  #x <-sample(survey$name_letters, size =25)
  x <-sample(survey$happy, size =25)
  xbar25[i] <- mean(x)
}
hist(xbar25,xlim=c(2,10))
mean(xbar25)
sd(xbar25)
sd(survey$name_letters)/sqrt(25)
mean(xbar5)
mean(xbar15)
mean(xbar25)
sd(xbar5)
sd(xbar15)
sd(xbar25)
#mean(xbar25) - sd(survey$name_letters)/sqrt(25)
#mean(xbar25) + sd(survey$name_letters)/sqrt(25)
mean(xbar25) - sd(survey$happy)/sqrt(25)
mean(xbar25) + sd(survey$happy)/sqrt(25)
round(mean(c(xbar5, xbar15, xbar25)),2)

# Lab
hist(survey$happy)
mean(survey$happy)
sd(survey$happy)
sd(survey$happy) / sqrt(5)
sd(survey$happy) / sqrt(15)
sd(survey$happy) / sqrt(25)
median(survey$happy)

# Calculate the population parameters
hist(survey$happy)
fivenum(survey$happy)
mean(survey$happy)
sd(survey$happy)
# Draw 1,000 samples of n=5 and find the mean of each sample.
xbar5 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =5)
xbar5[i] <-  mean(x)}
# Graph the histogram of 1,000 sample means.
hist(xbar5,xlim=c(0,100))
# Calculate the mean and sd of the sampling distribution.
mean(xbar5)
sd(xbar5)
# Compare to the std dev predicted by the CTL.
sd(survey$happy)/sqrt(5)
#Repeat for samples of size n=15
xbar15 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =15)
xbar15[i] <- mean(x)}
hist(xbar15,xlim=c(0,100))
mean(xbar15)
sd(xbar15)
sd(survey$happy)/sqrt(15)
#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =25)
xbar25[i] <- mean(x)}
hist(xbar25,xlim=c(0,100))
mean(xbar25)
sd(xbar25)
sd(survey$happy)/sqrt(25)
mean(xbar15) - sd(survey$happy)/sqrt(15)
mean(xbar15) + sd(survey$happy)/sqrt(15)
#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000) {
  #x <-sample(survey$happy, size =25)
  x <-sample(survey$happy, size =25)
  xbar25[i] <- mean(x)
}
hist(xbar25,xlim=c(0,100))
mean(xbar25)
sd(xbar25)
sd(survey$happy)/sqrt(5)
sd(survey$happy)/sqrt(15)
sd(survey$happy)/sqrt(25)
mean(xbar5)
mean(xbar15)
mean(xbar25)
sd(xbar5)
sd(xbar15)
sd(xbar25)


2*(pnorm(1) - 0.5)
1-pnorm(1.38)

calories <- c(180,  200,	190,	230,	80,	160,	170,
              130,	140,	220,	110,	120,	100,	170)
mean(calories)
round(48.5/sqrt(14),2)
round(1.96*48.5/sqrt(14),1)
round(mean(calories)+1.96*48.5/sqrt(14),1)
round(mean(calories)-1.96*48.5/sqrt(14),1)

# Problem Set
#survey <- read.csv("StudentSurvey.csv")
names(survey)
head(survey)
hist(survey$austin)
mean(survey$austin)
sd(survey$austin)
round(sd(survey$austin)/sqrt(10),2)
xbar10 <-rep(NA, 1000)
for (i in 1:1000) {
  x <-sample(survey$austin, size =10)
  xbar10[i] <-  mean(x)
}
hist(xbar10, xlim=c(2,14))
mean(xbar10)
sd(xbar10)

round(pnorm((3.2 - 3.08) / 0.40, lower.tail = FALSE), 3)
1- pnorm((3.2 - 3.08) / 0.40)
3.08
0.40 / sqrt(25)
(3.2 - 3.08) 
pnorm((3.2 - 3.08) / (0.40/sqrt(25))) - pnorm((2.9 - 3.08) / (0.40/sqrt(25)))

round(11/sqrt(23),2)
(35.1 - 28) / (11 / sqrt(23))
pnorm((35.1 - 28) / (11 / sqrt(23)), lower.tail=FALSE)
1 - pnorm((35.1 - 28) / (11 / sqrt(23)))

round(1.5 / sqrt(15), 3)
qnorm(0.975) * 1.5 / sqrt(15)
1.96 * 1.5 / sqrt(15)
round(471.46 - 1.96 * 1.5 / sqrt(15), 3)
round(471.46 + 1.96 * 1.5 / sqrt(15), 3)
(473.20 - 471.46) / (1.5 / sqrt(15))
  
# Week 2

qt(0.025, df=24, lower.tail=FALSE) # 5% significance level two-sided independent sample t-test
qt(0.05, df=6, lower.tail=TRUE) # 5% significance level one-sided (left) independent sample t-test

(8.12 - 8) / (0.72 / sqrt(81))
(1891 - 2000) / (251 / sqrt(25))
qnorm(0.95)
qnorm(0.975)
qt(0.975, 25-1) # 2 sided
round(59 / sqrt(7), 2)
(861 - 900) / (59 / sqrt(7))
qt(0.95, 7-1) # 1 sided

# Pre Lab
setwd('C:\\courses\\Edx\\Current\\UT.7.20x Foundations of Data Analysis - Part 2')
library(SDSFoundations)
bull <- BullRiders
bull <- read.csv('BullRiders.csv')
head(bull)
nrow(bull)

#Select bull riders from the US
USA <-bull[bull$Country=="USA",]
# Summarize the bull rider weights
mean(USA$Weight)
sd(USA$Weight)
# Visualize the weight distribution
hist(USA$Weight, main='Histogram of US Bull Rider Weights',xlab='Weight (lbs)')
# Run the single sample t-test
t.test(USA$Weight, mu=190)

#Lab
#Select bull riders from the US
riders  <-bull[bull$Events14>=5,]
mean(riders$RidePer14)
sd(riders$RidePer14)
# Visualize the weight distribution
hist(riders$RidePer14, main='Histogram of US Bull RidePercentage')
# Run the single sample t-test
t.test(riders$RidePer14, mu=0.5)

# Problem set
earnings_per <- bull$Earnings12 / bull$Events12 #with(bull, aggregate(Earnings12~Rider, FUN=mean))
hist(earnings_per)
earnings_per_log <- log(earnings_per)
hist(earnings_per_log)
m <- mean(earnings_per_log, na.rm=T)
s <- sd(earnings_per_log, na.rm=T)
round(m,2)
round(s,2)
n <- length(earnings_per_log[!is.na(earnings_per_log)])
lowerboundvalue <- m - qt(0.975, df=n-1)*s/sqrt(n)
upperboundvalue <- m + qt(0.975, df=n-1)*s/sqrt(n)
#m - qnorm(0.975)*s/sqrt(n)
#m + qnorm(0.975)*s/sqrt(n)
round(exp(lowerboundvalue))
round(exp(upperboundvalue))

# Summarize the bull rider weights
mean(bull$Weight)
sd(bull$Weight)
# Visualize the weight distribution
hist(bull$Weight, main='Histogram of Bull Rider Weights',xlab='Weight (lbs)')
# Run the single sample t-test
t.test(bull$Weight, mu=190)

mean(bull$RidePer)
sd(bull$RidePer)
(mean(bull$RidePer) - 0.5) / (sd(bull$RidePer) / sqrt(nrow(bull)))
nrow(bull) - 1
hist(bull$RidePer, main='Histogram of Bull Ride Precent',xlab='Ride Precent (lbs)')

# Run the single sample t-test
t.test(bull$RidePer, mu=0.5)

bull$avgEarningPerEvent <- bull$Earnings / bull$Events
bull$avgEarningPerEvent <- log(bull$Earnings / bull$Events)
bull <- bull[bull$Season == 2012,]
mean(bull$avgEarningPerEvent)
sd(bull$avgEarningPerEvent)
hist(bull$avgEarningPerEvent, main='Histogram of Bull avgEarningPerEvent',xlab='avgEarningPerEvent')
l <- mean(bull$avgEarningPerEvent) - qnorm(.975)*sd(bull$avgEarningPerEvent) / sqrt(nrow(bull))
u <- mean(bull$avgEarningPerEvent) + qnorm(.975)*sd(bull$avgEarningPerEvent) / sqrt(nrow(bull)) 

exp(l)
exp(u)

s <- c(29.4,      29.0,      28.4,      28.8,      28.9,      29.3,      28.5,      28.2)
mean(s)
sd(s)
round((mean(s) - 28.5) / (sd(s) / sqrt(length(s))),2)
qt(0.975, length(s)-1) # 2 sided, 95%
t.test(s, mu=28.5)

(93.6 - 91) / (7.8 / sqrt(25))
qt(0.95, 25-1) # 1 sided, 95%
(95 - 91) / (7.8 / sqrt(25))

qt(0.95, 12-1) # 2 sided, 90%
42.6 - qt(0.95, 12-1) * 5.3 / sqrt(12) 
42.6 + qt(0.95, 12-1) * 5.3 / sqrt(12) 

# Week 3

(78 - 66) / round(sqrt((12.56)^2/10 + (12.04)^2/15),2)
qt(0.95, df=10-1)
pt((78 - 66) / round(sqrt((12.56)^2/10 + (12.04)^2/15),2), df=10-1, lower.tail = FALSE)

dif <- c(-1, 1, -2, -2)
(mean(dif) - 0) / (sd(dif) / sqrt(4))
qt(0.975, 4-1)
mean(dif) - qt(0.975, 4-1) * (sd(dif) / sqrt(4))
mean(dif) + qt(0.975, 4-1) * (sd(dif) / sqrt(4))
t.test(c(79,95,85,82), c(80,94,87,84), paired = TRUE)

qchisq(0.95, 2)

# Per Lab

library(SDSFoundations)
post <- PostSurvey
head(post)

nrow(post)
head(subset(post, gender=='Male'))
first10 <- head(post, 10)
100 * sum(first10$live_campus == 'yes') / 10

#Lab Question 1
# Make a vector of happiness scores for each sample
underclass_happy <- post$happy[post$classification=='Freshman'|post$classification=='Sophomore']
upperclass_happy <- post$happy[post$classification=='Junior'|post$classification=='Senior']
# Check the normality assumption
hist(underclass_happy, xlab='Underclassman Happiness', main='Percent of Time Happy')
hist(upperclass_happy, xlab='Upperclassman Happiness', main='Percent of Time Happy')
# Run independent t-test
t.test(underclass_happy, upperclass_happy)

#Lab Question 2
# Make a vector of difference scores
post$diff_happy <- post$happy - post$post_happy
# Check the normality assumption
hist(post$diff_happy, xlab= 'Difference in Happiness over the Semester', main = 'Happy-Post Happy')
# Run dependent t-test
t.test(post$happy, post$post_happy, paired=T)

round(mean(underclass_happy), 2) 
round(mean(upperclass_happy), 2) 

nrow(post)
mean(post$diff_happy)

# Lab 
library(SDSFoundations)
post <- PostSurvey
head(post)

post$diff_hrs <- post$hw_hours_college - post$hw_hours_HS 
hist(post$diff_hrs, xlab= 'Difference in Hours', main = 'Hrs Spent')
hist(post$hw_hours_HS, col='red')
hist(post$hw_hours_college, col='green', add=T)
# Run dependent t-test
t.test(post$hw_hours_HS, post$hw_hours_college, paired=T, aalternative = 'less')
t.test(post$hw_hours_college, post$hw_hours_HS, paired=T, aalternative = 'more')
round(mean(post$diff_hrs), 2) 

greek <- post$sleep_Sat[post$greek=='yes']
non_greek <- post$sleep_Sat[post$greek=='no']
mean(non_greek) - mean(greek)
# Check the normality assumption
hist(greek, xlab='Greek', main='Sleep')
hist(non_greek, xlab='Non Greek', main='Sleep')
# Run independent t-test
t.test(greek, non_greek, alternative = 'less')
t.test(non_greek, greek, alternative = 'greater')

# Problem Set
library(SDSFoundations)
post <- PostSurvey
head(post)

diff_hrs <- post$hw_hours_college - post$hw_hours_HS
nursing <- diff_hrs[post$major=='Nursing']
biology <- diff_hrs[post$major=='Biology']
# Check the normality assumption
hist(nursing, xlab='nursing', main='diff_hrs')
hist(biology, xlab='biology', main='diff_hrs')
# Run independent t-test
t.test(nursing, biology)
#t.test(biology, nursing)

#26 + 32 - 2
min(26-1, 32-1)
qt(0.05, df=25, lower.tail=F)
qt(0.95, df=25)
se <- round(sqrt(5^2/26+6^2/32), 2)
(80 - 74) / se

df <- 16 - 1
qt(0.95, df=15) # one-sided

CPleft <- c(16.3,  4.8,  10.7,  14.0,  15.7,  9.9,  29.3,  20.4,  15.7,  7.6,  16.2,  14.7,  15.0,  8.4,  23.3,  17.7)
CPright <- c(11.5, 3.5, 12.8, 7.9, 15.2, 9.8, 24.0, 14.9, 12.6, 8.2, 8.4, 11.0, 12.5, 9.2, 17.5, 11.1)
d <- CPleft - CPright
mean(d)
mean(CPleft) - mean(CPright)
sd(d)
n <- length(d)
sqrt(sum((d-mean(d))^2)/(n-1))
se <- sd(d) / sqrt(n)
round(se, 2)
#mean(d) / se
mean(d) / round(se, 2)
mean(d) -  qt(0.95, df=n-1) * se
mean(d) +  qt(0.95, df=n-1) * se

# Week 4
8^2/30+2^2/30+6^2/30
qchisq(0.95, 3-1)
4^2/16+0^2/36+4^2/28
qchisq(0.95, 3-1)

# Pre Lab
library(SDSFoundations)
acl <- AustinCityLimits
head(acl)

#Question 1 (Goodness of Fit)
# Create a table of counts for Gender
gender_tab <-table(acl$Gender)
gender_tab
# Create vector of expected proportions
ExpGender <- c(.50, .50)
# Check expected counts assumption
chisq.test(gender_tab, p=ExpGender)$expected
# Run goodness of fit
chisq.test(gender_tab, p=ExpGender)

#Question 2 (Test of Independence)
# Create two-way table
gender_top10 <-table(acl$Gender, acl$BB.wk.top10)
gender_top10
sum(gender_top10)
nrow(acl)
nrow(acl[acl$Gender == 'M' & is.na(acl$BB.wk.top10),])
# Generate expected counts
chisq.test(gender_top10, correct=FALSE)$expected
# Run test of independence
chisq.test(gender_top10, correct=FALSE)

# Lab
library(SDSFoundations)
acl <- AustinCityLimits
head(acl)

# Goodness of Fit Test
counts <- table(acl$Genre)
exp.prop <- rep(1/4, 4)
exp.counts <- nrow(acl) * exp.prop
chisq.test(counts, p=exp.prop)
chisq.test(counts, correct=FALSE)

# Test of Independence
counts <- table(acl$Genre, acl$Twitter.100k)
counts / rowSums(counts)
chisq.test(counts)

# Problem Set
library(SDSFoundations)
acl <- AustinCityLimits
head(acl)

acl$recent <- ifelse(acl$Year %in% 2012:2013, 1, 0)
head(acl)
gender_recent <- table(acl$Gender, acl$recent)
chisq.test(gender_recent, correct=FALSE)$expected
chisq.test(gender_recent, correct=FALSE)

offsprings <- c(152,	39,	14)
props <- c(0.75, 0.15, 0.1)
props * sum(offsprings)
chisq.test(offsprings, p=props)
qchisq(0.95, 2)

genders <- c('M','M','F','M','F','F','F','M','F','F','M','F','M','M','F','M','M','F','F','M','F')
hands <- c('L','R','R','R','R','L','L','R','R','R','L','R','R','R','R','R','R','R','L','R','R')
gender_hand <- table(genders, hands)
chisq.test(gender_hand, correct=FALSE)$expected
chisq.test(gender_hand, correct=FALSE)
qchisq(0.95, 1)

#    R  S  U
# I  13 35 50 98
# N  15  7  3 25
#    28 42 53 123 
areas <- c(28, 42, 53)
internets <- c(13, 35, 50)
sum(internets) / sum(areas)
1 - sum(internets) / sum(areas)
28*98/123
53*25/123

# Week 5
#fstat = MSB / MSW
fcrit = 2.699
MSB = 19
ng = 4
n = 25*ng
SST = 117
dfB = ng - 1
dfW = n - ng
dfT = n - 1
pf(fcrit, df1=dfB, df2=dfW, lower.tail = FALSE)
SSB = MSB * dfB 
#SST = SSB + SSW
SSW = SST - SSB
MSW = SSW / dfW
fstat = MSB / MSW

0.05/(ng*(ng-1)/2) #Boferroni
1 - (1-0.05)^(ng*(ng-1)/2) # type I error prob

# Pre Lab
library(SDSFoundations)
film <- FilmData
head(film)
unique(film$Studio)
head(film[film$Studio == 'Uni.',])
min(head(film[order(film$Gross, decreasing = TRUE),], 10)$IMDB)
min(head(film, 10)$IMDB)

table(film$Rating)
#Question 1
# Calculate avg film budget of each group
aggregate(Budget~Rating,film,mean)
# Calculate sd of film budget within each group
aggregate(Budget~Rating,film,sd)
# Visualize the group means and variability
boxplot(film$Budget~film$Rating, main= "Film Budgets by Rating", ylab= "Budget", xlab= "MPAA Rating")
# Run ANOVA
modelbud <- aov(film$Budget~film$Rating)
summary(modelbud)
# Run post-hoc test if F statistic is significant
TukeyHSD(modelbud)

#Question 2
# Calculate avg IMDB score of each group
aggregate(IMDB~Rating,film,mean)
#Calculate sd of IMDB scores within each group
aggregate(IMDB~Rating,film,sd)
# Visualize the group means and variability
boxplot(film$IMDB~film$Rating, main= "IMDB Scores by Rating", ylab= "IMDB Score", xlab= "MPAA Rating")
# Run ANOVA
modelscore <- aov(film$IMDB~film$Rating)
summary(modelscore)
# Run post-hod text if F statistic is significant
TukeyHSD(modelscore)

# Lab
library(SDSFoundations)
film <- FilmData
head(film)
nrow(film)
unique(film$Studio)

library(dplyr)
film %>% group_by(Studio) %>% summarise(count=n()) 
aggregate(Days~Studio,film,length)
aggregate(Days~Studio,film,mean)
aggregate(Days~Studio,film,sd)
boxplot(film$Days~film$Studio, main= "Film Days by Studio", ylab= "Days", xlab= "Studio")
modelday <- aov(film$Days~film$Studio)
summary(modelday)
TukeyHSD(modelday)

film$Gross.Dom.Per <- 100*film$Gross.Dom / film$Gross
aggregate(Gross.Dom.Per~Studio,film,mean)
aggregate(Gross.Dom.Per~Studio,film,sd)
boxplot(film$Gross.Dom.Per~film$Studio, main= "Film Days by Studio", ylab= "Days", xlab= "Studio")
modelstud <- aov(film$Gross.Dom.Per~film$Studio)
summary(modelstud)
TukeyHSD(modelstud)

# Problem Set
film$type <- ifelse(film$Budget < 100, 'L', ifelse(film$Budget < 150, 'M', 'H'))
head(film)
table(film$type)
aggregate(Gross.Dom.Per~type,film,mean)
aggregate(Gross.Dom.Per~type,film,sd)
boxplot(film$Gross.Dom.Per~film$type, main= "Film Dom.Per by type", ylab= "Dom.Per", xlab= "type")
modeltype <- aov(film$Gross.Dom.Per~film$type)
summary(modeltype)
TukeyHSD(modeltype)

qf(0.05, 2, 42, lower.tail=FALSE)
SST <- 5949.1 
SSB <- 2387.7
SSW <- SST - SSB
dfB <- 3 - 1
dfW <- 45 - 3
fstat <- (SSB / dfB) / (SSW / dfW)
fstat

dfW <- 3*6-3
s1 <- c(8,4,6,8,6,4)
s2 <- c(3,7,0,2,7,5)
s3 <- c(1,2,7,6,5,0)
s <- c(s1, s2, s3)
SST <- sum((s - mean(s))^2)
SSB <- length(s1) * (mean(s1) - mean(s))^2 + length(s2) * (mean(s2) - mean(s))^2 + length(s3) * (mean(s3) - mean(s))^2
SSW <- sum((s1 - mean(s1))^2) + sum((s2 - mean(s2))^2) + sum((s3 - mean(s3))^2)
dfB <- 3 - 1
dfW <- length(s) - 3
MSB <- SSB / dfB
MSW <- SSW / dfW
fstat <- MSB / MSW
fstat
qf(0.05, dfB, dfW, lower.tail=FALSE)

SST <- 2147.00
SSB <- 782.00
SSW <- SST - SSB
dfB <- 3 - 1
dfW <- 34 # = n - 3
n <- dfW + 3
dfT <- n - 1
MSW <- SSW / dfW
MSB <- SSB / dfB
fstat <- MSB / 40.15 #MSB / MSW
3*(3-1)/2
0.05/3

# Week 6
# Pre Lab
library(SDSFoundations)
res <- TempskiResilience
dim(res)
head(res)
head(res[res$MS.QoL==10,])
sum(head(res$MS.QoL>5, 10))
sapply(res, class)

#Subset into the Clinical Sciences
clin <- res[res$Group == "Clinical Sciences",]

#Question One
#Intial Correlations
vars <- c("QoL", "BDI")
round(cor(clin[,vars]),3)

#RQ1 Model
ov_mod <- lm(QoL ~ BDI, data=clin)
summary(ov_mod)
confint(ov_mod)

#Diagnostics
plot(ov_mod, which=1)
cutoff <- 4/(ov_mod$df) 
plot(ov_mod, which=4, cook.levels=cutoff)

#Question Two
#Initial correlations
vars <- c("MS.QoL", "DREEM.S.SP", "DREEM.A.SP", "Resilience", "BDI", "Age")
cor(clin[,vars], use="pairwise.complete.obs")

#Test the initial correlations
library(psych)
corr.test(clin[,vars], use="pairwise.complete.obs")

#RQ2 Model
ms_mod <- lm(MS.QoL ~ DREEM.S.SP + DREEM.A.SP + Resilience + BDI + Age, data=clin)
summary(ms_mod)
confint(ms_mod)

#Diagnostics
library(car)
vif(ms_mod)
plot(ms_mod, which=1)
cutoff <- 4/(ms_mod$df) 
plot(ms_mod, which=4, cook.levels=cutoff)

#Put model into context
lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 

vars <- c('MS.QoL', 'DREEM.S.SP', 'DREEM.A.SP', 'Resilience', 'BDI', 'Age') 
head(clin[,vars])
corr.test(clin[,vars], use="pairwise.complete.obs")
#cor.test(clin[,vars])

# Lab
library(SDSFoundations)
res <- TempskiResilience
head(res)

#Subset into the Basic Sciences
basic <- res[res$Group == "Basic Sciences",]
head(basic)

#Initial correlations
vars <- c("MS.QoL", "WHOQOL.PH", "WHOQOL.PSY", "WHOQOL.SOC", "WHOQOL.ENV")
round(cor(basic[,vars], use="pairwise.complete.obs"), 4)

#Test the initial correlations
library(psych)
corr.test(basic[,vars], use="pairwise.complete.obs")

#RQ2 Model
ms_mod <- lm(MS.QoL ~ WHOQOL.PH + WHOQOL.PSY + WHOQOL.SOC + WHOQOL.ENV, data=basic)
summary(ms_mod)
confint(ms_mod)

#Diagnostics
library(car)
vif(ms_mod)
plot(ms_mod, which=1)
cutoff <- 4/(ms_mod$df) 
plot(ms_mod, which=4, cook.levels=cutoff)

#Put model into context
lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 

# Problem Set
library(SDSFoundations)
res <- TempskiResilience
head(res)
clin <- res[res$Group == "Clinical Sciences",]
#Initial correlations
vars <- c("BDI", "Female", "Age", "State.Anxiety", "Trait.anxiety")
round(cor(clin[,vars], use="pairwise.complete.obs"), 4)
#Test the initial correlations
library(psych)
corr.test(clin[,vars], use="pairwise.complete.obs")
#RQ2 Model
ms_mod <- lm(BDI ~ Female + Age + State.Anxiety + Trait.anxiety, data=clin)
summary(ms_mod)
confint(ms_mod)
#ms_full <- lm(BDI ~ ., data=clin[-c(1,3)])
#summary(ms_full)
#Diagnostics
library(car)
vif(ms_mod)
plot(ms_mod, which=1)
cutoff <- 4/(ms_mod$df) 
plot(ms_mod, which=4, cook.levels=cutoff)
#Put model into context
lmBeta(ms_mod) 
round(pCorr(ms_mod), 4) 

n <- 20
dfM <- 1
dfE <- n - 2
SSM <- 1848.76
MSM <- SSM / dfM
#fstat <- MSM / MSE
fstat <- 69.22
MSE <- MSM / fstat 
MSM / MSE
SSE <- MSE * dfE
cfC <- -23.4325
seC <- 12.74
tC <- cfC / seC
round(tC, 2)
tstatX1 <- 8.32 # cfX1 / seX1
seX1 <- 0.1528
cfX1 <- tstatX1 * seX1
cfX1 / seX1
SST <- SSM + round(SSE, 2)
SSM / SST # R^2

qf(0.05, 4, 88, lower.tail = F)
3526.4 + 1 * 722.5 + 12 * 90.02 + 10 * 1.269 + 15 * 23.406 # Man
3526.4 + 0 * 722.5 + 12 * 90.02 + 10 * 1.269 + 15 * 23.406 # Woman
