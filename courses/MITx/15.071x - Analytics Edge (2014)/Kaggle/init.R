library(rpart)
library(rpart.plot)
library(randomForest)
library(e1071)
library(ada)
library(gbm)
library(ROCR)
library(caret)
library(mice)
library(missForest)
library(impute)
library(caTools)
library(nnet)
library(glmnet)
library(flexclust)
#library(kernlab)
#library(Hmisc)
#source("http://bioconductor.org/biocLite.R")
#source("biocLite.R")
#biocLite("impute")

loadData <- function() {
	train <<- read.csv("train.csv", header=TRUE,  strip.white = TRUE, na.strings= c(NA, " ", ""))  
	test <<- read.csv("test.csv", header=TRUE,  strip.white = TRUE, na.strings= c(NA, " ", ""))  
	ntrain <<- nrow(train)
	ntest <<- nrow(test)
	combined <<- rbind(train[-8], test)
	ntot <<- nrow(combined)
	happy <<- train$Happy
	combined$age <- 2014 - combined$YOB
	combined.id <<- combined[1]
	combined <<- combined[-c(1,2)]
}

getCor <- function(train) {
	co <- c()
	for (i in 1:(ncol(train))) {
		co <- c(co, cor(as.numeric(train[,i]), as.numeric(train$Happy), use="complete"))
	}
	return(co)
}

getVarsForImputation <- function(combined, sparseness.index) {
	vars <- names(combined)
	dfna <- NULL
	for (n in 1:(length(combined))) {
		na.val <- sum(is.na(combined[,n]))
		if (na.val != 0) {
			dfna <- rbind(dfna, data.frame(var=vars[n], na.num=na.val, na.prop=na.val/ntot))
		}
	}
	print(dfna[order(dfna$na.prop),])
	vars.sparse <- as.character(dfna[dfna$na.prop > sparseness.index, ]$var)
	#vars.for.imputation = setdiff(names(combined), "Happy")
	vars.for.imputation <- setdiff(names(combined), c("Happy", vars.sparse))
	return(vars.for.imputation)
}

imputeData <- function(combined, vars.for.imputation, method) {

	combined <- combined[vars.for.imputation]
	n <- ncol(combined)
	for (i in 1:n) {
		tmp <- as.integer(combined[,i])
		if (method == "zeros") {
			tmp[is.na(tmp)] <- 0
		}
		combined[,i] <- tmp
	}

	if (method == "mice") {
		imputed <- complete(mice(combined[vars.for.imputation]))
		combined[vars.for.imputation] = imputed
	}
	else if (method == "missForest") {
		imputed <- missForest(combined[vars.for.imputation], verbose = TRUE)
		combined[vars.for.imputation] = imputed$ximp
	}
	else if (method == "knn") {
		#nrow(combined[colSums(apply(combined, 1, is.na))<=41,])
		combined <- combined[colSums(apply(combined, 1, is.na))<=9*length(vars.for.imputation)/10,]
		imputed <- impute.knn(as.matrix(combined[vars.for.imputation]))
		combined[vars.for.imputation] = imputed$data
	}
	else {
		#imputed <- rfImpute(Species ~ ., iris.na)
	}
	return(combined)
}

getPrincipalComponents <- function(combined, frac_var = 0.9) {
	pc.cr <- prcomp(combined, scale = TRUE)
	screeplot(pc.cr)
	screeplot(pc.cr, type="lines")
	vars <- cumsum((pc.cr$sdev)^2) / sum(pc.cr$sdev^2) 
	p <- quantile(vars) #p["25%"]
	n <- length(vars)
	k <- round(frac_var * n)
	A <- pc.cr$rotation #dim(A) #dim(X) #dim(t(A)%*%A) #dim(A%*%t(A)) #det(A%*%t(A))
	combined <- as.data.frame(as.matrix(combined) %*% A[,1:k])
	return(combined)
}

getImportantFeatures <- function(combined, imp, minGini) {
	imp <- subset(imp, imp$MeanDecreaseGini > minGini)
	vars.imp <- rownames(imp)
	combined <- combined[vars.imp]
	#dim(combined)
	return(combined)
}

cluster <- function(combined, k = 6) {
	distances = dist(combined, method = "euclidean")
	clusteredcombined = hclust(distances, method = "ward") 
	plot(clusteredcombined)
	clusterGroups <- cutree(clusteredcombined, k)
	rect.hclust(clusteredcombined, k, border = "red")
}

splitValidate <- function() {
	train <<- combined[1:ntrain,]
	train$Happy <<- happy
	test <<- combined[(ntrain+1):(ntrain+ntest),]
	test.id <<- combined.id[(ntrain+1):(ntrain+ntest),]
	nrow(train) == ntrain
	nrow(test) == ntest
	length(test.id) == ntest
	#set.seed(144)
	split = sample.split(train$Happy, SplitRatio = 0.7)
	train1 <<- subset(train, split == TRUE)
	valid1 <<- subset(train, split == FALSE)
	100 * nrow(train1) / nrow(train)
}

classifyRF <- function(train1, valid1, threshold, acc=TRUE) {
	RFm <- randomForest(as.factor(Happy) ~ ., data = train1, type="classification")
	#varImpPlot(RFm)
	predicted.Happy <- predict(RFm, newdata=valid1, type="prob")
	if (acc) {
		computeAccuracy(valid1, predicted.Happy[,2], valid1$Happy, threshold)
	}
	return(predicted.Happy[,2])
}

