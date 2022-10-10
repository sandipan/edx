library(tm)
library(sqldf)
setwd("C:/Users/SANDIPAN DEY/Desktop/Edx")

wiki <- read.csv("wiki.csv", header=TRUE)
names(wiki)
head(wiki)
wiki$Vandal = as.factor(wiki$Vandal)
nrow(wiki[wiki$Vandal == '1',])
sqldf('select count(*) from wiki where Vandal == 1')
length(stopwords("english"))

corpusAdded <- Corpus(VectorSource(wiki$Added))
# Preprocessing
# Convert to lower-case
corpusAdded <- tm_map(corpusAdded, tolower)
# Remove punctuation
corpusAdded <- tm_map(corpusAdded, removePunctuation)
# Remove stopwords and apple
corpusAdded <- tm_map(corpusAdded, removeWords, stopwords("english"))
# Stem document 
corpusAdded <- tm_map(corpusAdded, stemDocument)
# Create matrix
dtmAdded <- DocumentTermMatrix(corpusAdded)
dtmAdded
sparseAdded <- removeSparseTerms(dtmAdded, 0.997)
sparseAdded
# Convert to a data frame
wordsAdded <- as.data.frame(as.matrix(sparseAdded))
# Make all variable names R-friendly
colnames(wordsAdded) <- paste("A", colnames(wordsAdded))
dim(wordsAdded)

corpusRemoved <- Corpus(VectorSource(wiki$Removed))
# Preprocessing
# Convert to lower-case
corpusRemoved <- tm_map(corpusRemoved, tolower)
# Remove punctuation
corpusRemoved <- tm_map(corpusRemoved, removePunctuation)
# Remove stopwords and apple
corpusRemoved <- tm_map(corpusRemoved, removeWords, c(stopwords("english"), "apple"))
# Stem document 
corpusRemoved <- tm_map(corpusRemoved, stemDocument)
# Create matrix
dtmRemoved <- DocumentTermMatrix(corpusRemoved) #TermDocumentMatrix(corpusRemoved)
dtmRemoved
sparseRemoved <- removeSparseTerms(dtmRemoved, 0.997)
sparseRemoved
# Convert to a data frame
wordsRemoved <- as.data.frame(as.matrix(sparseRemoved))
# Make all variable names R-friendly
colnames(wordsRemoved) <- paste("R", colnames(wordsRemoved))
dim(wordsRemoved)

wikiWords <- cbind(wordsAdded, wordsRemoved)
wikiWords$Vandal <- wiki$Vandal

# Split the data
library(caTools)
set.seed(123)
split <- sample.split(wikiWords$Vandal, SplitRatio = 0.7)
wikiTrain <- subset(wikiWords, split==TRUE)
wikiTest <- subset(wikiWords, split==FALSE)

table(wikiTrain$Vandal)
# Baseline accuracy 
table(wikiTest$Vandal)
nrow(wikiTest[wikiTest$Vandal==0,]) / nrow(wikiTest)

library(rpart)
library(rpart.plot)
wikiCART <- rpart(Vandal ~ ., data=wikiTrain, method="class")
prp(wikiCART)
# Evaluate the performance of the model
predictCART <- predict(wikiCART, newdata=wikiTest, type="class")
table(wikiTest$Vandal, predictCART)
sum(predictCART == wikiTest$Vandal) / nrow(wikiTest)

# test overfitting
predictCART <- predict(wikiCART, type="class")
table(wikiTrain$Vandal, predictCART)
sum(predictCART == wikiTrain$Vandal) / nrow(wikiTrain)

#grepl("cat","dogs and cats",fixed=TRUE) # TRUE
#grepl("cat","dogs and rats",fixed=TRUE) # FALSE
wikiWords2 <- wikiWords
wikiWords2$HTTP <- ifelse(grepl("http",wiki$Added,fixed=TRUE), 1, 0)
sum(wikiWords2$HTTP)

