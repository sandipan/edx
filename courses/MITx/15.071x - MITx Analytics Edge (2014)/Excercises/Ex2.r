setwd('E:/work')
data(state)
statedata = cbind(data.frame(state.x77), state.abb, state.area, state.center,  state.division, state.name, state.region)
str(statedata)
plot(statedata$x, statedata$y)
sort(tapply(statedata$HS.Grad, statedata$state.region, mean))
boxplot(Murder ~ state.region, data = statedata, col = "lightgray")
mne <- subset(statedata, state.region=='Northeast')['Murder']
mu <- mean(mne$Murder)
sigma <- sd(mne$Murder)
mne[mne$Murder > mu + 2*sigma]
names(statedata)
m <- lm(Life.Exp ~ Population + Income + Illiteracy + Murder + HS.Grad + Frost + Area, data=statedata)
plot(statedata$Income, statedata$Life.Exp)
step(m)
m <- lm(Life.Exp ~ Population + Murder + HS.Grad + Frost, data=statedata)
p <- predict(m)
sort(p)
statedata[which.min(statedata$Life.Exp),]
sort(p)
statedata[which.max(statedata$Life.Exp),]
sort(abs(p - statedata$Life.Exp))

climate <- read.csv('climate_change.csv', header=TRUE)
names(climate)
training <- subset(climate, Year <= 2006)
test <- subset(climate, Year > 2006)
m <- lm(Temp~ MEI+CO2+CH4+N2O+CFC.11+CFC.12+TSI+Aerosols, data=training)
summary(m)

cor(training)
m <- lm(Temp~ MEI+N2O+TSI+Aerosols, data=training)

m <- lm(Temp~ MEI+CO2+CH4+N2O+CFC.11+CFC.12+TSI+Aerosols, data=training)
step(m)

m <- lm(Temp ~ MEI + CO2 + N2O + CFC.11 + CFC.12 + TSI + Aerosols, data = training)
summary(m)

#p <- predict(m, newdata=test, se.fit=TRUE)
#p <- predict(m, newdata=test)
#Rsq <- cor(test$Temp, p)^2 
#Rsq <- 1-mean((test$Temp - p)^2)/var(test$Temp)

# test R2
p = predict(m, newdata=test)
SSE = sum((p - test$Temp)^2)
SST = sum((test$Temp - mean(training$Temp))^2)
R2 = 1 - SSE/SST

pisaTrain <- read.csv('pisa2009train.csv', header=TRUE)
pisaTest <- read.csv('pisa2009test.csv', header=TRUE)
nrow(pisaTrain)
names(pisaTrain)
pisaTrain$readingScore
head(pisaTrain)
tapply(pisaTrain$readingScore, pisaTrain$male, mean)
vars <- names(pisaTrain)
for (n in 1:(length(vars))) {
	if (sum(is.na(pisaTrain[,n])) != 0) {
		print(vars[n])
	}
}
pisaTrain = na.omit(pisaTrain)
pisaTest = na.omit(pisaTest)
nrow(pisaTrain)
nrow(pisaTest)

class(pisaTrain$grade)
class(pisaTrain$male)
class(pisaTrain$raceeth)
unique(pisaTrain$grade)
unique(pisaTrain$male)
unique(pisaTrain$raceeth)

pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
pisaTest$raceeth = relevel(pisaTest$raceeth, "White")

lmScore <- lm(readingScore ~ ., data = pisaTrain)
summary(lmScore)

p = predict(lmScore)
RMSE = sqrt(mean((p - pisaTrain$readingScore)^2))
step(lmScore)

p <- predict(lmScore, newdata=pisaTest)
range(p)
max(p) - min(p)
SSE <- sum((p - pisaTest$readingScore)^2)
RMSE <- sqrt(mean((p - pisaTest$readingScore)^2))

# baseline
mean(predict(lmScore))
p = predict(lmScore, newdata=pisaTest)
SSE = sum((p - pisaTest$readingScore)^2)
SST = sum((pisaTest$readingScore - mean(pisaTrain$readingScore))^2)
R2 = 1 - SSE/SST


