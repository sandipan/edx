setwd("C:\\courses\\Edx\\Current\\UT Analytics Part I")

# Lab 1
#Assign the value 6+2 to x
x <- 6+2

BikeData <- read.csv("BikeData.csv")
head(BikeData,7)
head(BikeData,10)
sum(head(BikeData,10)$cyc_freq == "Daily")
table(BikeData$student)
student <-BikeData[BikeData$student==1,]
head(student)
dim(student)
table(student$cyc_freq)
distance <-student$distance
distance
mean(distance)
BikeData[8,7]
BikeData[,7]
employed<-BikeData[BikeData$employed=='1',]
employed_distance<-BikeData$distance[BikeData$employed=='1']

library(SDSFoundations)
bike <- BikeData
head(bike)

# Import the BikeData dataset, name it "bike"
# Find the number of students in the dataset
table(bike$student)
# Pull out student data into a new dataframe
student <-bike[bike$student==1,]
nrow(student)
ncol(student)
# Find how often the students ride, using the new dataframe
table(student$cyc_freq)
# Create a vector for the distance variable
distance <-student$distance
# Find average distance ridden
round(mean(distance),2)
length(distance)

bike[7,]$age
sum(bike[1:10,]$cyc_freq == 'Daily')
bike[bike$gender == 'F' & bike$cyc_freq == 'Less than once a month',]$speed
sapply(bike, class)
unique(bike$student)
males <- bike [bike$gender == 'M',]
nrow(bike[bike$cyc_freq == 'Daily',])
nrow(bike[bike$cyc_freq == 'Daily'& bike$gender == 'M',])
round(mean(bike[bike$cyc_freq == 'Daily',]$age),1)
round(mean(bike[bike$cyc_freq == 'Daily' & bike$gender == 'F',]$age),1)
round(mean(bike[bike$cyc_freq == 'Daily' & bike$gender == 'M',]$age),1)
thirty <- bike[bike$age >= 30,]
nrow(subset(thirty, gender == 'M' & cyc_freq == 'Daily'))

# Lab 2
AnimalData <- read.csv("AnimalData.csv")
head(AnimalData)
names(AnimalData)
library(lattice)
xyplot(Days.Shelter~Aggressive, AnimalData,
            main="Lattice",
            xlab="Aggressive",
            ylab="Days.Shelter")
library(ggplot2)
ggplot(AnimalData, aes(Aggressive, Days.Shelter),
       main="ggplot",
       xlab="Aggressive",
       ylab="Days.Shelter") + geom_point()
ggplot(AnimalData, aes(Outcome.Type, Age.Intake),
       main="ggplot",
       xlab="Outcome.Type",
       ylab="Age.Intake") + geom_point()

Dogs <- subset(AnimalData, Animal.Type=='Dog' & Age.Intake >= 1)
Cats <- subset(AnimalData, Animal.Type=='Cat' & Age.Intake >= 1)
par(mfrow=c(1,2))
hist(Dogs$Weight)
hist(Cats$Weight)
nrow(Dogs)
nrow(Cats)
round(mean(Cats$Weight),1)
round(sd(Cats$Weight),2)
zcat <- round((13-mean(Cats$Weight))/sd(Cats$Weight), 1)
round(1-pnorm(zcat),3)
quantile(Dogs$Weight)
summary(Dogs$Weight)
summary(Cats$Weight)
round(mean(Dogs$Weight),1)
round(sd(Dogs$Weight),2)
mean(Cats$Weight)+qnorm(.975)*sd(Cats$Weight)
mean(Cats$Weight)-qnorm(.975)*sd(Cats$Weight)
mean(Cats$Weight)+qnorm(.99)*sd(Cats$Weight)
mean(Cats$Weight)-qnorm(.99)*sd(Cats$Weight)
sort(Dogs$Weight)