wikiTrain2 <- subset(wikiWords2, split==TRUE)
wikiTest2 <- subset(wikiWords2, split==FALSE)
wikiCART2 <- rpart(Vandal ~ ., data=wikiTrain2, method="class")
prp(wikiCART2)
# Evaluate the performance of the model
predictCART2 <- predict(wikiCART2, newdata=wikiTest2, type="class")
table(wikiTest2$Vandal, predictCART2)
sum(predictCART2 == wikiTest2$Vandal) / nrow(wikiTest2)

wikiWords2$NumWordsAdded <- rowSums(as.matrix(dtmAdded))
wikiWords2$NumWordsRemoved <- rowSums(as.matrix(dtmRemoved))
wikiWords2$NumWordsAdded
mean(wikiWords2$NumWordsAdded)

wikiTrain2 <- subset(wikiWords2, split==TRUE)
wikiTest2 <- subset(wikiWords2, split==FALSE)
wikiCART3 <- rpart(Vandal ~ ., data=wikiTrain2, method="class")
prp(wikiCART3)
# Evaluate the performance of the model
predictCART3 <- predict(wikiCART3, newdata=wikiTest2, type="class")
table(wikiTest2$Vandal, predictCART3)
sum(predictCART3 == wikiTest2$Vandal) / nrow(wikiTest2)

wikiWords3 = wikiWords2
wikiWords3$Minor = wiki$Minor
wikiWords3$Loggedin = wiki$Loggedin
wikiTrain3 <- subset(wikiWords3, split==TRUE)
wikiTest3 <- subset(wikiWords3, split==FALSE)
wikiCART4 <- rpart(Vandal ~ ., data=wikiTrain3, method="class")
prp(wikiCART4)
# Evaluate the performance of the model
predictCART4 <- predict(wikiCART4, newdata=wikiTest3, type="class")
table(wikiTest3$Vandal, predictCART4)
sum(predictCART4 == wikiTest3$Vandal) / nrow(wikiTest3)



trials <- read.csv("clinical_trial.csv", header=TRUE, stringsAsFactors=FALSE)
names(trials)
head(trials)
nchar(trials$abstract)
max(nchar(trials$abstract))
nrow(trials[nchar(trials$abstract) == 0, ])
#trials$titlelen <- nchar(trials$title)
#head(trials[order(trials$titlelen),][c('title', 'titlelen')])
trials[which.min(nchar(trials$title)),]$title
min(nchar(trials$title))

corpusTitle <- Corpus(VectorSource(trials$title))
# Preprocessing
# Convert to lower-case
corpusTitle <- tm_map(corpusTitle, tolower)
# Remove punctuation
corpusTitle <- tm_map(corpusTitle, removePunctuation)
# Remove stopwords and apple
corpusTitle <- tm_map(corpusTitle, removeWords, stopwords("english"))
# Stem document 
corpusTitle <- tm_map(corpusTitle, stemDocument)
# Create matrix
dtmTitle <- DocumentTermMatrix(corpusTitle)
dtmTitle <- removeSparseTerms(dtmTitle, 0.95)
# Convert to a data frame
dtmTitle <- as.data.frame(as.matrix(dtmTitle))

corpusAbstract <- Corpus(VectorSource(trials$abstract))
# Preprocessing
# Convert to lower-case
corpusAbstract <- tm_map(corpusAbstract, tolower)
# Remove punctuation
corpusAbstract <- tm_map(corpusAbstract, removePunctuation)
# Remove stopwords and apple
corpusAbstract <- tm_map(corpusAbstract, removeWords, stopwords("english"))
# Stem document 
corpusAbstract <- tm_map(corpusAbstract, stemDocument)
# Create matrix
dtmAbstract <- DocumentTermMatrix(corpusAbstract)
dtmAbstract <- removeSparseTerms(dtmAbstract, 0.95)
# Convert to a data frame
dtmAbstract <- as.data.frame(as.matrix(dtmAbstract))

