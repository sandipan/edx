setwd("C:/Users/SANDIPAN DEY/Desktop/Edx")
source("init.R")

#### init
train <- test <- combined <- combined.id <- happy <- train1 <- valid1 <- NULL
ntrain <- ntest <- ntot <- 0

#### load data
loadData()

#### vars for imputation
sparseness.index <- 0.9 #0.295 # 0.3
vars.for.imputation <- getVarsForImputation(combined, sparseness.index)
length(vars.for.imputation)

#### impute
method <- "knn" #"zeros" #"knn" # "mice" # "missForest"
combined <- imputeData(combined, vars.for.imputation, method)

#### normalize
preproc <- preProcess(combined)
combined <- predict(preproc, combined)

#### cluster
k <- 6
cluster(combined, k)

#### dimensionality reduction
frac_var <- 0.98 #0.75 #0.35 #0.25 
combined <- getPrincipalComponents(combined, frac_var)

#### importance
imp <- as.data.frame(importance(RFm))
combined <- getImportantFeatures(combined, imp, minGini=16)

#### split validate
splitValidate()

#### start classification
set.seed(100)
threshold <- 0.5

#### step
LOGm <- glm(as.factor(Happy) ~ ., data=train, family='binomial')
RLOGm <- step(LOGm)
predicted.Happy <- predict(RLOGm, newdata=valid1, type="response")
computeAccuracy(valid1, predicted.Happy, valid1$Happy, threshold)
combined <- combined[names(RLOGm$coefficients)[-1]]

#### classify
predicted.HappyLOG <- classify(train1, valid1, threshold, "classifyLOG")
predicted.HappyRF <- classify(train1, valid1, threshold, "classifyRF")
predicted.HappySVM <- classify(train1, valid1, threshold, "classifySVM")
predicted.HappyADA <- classify(train1, valid1, threshold, "classifyADA")
#predicted.HappyNB <- classify(train1, valid1, threshold, "classifyNB")

p1 <- predicted.HappyLOG > threshold
p2 <- predicted.HappyRF  > threshold
p3 <- predicted.HappySVM  > threshold
p4 <- predicted.HappyADA  > threshold
p5 <- predicted.HappyNB  > threshold

dfm <- data.frame(p1 = p1, p2 = p2, p3 = p3, p4 = p4, p5 = p5)
dfm <- data.frame(p1 = p1, p2 = p2, p3 = p3, p4 = p4)
dfm <- data.frame(p1 = p1, p2 = p2, p3 = p3)
pred <- as.integer(rowSums(dfm) >= 3)
computeAccuracy(valid1, pred, valid1$Happy, threshold)

ind = which(predicted.HappyRF < predicted.HappySVM)
pred = predicted.HappyRF
pred[ind] <- predicted.HappySVM[ind]
computeAccuracy(valid1, pred, valid1$Happy, threshold)
computeAccuracy(valid1, apply(rbind(predicted.HappyRF, predicted.HappyADA, predicted.HappySVM), 2, median), valid1$Happy, threshold)
computeAccuracy(valid1, apply(rbind(predicted.HappyRF, predicted.HappyADA, predicted.HappySVM), 2, mean), valid1$Happy, threshold)
computeAccuracy(valid1, apply(rbind(predicted.HappyRF, predicted.HappyLOG, predicted.HappySVM), 2, mean), valid1$Happy, threshold)
computeAccuracy(valid1, apply(rbind(predicted.HappyRF, predicted.HappyLOG, predicted.HappySVM), 2, median), valid1$Happy, threshold)
computeAccuracy(valid1, apply(rbind(predicted.HappyRF, predicted.HappyLOG, predicted.HappySVM, predicted.HappyADA, predicted.HappyNB), 2, median), valid1$Happy, threshold)
computeAccuracy(valid1, apply(rbind(predicted.HappyRF, predicted.HappyLOG, predicted.HappySVM, predicted.HappyADA, predicted.HappyNB), 2, mean), valid1$Happy, threshold)

# maxauc 0.6863462