tbl <- table(AnimalData[AnimalData$Animal.Type=='Dog',]$Intake.Type)
round(tbl['Owner Surrender'] / sum(tbl), 3)
nrow(AnimalData[AnimalData$Animal.Type=='Dog' & 
           AnimalData$Intake.Type=='Owner Surrender' & 
           AnimalData$Outcome.Type=='Return to Owner',])
mean(AnimalData[AnimalData$Animal.Type=='Dog' & 
                  AnimalData$Intake.Type=='Owner Surrender' & 
                  AnimalData$Outcome.Type=='Return to Owner',]$Days.Shelter)
barplot(table(Dogs$Intake.Type))

animaldata <- read.csv("AnimalData.csv")
head(animaldata)
names(animaldata)
dim(animaldata)
sum(animaldata[1:10,]$Outcome.Type == 'Adoption')
unique(animaldata$Intake.Type)
unique(animaldata$Outcome.Type)
head(animaldata[animaldata$Intake.Type == 'Owner Surrender',]$Neutered.Status)
sapply(animaldata, class)
hist(animaldata$Days.Shelter)

#Find the number of animals that were adopted
table(animaldata$Outcome.Type)

#Pull out only adopted animals
adopted <- animaldata[animaldata$Outcome.Type=="Adoption",]

#Pull out just the days in shelter for the adopted animals
daystoadopt <- adopted$Days.Shelter

#Visualize and describe this variable
hist(daystoadopt)
fivenum(daystoadopt)
mean(daystoadopt)
sd(daystoadopt)
which(animaldata$Days.Shelter==max(daystoadopt))
median(daystoadopt)
IQR(daystoadopt)
quantile(daystoadopt)
#max(daystoadopt) - min(daystoadopt)
max.sheltered <- sort(daystoadopt, decreasing=TRUE)[1]
animaldata[which(animaldata$Days.Shelter==max(daystoadopt)),]
round((max.sheltered - mean(daystoadopt)) / sd(daystoadopt), 2)

tot <- 100 * 6 / 15
(85 / 100) * tot
(55 / 100) * tot
barplot(c(20,20,15,15,15,10,5))
cumsum(c(20,20,15,15,15,10,5))

# (6 + C) / 2 = 6.5 
# E - 2 = 16
# A = 2
# (2 2 3 B 6) (7 9 D 15 18)
# D - 3 = 10
# (2 2 3 B 6) (7 9 13 15 18)
8*10 - (2+2+3+6+7+9+13+15+18)

6.7 + 1.1*(-1.5)
1-pnorm((4.5 - 6.7) / 1.1)
pnorm((8.79 - 6.7) / 1.1) - pnorm((5.38 - 6.7) / 1.1)

# qnorm(0.5+0.68/2)
pnorm(1) - pnorm(-1)
7.5 - 1.1 * 1
7.5 + 1.1 * 1
# qnorm(0.5+0.95/2)
pnorm(1.96) - pnorm(-1.96)
7.5 - 1.1 * 1.96
7.5 + 1.1 * 1.96
qnorm(0.5+0.997/2)
7.5 - 1.1 * 2.967738
7.5 + 1.1 * 2.967738

# Lab 3

# Pre-Lab
bull <- read.csv("BullRiders.csv")
nrow(bull)
head(bull)
nrow(subset(head(bull, 10), YearsPro>=10))
subset(head(bull, 10), YearsPro>=10)
subset(bull, Rider == 'Joao Ricardo Vieira')

#Subset for riders that participated in at least one event in 2013
new_bull <- bull[bull$Events13  >= 1,]
plot(new_bull$Rides13,new_bull$Top10_13)
head(new_bull)
nrow(new_bull)
length(unique(new_bull$Rider))
cor(new_bull$Rides13,new_bull$Top10_13)
# Create a correlation matrix
vars <-c("Top10_13", "Rides13")
cor(new_bull[,vars])
plot(bull$Events12, bull$BuckOuts12)
abline(lm(bull$Events12~bull$BuckOuts12))
abline(lm(bull$BuckOuts12~bull$Events12))