sort(colSums(as.matrix(dtmAbstract)))
which.max(colSums(as.matrix(dtmAbstract)))
findFreqTerms(dtmAbstract, lowfreq=8000)

colnames(dtmTitle) <- paste0("T", colnames(dtmTitle))
colnames(dtmAbstract) <- paste0("A", colnames(dtmAbstract))
dtm <- cbind(dtmTitle, dtmAbstract)
dtm$trial <- trials$trial
ncol(dtm)

set.seed(144)
split <- sample.split(dtm$trial, SplitRatio = 0.7)
dtmTrain <- subset(dtm, split==TRUE)
dtmTest <- subset(dtm, split==FALSE)

table(dtmTrain$trial)
# Baseline accuracy 
table(dtmTest$trial)
nrow(dtmTest[dtmTest$trial==0,]) / nrow(dtmTest)

dtmCART <- rpart(trial ~ ., data=dtmTrain, method="class")
prp(dtmCART)
# Evaluate the performance of the model
predictCART <- predict(dtmCART)
max(predictCART[,2])
predictCART <- predict(dtmCART, newdata=dtmTest)
max(predictCART[,2])

predictCART <- predict(dtmCART, type="class")
table(dtmTrain$trial, predictCART)
# accuracy
sum(predictCART == dtmTrain$trial) / nrow(dtmTrain)
# sensitivity
sum((predictCART == dtmTrain$trial) & (dtmTrain$trial == 1)) / sum(dtmTrain$trial == 1)
# specificity
sum((predictCART == dtmTrain$trial) & (dtmTrain$trial == 0)) / sum(dtmTrain$trial == 0)

predictCART <- predict(dtmCART, newdata=dtmTest, type="class")
table(dtmTest$trial, predictCART)
sum(predictCART == dtmTest$trial) / nrow(dtmTest)

library(ROCR)
predictCART <- predict(dtmCART, newdata=dtmTest)[,2]
pred <- prediction(predictCART, dtmTest$trial)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)

emails <- read.csv("emails.csv", header=TRUE, stringsAsFactors=FALSE)
names(emails)
head(emails)
nrow(emails)
nrow(subset(emails, spam==1))
emails$text[1:10]
max(nchar(emails$text))
which.min(nchar(emails$text))

corpus <- Corpus(VectorSource(emails$text))
# Preprocessing
# Convert to lower-case
corpus <- tm_map(corpus, tolower)
# Remove punctuation
corpus <- tm_map(corpus, removePunctuation)
# Remove stopwords and apple
corpus <- tm_map(corpus, removeWords, stopwords("english"))
# Stem document 
corpus <- tm_map(corpus, stemDocument)
# Create matrix
dtm <- DocumentTermMatrix(corpus)
dtm
spdtm <- removeSparseTerms(dtm, 0.95)
spdtm
# Convert to a data frame
emailsSparse <- as.data.frame(as.matrix(spdtm))
colnames(emailsSparse) <- make.names(colnames(emailsSparse))
sort(colSums(emailsSparse))
emailsSparse$spam <- emails$spam
sort(colSums(emailsSparse[emailsSparse$spam == 0,]))
sum(sort(colSums(emailsSparse[emailsSparse$spam == 1,])) >= 1000)

library(caTools)
set.seed(123)
split <- sample.split(emailsSparse$spam, SplitRatio = 0.7)
spamTrain <- subset(emailsSparse, split==TRUE)
spamTest <- subset(emailsSparse, split==FALSE)

spamCART <- rpart(spam ~ ., data=spamTrain, method="class")
prp(spamCART)
# Training Accuracy
predictCART = predict(spamCART, type="class")
table(spamTrain$spam, predictCART)
sum(spamTrain$spam == predictCART) / nrow(spamTrain)
# Test Accuracy
predictCART = predict(spamCART, newdata=spamTest, type="class")
table(spamTest$spam, predictCART)
acCART <- sum(spamTest$spam == predictCART) / nrow(spamTest)
acCART
# Training AUC
predictCART <- predict(spamCART)[,2]
pred <- prediction(predictCART, spamTrain$spam)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
# Test AUC
predictCART <- predict(spamCART, newdata=spamTest)[,2]
pred <- prediction(predictCART, spamTest$spam)
auc.tmp <- performance(pred, "auc")
aucCART <- as.numeric(auc.tmp@y.values)
aucCART
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)