FluTrain <- read.csv('FluTrain.csv', header=TRUE)
head(FluTrain)
names(FluTrain)
FluTrain[FluTrain$ILI == max(FluTrain$ILI), ]
FluTrain[FluTrain$Queries == max(FluTrain$Queries), ]
hist(FluTrain$ILI)
#plot(log(FluTrain$ILI, FluTrain$Queries))
plot(log(FluTrain$ILI), FluTrain$Queries)
plot(FluTrain$Queries, log(FluTrain$ILI))
FluTrend1  <- lm(log(ILI)~Queries, data=FluTrain)
summary(FluTrend1)
R <- summary(FluTrend1)$r.squared
r <- cor(log(FluTrain$ILI), FluTrain$Queries)
r^2
FluTest <- read.csv('FluTest.csv', header=TRUE)
#PredTest1 = predict(FluTrend1, newdata=FluTest)
PredTest1 = exp(predict(FluTrend1, newdata=FluTest))
names(FluTest)
index <- which(FluTest$Week == '2012-03-11 - 2012-03-17')
#FluTest[index,]
ObservedILI <- FluTest$ILI[index]
EstimatedILI <- PredTest1[index]
(ObservedILI - EstimatedILI) / ObservedILI
RMSE <- sqrt(mean((FluTest$ILI - PredTest1)^2))

install.packages("zoo")
library(zoo)
ILILag2 = lag(zoo(FluTrain$ILI), -2, na.pad=TRUE)
FluTrain$ILILag2 = coredata(ILILag2)
plot(log(FluTrain$ILILag2), log(FluTrain$ILI))
FluTrend2 <- lm(log(ILI)~Queries+log(ILILag2), data=FluTrain)
#FluTrend2
summary(FluTrend2)

ILILag2 = lag(zoo(FluTest$ILI), -2, na.pad=TRUE)
FluTest$ILILag2 = coredata(ILILag2)
FluTest$ILILag2
FluTest$ILILag2[1] <- FluTrain$ILI[length(FluTrain$ILI)-1]
FluTest$ILILag2[2] <- FluTrain$ILI[length(FluTrain$ILI)]

# testset RMSE
p <- exp(predict(FluTrend1, newdata=FluTest))
RMSE <- sqrt(mean((p - FluTest$ILI)^2))
RMSE
p <- exp(predict(FluTrend2, newdata=FluTest))
RMSE <- sqrt(mean((p - FluTest$ILI)^2))
RMSE

wine <- read.csv('wine.csv', header=TRUE)
names(wine)
cor(wine$HarvestRain, wine$WinterRain)
plot(wine$HarvestRain, wine$WinterRain)
m <- lm(Price ~ HarvestRain + WinterRain, data=wine)
summary(m)

xs <- c(0,1,1)
ys <- c(2,2,8)
ps <- 3*xs+2

baseline <- mean(ps)
sse <- sum((ps - ys)^2)
sst <- sum((ys - mean(ys))^2)
R2 <- 1 - sse / sst

# Quiz 3

RD <- 713 - 614
W <- 80.8314 + 0.1058*RD
W

OOBP <- 0.311 
OSLG <- 0.405
RS <- -804.63 + 2737.77*OOBP + 1584.91*OSLG
OOBP <- 0.297 
OSLG <- 0.370
RA <- -837.38 + 2913.60*OOBP + 1514.29*OSLG

OOBP <- 0.338	 
OSLG <- 0.540	 #$1,400,000
RS <- -804.63 + 2737.77*OOBP + 1584.91*OSLG
RS
OOBP <- 0.391	 
OSLG <- 0.450	 #$1,065,000
RS <- -804.63 + 2737.77*OOBP + 1584.91*OSLG
RS
OOBP <- 0.369	 
OSLG <- 0.374	 #$295,000
RS <- -804.63 + 2737.77*OOBP + 1584.91*OSLG
RS
OOBP <- 0.313	 
OSLG <- 0.447	 #$800,000
RS <- -804.63 + 2737.77*OOBP + 1584.91*OSLG
RS
OOBP <- 0.361	 
OSLG <- 0.500	 #$300,000
RS <- -804.63 + 2737.77*OOBP + 1584.91*OSLG
RS
RS <- c(976.5877, 979.0476, 798.3635, 760.7468, 976.16)
Sal <- c(1400000, 1065000, 295000, 800000, 300000)
Names <- c('Eric Chavez', 'Jeremy Giambi', 'Frank Menechino', 'Greg Myers', 'Carlos Pena')
for (i in 1:(length(RS))) {
	for (j in 1:(length(RS))) {
		if (Sal[i] + Sal[j] < 1500000) {
			print(paste(Names[i], Names[j], RS[i] + RS[j], Sal[i] + Sal[j]))
		}
	}
}
teamRank <- c(1,2,3,3,4,4,4,4,5,5)
wins2012 <- c(94,88,95,88,93,94,98,97,93,94)
wins2013 <- c(97,97,92,93,92,96,94,96,92,90)
cor(teamRank, wins2012)
cor(teamRank, wins2013)