# Visualize and describe the first variable of interest
hist(new_bull$Rides13)
fivenum(new_bull$Rides13)
median(new_bull$Rides13)
mean(new_bull$Rides13)
sd(new_bull$Rides13)
# Visualize and describe the second variable of interest
hist(new_bull$Top10_13)
fivenum(new_bull$Top10_13)
median(new_bull$Top10_13)
mean(new_bull$Top10_13)
sd(new_bull$Top10_13)
# Create a scatterplot
plot(new_bull$Rides13,new_bull$Top10_13)
# Add line of best fit
abline(lm(new_bull$Top10_13~new_bull$Rides13))
# Calculate the correlation coefficient
round(cor(new_bull$Rides13,new_bull$Top10_13), 3)
# Create a correlation matrix 
vars <- c("Top10_13", "Rides13")
cor(new_bull[,vars])
#identify a specific record
new_bull[which(new_bull$Top10_13==2 & new_bull$Rides13==22),]



#library(SDSFoundations)
#bull <- BullRiders
bull <- read.csv("BullRiders.csv")
nrow(bull)
names(bull)
head(bull)
bull10 <- bull[1:10,]
nrow(bull10[bull10$YearsPro > 10,])
bull10[order(bull10$BuckOuts),]
sapply(bull, class)
round(mean(bull$RidePer),2)
nrow(bull[bull$RidePer>.6,])
round(cor(bull$RidePer,bull$Top10),3)
cor(bull[,c("RidePer", "Top10")])
plot(bull$RidePer,bull$Top10)
m <- lm(bull$Top10~bull$RidePer)
abline(m$coef[1], m$coef[2])
m$coef[1] + 0.53 * m$coef[2]
bull[which(bull$Top10==5 & bull$RidePer==.53),]
apply(bull[bull$RidePer>.5,][-1],2,mean)
hist(bull$Earnings)
#summary(bull$Earnings)
mean(bull$Earnings)
max(bull$Earnings)
median(bull$Earnings)
plot(bull$RidePer,bull$Earnings)
cor(bull$RidePer,bull$Earnings)
plot(bull$CupPoints,bull$Earnings)
cor(bull$CupPoints,bull$Earnings)
bull[which(bull$Earnings == max(bull$Earnings)),]
m <- lm(bull$Earnings~bull$CupPoints)
abline(m$coef[1], m$coef[2])
nooutlier <-bull[-1,]
plot(nooutlier$RidePer,nooutlier$Earnings)
cor(nooutlier$RidePer,nooutlier$Earnings)
plot(nooutlier$CupPoints,nooutlier$Earnings)
cor(nooutlier$CupPoints,nooutlier$Earnings)
bull$RidesPerEvent <- bull$Rides/bull$Events
hist(bull$RidesPerEvent)
summary(bull$RidesPerEvent)

bull$RidesPerEvent <- bull$Rides/bull$Events
hist(bull$RidesPerEvent)
fivenum(bull$RidesPerEvent)
plot(bull$RidesPerEvent, bull$Place)
m <- lm(bull$Place~bull$RidesPerEvent)
abline(m$coef[1], m$coef[2])
cor(bull$RidesPerEvent, bull$Place)
1 - 0.75^2

library(SDSFoundations)
bull <- BullRiders
#Subset for riders that participated in at least one event in 2013
new_bull <- bull[bull$Events13  >= 1,]
# Visualize and describe the first variable of interest
hist(new_bull$Rides13)
fivenum(new_bull$Rides13)
mean(new_bull$Rides13)
sd(new_bull$Rides13)
# Visualize and describe the second variable of interest
hist(new_bull$Top10_13)
fivenum(new_bull$Top10_13)
mean(new_bull$Top10_13)
sd(new_bull$Top10_13)
# Create a scatterplot
plot(new_bull$Rides13,new_bull$Top10_13)
# Add line of best fit
abline(lm(new_bull$Top10_13~new_bull$Rides13))
# Calculate the correlation coefficient
cor(new_bull$Rides13,new_bull$Top10_13)
# Create a correlation matrix 
vars <- c("Top10_13", "Rides13")
cor(new_bull[,vars])