spamLog <- glm(spam ~ ., data=spamTrain, family="binomial")
# Training Accuracy
predictLog = predict(spamLog, type="response")
sum(predictLog < 0.00001)
sum(predictLog > 0.99999)
sum(predictLog <= 0.99999 & predictLog > 0.00001)
nrow(spamTrain)
summary(spamLog)
predictLog[predictLog > 0.5] <- 1
predictLog[predictLog <= 0.5] <- 0
table(spamTrain$spam, predictLog)
sum(spamTrain$spam == predictLog) / nrow(spamTrain)
# Test Accuracy
predictLog = predict(spamLog, newdata=spamTest, type="response")
predictLog[predictLog > 0.5] <- 1
predictLog[predictLog <= 0.5] <- 0
table(spamTest$spam, predictLog)
acLog <- sum(spamTest$spam == predictLog) / nrow(spamTest)
# Training AUC
predictLog <- predict(spamLog, type="response")
pred <- prediction(predictLog, spamTrain$spam)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
auc
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc
# Test AUC
predictLog <- predict(spamLog, newdata=spamTest, type="response")
pred <- prediction(predictLog, spamTest$spam)
auc.tmp <- performance(pred, "auc")
aucLog <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
aucLog

library(randomForest)
set.seed(123)
spamRF <- randomForest(spam ~., data = spamTrain)
predictRF <- predict(spamRF)
predictRF[predictRF > 0.5] <- 1
predictRF[predictRF <= 0.5] <- 0
table(spamTrain$spam, predictRF)
sum(spamTrain$spam == predictRF) / nrow(spamTrain)
pred <- prediction(predictRF, spamTrain$spam)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc
predictRF <- predict(spamRF, newdata=spamTest)
predictRF[predictRF > 0.5] <- 1
predictRF[predictRF <= 0.5] <- 0
table(spamTest$spam, predictRF)
acRF <- sum(spamTest$spam == predictRF) / nrow(spamTest)
acRF
pred <- prediction(predictRF, spamTest$spam)
auc.tmp <- performance(pred, "auc")
aucRF <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
aucRF
paste("Log", "CART", "RF")
paste(acLog, acCART, acRF)
paste(aucLog, aucCART, aucRF)

wordCount = rowSums(as.matrix(dtm))
length(wordCount)
#library(slam)
#wordCount = rollup(dtm, 2, FUN=sum)$v
spwordCount = rowSums(as.matrix(spdtm))
length(spwordCount)
hist(wordCount)
logWordCount <- log(wordCount)
hist(logWordCount)
boxplot(logWordCount ~ emailsSparse$spam)
emailsSparse2 = emailsSparse
emailsSparse2$logWordCount = logWordCount
train2 <- subset(emailsSparse2, split==TRUE)
test2 <- subset(emailsSparse2, split==FALSE)

library(rpart)
library(rpart.plot)
library(ROCR)
spam2CART <- rpart(spam ~ ., data=train2, method="class")
prp(spam2CART)
# Training Accuracy
predictCART = predict(spam2CART, type="class")
table(train2$spam, predictCART)
sum(train2$spam == predictCART) / nrow(train2)
# Test Accuracy
predictCART = predict(spam2CART, newdata=test2, type="class")
table(test2$spam, predictCART)
acCART <- sum(test2$spam == predictCART) / nrow(test2)
acCART
# Training AUC
predictCART <- predict(spam2CART)[,2]
pred <- prediction(predictCART, train2$spam)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
# Test AUC
predictCART <- predict(spam2CART, newdata=test2)[,2]
pred <- prediction(predictCART, test2$spam)
auc.tmp <- performance(pred, "auc")
aucCART <- as.numeric(auc.tmp@y.values)
aucCART
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)

