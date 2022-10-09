setwd('E:/Academics/Edx/')
songs <- read.csv('songs.csv', header=TRUE)
names(songs)
head(songs)
nrow(subset(songs, year == 2010))
nrow(songs[songs$artistname == "Michael Jackson",])
songs[songs$artistname == "Michael Jackson" & songs$Top10 == 1,][c("songtitle", "Top10")]
unique(songs$timesignature)
sort(table(songs$timesignature), decreasing=TRUE)
head(songs[order(songs$tempo, decreasing=TRUE),][c("songtitle", "tempo")])
songs[songs$tempo == max(songs$tempo),][c("songtitle", "tempo")]
class(songs$year)
SongsTrain = subset(songs, year <= 2009)
SongsTest = subset(songs, year == 2010)
nrow(SongsTrain)
#SongsLog1 = glm(Top10 ~ ., data=SongsTrain, family=binomial)
nonvars = c("year", "songtitle", "artistname", "songID", "artistID")
SongsTrain = SongsTrain[ , !(names(SongsTrain) %in% nonvars) ]
SongsTest = SongsTest[ , !(names(SongsTest) %in% nonvars) ]
SongsLog1 = glm(Top10 ~ ., data=SongsTrain, family=binomial)
summary(SongsLog1)
cor(SongsTrain$loudness, SongsTrain$energy)
plot(SongsTrain$loudness, SongsTrain$energy)
SongsLog2 = glm(Top10 ~ . - loudness, data=SongsTrain, family=binomial)
summary(SongsLog2)
summary(SongsLog1)$coefficients['energy',]
summary(SongsLog2)$coefficients['energy',]
SongsLog3 = glm(Top10 ~ . - energy, data=SongsTrain, family=binomial)
summary(SongsLog1)$coefficients['loudness',]
summary(SongsLog3)$coefficients['loudness',]
predTst <- predict(SongsLog3, SongsTest, type="response")
thresh  <- 0.45
predFac <- as.integer(cut(predTst, breaks=c(-Inf, thresh, Inf), labels=c("0", "1"))) - 1
cTab <- table(SongsTest$Top10, predFac, dnn=c("actual", "predicted"))
addmargins(cTab)
accuracy <- sum(SongsTest$Top10 == predFac) / nrow(SongsTest)
table(SongsTest$Top10)
baseline_accuracy <- sum(SongsTest$Top10 == 0) / nrow(SongsTest)
nrow(SongsTest[SongsTest$Top10 == predFac & SongsTest$Top10 == 1,])
nrow(SongsTest[predFac == 1 & SongsTest$Top10 == 0,])
nrow(SongsTest[SongsTest$Top10 == 1,])
TP <- nrow(SongsTest[predFac == 1 & SongsTest$Top10 == 1,])
FP <- nrow(SongsTest[predFac == 1 & SongsTest$Top10 == 0,])
TN <- nrow(SongsTest[predFac == 0 & SongsTest$Top10 == 0,])
FN <- nrow(SongsTest[predFac == 0 & SongsTest$Top10 == 1,])
sensitivity <- TP / (TP + FN) # recall
specifity <- TN / (TN + FP)
precision <- TP / (TP + FP)

baseball <- read.csv('baseball.csv', header=TRUE)
names(baseball)
head(baseball)
length(unique(paste(baseball$Team, baseball$Year)))
table(baseball$Year)
length(unique(baseball$Year))
baseball <- subset(baseball, baseball$Playoffs == 1)
nrow(baseball)
unique(table(baseball$Year))
PlayoffTable = table(baseball$Year)
PlayoffTable
class(PlayoffTable)
names(PlayoffTable)
class(names(PlayoffTable))
PlayoffTable[c("1990", "2001")]
baseball$NumCompetitors = PlayoffTable[as.character(baseball$Year)]
nrow(baseball[baseball$NumCompetitors == 8,][c("Team", "Year")])

baseball$WorldSeries = as.numeric(baseball$RankPlayoffs == 1)
nrow(baseball[baseball$WorldSeries == 0,])
baseball <- read.csv('baseball.csv', header=TRUE)
baseball$NumCompetitors = PlayoffTable[as.character(baseball$Year)]
baseball$WorldSeries = as.numeric(baseball$RankPlayoffs == 1)
summary(glm(WorldSeries ~ Year, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ RS, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ RA, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ W, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ OBP, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ SLG, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ BA, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ RankSeason, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ OOBP, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ OSLG, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ NumCompetitors, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ League, data=baseball, family='binomial'))
summary(glm(WorldSeries ~ Year + RA + RankSeason + NumCompetitors, data=baseball, family='binomial'))
cor(baseball[c("Year", "RA", "RankSeason", "NumCompetitors")], use="complete") # na.rm

