setwd("C:/Users/SANDIPAN DEY/Desktop/Edx")

elantra <- read.csv("elantra.csv")
names(elantra)
head(elantra)
dim(elantra)

unique(elantra$Year)
train <- elantra[elantra$Year <= 2012,]
test <- elantra[elantra$Year > 2012,]
nrow(train)
nrow(test)
nrow(elantra)

m <- lm(ElantraSales ~ Unemployment + CPI_all + CPI_energy + Queries, data = train)
m
summary(m)

m <- lm(ElantraSales ~ Month + Unemployment + CPI_all + CPI_energy + Queries, data = train)
m
summary(m)

(3-1)*110.69
(5-1)*110.69

elantra$FMonth <- as.factor(elantra$Month)
train <- elantra[elantra$Year <= 2012,]
test <- elantra[elantra$Year > 2012,]

m <- lm(ElantraSales ~ FMonth + Unemployment + CPI_all + CPI_energy + Queries, data = train)
m
summary(m)

elantra <- read.csv("elantra.csv")
train <- elantra[elantra$Year <= 2012,]
test <- elantra[elantra$Year > 2012,]
abs(cor(train))

m <- lm(ElantraSales ~ FMonth + Unemployment + CPI_all + CPI_energy, data = train)
summary(m)

p <- predict(m, newdata=test)
sse <- sum((p - test$ElantraSales)^2)

b <- mean(train$ElantraSales)
# test R2
sst = sum((test$ElantraSales - b)^2)
R2 = 1 - sse/sst

max(abs(p - test$ElantraSales))
test[which.max(abs(p - test$ElantraSales)),]

test$pred <- abs(p - test$ElantraSales)
test[order(test$pred, decreasing=TRUE),] 

nytimes <- read.csv("nytimes.csv", stringsAsFactors = FALSE)
names(nytimes)
head(nytimes)
subset(nytimes, popular == 1)
nrow(subset(nytimes, popular == 1))
nrow(nytimes)
nrow(subset(nytimes, popular == 1)) / nrow(nytimes)
plot(nchar(nytimes$headline), nytimes$popular)
cor(nchar(nytimes$headline), nytimes$popular)
nytimes$popular <- as.factor(nytimes$popular)
nytimes$type <- as.factor(nytimes$type)

library(rpart)
library(randomForest)
m <- glm(popular ~ print + word.count, data = nytimes, family = 'binomial')
m <- rpart(popular ~ print + word.count, data = nytimes, type='class')
m <- randomForest(popular ~ print + word.count, data = nytimes)
predict(m)

# Split the data
library(caTools)
set.seed(144)
split <- sample.split(nytimes$popular, SplitRatio = 0.7)
train <- subset(nytimes, split==TRUE)
test <- subset(nytimes, split==FALSE)
m <- glm(popular ~ print + type + word.count, data = train, family = 'binomial')
summary(m)
predict(m, newdata=data.frame(print = 1, type = "News", word.count =  682), type = "response")
#predict(m, newdata=data.frame(print=1, typeNews=1, typeOther=0, word.count=682), type = "response")
predictLog <- predict(m, newdata=test, type = "response")
predictLog[predictLog > 0.5] <- 1
predictLog[predictLog <= 0.5] <- 0
tbl <- table(test$popular)
predictBaseline <- as.integer(names(tbl)[which.max(tbl)])
sum(predictLog != predictBaseline)
library(ROCR)
predictLog <- predict(m, newdata=test, type = "response")
pred <- prediction(predictLog, test$popular)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc

library(caret)
set.seed(144)
fitControl = trainControl( method = "cv", number = 10 )
cartGrid = expand.grid( .cp = (1:50)*0.01) 
# Perform the cross validation
cp <- train(popular ~ print + type + word.count, data = train, method = "rpart", trControl = fitControl, tuneGrid = cartGrid )
cp$bestTune
CARTm <- rpart(popular ~ print + type + word.count, data=train, cp=cp$bestTune)
prp(CARTm)
p <- predict(CARTm)
sum((p - statedata$Life.Exp)^2)