#for (k in seq(0.35, 0.45, 0.01)) {
for (k in seq(0.1, 0.9, 0.05)) {
	print(k)
	computeAccuracy(valid1, (k*predicted.HappyRF + (1-k)*predicted.HappyLOG), valid1$Happy, threshold)
}
for (k in seq(0.1, 0.9, 0.05)) {
	print(k)
	computeAccuracy(valid1, (k*predicted.HappyRF + (1-k)*predicted.HappySVM), valid1$Happy, threshold)
}
for (k in seq(0.1, 0.9, 0.05)) {
	print(k)
	computeAccuracy(valid1, (k*predicted.HappyLOG + (1-k)*predicted.HappySVM), valid1$Happy, threshold)
}
for (k in seq(0.1, 0.9, 0.05)) {
	for (l in seq(0.1, 0.9, 0.05)) {
		print(paste(k,l))
		computeAccuracy(valid1, (k*predicted.HappyLOG + l*predicted.HappySVM + (1-k-l)*predicted.HappyRF), valid1$Happy, threshold)
	}
}
maxklm <- ''
maxauc <- 0
for (k in seq(0.1, 0.9, 0.1)) {
	for (l in seq(0.1, 0.9, 0.1)) {
		for (m in seq(0.1, 0.9, 0.1)) {
			auc <- getAUC(valid1, (k*predicted.HappyLOG + l*predicted.HappySVM + m*predicted.HappyRF + (1-k-l-m)*predicted.HappyADA), valid1$Happy, threshold)
			if (maxauc < auc & k+l+m <= 1) {
				maxauc <- auc
				maxklm <- paste(k,l,m)
			}
			#computeAccuracy(valid1, (k*predicted.HappyLOG + l*predicted.HappySVM + m*predicted.HappyRF + (1-k-l-m)*predicted.HappyADA), valid1$Happy, threshold)
		}
	}
}

computeAccuracy(valid1, (0.3*predicted.HappyLOG + 0.1*predicted.HappySVM + 0.2*predicted.HappyRF + 0.4*predicted.HappyADA), valid1$Happy, threshold) ####
computeAccuracy(valid1, (0.1*predicted.HappyLOG + 0.35*predicted.HappySVM + 0.55*predicted.HappyRF), valid1$Happy, threshold) #### 6893, 16
computeAccuracy(valid1, (0.8*predicted.HappyRF + predicted.HappyLOG) / 2, valid1$Happy, threshold)
computeAccuracy(valid1, (0.4*predicted.HappyRF + 0.6*predicted.HappyLOG), valid1$Happy, threshold)

predicted.HappyLOG <- classify(train, train, threshold, "classifyLOG")
predicted.HappyRF <- classify(train, train, threshold, "classifyRF")
predicted.HappySVM <- classify(train, train, threshold, "classifySVM")
computeAccuracy(train, (0.1*predicted.HappyLOG + 0.35*predicted.HappySVM + 0.55*predicted.HappyRF), train$Happy, threshold)
predicted.HappyLOG <- classify(train, test, threshold, "classifyLOG", FALSE)
predicted.HappyRF <- classify(train, test, threshold, "classifyRF", FALSE)
predicted.HappySVM <- classify(train, test, threshold, "classifySVM", FALSE)
#testout <- data.frame(UserID=test.id, Probability1=(0.4*predicted.HappyRF + 0.6*predicted.HappyLOG))
testout <- data.frame(UserID=test.id, Probability1=(0.1*predicted.HappyLOG + 0.35*predicted.HappySVM + 0.55*predicted.HappyRF))
write.csv(testout, "testout.csv", row.names=FALSE)

computeAccuracy(valid1, (predicted.HappyRF + predicted.HappyLOG) / 2, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF + predicted.HappySVM) / 2, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF + predicted.HappyADA) / 2, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF + predicted.HappyADA + predicted.HappySVM) / 3, valid1$Happy, threshold)

