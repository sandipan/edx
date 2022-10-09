setwd('E:/work/Academics/Edx/')
gerber <- read.csv("gerber.csv", header=TRUE)
names(gerber)
head(gerber)
nrow(subset(gerber, voting==1)) / nrow(gerber)
nrow(subset(gerber, civicduty==1 & voting==1)) / nrow(subset(gerber, civicduty==1))
nrow(subset(gerber, hawthorne==1 & voting==1)) / nrow(subset(gerber, hawthorne==1))
nrow(subset(gerber, self==1 & voting==1)) / nrow(subset(gerber, self==1))
nrow(subset(gerber, neighbors==1 & voting==1)) / nrow(subset(gerber, neighbors==1))
m <- glm(voting ~ civicduty + hawthorne + self + neighbors, data = gerber, family = 'binomial')
summary(m)
computeAccuracy <- function(p, a, threshold) {
	p[p > threshold] <- 1
	p[p <= threshold] <- 0
	accuracy <- sum(p == a) / length(a)
	return(accuracy)
}
p <- predict(m, type='response')
print(computeAccuracy(p, gerber$voting, threshold=0.3))
print(computeAccuracy(p, gerber$voting, threshold=0.5))
nrow(subset(gerber, voting==0)) / nrow(gerber)
p <- predict(m, type='response')
threshold <- 0.3 #0.5 
p[p > threshold] <- 1
p[p <= threshold] <- 0
library(ROCR)
pred <- prediction(p, gerber$voting)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
auc
library(rpart)
CARTmodel = rpart(voting ~ civicduty + hawthorne + self + neighbors, data=gerber)
plot(CARTmodel)
text(CARTmodel)
CARTmodel2 = rpart(voting ~ civicduty + hawthorne + self + neighbors, data=gerber, cp=0.0)
plot(CARTmodel2)
text(CARTmodel2)
summary(CARTmodel2)
CARTmodel2
#(191243*0.2966383+38218*0.3145377)/(191243+38218)
predict(CARTmodel2, data.frame(civicduty=1,hawthorne=0,self=0,neighbors=0))
CARTmodel3 = rpart(voting ~ civicduty + hawthorne + self + neighbors + sex, data=gerber, cp=0.0)
plot(CARTmodel3)
text(CARTmodel3)
CARTmodel3
library(rpart.plot)
prp(CARTmodel3)
CARTmodel4 = rpart(voting ~ control, data=gerber, cp=0.0)
prp(CARTmodel4, digits=6)
CARTmodel5 = rpart(voting ~ control + sex, data=gerber, cp=0.0)
prp(CARTmodel5, digits=6)
LogModel <- glm(voting ~ control + sex, data = gerber, family = 'binomial')
summary(LogModel)
Possibilities = data.frame(sex=c(0,0,1,1),control=c(0,1,0,1))
predict(LogModel, newdata=Possibilities, type="response")
#  abs(0.290456-0.2908065) = 0.0003505
LogModel2 = glm(voting ~ sex + control + sex:control, data=gerber, family="binomial")
summary(LogModel2)
#p1 <- predict(LogModel2, newdata=Possibilities, type="response")
#p2 <- predict(CARTmodel5, newdata=Possibilities)
#abs(p1 - p2)
predict(LogModel2, newdata=Possibilities, type="response")
# abs(0.290456 - 0.2904558) = 2e-07