predictLog <- predict(m, type = "response")
pred <- prediction(predictLog, train$popular)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc

library(rpart.plot)
m <- rpart(popular ~ print + type + word.count, data = train, cp=0.01)
prp(m)

library(tm)
corpusSnippet <- Corpus(VectorSource(nytimes$snippet))
# Preprocessing
# Convert to lower-case
corpusSnippet <- tm_map(corpusSnippet, tolower)
# Remove punctuation
corpusSnippet <- tm_map(corpusSnippet, removePunctuation)
# Remove stopwords
corpusSnippet <- tm_map(corpusSnippet, removeWords, stopwords("english"))
# Stem document 
corpusSnippet <- tm_map(corpusSnippet, stemDocument)
# Create matrix
dtmSnippet <- DocumentTermMatrix(corpusSnippet)
dtmSnippet
length(dtmSnippet$dimnames$Term)
spdtm <- removeSparseTerms(dtmSnippet, 0.95)
spdtm
length(spdtm$dimnames$Term)
# Convert to a data frame
articleText <- as.data.frame(as.matrix(spdtm))
dim(articleText)
sort(colSums(articleText))

articleText$print <- nytimes$print
articleText$type <- nytimes$type
articleText$word.count <- nytimes$word.count
articleText$popular <- nytimes$popular

trainText <- subset(articleText, split==TRUE)
testText <- subset(articleText, split==FALSE)
dim(testText)

glmText  <- glm(popular ~ ., data = trainText, family = 'binomial')
summary(glmText)
predictLog <- predict(glmText, newdata=testText, type = "response")

# test auc
pred <- prediction(predictLog, testText$popular)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc

# train auc
predictLog <- predict(glmText, type = "response")
pred <- prediction(predictLog, trainText$popular)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc

# removing variables
glmText  <- glm(popular ~ yahoo + print + type + word.count, data = trainText, family = 'binomial')
summary(glmText)

# test auc
predictLog <- predict(glmText, newdata=testText, type = "response")
pred <- prediction(predictLog, testText$popular)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc

# train auc
predictLog <- predict(glmText, type = "response")
pred <- prediction(predictLog, trainText$popular)
auc.tmp <- performance(pred, "auc")
auc <- as.numeric(auc.tmp@y.values)
perf = performance(pred, "tpr", "fpr")
plot(perf, colorize=TRUE)
auc

stocks <- read.csv("nasdaq_returns.csv")
names(stocks)
head(stocks)
dim(stocks)
length(unique(stocks$stock_symbol))
sort(table(stocks$industry))
nrow(stocks[stocks$ret2000.12 >= 0.1,])
nrow(stocks[stocks$ret2000.12 <= -0.1,])
sort(tapply(stocks$ret2008.10, stocks$industry, mean))
sort(tapply(stocks$ret2000.02, stocks$industry, mean))

limited <- stocks[c(-1,-2,-3)]
names(limited)
sort(apply(limited, 2, mean))

distances = dist(limited, method = "euclidean")
clusterdlimited = hclust(distances, method = "ward") 
plot(clusterdlimited)
clusterGroups = cutree(clusterdlimited, k = 5)
clusters <- list()
cdf <- NULL
for (i in 1:5) {
	clusters[[i]] <- subset(stocks, clusterGroups == i)
	print(paste(i, nrow(clusters[[i]])))
	print(sort(table(clusters[[i]]$industry)))
	cdf <- cbind(cdf, as.matrix(table(clusters[[i]]$industry)))
}
cdf
cdf[c("Technology","Healthcare"),]

clusters <- list()
cdf <- NULL
for (i in 1:5) {
	clusters[[i]] <- subset(stocks, clusterGroups == i)
	print(paste(i, nrow(clusters[[i]])))
	print(sort(table(clusters[[i]]$industry)))
	cdf <- cbind(cdf, as.matrix(table(clusters[[i]]$subindustry)))
}
cdf
cdf["Apparel Stores",]