predicted.HappyRF <- classify(train, train, threshold, "classifyRF")
predicted.HappyLOG <- classify(train, train, threshold, "classifyLOG")
predicted.HappySVM <- classify(train, train, threshold, "classifySVM")
#computeAccuracy(train, (predicted.HappyRF + predicted.HappyLOG) / 2, train$Happy, threshold)
computeAccuracy(train, (0.1*predicted.HappyLOG + 0.35*predicted.HappySVM + 0.55*predicted.HappyRF), train$Happy, threshold)
predicted.HappyRF <- classify(train, test, threshold, "classifyRF", FALSE)
predicted.HappyLOG <- classify(train, test, threshold, "classifyLOG", FALSE)
predicted.HappySVM <- classify(train, test, threshold, "classifySVM", FALSE)
#computeAccuracy(valid1, (0.8*predicted.HappyRF + predicted.HappyLOG) / 2, valid1$Happy, threshold)
#testout <- data.frame(UserID=test.id, Probability1=(predicted.HappyRF + predicted.HappyLOG) / 2)
testout <- data.frame(UserID=test.id, Probability1=(0.1*predicted.HappyLOG + 0.35*predicted.HappySVM + 0.55*predicted.HappyRF))
write.csv(testout, "testout.csv", row.names=FALSE)

predicted.HappyRF <- classifyWithClustering(train1, valid1, k, threshold, "classifySVM")

threshold <- 0.5
KNN1 <- train(Happy ~ ., data = train1, method = "knn", trControl = trainControl(method = "cv"))
predicted.HappyKNN <- predict(KNN1, newdata = train1, type = "raw")
computeAccuracy(train1, predicted.HappyKNN, train1$Happy, threshold)
predicted.HappyKNN <- predict(KNN1, newdata = valid1, type = "raw")
computeAccuracy(valid1, predicted.HappyKNN, valid1$Happy, threshold)

RFm1 <- train(as.factor(Happy) ~ ., data = train1, method = "rf", trControl = trainControl(method = "cv"))
predicted.HappyRF <- predict(RFm1, newdata = valid1, type = "raw")
computeAccuracy(train1, predicted.HappyRF, valid1$Happy, threshold)
GBMm1 <- train(as.factor(Happy) ~ ., data = train, method = "gbm", trControl = trainControl(method = "cv"))
predicted.HappyGBM <- predict(GBMm1, newdata = NULL, type = "raw")
computeAccuracy(train1, predicted.HappyGBM, train1$Happy, threshold)


predict(knnFit, newdata = test, type = "raw")





RFm1 <- randomForest(as.factor(Happy) ~ ., data = train1, type="classification")
SVMm1 <- svm(as.factor(Happy) ~ ., data = train1, type="C-classification", probability=TRUE)
ADAm1 <- ada(as.factor(Happy) ~ ., data = train1)
LOGm1 <- glm(as.factor(Happy) ~ ., data=train1, family='binomial')
#RLOGm1 <- glmnet(train1[-83], as.factor(train1$Happy), family='binomial')
NBm1 <- naiveBayes(as.factor(Happy) ~ ., data = train1, type="raw")
GBMm1 <- gbm(as.factor(Happy) ~ ., data=train1, dist="adaboost", n.tree = 500, shrinkage = 1)