letters <- read.csv("letters_ABPR.csv", header=TRUE)
names(letters)
head(letters)
letters$isB = as.factor(letters$letter == "B")
head(letters)
library(caTools)
set.seed(1000)
split = sample.split(letters$isB, SplitRatio = 0.5)
train = subset(letters, split == TRUE)
test = subset(letters, split == FALSE)
head(train)
head(test)
nrow(test[test$isB == FALSE,]) / nrow(test)
CARTb = rpart(isB ~ . - letter, data=train, method="class")
prp(CARTb)
p <- predict(CARTb, newdata=test, type="class")
sum(p == test$isB) / nrow(test)
library(randomForest)
set.seed(1000)
rb = randomForest(isB ~ . - letter, data=train)
p <- predict(rb, newdata=test, type="class")
sum(p == test$isB) / nrow(test)
letters <- read.csv("letters_ABPR.csv", header=TRUE)
letters$letter = as.factor( letters$letter )
set.seed(2000)
split = sample.split(letters$letter, SplitRatio = 0.5)
train = subset(letters, split == TRUE)
test = subset(letters, split == FALSE)
head(train)
head(test)
#baseline
pclass <- names(which.max(table(train$letter) / nrow(train)))
nrow(test[test$letter == pclass,]) / nrow(test)
CARTm = rpart(letter ~ ., data=train, method="class")
prp(CARTm)
p <- predict(CARTm, newdata=test, type="class")
sum(p == test$letter) / nrow(test)
set.seed(1000)
rb = randomForest(letter ~ ., data=train)
p <- predict(rb, newdata=test, type="class")
sum(p == test$letter) / nrow(test)
data(state)
statedata = data.frame(state.x77)
names(statedata)
head(statedata)
str(statedata)
lrm <- lm(Life.Exp ~ ., data = statedata)
#lrm
summary(lrm)
p <- predict(lrm)
sum((p - statedata$Life.Exp)^2)
lrm <- lm(Life.Exp ~ Population + Murder + Frost + HS.Grad, data = statedata)
summary(lrm)
p <- predict(lrm)
sum((p - statedata$Life.Exp)^2)
cor(statedata$Income, statedata$Life.Exp)
CARTm <- rpart(Life.Exp ~ ., data=statedata)
#CARTm <- rpart(Life.Exp ~ ., data=statedata, cp=0.0)
prp(CARTm)
p <- predict(CARTm)
sum((p - statedata$Life.Exp)^2)
CARTm <- rpart(Life.Exp ~ ., data=statedata, minbucket=5)
prp(CARTm)
p <- predict(CARTm)
sum((p - statedata$Life.Exp)^2)
CARTm <- rpart(Life.Exp ~ Area, data=statedata, minbucket=1)
prp(CARTm)
p <- predict(CARTm)
sum((p - statedata$Life.Exp)^2)
#lrm <- lm(Life.Exp ~ Area, data=statedata)
#p <- predict(lrm)
#sum((p - statedata$Life.Exp)^2)
library(caret)
set.seed(111)
fitControl = trainControl( method = "cv", number = 10 )
cartGrid = expand.grid( .cp = (1:50)*0.01) 
# Perform the cross validation
cp <- train(Life.Exp ~ ., data = statedata, method = "rpart", trControl = fitControl, tuneGrid = cartGrid )
cp$bestTune
CARTm <- rpart(Life.Exp ~ ., data=statedata, cp=cp$bestTune)
prp(CARTm)
p <- predict(CARTm)
sum((p - statedata$Life.Exp)^2)
set.seed(111)
fitControl = trainControl( method = "cv", number = 10 )
cartGrid = expand.grid( .cp = (1:50)*0.01) 
cp <- train(Life.Exp ~ Area, data = statedata, method = "rpart", trControl = fitControl, tuneGrid = cartGrid )
cp$bestTune
CARTm <- rpart(Life.Exp ~ Area, data=statedata, cp=cp$bestTune)
prp(CARTm)
p <- predict(CARTm)
sum((p - statedata$Life.Exp)^2)
#census <- read.csv("census.csv", header=TRUE)
#names(census)
#head(census)
#census$over50k <- as.character(census$over50k)
#census$over50k[census$over50k == ' >50K'] <- 1
#census$over50k[census$over50k == ' <=50K'] <- 0
#census$over50k <- as.integer(census$over50k)
#set.seed(2000)
#split = sample.split(census$over50k, SplitRatio = 0.6)
#train = subset(census, split == TRUE)
#test = subset(census, split == FALSE)
#LogModel <- glm(over50k ~ ., data = train, family = 'binomial')
#summary(LogModel)
#p <- predict(LogModel, newdata=test, type='response')
#p[p > 0.5] <- 1
#p[p <= 0.5] <- 0
#sum(p == test$over50k) / nrow(test)
#sum(test$over50k == 1) / nrow(test)
#sum(test$over50k == 0) / nrow(test)
census <- read.csv("census.csv", header=TRUE)
names(census)
head(census)
#set.seed(1000)
set.seed(2000)
split = sample.split(census$over50k, SplitRatio = 0.6)
train = subset(census, split == TRUE)
test = subset(census, split == FALSE)
LogModel <- glm(over50k ~ ., data = train, family = 'binomial')
summary(LogModel)
p <- predict(LogModel, newdata=test, type='response')
pROC <- p
p[p > 0.5] <- 1
p[p <= 0.5] <- 0
p <- as.character(p)
p[p == '1'] <- ' >50K'
p[p == '0'] <- ' <=50K'
p <- as.factor(p)
sum(p == test$over50k) / nrow(test)
sum(test$over50k == ' >50K') / nrow(test)
sum(test$over50k == ' <=50K') / nrow(test)
#table(p, test$over50k)
# ROC curve
library(ROCR)
pred = prediction(pROC, test$over50k)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
as.numeric(performance(pred, "auc")@y.values)
CartModel <- rpart(over50k ~ ., data = train, method = 'class')
prp(CartModel)
pc <- predict(CartModel, newdata=test, type='class')
#pc <- as.integer(as.character(pc))
sum(p == test$over50k) / nrow(test)
sum(pc == test$over50k) / nrow(test)
pcROC <- predict(CartModel, newdata=test)
#predc = prediction(pc, test$over50k)
predc = prediction(pcROC[,2], test$over50k)
perfc = performance(predc, "tpr", "fpr")
#as.numeric(performance(pred, "auc")@y.values)
as.numeric(performance(predc, "auc")@y.values)
plot(perf, colorize=TRUE)
lines(perfc@x.values[[1]], perfc@y.values[[1]], lty=2, lwd=2, col=6)
set.seed(1)
trainSmall = train[sample(nrow(train), 2000), ]
randomForest(over50k ~., data = trainSmall)
class(census$nativecountry)
levels(census$nativecountry)
set.seed(1)
trainSmall = train[sample(nrow(train), 2000), ]
r <- randomForest(as.factor(over50k) ~. - nativecountry, data = trainSmall)
pr <- predict(r, newdata=test, type='class')
sum(pr == test$over50k) / nrow(test)
vu = varUsed(r, count=TRUE)
vusorted = sort(vu, decreasing = FALSE, index.return = TRUE)
dotchart(vusorted$x, names(r$forest$xlevels[vusorted$ix]))
varImpPlot(r)
set.seed(2)
fitControl = trainControl( method = "cv", number = 10 )
cartGrid = expand.grid( .cp = seq(0.002,0.1,0.002))
cp <- train(over50k ~ ., data = train, method = "rpart", trControl = fitControl, tuneGrid = cartGrid )
cp$bestTune
CARTm <- rpart(over50k ~ ., data=train, cp=cp$bestTune)
prp(CARTm)
p <- predict(CARTm, newdata=test, type='class')
sum(p == test$over50k) / nrow(test)