clusters <- list()
for (i in 1:5) {
	clusters[[i]] <- subset(stocks, clusterGroups == i)
	print(paste(i, nrow(clusters[[i]])))
	print(paste(mean(clusters[[i]]$ret2000.02), mean(clusters[[i]]$ret2000.03), mean(clusters[[i]]$ret2005.05), mean(clusters[[i]]$ret2009.10), mean(clusters[[i]]$ret2009.12)))
}

boxplot(limited$ret2000.02 ~ clusterGroups)
library(ggplot2)
#ggplot(limited, aes(x = clusterGroups, y = limited$ret2000.02)) + geom_point()
#ggplot(limited, aes(x = clusterGroups, y = limited$ret2000.02)) + geom_line()
ggplot(limited, aes(y = clusterGroups, x = limited$ret2000.02)) + geom_point()

set.seed(144)
cl <- kmeans(limited, centers = 5)
table(cl$cluster)
sort(table(cl$cluster))

k4 <- which(cl$cluster == 4)
print(length(k4))
for (i in 1:5) {
	print(paste(i, length(intersect(k4, which(clusterGroups == i)))))
}

cdf <- NULL
for (i in 1:5) {
	clusters[[i]] <- subset(stocks, clusterGroups == i)
	cdf <- cbind(cdf, as.matrix(table(clusters[[i]]$stock_symbol)))
}
cdf[c("AAPL", "AMZN", "MSFT", "TROW"),]

cdf <- NULL
for (i in 1:5) {
	clusters[[i]] <- subset(stocks, cl$cluster == i)
	cdf <- cbind(cdf, as.matrix(table(clusters[[i]]$stock_symbol)))
}
cdf[c("AAPL", "AMZN", "MSFT", "TROW"),]


library(Rglpk)

Dj_Rj <- c(42941,-917,-6650,1941,116,-5194,-299,9790,-6436,1723,870,-66,99,-8412,-3009,395,-81,9943,1361,-5504,-812,8016,-2313,2707,-13091,6473,34523,-965,1285,9145,-1107,-760,685)
x_ij <- c(rep(0, 33), rep(1,33), rep(0,33))
obj <- Dj_Rj * x_ij

C1 <- cbind(diag(33), diag(33), diag(33))
C2 <- matrix(c(c(rep(1, 33), rep(0, 66)), c(rep(0, 33), rep(1, 33), rep(0, 33)), c(rep(0, 66), rep(1, 33))), nrow=3, byrow=TRUE)
C3 <- matrix(c(Dj_Rj * c(rep(1, 33), rep(0,66)), Dj_Rj * c(rep(0, 66), rep(1,33))), nrow=2, byrow=TRUE)
mat <- rbind(C1, C2, C3)

dir <- c(rep("==", 33), rep(">=", 5))
R12 <- rep(1, 36)
R3 <- c(rep(100, 2))
rhs <- c(R12, R3)
max <- TRUE
types <- rep("B", 99)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)

x_ij <- sol$solution
soln <- as.data.frame(matrix(x_ij, nrow=3, byrow=TRUE))
rownames(soln) <- c("D1", "D2", "D3")
names(soln) <- 1:33
soln

z_ij <- c(c(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0),
		  c(0,1,1,1,0,0,1,1,1,1,1,0,1,1,1,0,1,0,0,1,0,0,1,0,0,0,0,1,1,0,0,0,1),
		  c(0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,1,0,1,1,0,1,1,0,1,1,1,1,0,0,1,0,1,0))
obj <- z_ij
C3 <- matrix(c(Dj_Rj * c(rep(1, 33), rep(0,66)), Dj_Rj * c(rep(0, 33), rep(1, 33), rep(0,33)), Dj_Rj * c(rep(0, 66), rep(1,33))), nrow=3, byrow=TRUE)
mat <- rbind(C1, C2, C3)
dir <- c(rep("==", 33), rep(">=", 6))
R3 <- c(rep(100, 3))
rhs <- c(R12, R3)
types <- rep("B", 99)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol

