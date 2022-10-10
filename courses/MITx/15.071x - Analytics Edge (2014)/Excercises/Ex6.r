setwd("E:/Academics/Edx/")

dcos <- read.csv("dailykos.csv", header=TRUE)
names(dcos)
head(dcos)
dcos$Document <- NULL
distances = dist(dcos, method = "euclidean")
clusterdcos = hclust(distances, method = "ward") 
plot(clusterdcos)
clusterGroups = cutree(clusterdcos, k = 7)
clusters <- list()
for (i in 1:7) {
	clusters[[i]] <- subset(dcos, clusterGroups == i)
	print(paste(i, nrow(clusters[[i]])))
}
HierCluster = split(dcos, clusterGroups)
for (i in 1:(length(HierCluster))) {
	print(paste(i, nrow(HierCluster[[i]])))
}
for (i in 1:7) {
	print(i)
	print(tail(sort(colMeans(HierCluster[[i]][-1]))))
}
set.seed(1000)
cl <- kmeans(dcos, centers = 7)
table(cl$cluster)
sort(table(cl$cluster))
for (i in 1:7) {
	print(i)
	print(tail(sort(colMeans(dcos[which(cl$cluster==i),][-1]))))
}
table(clusterGroups)
table(cl$cluster)

airlines <- read.csv("AirlinesCluster.csv", header=TRUE)
names(airlines)
head(airlines)
sort(apply(airlines, 2, mean))
library(caret)
preproc <- preProcess(airlines)
airlinesNorm <- predict(preproc, airlines)
head(airlinesNorm)
#mean(airlinesNorm)
#sd(airlinesNorm)
apply(airlinesNorm, 2, mean)
apply(airlinesNorm, 2, sd)
sort(apply(airlinesNorm, 2, max))
sort(apply(airlinesNorm, 2, min))
distances = dist(airlinesNorm, method = "euclidean")
clusterdairlines = hclust(distances, method = "ward") 
plot(clusterdairlines)
clusterGroups <- cutree(clusterdairlines, k = 5)
rect.hclust(clusterdairlines, k = 5, border = "red")
sum(clusterGroups == 1)
#for (v in names(airlines)) {
#	print(paste(v, tapply(airlines[v], clusterGroups, mean)))
#}
sort(tapply(airlines$Balance, clusterGroups, mean))
sort(tapply(airlines$QualMiles, clusterGroups, mean))
sort(tapply(airlines$BonusMiles, clusterGroups, mean))
sort(tapply(airlines$BonusTrans, clusterGroups, mean))
sort(tapply(airlines$FlightMiles, clusterGroups, mean))
sort(tapply(airlines$FlightTrans, clusterGroups, mean))
sort(tapply(airlines$DaysSinceEnroll, clusterGroups, mean))
set.seed(88)
cl <- kmeans(airlinesNorm, centers = 5, iter.max = 1000)
table(cl$cluster)
#cl$centers
sort(tapply(airlines$Balance, cl$cluster, mean))
sort(tapply(airlines$QualMiles, cl$cluster, mean))
sort(tapply(airlines$BonusMiles, cl$cluster, mean))
sort(tapply(airlines$BonusTrans, cl$cluster, mean))
sort(tapply(airlines$FlightMiles, cl$cluster, mean))
sort(tapply(airlines$FlightTrans, cl$cluster, mean))
sort(tapply(airlines$DaysSinceEnroll, cl$cluster, mean))