# Lab
bull <- read.csv("BullRiders.csv")
nrow(bull)
head(bull)
new_bull12 <- subset(bull, Events12 >= 1)
library(ggplot2)
ggplot(new_bull12, aes(Earnings12)) + geom_histogram()
round(median(new_bull12$Earnings12))
round(max(new_bull12$Earnings12))
plot(new_bull12$Earnings12, new_bull12$RidePer12)
cor(new_bull12$Earnings12, new_bull12$RidePer12)
plot(new_bull12$Earnings12, new_bull12$CupPoints12)
cor(new_bull12$Earnings12, new_bull12$CupPoints12)
which(new_bull12$Earnings12 == max(new_bull12$Earnings12))
new_bull12[which(new_bull12$Earnings12 == max(new_bull12$Earnings12)), ]
#identify(new_bull12$RidePer12, new_bull12$Earnings12, pos=TRUE)
nooutlier <- new_bull12[new_bull12$Earnings12 < 1000000 ,] 
plot(nooutlier$Earnings12, nooutlier$RidePer12)
cor(nooutlier$Earnings12, nooutlier$RidePer12)
plot(nooutlier$Earnings12, nooutlier$CupPoints12)
cor(nooutlier$Earnings12, nooutlier$CupPoints12)


# Problem Set
bull <- read.csv("BullRiders.csv")
new_bull <- subset(bull, bull$Rides14 >= 1)
head(new_bull)
RidesPerEvent14 <- new_bull$Rides14/new_bull$Events14
hist(RidesPerEvent14)
fivenum(RidesPerEvent14)
plot(RidesPerEvent14, new_bull$Rank14)
cor(RidesPerEvent14, new_bull$Rank14)

1-0.75^2

mins <-   c(30, 45, 180, 95, 130, 140, 30, 80, 60, 110, 0, 80)
grades <- c(74, 68, 87,  90, 94,  84,  92, 88, 82, 93, 65, 90)
cor(mins, grades)
cor(mins, grades)^2 # % variance explained
plot(mins, grades)

mins <-   c(30, 45, 180, 95, 130, 140, 80, 60, 110, 0, 80)
grades <- c(74, 68, 87,  90, 94,  84,  88, 82, 93, 65, 90)
cor(mins, grades)



# Lab 4
acl <- read.csv("AustinCityLimits.csv")
library(SDSFoundations)
acl <- AustinCityLimits
head(acl)
nrow(acl)
nrow(subset(head(acl, 10), Grammy == 'Y'))
subset(acl, Gender == 'F' & Age > 60)$Genre
sapply(acl, class)

# Pre-Lab
gender <- table(acl$Gender)
#Subset the data for artists age 30 or older
older <-acl[acl$Age>=30,]
# Create tables of marginal distributions
genre <- table(older$Genre)
genre
gender <- table(older$Gender)
gender
# Create contingency table 
twoway <- table(older$Gender,older$Genre)
twoway
# Visualize the counts
barplot(twoway, legend=T, beside=T)
barplot(twoway, legend=T)
# Calculate P(A): the probability of each genre being played
prop.table(genre)
sum(prop.table(genre))
# Calculate P(A|B): the probability of each genre being played, given the artist's gender
prop.table(twoway,1)

# Lab
acl <- AustinCityLimits
males <- subset(acl, Gender=='M')
nrow(males)
nrow(subset(males, Grammy=='Y'))
nrow(subset(males, Grammy=='N'))
table(males$Genre, males$Grammy)
round(prop.table(table(males$Grammy)), 3)
round(prop.table(table(males$Genre, males$Grammy), 1), 3)
#round(prop.table(table(males$Genre, males$Grammy), 2), 3)
#barplot(table(males$Grammy, males$Genre), legend=T, beside=T)
barplot(round(prop.table(table(males$Grammy, males$Genre), 2), 3), legend=T, beside=T)