z_ij
sol$solution

sum(sol$solution == z_ij)

soln <- as.data.frame(matrix(sol$solution, nrow=3, byrow=TRUE))
rownames(soln) <- c("D1", "D2", "D3")
names(soln) <- 1:33
soln

solnp <- as.data.frame(matrix(z_ij, nrow=3, byrow=TRUE))
rownames(solnp) <- c("D1", "D2", "D3")
names(solnp) <- 1:33
solnp

apply(soln, 2, which.max)
apply(solnp, 2, which.max)

which(apply(soln, 2, which.max) != apply(solnp, 2, which.max))

C4 <- matrix(c(c(rep(0, 33), rep(0, 7), 1, rep(0, 18), 1, rep(0,6), rep(0, 33)), c(c(rep(0,28),1,0,-1,0,0), c(rep(0,28),2,0,-2,0,0), c(rep(0,28),3,0,-3,0,0))), nrow=2, byrow=TRUE)
mat <- rbind(C1, C2, C3, C4)
dir <- c(rep("==", 33), rep(">=", 6), rep("==", 2))
rhs <- c(rhs, 1, 0)
types <- rep("B", 99)
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol
soln <- as.data.frame(matrix(sol$solution, nrow=3, byrow=TRUE))
rownames(soln) <- c("D1", "D2", "D3")
names(soln) <- 1:33
soln
apply(soln, 2, which.max)
apply(solnp, 2, which.max)
which(apply(soln, 2, which.max) != apply(solnp, 2, which.max))

Dj_Rj <- c(43411,18,-6244,1449,-871,-4241,223,8856,-6787,1993,260,-349,510,-7585,-2233,-347,233,9995,1780,-5578,-992,7948,-2665,1984,-13942,7008,34516,-658,1491,9779,-1980,-606,-304)
x_ij <- sol$solution
D1 <- sum(Dj_Rj * c(x_ij[1:33], rep(0, 66)))
D2 <- sum(Dj_Rj * c(rep(0, 33), x_ij[34:66], rep(0, 33)))
D3 <- sum(Dj_Rj * c(rep(0, 66), x_ij[67:99]))

D1_R1 <- c(42941,-917,-6650,1941,116,-5194,-299,9790,-6436,1723,870,-66,99,-8412,-3009,395,-81,9943,1361,-5504,-812,8016,-2313,2707,-13091,6473,34523,-965,1285,9145,-1107,-760,685)
D2_R2 <- c(43411,18,-6244,1449,-871,-4241,223,8856,-6787,1993,260,-349,510,-7585,-2233,-347,233,9995,1780,-5578,-992,7948,-2665,1984,-13942,7008,34516,-658,1491,9779,-1980,-606,-304)
D3_R3 <- c(11336,-716,-6436,1025,-1099,-5093,567,8251,-6736,1121,183,-286,1014,-8062,-1678,1984,-371,9711,975,-5135,-942,44329,-2263,5668,-13488,7571,12145,-173,3004,10226,-2245,-1368,909)
z_ij <- c(c(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0),
		  c(0,1,1,1,0,0,1,1,1,1,1,0,1,1,1,0,1,0,0,1,0,0,1,0,0,0,0,1,1,0,0,0,1),
		  c(0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,1,0,1,1,0,1,1,0,1,1,1,1,0,0,1,0,1,0))
obj <- z_ij
C1 <- cbind(diag(33), diag(33), diag(33))
C2 <- matrix(c(c(rep(1, 33), rep(0, 66)), c(rep(0, 33), rep(1, 33), rep(0, 33)), c(rep(0, 66), rep(1, 33))), nrow=3, byrow=TRUE)
C3 <- matrix(c(D1_R1 * c(rep(1, 33), rep(0,66)), D1_R1 * c(rep(0, 33), rep(1, 33), rep(0,33)), D1_R1 * c(rep(0, 66), rep(1,33)),
			   D2_R2 * c(rep(1, 33), rep(0,66)), D2_R2 * c(rep(0, 33), rep(1, 33), rep(0,33)), D2_R2 * c(rep(0, 66), rep(1,33)),
			   D3_R3 * c(rep(1, 33), rep(0,66)), D3_R3 * c(rep(0, 33), rep(1, 33), rep(0,33)), D3_R3 * c(rep(0, 66), rep(1,33))), 
			   nrow=9, byrow=TRUE)