#NNm1 <- nnet(as.factor(Happy) ~ ., data = train1, size=10)
#SLOGm1 <- step(LOGm1)
#CARTm1 <- rpart(as.factor(Happy) ~ ., data=train1, method="class")
predicted.HappyRF <- predict(RFm1, type="prob")
predicted.HappySVM <- predict(SVMm1, train1, decision.values = TRUE, probability=TRUE)
predicted.HappyNB <- predict(NBm1, train1, type="raw")
predicted.HappyADA <- predict(ADAm1, newdata=train1, type="prob")
predicted.HappyLOG <- predict(LOGm1, newdata=train1, type="response")
predicted.HappyRLOG <- predict(LOGm1, newdata=train1, type="response")
#gbm.perf(GBMm1)
#confusion(predict(fit.gbm1, test.data2, n.trees = gbm.perf(GBMm1)) > 0, test.data2$y > 0)
predicted.HappyGBM <- predict(GBMm1, newdata=valid1, n.trees = gbm.perf(GBMm1), type="response")
#predicted.HappyNN <- predict(NNm1, newdata=train1, type="raw")
computeAccuracy(train1, predicted.HappyRF[,2], train1$Happy, threshold)
computeAccuracy(train1, attr(predicted.HappySVM, "probabilities")[,1], train1$Happy, threshold)
computeAccuracy(train1, predicted.HappyNB[,2], train1$Happy, threshold)
#computeAccuracy(train1, predicted.HappyNN, train1$Happy, threshold)
computeAccuracy(train1, predicted.HappyADA[,2], train1$Happy, threshold)
computeAccuracy(train1, predicted.HappyLOG, train1$Happy, threshold)
computeAccuracy(train1, (predicted.HappyRF[,2] + attr(predicted.HappySVM, "probabilities")[,1]) / 2, train1$Happy, threshold)
computeAccuracy(train1, (predicted.HappyRF[,2] + predicted.HappyADA[,2]) / 2, train1$Happy, threshold)
computeAccuracy(train1, (predicted.HappyRF[,2] + predicted.HappyADA[,2] + attr(predicted.HappySVM, "probabilities")[,1]) / 3, train1$Happy, threshold)
predicted.HappyRF <- predict(RFm1, newdata=valid1, type="prob")
predicted.HappySVM <- predict(SVMm1, newdata=valid1, decision.values = TRUE, probability=TRUE)
predicted.HappyNB <- predict(NBm1, newdata=valid1,type="raw")
predicted.HappyADA <- predict(ADAm1, newdata=valid1, type="prob")
predicted.HappyLOG <- predict(LOGm1, newdata=valid1, type='response')
rdf <- as.data.frame(cbind(predicted.HappyRF[,2],attr(predicted.HappySVM, "probabilities")[,1],predicted.HappyLOG,predicted.HappyNB[,2], predicted.HappyADA[,2], valid1$Happy))
names(rdf) <- c("rf", "svm", "log", "nb", "ada", "happy")
write.csv(rdf, "out.csv")
#predicted.HappyNN <- predict(NNm1, newdata=valid1, type="raw")
#predicted.HappySLOG <- predict(SLOGm1, newdata=valid1, type='response')
#predicted.HappyCART <- predict(CARTm1, newdata=valid1, type="prob")
computeAccuracy(valid1, predicted.HappyRF[,2], valid1$Happy, threshold)
computeAccuracy(valid1, attr(predicted.HappySVM, "probabilities")[,1], valid1$Happy, threshold)
computeAccuracy(valid1, predicted.HappyNB[,2], valid1$Happy, threshold)
computeAccuracy(valid1, predicted.HappyADA[,2], valid1$Happy, threshold)
computeAccuracy(valid1, predicted.HappyLOG, valid1$Happy, threshold)
#computeAccuracy(valid1, predicted.HappyNN, valid1$Happy, threshold)
#computeAccuracy(valid1, predicted.HappySLOG, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF[,2] + attr(predicted.HappySVM, "probabilities")[,1]) / 2, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyADA[,2] + attr(predicted.HappySVM, "probabilities")[,1]) / 2, valid1$Happy, threshold)
#computeAccuracy(valid1, (predicted.HappyLOG + predicted.HappyADA[,2] + attr(predicted.HappySVM, "probabilities")[,1]) / 3, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappyADA[,2]) / 2, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappyLOG) / 2, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyNB[,2] + predicted.HappyLOG) / 2, valid1$Happy, threshold)
#computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappySLOG) / 2, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappyADA[,2] + attr(predicted.HappySVM, "probabilities")[,1]) / 3, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappyADA[,2] + attr(predicted.HappySVM, "probabilities")[,1] + predicted.HappyLOG) / 4, valid1$Happy, threshold)
computeAccuracy(valid1, (predicted.HappyRF[,2] + attr(predicted.HappySVM, "probabilities")[,1] + predicted.HappyLOG) / 3, valid1$Happy, threshold)
#computeAccuracy(valid1, predicted.HappyCART[,2], valid1$Happy, threshold)
#computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappyADA[,2] + attr(predicted.HappySVM, "probabilities")[,1] + predicted.HappyLOG + predicted.HappyCART[,2]) / 5, valid1$Happy, threshold)
#computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappyADA[,2] + attr(predicted.HappySVM, "probabilities")[,1] + predicted.HappySLOG) / 4, valid1$Happy, threshold)
#computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappyADA[,2] + predicted.HappyNB[,2] + attr(predicted.HappySVM, "probabilities")[,1] + predicted.HappyLOG) / 5, valid1$Happy, threshold)
#computeAccuracy(valid1, (predicted.HappyRF[,2] + predicted.HappyADA[,2] + predicted.HappyNB[,2] + predicted.HappyLOG) / 4, valid1$Happy, threshold)