# Problem set
acl <- AustinCityLimits
head(acl)
nrow(subset(acl, Facebook.100k>=1))
#with(acl, tapply(Facebook.100k, Age.Group, function(x) sum(Facebook.100k>=1)))
library(dplyr)
df1 <- acl %>% filter(Facebook.100k>=1) %>% group_by(Age.Group) %>% summarise(count=n())
df2 <- acl %>% group_by(Age.Group) %>% summarise(count=n())
df2$prop <- round(df1$count / df2$count, 3)
df2

#library(sqldf)
#sqldf('select Age.Group, count(*) from acl where Facebook.100k>=1 group by Age.Group')
#aggregate(Facebook.100k~Age.Group, acl, sum)

gender <- table(acl$Gender)
#Subset the data for artists age 30 or older
older <-acl[acl$Age>=30,]
# Create tables of marginal distributions
genre <- table(older$Genre)
genre
gender <- table(older$Gender)
gender
# Create contingency table 
twoway <- table(older$Gender,older$Genre)
twoway
# Visualize the counts
barplot(twoway, legend=T, beside=T)
barplot(twoway, legend=T)
# Calculate P(A): the probability of each genre being played
prop.table(genre)
sum(prop.table(genre))
# Calculate P(A|B): the probability of each genre being played, given the artist's gender
prop.table(twoway,1)


nrow(acl[acl$Grammy == 'Y',])
nrow(acl[acl$Grammy == 'N',])
nrow(acl)
g <- acl[acl$Grammy == 'Y',]
sort(table(g$Genre), decreasing=TRUE)
nrow(acl[acl$Grammy == 'Y',]) / nrow(acl)

nrow(acl[acl$Genre == 'Singer-Songwriter' & acl$Grammy == 'Y',])
nrow(acl[acl$Genre == 'Singer-Songwriter',])
5 / 49
nrow(acl[acl$Genre == 'Country' & acl$Grammy == 'Y',]) / nrow(acl[acl$Genre == 'Country',])
nrow(acl[acl$Genre == 'Jazz/Blues' & acl$Grammy == 'Y',]) / nrow(acl[acl$Genre == 'Jazz/Blues',])
nrow(acl[acl$Genre == 'Rock/Folk/Indie' & acl$Grammy == 'Y',]) / nrow(acl[acl$Genre == 'Rock/Folk/Indie',])
nrow(acl[acl$Genre == 'Singer-Songwriter' & acl$Grammy == 'Y',]) / nrow(acl[acl$Genre == 'Singer-Songwriter',])
unique(acl$Genre)

nrow(acl[acl$Facebook.100k == 1,])
nrow(acl[acl$Facebook > 100000,])
sort(table(acl[acl$Facebook.100k == 1,]$Age.Group), decreasing=TRUE)

for (g in unique(acl$Age.Group)) {
  print(g)
  print(nrow(acl[acl$Age.Group == g & acl$Facebook.100k == 1,]) / nrow(acl[acl$Age.Group == g,]))  
}

sg <- as.data.frame(matrix(c(5,	10,	9,	10,	6, 8,  10,	9,	7,	4, 11,  5,	4,	4,	2, 9,  9,	4,	2,	0), 
                              nrow=4, ncol=5, byrow=TRUE))
names(sg) <- c('A',  'B',	'C',	'D',	'F')
rownames(sg) <- c('Freshman',  'Sophomore',	'Junior',	'Senior')
colSums(sg)
sum(sg)
colSums(sg) / sum(sg)
sum(sg[rownames(sg) %in% c('Junior', 'Senior'),]) / sum(sg)
sg[rownames(sg) == 'Freshman',] / sum(sg[rownames(sg) == 'Freshman',])
sg / sum(sg)
# sg[rownames(sg) == 'Sophomore',] / sum(sg)
1 - sg[rownames(sg) == 'Junior',][5] / sum(sg[rownames(sg) == 'Junior',])
sum(sg[rownames(sg) == 'Senior',])  / sum(sg)
sg['D'] / sum(sg['D']) # sum(sg['D'] / sum(sg['D']))
0.15 / 0.35
round(rowSums(sg) / sum(sg), 2)