classifyLOG <- function(train1, valid1, threshold, acc=TRUE) {
	LOGm <- glm(as.factor(Happy) ~ ., data=train1, family='binomial')
	predicted.Happy <- predict(LOGm, newdata=valid1, type="response")
	if (acc) {
		computeAccuracy(valid1, predicted.Happy, valid1$Happy, threshold)
	}
	return(predicted.Happy)
}

classifySVM <- function(train1, valid1, threshold, acc=TRUE) {
	SVMm <- svm(as.factor(Happy) ~ ., data = train1, type="C-classification", probability=TRUE)
	predicted.Happy <- predict(SVMm, newdata=valid1, decision.values = TRUE, probability=TRUE)
	if (acc) {
		computeAccuracy(valid1, attr(predicted.Happy, "probabilities")[,1], valid1$Happy, threshold)
	}
	return(as.vector(attr(predicted.Happy, "probabilities")[,1]))
}

classifyNB <- function(train1, valid1, threshold, acc=TRUE) {
	NBm <- naiveBayes(as.factor(Happy) ~ ., data = train1, type="raw")
	predicted.Happy <- predict(NBm, newdata=valid1,type="raw")
	if (acc) {
		computeAccuracy(valid1, predicted.Happy[,2], valid1$Happy, threshold)
	}
	return(predicted.Happy[,2])
}

classifyADA <- function(train1, valid1, threshold, acc=TRUE) {
	ADAm <- ada(as.factor(Happy) ~ ., data = train1)
	predicted.Happy <- predict(ADAm, newdata=valid1, type="prob")
	if (acc) {
		computeAccuracy(valid1, predicted.Happy[,2], valid1$Happy, threshold)
	}
	return(predicted.Happy[,2])
}

classifyGBM <- function(train1, valid1, threshold, acc=TRUE) {
	GBMm <- gbm(as.factor(Happy) ~ ., data=train1)
	predicted.Happy <- plogis(predict(GBMm, newdata=valid1, n.trees = gbm.perf(GBMm), type="response"))
	if (acc) {
		computeAccuracy(valid1, predicted.Happy[,2], valid1$Happy, threshold)
	}
	return(predicted.Happy[,2])
}


classify <- function(train1, valid1, threshold, classifyMethod, acc=TRUE) {
	return(do.call(classifyMethod, list(train1, valid1, threshold, acc)))
}

classifyWithClustering <- function(train.norm, test.norm, k, threshold, classifyMethod) {
	set.seed(144)
	km <- kmeans(train.norm, centers = k, iter.max = 1000)
	#table(km$cluster)
	km.kcca = as.kcca(km, train.norm)
	cluster.train = predict(km.kcca)
	cluster.test = predict(km.kcca, newdata=test.norm)
	strain <- list()
	stest <- list()
	pred.test <- list()
	for (i in 1:k) {
		print(k)
		strain[[i]] <- subset(train.norm, cluster.train == i)
		stest[[i]] <- subset(test.norm, cluster.test == i)
		pred.test[[i]] <- classify(strain[[i]], stest[[i]], threshold, classifyMethod)
	}
	print('Done')
	all.predictions <- c()
	all.outcomes <- c()
	for (i in 1:k) {
		all.predictions <- c(all.predictions, pred.test[[i]])
		all.outcomes <- c(all.outcomes, stest$Happy)
	}
	computeAccuracy(test.norm, all.predictions, all.outcomes, threshold)
	return(classifyRFWithClustering)
}

computeAccuracy <- function(dfm, predicted, actual, threshold) {
	predicted[predicted > threshold] <- 1
	predicted[predicted <= threshold] <- 0
	print(table(predicted, actual)) # confusion
	TP <- nrow(dfm[predicted == 1 & actual == 1, ])
	TN <- nrow(dfm[predicted == 0 & actual == 0, ])
	FP <- nrow(dfm[predicted == 1 & actual == 0, ])
	FN <- nrow(dfm[predicted == 0 & actual == 1, ])
	accuracy <- (TP + TN) / (TP + TN + FP + FN)
	precision <- TP / (TP + FP)
	recall <- TP / (TP + FN)
	sensitivity <- recall
	specificity <- TN / (TN + FN)
	pred <- prediction(predicted, actual)
	auc.tmp <- performance(pred, "auc")
	auc <- as.numeric(auc.tmp@y.values)
	perf=performance(pred, 'tpr', 'fpr')  #true positive and false negative
	plot(perf, colorize=T)
	print(data.frame(accuracy=accuracy, precision=precision, recall=recall, sensitivity=sensitivity, specificity=specificity, auc=auc))
	#print(data.frame(accuracy=accuracy, precision=precision, recall=recall, sensitivity=sensitivity, specificity=specificity))
}

getAUC <- function(dfm, predicted, actual, threshold) {
	predicted[predicted > threshold] <- 1
	predicted[predicted <= threshold] <- 0
	pred <- prediction(predicted, actual)
	auc.tmp <- performance(pred, "auc")
	auc <- as.numeric(auc.tmp@y.values)
	return(auc)
}