LOGm <- glm(as.factor(Happy) ~ ., data=train1, family='binomial')
summary(LOGm)
predicted.Happy <- predict(LOGm, type='response')
computeAccuracy(train1, predicted.Happy, train1$Happy, threshold)
predicted.Happy <- predict(LOGm, newdata=valid1, type='response')
computeAccuracy(valid1, predicted.Happy, valid1$Happy, threshold)

CARTm <- rpart(as.factor(Happy) ~ ., data=train1, method="class")
prp(CARTm)
#predicted.Happy <- predict(CARTm, type="class")
predicted.Happy <- predict(CARTm, type="prob")
computeAccuracy(train1, predicted.Happy[,2], train1$Happy, threshold)
#predicted.Happy <- predict(CARTm, newdata=valid1, type="class")
predicted.Happy <- predict(CARTm, newdata=valid1, type="prob")
computeAccuracy(valid1, predicted.Happy[,2], valid1$Happy, threshold)

RFm <- randomForest(as.factor(Happy) ~ ., data = train1, type="classification")
varImpPlot(RFm)
#predicted.Happy <- predict(RFm, type="class")
predicted.Happy <- predict(RFm, type="prob")
computeAccuracy(train1, predicted.Happy[,2], train1$Happy, threshold)
#predicted.Happy <- predict(RFm, newdata=valid1, type="class")
#RFm <- randomForest(as.factor(Happy) ~ ., data = train1, type="classification", maxnode=5, ntree=1000)
predicted.Happy <- predict(RFm, newdata=valid1, type="prob")
computeAccuracy(valid1, predicted.Happy[,2], valid1$Happy, threshold)

ADAm <- ada(as.factor(Happy) ~ ., data = train1)
#predicted.Happy <- predict(RFm, type="class")
predicted.Happy <- predict(ADAm, newdata=train1, type="prob")
computeAccuracy(train1, predicted.Happy[,2], train1$Happy, threshold)
#predicted.Happy <- predict(RFm, newdata=valid1, type="class")
predicted.Happy <- predict(ADAm, newdata=valid1, type="prob")
computeAccuracy(valid1, predicted.Happy[,2], valid1$Happy, threshold)

SVMm <- svm(as.factor(Happy) ~ ., data = train1, type="C-classification", probability=TRUE)
predicted.Happy <- predict(SVMm, train1, decision.values = TRUE, probability=TRUE)
computeAccuracy(train1, attr(predicted.Happy, "probabilities")[,1], train1$Happy, threshold)
SVMm <- svm(as.factor(Happy) ~ ., data = train1, type="C-classification", kernel="linear", cost=1000, probability=TRUE) # linear polynomial 
#SVMm <- svm(as.factor(Happy) ~ ., data = train1, type="C-classification", probability=TRUE, cross=10)
predicted.Happy <- predict(SVMm, newdata=valid1, decision.values = TRUE, probability=TRUE)
computeAccuracy(valid1, attr(predicted.Happy, "probabilities")[,1], valid1$Happy, threshold)

SVMm <- svm(as.factor(Happy) ~ ., data = train, type="C-classification",kernel = "linear", probability=TRUE)
LOGm <- glm(as.factor(Happy) ~ ., data = train, family='binomial')
ADAm <- ada(as.factor(Happy) ~ ., data = train)
RFm <- randomForest(as.factor(Happy) ~ ., data = train, type="classification")
GBMm <- gbm(as.factor(Happy) ~ ., data = train)
CARTm <- rpart(as.factor(Happy) ~ ., data=train, method="class")
predicted.HappySVM <- predict(SVMm, train, decision.values = TRUE, probability=TRUE)
predicted.HappyLOG <- predict(LOGm, train, type='response')
predicted.HappyCART <- predict(CARTm, train, type="prob")
predicted.HappyADA <- predict(ADAm, train, type="prob")
predicted.HappyGBM <- predict(GBMm, train, type="response", n.trees=100)
predicted.HappyRF <- predict(RFm, train, type="prob")
computeAccuracy(train, attr(predicted.HappySVM, "probabilities")[,1], train$Happy, threshold)
computeAccuracy(train, predicted.HappyLOG, train$Happy, threshold)
computeAccuracy(train, predicted.HappyCART[,2], train$Happy, threshold)
computeAccuracy(train, predicted.HappyADA[,2], train$Happy, threshold)
computeAccuracy(train, predicted.HappyGBM[,2], train$Happy, threshold)
computeAccuracy(train, predicted.HappyRF[,2], train$Happy, threshold)
computeAccuracy(train, (predicted.HappyRF[,2] + attr(predicted.HappySVM, "probabilities")[,1]) / 2, train$Happy, threshold)