mg <- as.data.frame(matrix(c(50*.12,  80*.35,  50*.34,  80*.25, 50*.30,  80*.325,  50*.24,  80*.075), nrow=4, byrow=TRUE))
rownames(mg) <- c('Action', 'Comedy', 'Horror', 'Romance')
names(mg) <- c('Women', 'Men')
mg / sum(mg)
m1 <- as.matrix(rowSums(mg) / sum(mg))
m2 <- as.matrix(colSums(mg) / sum(mg))
m1 %*% t(m2)
m1 %*% t(m2) == mg / sum(mg)
rowSums(mg) / sum(mg)
mg[1,1] / colSums(mg)[1]


# Lab 5
mil <- c(86, 18, 22, 141, 26, 207, 368, 228, 20, 11)
pop <- c(35, 8, 13, 64, 13, 87, 193, 124, 11, 6)
cor(mil, pop)
summary(lm(mil~pop))

WR <- read.csv("WorldRecords.csv")
names(WR)
head(WR)

#Invoke the SDSFoundataions package
library(SDSFoundations)
WR <- WorldRecords
head(WR)

length(unique(WR$Event))
WR[WR$Athlete == 'Usain Bolt' & WR$Event == 'Mens 100m',]
WR[WR$Record < 260 & WR$Event == 'Womens Mile',]
class(WR$Record)
class(WR$Year)
sapply(WR, class)

#Subset the data
menshot <- WR[WR$Event=='Mens Shotput',]
womenshot <- WR[WR$Event=='Womens Shotput',] 

#Create scatterplots
plot(menshot$Year,menshot$Record,main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)

#Run linear models
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year,womenshot$Record)

#Subset the data

menshot <- WR[WR$Event=='Mens Shotput',]
womenshot <- WR[WR$Event=='Womens Shotput',] 
nrow(menshot)
nrow(womenshot)
#Create scatterplots

menshot <- WR[WR$Event=='Mens Mile',]
womenshot <- WR[WR$Event=='Womens Mile',] 
plot(menshot$Year,menshot$Record,main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year,womenshot$Record)

#WR<-WorldRecords
#recent<-WR[Year>=1990,]

menshot <- WR[WR$Event=='Mens Polevault',]
max(menshot$Record)
menshot[menshot$Record > 6, ]

plot(menshot$Year,menshot$Record,main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)

#Run linear models

menshot <- menshot[menshot$Year >= 1970,]

summary(lm(menshot$Record ~ menshot$Year)) #linFit(menshot$Year, menshot$Record)
summary(lm(womenshot$Record ~ womenshot$Year)) #linFit(womenshot$Year,womenshot$Record)
1 / 0.39347
1 / 0.9729

# Lab

#Invoke the SDSFoundataions package
library(SDSFoundations)
WR <- WorldRecords
head(WR)
unique(WR$Event)
mens <- WR[WR$Event == 'Mens Mile',]
womens <- WR[WR$Event == 'Womens Mile',]
with(mens, plot(Year, Record))
with(womens, plot(Year, Record))
#mean(mens$Record[2:nrow(mens)] - mens$Record[1:(nrow(mens)-1)])
with(mens, linFit(Year, Record))
round(with(womens, linFit(Year, Record))$Slope, 3)
1/round(with(womens, linFit(Year, Record))$Slope, 3)


class(WR$Record)
class(WR$Year)
sapply(WR, class)

# Problem Set
library(SDSFoundations)
WR <- WorldRecords
head(WR)
unique(WR$Event)
pole <- subset(WR, Event == 'Mens Polevault' & Year >= 1970)
nrow(pole)
max(pole$Record)
head(with(pole, pole[Record > 6,]))
min(with(pole, pole[Record > 6,])$Year)
with(pole, plot(Year, Record))
linFit(pole$Year, pole$Record)