C4 <- matrix(c(c(rep(0, 33), rep(0, 7), 1, rep(0, 18), 1, rep(0,6), rep(0, 33)), c(c(rep(0,28),1,0,-1,0,0), c(rep(0,28),2,0,-2,0,0), c(rep(0,28),3,0,-3,0,0))), nrow=2, byrow=TRUE)
mat <- rbind(C1, C2, C3, C4)
dir <- c(rep("==", 33), rep(">=", 12), rep("==", 2))
types <- rep("B", 99)
#mat <- rbind(C1, C2, C3)
#dir <- c(rep("==", 33), rep(">=", 12))
R12 <- rep(1, 36)
R3 <- c(rep(12000, 9))
rhs <- c(R12, R3, 1, 0)
types <- rep("B", 99)
max <- TRUE
sol <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
sol

soln <- as.data.frame(matrix(sol$solution, nrow=3, byrow=TRUE))
rownames(soln) <- c("D1", "D2", "D3")
names(soln) <- 1:33
soln
solnp <- as.data.frame(matrix(z_ij, nrow=3, byrow=TRUE))
rownames(solnp) <- c("D1", "D2", "D3")
names(solnp) <- 1:33
solnp
apply(soln, 2, which.max)
apply(solnp, 2, which.max)
which(apply(soln, 2, which.max) != apply(solnp, 2, which.max))

x_ij <- sol$solution
D3 <- sum(D2_R2 * c(rep(0, 66), x_ij[67:99]))
D1 <- sum(D3_R3 * c(x_ij[1:33], rep(0, 66)))

# hack
x_ij[c(1,33+1,2*33+1)] <- z_ij[c(1,33+1,2*33+1)]
x_ij[c(30,33+30,2*33+30)] <- z_ij[c(30,33+30,2*33+30)]
for (j in 1:3) {
	tmp <- rep(0, 3)
	tmp[j] <- 1
	x_ij[c(8,33+8,2*33+8)] <- tmp
	for (j in 1:3) {
		tmp <- rep(0, 3)
		tmp[j] <- 1
		x_ij[c(22,33+22,2*33+22)] <- tmp
		for (j in 1:3) {
			tmp <- rep(0, 3)
			tmp[j] <- 1
			x_ij[c(27,33+27,2*33+27)] <- tmp
			for (j in 1:3) {
				tmp <- rep(0, 3)
				tmp[j] <- 1
				x_ij[c(29,33+29,2*33+29)] <- tmp
				D3 <- sum(D2_R2 * c(rep(0, 66), x_ij[67:99]))
				D1 <- sum(D3_R3 * c(x_ij[1:33], rep(0, 66)))
				if (D1 >= 12000 & D3 >= 12000 &
				    sum(x_ij[c(8,33+8,2*33+8)] * z_ij[c(8,33+8,2*33+8)]) == 0 &
					!all(x_ij[c(22,33+22,2*33+22)] == z_ij[c(22,33+22,2*33+22)]) &
					!all(x_ij[c(27,33+27,2*33+27)] == z_ij[c(27,33+27,2*33+27)]) &
					!all(x_ij[c(29,33+29,2*33+29)] == z_ij[c(29,33+29,2*33+29)])) {
					print(x_ij[c(8,33+8,2*33+8)])
					print(x_ij[c(22,33+22,2*33+22)])
					print(x_ij[c(27,33+27,2*33+27)])
					print(x_ij[c(29,33+29,2*33+29)])
					print(paste(D3, D1))
				}
			}
		}
	}
}