threshold <- 0.53

predicted.HappyRF <- predict(RFm, newdata=test, type="prob")
testout1 <- data.frame(UserID=test.id, Probability1=predicted.HappyRF[,2])
predicted.HappySVM <- predict(SVMm, newdata=test, decision.values = TRUE, probability=TRUE)
testout2 <- data.frame(UserID=test.id, Probability1=attr(predicted.HappySVM, "probabilities")[,1])
plot(testout$Probability1, testout1$Probability1)
testout12 <- data.frame(UserID=test.id, Probability1=(predicted.HappyRF[,2] + attr(predicted.HappySVM, "probabilities")[,1]) / 2)
predicted.HappyADA <- predict(ADAm, test, type="prob")
testout3 <- data.frame(UserID=test.id, Probability1=predicted.HappyADA[,2])
predicted.HappyLOG <- predict(LOGm, test, type="response")
testout4 <- data.frame(UserID=test.id, Probability1=predicted.HappyLOG[,2])
testout1234 <- data.frame(UserID=test.id, Probability1=(predicted.HappyRF[,2] + attr(predicted.HappySVM, "probabilities")[,1] + predicted.HappyADA[,2] + predicted.HappyLOG) / 4)
plot(testout$Probability1, testout2$Probability1)
testout13 <- data.frame(UserID=test.id, Probability1=rowMeans(cbind(testout1$Probability1, testout3$Probability1)))
testout14 <- data.frame(UserID=test.id, Probability1=(predicted.HappyRF[,2] + predicted.HappyLOG) / 2)
testout124 <- data.frame(UserID=test.id, Probability1=(predicted.HappyRF[,2] + attr(predicted.HappySVM, "probabilities")[,1] + predicted.HappyLOG) / 3)

#write.csv(testout, "testout.csv", row.names=FALSE)
#write.csv(testout1, "testout.csv", row.names=FALSE)
#write.csv(testout2, "testout.csv", row.names=FALSE)
#write.csv(testout3, "testout.csv", row.names=FALSE)
#write.csv(testout12, "testout.csv", row.names=FALSE)
#write.csv(testout1234, "testout.csv", row.names=FALSE)
write.csv(testout14, "testout.csv", row.names=FALSE)

testout$algo <- "RF"
testout1$algo <- "SVM"
testout2$algo <- "ADA"
#ggplot(testout,aes(UserID,Probability1))+geom_line(aes(color="First line"))+
#  geom_line(data=testout1,aes(color="Second line"))+
#  labs(color="Legend text")
predicted <- as.data.frame(rbind(testout, testout1, testout2))
#qplot(UserID, Probability1, data = predicted, group = as.factor(algo), colour = as.factor(algo), geom = "line")
ggplot(predicted,aes(x=UserID,y=Probability1 > threshold,colour=as.factor(algo),group=as.factor(algo))) + geom_point()
d <- data.frame(UserID=testout$UserID, RF=testout$Probability1>threshold, SVM=testout1$Probability1>threshold, ADA=testout2$Probability1>threshold)






predictedSVM.Happy <- predict(SVMm, train, decision.values = TRUE, probability=TRUE)
predictedSVM.Happy <- attr(predictedSVM.Happy, "probabilities")[,1]
predictedLOG.Happy <- predict(LOGm, type="response")
#predicted.Happy <- (predictedSVM.Happy + predictedLOG.Happy) / 2
predicted.Happy <- cbind(predictedSVM.Happy, predictedLOG.Happy, threshold)

predictedSVM.Happy[predictedSVM.Happy > threshold] <- 1
predictedSVM.Happy[predictedSVM.Happy <= threshold] <- 0
predictedLOG.Happy[predictedLOG.Happy > threshold] <- 1
predictedLOG.Happy[predictedLOG.Happy <= threshold] <- 0
predicted.Happy[predicted.Happy > threshold] <- 1
predicted.Happy[predicted.Happy <= threshold] <- 0