C <- c(140,  280,	420,	560)
h <- c(0,  2,	4,	6)
#summary(lm(C~h))
linFit(h, C)
(175*4-140)/70

GPA = 2.84 + .04 * 970 / 100
round(GPA, 2)
round(3.71 - 2.84, 2)
round(2.91 - (2.84 + .04 * 1450 / 100), 2)



# Lab 6
world <- read.csv("WorldBankData.csv")
names(world)
head(world)
head(world[world$IncomeGroup=="Low income",])
world[world$Country=="Aruba" & world$year==1970,]$rural.population
head(world[world$Country=="Australia" & !is.na(world$mobile.users) & world$mobile.users > 0,])
sapply(world, class)

#install.packages("SDSFoundations_1.1.tgz", repos = NULL, type="source")
library(SDSFoundations)
# Subset data for just the United States and name the new data frame "us"
us <- world[world$Country.Code == "USA",]
# Select the years from 1990 and name the new data frame "us_select"
us_select <- us[us$year >= 1990, ]
# Make the number of users more interpretable (into millions)
us_select$internet.mil <- us_select$internet.users / 1000000
# Create a new variable that is "years since 1990"
us_select$time <- us_select$year - 1990
# Select the first 10 years (from 1990 to 1999) and name the new data frame "us_select_10"
us_select_10 <- us_select[us_select$time < 10,]
# Use a function to fit an exponential and logistic model for 1990-1999
expFit(us_select_10$time, us_select_10$internet.mil)
logisticFit(us_select_10$time, us_select_10$internet.mil)
# Based on the prior model parameters, predict the number of internet users in 2006
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)
# Show how many internet users the US actually had in 2006
us_select[us_select$time == 16, c("Country", "year", "internet.mil")]
# Calculate the residuals for each model
us_select$internet.mil[us_select$time == 16] - e
us_select$internet.mil[us_select$time == 16] - l
# Look at the model fits for all available data (1990 to 2012)
expFit(us_select$time, us_select$internet.mil)
logisticFit(us_select$time, us_select$internet.mil)
# Which model fits the best?
tripleFit(us_select$time, us_select$internet.mil)
# How many internet users would the US have had in 2012 if you had used the original exponential model?
e1 <- expFitPred(us_select_10$time, us_select_10$internet.mil, 22)

world$proportion <- world$internet.users / world$population
world_select <- world[world$year >= 1990, ]
#world_select$internet.mil <- world_select$internet.users / 1000000
world_select$time <- world_select$year - 1990
denmark <- world_select[world_select$Country == "Denmark",]
expFit(denmark$time, denmark$proportion)
ld <- logisticFit(denmark$time, denmark$proportion)
belarus <- world_select[world_select$Country == "Belarus",]
expFit(belarus$time, belarus$proportion)
lb <- logisticFit(belarus$time, belarus$proportion)

#1990 + which(logisticFitPred(denmark$time, denmark$proportion, 0:22) >= 0.10)[1]
#1990 + which(logisticFitPred(belarus$time, belarus$proportion, 0:22) >= 0.10)[1]
#print(logisticFitPred(denmark$time, denmark$proportion, 0:22))
# y = C / (1 + a.b^(-t)) => t  = -log((C / y - 1) / a) / log(b)
1990 + ceiling(-log((ld$C / 0.1 - 1) / ld$a) / log(ld$b))
1990 + ceiling(-log((lb$C / 0.1 - 1) / lb$a) / log(lb$b))
1990 + ceiling(-log((ld$C / 0.8 - 1) / ld$a) / log(ld$b))
1990 + ceiling(-log((lb$C / 0.8 - 1) / lb$a) / log(lb$b))