summary(glm(WorldSeries ~ Year, data=baseball))$aic
summary(glm(WorldSeries ~ RA, data=baseball))$aic
summary(glm(WorldSeries ~ RankSeason, data=baseball))$aic
summary(glm(WorldSeries ~ NumCompetitors, data=baseball))$aic
summary(glm(WorldSeries ~ Year + RA, data=baseball))$aic
summary(glm(WorldSeries ~ Year + RankSeason, data=baseball))$aic
summary(glm(WorldSeries ~ Year + NumCompetitors, data=baseball))$aic
summary(glm(WorldSeries ~ RA + RankSeason, data=baseball))$aic
summary(glm(WorldSeries ~ RA + NumCompetitors, data=baseball))$aic
summary(glm(WorldSeries ~ RankSeason + NumCompetitors, data=baseball))$aic

parole <- read.csv('parole.csv', header=TRUE)
names(parole)
head(parole)
nrow(parole)
unique(parole$violator)
nrow(parole[parole$violator==1,])
length(unique(parole$male))
length(unique(parole$race))
length(unique(parole$age))
length(unique(parole$state))
length(unique(parole$time.served))
length(unique(parole$max.sentence))
length(unique(parole$multiple.offenses))
length(unique(parole$crime))
length(unique(parole$violator))
summary(parole)
table(parole$state)
str(parole$state)
parole$state <- as.factor(parole$state)
parole$crime <- as.factor(parole$crime)
summary(parole)

set.seed(144)
library(caTools)
split = sample.split(parole$violator, SplitRatio = 0.7)
train = subset(parole, split == TRUE)
test = subset(parole, split == FALSE)
100 * nrow(train) / nrow(parole)
#split = sample.split(parole$violator, SplitRatio = 0.7)
#train1 = subset(parole, split == TRUE)
#sum(train != train1)
m <- glm(violator ~ ., data=train, family='binomial')
summary(m)
lo <- predict(m, newdata=data.frame(male=1, race=1, age=50, state=unique(parole$state)[[1]], time.served=3, max.sentence=12, multiple.offenses=0, crime=unique(parole$crime)[[4]])) # log odds
lo
o <- exp(lo)
o
p <- 1 / (1 + exp(-lo))
p
#lo = P / (1 - P) = exp(p)
#1 / (1 + exp(-p)) = 1 / (1 + 1/P - 1) = P
p <- predict(m, newdata=data.frame(male=1, race=1, age=50, state=unique(parole$state)[[1]], time.served=3, max.sentence=12, multiple.offenses=0, crime=unique(parole$crime)[[4]]), type="response") # prob
p
#d <- c(1, 1, 1, 50, 0, 0, 0, 3, 12, 0, 0, 0, 1)
#p <- sum(m$coefficients * d)
#p

p <- predict(m, newdata=test, type='response')
max(p)
threshold <- 0.5
#threshold <- 0.4
#threshold <- 0.6
p[p > threshold] <- 1
p[p < threshold] <- 0
test$p <- p
TP <- nrow(test[test$p == 1 & test$violator == 1,])
FP <- nrow(test[test$p == 1 & test$violator == 0,])
TN <- nrow(test[test$p == 0 & test$violator == 0,])
FN <- nrow(test[test$p == 0 & test$violator == 1,])
sensitivity <- TP / (TP + FN) # recall
specifity <- TN / (TN + FP)
precision <- TP / (TP + FP)
accuracy <- (TP + TN) / (TP + FP + TN + FN)
paste(sensitivity, specifity, precision, accuracy)

nrow(test[test$violator == 0,]) / nrow(test)
# The board assigns more cost to a false negative than a false positive, and should therefore use a logistic regression cutoff less than 0.5

library(ROCR)
#pred <- prediction(test$p, test$violator)
pred <- prediction(p, test$violator)
#plot(performance(pred, "tpr", "fpr"))
#plot(performance(pred, "prec", "rec"))
#plot(performance(pred, "sens", "spec"))
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)

library(AUC)
auc(accuracy(test$p, test$violator))
roc(test$p, test$violator)