computeAccuracy(train, predictedSVM.Happy, train$Happy)
computeAccuracy(train, predictedLOG.Happy, train$Happy)
computeAccuracy(train, predicted.Happy, train$Happy)

predictedSVM.Happy <- predict(SVMm, newdata=test, decision.values = TRUE, probability=TRUE)
predictedSVM.Happy <- attr(predictedSVM.Happy, "probabilities")[,1]
predictedLOG.Happy <- predict(LOGm, newdata=test, type="response")
testout <- data.frame(UserID=test.id, Probability1=predictedSVM.Happy, Probability2=predictedLOG.Happy)
plot(testout$Probability1, testout$Probability2)
testout <- data.frame(UserID=test.id, Probability1=predictedLOG.Happy)
write.csv(testout, "testout.csv", row.names=FALSE)


predictedLOG.Happy <- predict(LOGm, type="response")
predictedLOG.Happy[predictedLOG.Happy > threshold] <- 1
predictedLOG.Happy[predictedLOG.Happy <= threshold] <- 0
computeAccuracy(train, predictedLOG.Happy, train$Happy)


sort(unique(train$YOB))
sort(unique(test$YOB))
unique(train$age)
train$age <- 2014 - train$YOB
test$age <- 2014 - test$YOB
unique(train$EducationLevel)
test.id <- test[1]
train <- train[-c(1,2)]
test <- test[-c(1,2)]
names(train)
head(train)
dim(train)
dim(test)

train[train == ""] <- NA
test[test == ""] <- NA

require(lattice)
imp <- mice(train, maxit=1)
### density plot of head circumference per imputation
### blue is observed, red is imputed
densityplot(train, ~Happy|.imp)
### All combined in one panel.
densityplot(imp, ~Happy)

# nhanes example without .id
imp <- mice(train, print = FALSE)
X <- complete(imp, action = "long", include = TRUE)[, -2]
test <- as.mids(X, .id = NULL)
is.mids(test)
test.dat <- complete(test, action = "long", include = TRUE)

imp <- mice(nhanes, seed = 23109)
print(imp)
imp$imp$bmi
complete(imp)
stripplot(imp, pch = 20, cex = 1.2)
xyplot(imp, bmi ~ chl | .imp, pch = 20, cex = 1.4)

imp <- mice(train[,1:6], m=10)
print(imp)
train[,1:6] <- complete(imp)
stripplot(imp, pch = 20, cex = 1.2)
xyplot(imp, bmi ~ chl | .imp, pch = 20, cex = 1.4)

#with(train, impute(age, median))

#preproc = preProcess(train)
#train = predict(preproc, train)
#test = predict(preproc, test)
#train.mod <- missForest(train, verbose=TRUE)
train.num <- train
for (i in 8:108) {
	train.num[,i] <- as.integer(train.num[,i])
}
X <- train.num[,8:108]
#pc.cr <- princomp(X, cor = TRUE) #screeplot(pc.cr) #screeplot(pc.cr, type="lines") #ld <- with(pc.cr, unclass(loadings)) #aload <- abs(ld)
#pcs <- sweep(aload, 2, colSums(aload), "/") #head(pcs) #colSums(pcs) #plot(pc.cr$sdev^2) #lines(pc.cr$sdev^2)

CARTm <- rpart(Happy ~ ., data=train.num, method="class")
prp(CARTm)
p <- predict(CARTm, type="class")
sum(p == train.num$Happy) / nrow(train.num)

CARTm <- rpart(Happy ~ ., data=train, method="class")
prp(CARTm)
p <- predict(CARTm, type="class")
sum(p == train$Happy) / nrow(train)
p <- predict(CARTm, newdata=test, type="class")
p1 <- predict(CARTm, newdata=test)
testout <- data.frame(UserID=test.id,Probability1=p1, Class=p)
write.csv(testout, "testout.csv")

vs <- c("Gender", "Income", "HouseholdStatus", "EducationLevel", "Party", "votes", "Happy")
tvs <- rfImpute(Happy ~ Gender + Income + HouseholdStatus + EducationLevel + Party + votes, train[vs])
for (v in vs) {
	train[v] <- tvs[v]
}

train <- rfImpute(Happy ~ ., train)
rfm <- randomForest(Happy ~ ., data = train)
p <- predict(rfm)
sum(p == train$Happy) / nrow(train)