library(randomForest)
set.seed(123)
spam2RF <- randomForest(spam ~., data = train2)
predictRF <- predict(spam2RF)
predictRF[predictRF > 0.5] <- 1
predictRF[predictRF <= 0.5] <- 0
table(train2$spam, predictRF)
sum(train2$spam == predictRF) / nrow(train2)
pred <- prediction(predictRF, train2$spam)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc
predictRF <- predict(spam2RF, newdata=test2)
#table(test2$spam, predictRF >= 0.5)
predictRF[predictRF > 0.5] <- 1
predictRF[predictRF <= 0.5] <- 0
table(test2$spam, predictRF)
acRF <- sum(test2$spam == predictRF) / nrow(test2)
acRF
pred <- prediction(predictRF, test2$spam)
auc.tmp <- performance(pred, "auc")
aucRF <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
aucRF
paste("CART", "RF")
paste(acCART, acRF)
paste(aucCART, aucRF)

library(RTextTools)
dtm2gram = create_matrix(as.character(corpus), ngramLength=2)
dtm2gram
spdtm2gram <- removeSparseTerms(dtm2gram, 0.95)
spdtm2gram
# Convert to a data frame
emailsSparse2gram <- as.data.frame(as.matrix(spdtm2gram))
# Make all variable names R-friendly
colnames(emailsSparse2gram) <- make.names(colnames(emailsSparse2gram))
emailsCombined = cbind(emailsSparse, emailsSparse2gram)
trainCombined <- subset(emailsCombined, split==TRUE)
testCombined <- subset(emailsCombined, split==FALSE)

library(rpart)
library(rpart.plot)
library(ROCR)
spamCARTCombined <- rpart(spam ~ ., data=trainCombined, method="class")
prp(spamCARTCombined)
prp(spamCARTCombined, varlen=0)
# Training Accuracy
predictCART = predict(spamCARTCombined, type="class")
table(trainCombined$spam, predictCART)
sum(trainCombined$spam == predictCART) / nrow(trainCombined)
# Test Accuracy
predictCART = predict(spamCARTCombined, newdata=testCombined, type="class")
table(testCombined$spam, predictCART)
acCART <- sum(testCombined$spam == predictCART) / nrow(testCombined)
acCART
# Training AUC
predictCART <- predict(spamCARTCombined)[,2]
pred <- prediction(predictCART, trainCombined$spam)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
# Test AUC
predictCART <- predict(spamCARTCombined, newdata=testCombined)[,2]
pred <- prediction(predictCART, testCombined$spam)
auc.tmp <- performance(pred, "auc")
aucCART <- as.numeric(auc.tmp@y.values)
aucCART
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)

library(randomForest)
set.seed(123)
spamRFCombined <- randomForest(spam ~., data = trainCombined)
predictRF <- predict(spamRFCombined)
predictRF[predictRF > 0.5] <- 1
predictRF[predictRF <= 0.5] <- 0
table(trainCombined$spam, predictRF)
sum(trainCombined$spam == predictRF) / nrow(trainCombined)
pred <- prediction(predictRF, trainCombined$spam)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc
predictRF <- predict(spamRFCombined, newdata=testCombined)
#table(testCombined$spam, predictRF >= 0.5)
predictRF[predictRF > 0.5] <- 1
predictRF[predictRF <= 0.5] <- 0
table(testCombined$spam, predictRF)
acRF <- sum(testCombined$spam == predictRF) / nrow(testCombined)
acRF
pred <- prediction(predictRF, testCombined$spam)
auc.tmp <- performance(pred, "auc")
aucRF <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
aucRF
paste("CART", "RF")
paste(acCART, acRF)
paste(aucCART, aucRF)