claims <- read.csv("reimbursement.csv", header=TRUE)
names(claims)
head(claims)
nrow(claims)
sum(apply(claims[,2:12], 1, sum) >= 1) / nrow(claims)
table(apply(claims[,2:12], 1, sum))
sort(cor(claims[,2:12]))
hist(claims$reimbursement2008)
hist(claims$reimbursement2009)
#sum(claims$reimbursement2009 == 0)
claims$reimbursement2008 = log(claims$reimbursement2008+1)
claims$reimbursement2009 = log(claims$reimbursement2009+1)
hist(claims$reimbursement2008)
hist(claims$reimbursement2009)
sum(claims$reimbursement2009 == 0) / nrow(claims)
set.seed(144)
spl = sample(1:nrow(claims), size=0.7*nrow(claims))
train = claims[spl,]
test = claims[-spl,]
lm.claims <- lm(reimbursement2009 ~ ., data = train)
summary(lm.claims)
p <- predict(lm.claims, newdata=test)
rmse <- sqrt(mean((test$reimbursement2009 - p)^2))
p <- mean(train$reimbursement2009)
rmse <- sqrt(mean((test$reimbursement2009 - p)^2))
rmse <- sqrt(mean((test$reimbursement2009 - test$reimbursement2008)^2))
train.limited = train
train.limited$reimbursement2009 = NULL
test.limited = test
test.limited$reimbursement2009 = NULL
library(caret)
preproc = preProcess(train.limited)
train.norm = predict(preproc, train.limited)
test.norm = predict(preproc, test.limited)
names(train.norm)
mean(train.norm$arthritis)
mean(test.norm$arthritis)
set.seed(144)
km <- kmeans(train.norm, centers = 3, iter.max = 1000)
table(km$cluster)
sort(tapply(train.limited$age, km$cluster, mean)) > mean(train.limited$age)
sort(tapply(train.limited$stroke, km$cluster, mean)) < mean(train.limited$stroke)
sort(tapply(train.limited$reimbursement2008, km$cluster, mean)) > mean(train.limited$reimbursement2008)
library(flexclust)
km.kcca = as.kcca(km, train.norm)
cluster.train = predict(km.kcca)
cluster.test = predict(km.kcca, newdata=test.norm)
sum(cluster.test == 2)
train1 <- subset(train, cluster.train == 1)
train2 <- subset(train, cluster.train == 2)
train3 <- subset(train, cluster.train == 3)
test1 <- subset(test, cluster.test == 1)
test2 <- subset(test, cluster.test == 2)
test3 <- subset(test, cluster.test == 3)
mean(train1$reimbursement2009)
mean(train2$reimbursement2009)
mean(train3$reimbursement2009)
lm1 <- lm(reimbursement2009 ~ ., data = train1)
lm2 <- lm(reimbursement2009 ~ ., data = train2)
lm3 <- lm(reimbursement2009 ~ ., data = train3)
pred.test1 <- predict(lm1, newdata = test1)
pred.test2 <- predict(lm2, newdata = test2)
pred.test3 <- predict(lm3, newdata = test3)
mean(pred.test1)
mean(pred.test2)
mean(pred.test3)
rmse1 <- sqrt(mean((test1$reimbursement2009 - pred.test1)^2))
rmse2 <- sqrt(mean((test2$reimbursement2009 - pred.test2)^2))
rmse3 <- sqrt(mean((test3$reimbursement2009 - pred.test3)^2))
all.predictions = c(pred.test1, pred.test2, pred.test3)
all.outcomes = c(test1$reimbursement2009, test2$reimbursement2009, test3$reimbursement2009)
rmse <- sqrt(mean((all.outcomes - all.predictions)^2))

# cluster analysis
library(mclust)
# Run the function to see how many clusters
# it finds to be optimal, set it to search for
# at least 1 model and up 20.
d_clust <- Mclust(as.matrix(airlinesNorm), G=2:7)
m.best <- dim(d_clust$z)[2]
cat("model-based optimal number of clusters:", m.best, "\n")
# 4 clusters
plot(d_clust)

library(pvclust)
library(MASS)
airlinesNorm.pv <- pvclust(airlinesNorm)
plot(airlinesNorm.pv)

library(cluster)
hcluster <- function(x, k) list(cluster=cutree(hclust(dist(x), method = "ward"),k=k))
#g <- clusGap(airlinesNorm, kmeans, 7, B = 100, verbose = interactive())
g <- clusGap(airlinesNorm, hcluster, 7, B = 100, verbose = interactive())
plot(g)
#library(ggplot2)
#plot_clusgap(g, title = "Gap Statistic results")


library(NbClust)
nb <- NbClust(airlinesNorm, diss="NULL", distance = "euclidean", 
        min.nc=2, max.nc=7, method = "kmeans", 
        index = "alllong", alphaBeale = 0.1)
hist(nb$Best.nc[1,], breaks = max(na.omit(nb$Best.nc[1,])))

maxcls <- 7
out.psse <- rep(0, maxcls)
mv <- apply(airlinesNorm, 2, mean)
maxsse <- sum(sweep(airlinesNorm,2,mv)^2)
out.psse[1]=100
#calculate series of k-means solutions...
for (i in 2:maxcls){
	cl <- kmeans(airlinesNorm,centers= i, iter.max=1000, nstart=1000)
    #express withinss as fraction of total (pre-cluster) SSE...
    out.psse[i] <- sum(cl$withinss)/maxsse*100
} #
plot(out.psse, type='l')

library(apcluster)
d.apclus <- apcluster(negDistMat(r=2), airlinesNorm)
cat("affinity propogation optimal number of clusters:", length(d.apclus@clusters), "\n")
heatmap(d.apclus)
plot(d.apclus, airlinesNorm)

require(vegan)
fit <- cascadeKM(scale(airlinesNorm, center = TRUE,  scale = TRUE), 1, 10, iter = 1000)
plot(fit, sortg = TRUE, grpmts.plot = TRUE)
calinski.best <- as.numeric(which.max(fit$results[2,]))
cat("Calinski criterion optimal number of clusters:", calinski.best, "\n")

clusplot(pam(airlinesNorm, k = 6))