loans <- read.csv('loans.csv', header=TRUE)
names(loans)
head(loans)
nrow(loans)
nrow(loans[loans$not.fully.paid == 1, ])/ nrow(loans)
vars <- names(loans)
for (n in 1:(length(vars))) {
	if (sum(is.na(loans[,n])) != 0) {
		print(vars[n])
	}
}
l1<-loans[is.na(loans$log.annual.inc)|is.na(loans$days.with.cr.line)|is.na(loans$revol.util)|is.na(loans$inq.last.6mths)|is.na(loans$delinq.2yrs)|is.na(loans$pub.rec), ]
l2<-loans[!(is.na(loans$log.annual.inc)|is.na(loans$days.with.cr.line)|is.na(loans$revol.util)|is.na(loans$inq.last.6mths)|is.na(loans$delinq.2yrs)|is.na(loans$pub.rec)), ]
nrow(l1)
nrow(l2)
nrow(l1[l1$not.fully.paid == 1, ])/ nrow(l1)
nrow(l2[l2$not.fully.paid == 1, ])/ nrow(l2)
library(mice)
set.seed(144)
vars.for.imputation = setdiff(names(loans), "not.fully.paid")
imputed = complete(mice(loans[vars.for.imputation]))
loans[vars.for.imputation] = imputed
set.seed(144)
library(caTools)
split = sample.split(loans$not.fully.paid, SplitRatio = 0.7)
train = subset(loans, split == TRUE)
test = subset(loans, split == FALSE)
100 * nrow(train) / nrow(loans)
m <- glm(not.fully.paid ~ ., data=train, family='binomial')
summary(m)
l <- m$coefficients['fico']*(700-710) # logit(A)-logit(B)
exp(l) # o(A)/o(B)
predicted.risk <- predict(m, newdata=test, type='response')
predicted.risk[predicted.risk > 0.5] <- 1
predicted.risk[predicted.risk <= 0.5] <- 0
test$predicted.risk <- predicted.risk
table(test$predicted.risk, test$not.fully.paid) # confusion
accuracy <- nrow(test[test$predicted.risk == test$not.fully.paid, ]) / nrow(test)
nrow(test[test$not.fully.paid==1,])
nrow(test[test$not.fully.paid==0,])
nrow(test[test$not.fully.paid==0,]) / nrow(test)
library(ROCR)
pred <- prediction(predicted.risk, test$not.fully.paid)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
#plot(performance(pred, "sens", "spec"))
perf=performance(pred, 'tpr', 'fpr')  #true positive and false negative
plot(perf, colorize=T)
auc=unlist(slot(auc.tmp, 'y.values'))
m <- glm(not.fully.paid ~ int.rate, data=train, family='binomial')
summary(m)
predicted.risk <- predict(m, newdata=test, type='response')
max(predicted.risk)
library(ROCR)
pred <- prediction(predicted.risk, test$not.fully.paid)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
10*exp(0.06*3)
test$profit = exp(test$int.rate*3) - 1
test$profit[test$not.fully.paid == 1] = -1
max(10*test$profit)
test$predicted.risk <- predicted.risk
high.int <- subset(test, test$int.rate >= 0.15) 
top100 <- head(high.int[order(high.int$int.rate),], 100)
#top100[c('predicted.risk', 'int.rate', 'profit')]
mean(top100$profit)
nrow(high.int[high.int$not.fully.paid==1,]) / nrow(high.int)
cutoff <- sort(high.int$predicted.risk, decreasing=FALSE)[100]
selectedLoans <- subset(high.int, predicted.risk <= cutoff)
nrow(selectedLoans)
sum(selectedLoans$profit)
nrow(selectedLoans[selectedLoans$not.fully.paid == 1,])

quality = read.csv("quality.csv")
names(quality)
#install.packages("caTools")
library(caTools)
set.seed(88)
split = sample.split(quality$PoorCare, SplitRatio = 0.75)
qualityTrain = subset(quality, split == TRUE)
qualityTest = subset(quality, split == FALSE)
QualityLog = glm(PoorCare ~ StartedOnCombination + ProviderCount, data=qualityTrain, family=binomial)
QualityLog
QualityLog = glm(PoorCare ~ OfficeVisits + Narcotics, data=qualityTrain, family=binomial)
QualityLog
predictTest = predict(QualityLog, type="response", newdata=qualityTest)
ROCRpredTest = prediction(predictTest, qualityTest$PoorCare)
auc = as.numeric(performance(ROCRpredTest, "auc")@y.values)
