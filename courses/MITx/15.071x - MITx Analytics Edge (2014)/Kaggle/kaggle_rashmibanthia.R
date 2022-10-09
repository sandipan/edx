#Kaggle Show of Hands
#This script had private AUC of 0.77896

rm(list=ls(all=TRUE))
library(gbm)
answers <- read.csv("train.csv", stringsAsFactors=FALSE)

answers[2653,2]=NA  #YOB=2039
answers[answers==''] <- "AIGNORED"


#Renaming the column names
newcolnames <- setdiff(names(answers),c("UserID","YOB","Gender","Income","HouseholdStatus","EducationLevel","Party","Happy","votes"))
oldcolnames <- newcolnames
#New colnames Q:1..101
newcolnames <- sprintf("Q%d",1:101)
colnames(answers)[9:109] = newcolnames

library(mice)
set.seed(144)
vars.for.imputation = c("Gender","Party", "YOB","Income","HouseholdStatus","EducationLevel")
imputed=complete(mice(answers[vars.for.imputation]))
answers[vars.for.imputation]=imputed

answers$Gender = as.factor(answers$Gender)
answers$Income = as.factor(answers$Income)
answers$HouseholdStatus = as.factor(answers$HouseholdStatus)
answers$EducationLevel = as.factor(answers$EducationLevel)
answers$Party = as.factor(answers$Party)

answers$Happy = as.factor(answers$Happy)
answers[, newcolnames] <- lapply(answers[, newcolnames], as.factor)

#Thanks to Telesphore for following code to scale variables 
for( cn in colnames(answers) ) {
  if ( substr(cn, 1, 1) != "Q" ) next
  lvls <- levels( answers[,cn] )
  if ( length(lvls) != 3 ) next  # Paranoia
  answers[,cn] <- as.integer( factor(answers[,cn], levels=c(lvls[2], lvls[1], lvls[3])) ) - 2
}

#Split Training set
library(ROCR)
library(caTools)
set.seed(123)
split = sample.split(answers$Happy, SplitRatio = 0.78)
train1 = subset(answers, split==TRUE)
test1 = subset(answers, split==FALSE)

set.seed(123)
GBM.model = gbm(Happy~.-UserID-Q3-Q11-Q101-Q45-Q69-Q23-Q60-Q75-Q44-Q76-Q54-Q70-Q2-Q52-Q79-Q91-Q34-Q51-Q47-Q36-Q77-Q61-Q37-Q53-Q7-Q57-Q87-Q39-Income-EducationLevel-Q86-Q24-Q78-Q48-Q35-Q72-Q93-Q20-Q56-Q32-Q97-Q98-Q99-Q9-Q49-Q71-Q88-Q58-Q95-Q73-Q1-Q21-Q4-Q28-Q92,data=train1,distribution = "gaussian", n.trees = 2000, shrinkage = 0.01, interaction.depth = 4,n.minobsinnode=5)
predictgbm = plogis(predict(GBM.model,n.trees=1000,type="response"))
as.numeric(performance(prediction(predictgbm, train1$Happy), "auc")@y.values)
#0.8154753

x1 = test1$Happy
test1$Happy = NULL
set.seed(123)
predictedtesthappy = plogis(predict(GBM.model,newdata=test1,n.trees=1225,type="response"))
as.numeric(performance(prediction(predictedtesthappy, x1), "auc")@y.values)
test1$Happy = x1
#0.7604545

#Preparing to submit
set.seed(123)
GBM.model1 = gbm(Happy~.-UserID-Q3-Q11-Q101-Q45-Q69-Q23-Q60-Q75-Q44-Q76-Q54-Q70-Q2-Q52-Q79-Q91-Q34-Q51-Q47-Q36-Q77-Q61-Q37-Q53-Q7-Q57-Q87-Q39-Income-EducationLevel-Q86-Q24-Q78-Q48-Q35-Q72-Q93-Q20-Q56-Q32-Q97-Q98-Q99-Q9-Q49-Q71-Q88-Q58-Q95-Q73-Q1-Q21-Q4-Q28-Q92,data=answers,distribution = "gaussian", n.trees = 2000, shrinkage = 0.01, interaction.depth = 4,n.minobsinnode=5)

testanswers <- read.csv("test.csv", stringsAsFactors=FALSE)
testanswers[575,2]=NA #2039 value changed to NA

testanswers[testanswers==''] <- "AIGNORED"

#Renaming the column names
newcolnames <- setdiff(names(testanswers),c("UserID","YOB","Gender","Income","HouseholdStatus","EducationLevel","Party","votes"))
oldcolnames <- newcolnames
#New colnames Q:1..101
newcolnames <- sprintf("Q%d",1:101)
colnames(testanswers)[8:108] = newcolnames


set.seed(144)
vars.for.imputation = c("YOB","Income")
imputed=complete(mice(testanswers[vars.for.imputation]))
testanswers[vars.for.imputation]=imputed

testanswers$Gender = as.factor(testanswers$Gender)
testanswers$Income = as.factor(testanswers$Income)
testanswers$HouseholdStatus = as.factor(testanswers$HouseholdStatus)
testanswers$EducationLevel = as.factor(testanswers$EducationLevel)
testanswers$Party = as.factor(testanswers$Party)

testanswers[, newcolnames] <- lapply(testanswers[, newcolnames], as.factor)

for( cn in colnames(testanswers) ) {
  if ( substr(cn, 1, 1) != "Q" ) next
  lvls <- levels( testanswers[,cn] )
  if ( length(lvls) != 3 ) next  # Paranoia
  testanswers[,cn] <- as.integer( factor(testanswers[,cn], levels=c(lvls[2], lvls[1], lvls[3])) ) - 2
}

#predictions for test set
set.seed(123)
#testanswers$Happy = plogis(predict(GBM.model1,newdata=testanswers,n.trees=1225,type="response"))
testanswers$Happy = plogis(predict(GBM.model1,newdata=testanswers,n.trees=1225,type="response"))

#Submission
submission = data.frame(UserID = testanswers$UserID, Probability1 = testanswers$Happy)
write.csv(submission, "submission.csv", row.names=FALSE) 