# Pre-Lab
library(SDSFoundations) 
world <- WorldBankData 
head(world)
head(subset(world, IncomeGroup=='Low income'))
subset(world, Country=='Aruba' & year == 1970)
head(subset(world, Country=='Australia' & !is.na(mobile.users) & mobile.users > 0))

# Subset data for just the United States and name the new data frame "us"
us <- world[world$Country.Code == "USA",]
# Select the years from 1990 and name the new data frame "us_select"
us_select <- us[us$year >= 1990, ]
# Create a new variable in our datset called internet.mil to make the number of users more interpretable (into millions)
us_select$internet.mil <- us_select$internet.users / 1000000
# Create a new variable in our dataset called time that represents "years since 1990"
us_select$time <- us_select$year - 1990
# Select the first 10 years (from 1990 to 1999) and name the new data frame "us_select_10"
us_select_10 <- us_select[us_select$time < 10,]
# Use a function to fit an exponential and logistic model for 1990-1999
expFit(us_select_10$time, us_select_10$internet.mil)
logisticFit(us_select_10$time, us_select_10$internet.mil)
# Based on the prior model parameters, predict the number of internet users in 2006
e <- expFitPred(us_select_10$time, us_select_10$internet.mil, 16)
l <- logisticFitPred(us_select_10$time, us_select_10$internet.mil, 16)
# Create a new variable in our dataset called internet.mil to make the number of users more interpretable (into millions)
us_select$internet.mil <- us_select$internet.users / 1000000
world <- WorldBankData
belgium <- world[world$Country == 'Belgium',]
recent_belgium <- world[world$year >= 1990,]
actual <- us_select[us_select$year == 2006,]$internet.users / 1000000
actual - e
actual - l

# Lab
library(SDSFoundations) 
world <- WorldBankData 
head(world)
denmark <- world[world$Country == "Denmark",]
denmark_select <- denmark[denmark$year >= 1990, ]
denmark_select$internet.prop <- denmark_select$internet.users / denmark_select$population
denmark_select$time <- denmark_select$year - 1990
expFit(denmark_select$time, denmark_select$internet.prop)
logisticFit(denmark_select$time, denmark_select$internet.prop)
e <- expFitPred(denmark_select$time, denmark_select$internet.prop, 16)
l <- logisticFitPred(denmark_select$time, denmark_select$internet.prop, 16)
denmark_select$internet.prop <- denmark_select$internet.users / 1000000
actual <- denmark_select[denmark_select$year == 2006,]$internet.users / 1000000
actual - e
actual - l

a =  0.00585 
b =  1.34666 
t <- log(0.7/a)/log(b)

C =  0.89668 
a =  308.8345 
b =  1.73124 
t<--log((C/0.7-1)/a)/log(b)

# Problem set
# Lab
library(SDSFoundations) 
world <- WorldBankData 
head(world)
brazil <- world[world$Country == "Brazil",]
brazil_select <- brazil[brazil$year >= 1995, ]
View(brazil_select)
brazil_select$mobile.mil <- brazil_select$mobile.users / 1000000
brazil_select[brazil_select$year == 2000, ]$mobile.mil
brazil_select[brazil_select$mobile.mil > 100, ]
brazil_select$time <- brazil_select$year - 1995
par(mfrow = c(3,1))
linFit(brazil_select$time, brazil_select$mobile.mil)
expFit(brazil_select$time, brazil_select$mobile.mil)
logisticFit(brazil_select$time, brazil_select$mobile.mil)
e <- expFitPred(brazil_select$time, brazil_select$mobile.mil, 2025-1995)
l <- logisticFitPred(brazil_select$time, brazil_select$mobile.mil, 2025-1995)
brazil_select$mobile.mil <- brazil_select$mobile.users / 1000000
actual <- brazil_select[brazil_select$year == 2006,]$mobile.users / 1000000
actual - e
actual - l

a =  0.00585 
b =  1.34666 
t <- log(0.7/a)/log(b)

C =  0.89668 
a =  308.8345 
b =  1.73124 
t<--log((C/0.7-1)/a)/log(b)
