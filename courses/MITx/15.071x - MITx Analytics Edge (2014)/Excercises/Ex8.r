setwd("E:/Academics/Edx/")

library(ggplot2)
library(maps)
library(ggmap)

statesMap = map_data("state")
str(statesMap)
names(statesMap)
length(unique(statesMap$group))
ggplot(statesMap, aes(x = long, y = lat, group = group)) + geom_polygon(fill = "white", color = "black") + coord_map("mercator")
polling <- read.csv("PollingImputed.csv")
names(polling)
unique(polling$Year)
Train <- subset(polling, Year >= 2004 & Year <= 2008)
Test <- subset(polling, Year == 2012)
mod2 = glm(Republican~SurveyUSA+DiffCount, data=Train, family="binomial")
TestPrediction = predict(mod2, newdata=Test, type="response")
TestPredictionBinary = as.numeric(TestPrediction > 0.5)
predictionDataFrame = data.frame(TestPrediction, TestPredictionBinary, Test$State)
nrow(predictionDataFrame)
sum(predictionDataFrame$TestPredictionBinary == 1)
mean(TestPrediction)

predictionDataFrame$region = tolower(predictionDataFrame$Test.State)
predictionMap = merge(statesMap, predictionDataFrame, by = "region")
predictionMap = predictionMap[order(predictionMap$order),]
nrow(predictionMap)
nrow(statesMap)
length(unique(predictionMap$region))
length(unique(statesMap$region))
ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary)) + geom_polygon(color = "black")
#ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = as.factor(TestPredictionBinary))) + geom_polygon(color = "black")
ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary))+ geom_polygon(color = "black") + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")
ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPrediction))+ geom_polygon(color = "black") + scale_fill_gradient(low = "blue", high = "red", name = "Prediction 2012")
predictionDataFrame[predictionDataFrame$region == "florida",]
ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary))+ geom_polygon(color = "black", linetype=3) + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")
ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary))+ geom_polygon(color = "black", size=3) + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")
ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary))+ geom_polygon(color = "black", alpha=0.3) + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")

parole <- read.csv("parole.csv")
names(parole)
head(parole)
parole$male = as.factor(parole$male)
parole$state = as.factor(parole$state)
parole$crime = as.factor(parole$crime)
nrow(parole[parole$violator == 1 & parole$male == 0,]) / nrow(parole[parole$violator == 1,])
table(parole$state, parole$crime)
#table(parole$state, parole$violator)
tapply(parole$state, parole$crime, summary)
#by(parole$state, parole$crime, summary)
by(parole$crime, parole$state, summary)
ggplot(data = parole, aes(x = age)) + geom_histogram()
ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth=5)
ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth=5, color="blue")
ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth = 5) + facet_grid(male ~ .) + scale_x_continuous(breaks=c(0,10,20,30,40,50,60,70))
ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth = 5) + facet_grid(. ~ male) + scale_x_continuous(breaks=c(0,10,20,30,40,50,60,70))
ggplot(data = parole, aes(x = age, fill = male)) + geom_histogram(binwidth = 5)
ggplot(data = parole, aes(x = age, fill = male)) + geom_histogram(binwidth = 5, position="identity", alpha=0.5) + 
scale_x_continuous(breaks=c(0,10,20,30,40,50,60,70))
ggplot(data = parole, aes(x = time.served)) + geom_histogram(binwidth=1) + scale_x_continuous(breaks=0:8)
ggplot(data = parole, aes(x = time.served)) + geom_histogram(binwidth=0.1) + scale_x_continuous(breaks=seq(1,10,0.2))
ggplot(data = parole, aes(x = time.served)) + geom_histogram(binwidth = 1) + facet_grid(crime ~ .) + scale_x_continuous(breaks=seq(1,10,1))
ggplot(data = parole, aes(x = age, fill = crime)) + geom_histogram(binwidth = 1, position="identity", alpha=0.5) + scale_x_continuous(breaks=seq(1,10,1))

edges <- read.csv("edges.csv")
names(edges)
head(edges)
nrow(edges)
users <- read.csv("users.csv")
names(users)
head(users)
nrow(users)
U <- unique(users$id)
V <- sort(unique(c(edges$V1, edges$V2)))
length(V)
sum(!(U %in% V))
frndPerUser <- c()
for (v in V) {
	frndPerUser <- c(frndPerUser, nrow(edges[edges$V1 == v,]) + nrow(edges[edges$V2 == v,]))
}
frndPerUser
length(U)
sum(frndPerUser) / length(U)
2*nrow(edges)/length(U)
table(users$locale)
by(users$gender, users$school, summary)
#by(users$school, users$gender, summary)
library(igraph)
g = graph.data.frame(edges, FALSE, users)
plot(g, vertex.size=5, vertex.label=NA)
D <- sort(degree(g))
D[D >= 10]
length(D[D >= 10])
V(g)$size = degree(g)/2+2
plot(g, vertex.label=NA)
max(V(g)$size)
min(V(g)$size)
sort(V(g)$size)
V(g)$color = "black"
V(g)$color[V(g)$gender == "A"] = "red"
V(g)$color[V(g)$gender == "B"] = "gray"
plot(g, vertex.label=NA)
V(g)$gender[which.max(degree(g))]
#degree(g)[which.max(degree(g))]
unique(V(g)$school)
V(g)$color = "black"
V(g)$color[V(g)$school == "AB"] = "red"
V(g)$color[V(g)$school == "A"] = "gray"
plot(g, vertex.label=NA)
edges[edges$V1 == users[users$school=='AB',]$id[1] & edges$V2==users[users$school=='AB',]$id[2],]
V(g)$school[which(degree(g)>=10)]
unique(V(g)$locale)
V(g)$color = "black"
V(g)$color[V(g)$locale == "A"] = "red"
V(g)$color[V(g)$locale == "B"] = "gray"
plot(g, vertex.label=NA)
?igraph.plotting

library(tm)
tweets <- read.csv("tweets.csv")
names(tweets)
head(tweets)

library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")

getCorpus <- function(txt, stoplst) {
	#1) Create a corpus using the Tweet variable
	corpusTweet <- Corpus(VectorSource(txt))
	#2) Convert the corpus to lowercase
	corpusTweet <- tm_map(corpusTweet, tolower)
	#3) Remove punctuation from the corpus
	corpusTweet <- tm_map(corpusTweet, removePunctuation)
	#4) Remove all English-language stopwords
	corpusTweet <- tm_map(corpusTweet, removeWords, stoplst)
	return(corpusTweet)
}

corpusTweet <- getCorpus(tweets$Tweet, stopwords("english"))
#5) Build a document-term matrix out of the corpus
dtmTweet <- DocumentTermMatrix(corpusTweet) #dtmTweet
#6) Convert the document-term matrix to a data frame called allTweets
allTweets <- as.data.frame(as.matrix(dtmTweet)) #dim(allTweets) #dim(tweets)
words <- colnames(allTweets)
wordsFreq <- colSums(allTweets)
wordcloud(corpusTweet, min.freq=2, max.words=500, scale=c(2, 0.5), colors=pal2)
mostFreqWord <- names(sort(wordsFreq, decreasing=TRUE)[1])
#sort(wordsFreq, decreasing=TRUE)[1]

corpusTweet <- getCorpus(tweets$Tweet, c(stopwords("english"), mostFreqWord))
dtmTweet <- DocumentTermMatrix(corpusTweet) #dtmTweet
allTweets <- as.data.frame(as.matrix(dtmTweet))
words <- colnames(allTweets)
wordsFreq <- colSums(allTweets)
wordcloud(corpusTweet, min.freq=2, max.words=500, scale=c(2, 0.5), colors=pal2)
wordcloud(corpusTweet)
wordcloud(corpusTweet, min.freq=2, max.words=500, scale=c(2, 0.5), random.order=FALSE, colors=pal2)
wordcloud(corpusTweet, min.freq=2, max.words=500, scale=c(2, 0.5), rot.per=0.5, colors=pal2)
wordcloud(corpusTweet, min.freq=2, max.words=500, scale=c(2, 0.5), ordered.colors=TRUE, colors=pal2)
wordcloud(corpusTweet, min.freq=2, max.words=500, scale=c(2, 0.5), ordered.colors=TRUE, colors=brewer.pal(9, "Blues")[c(-1, -2, -3, -4)])
#wordcloud(words,min.freq=2,max.words=100, random.order=T, colors=pal2)
sort(wordsFreq, decreasing=TRUE)[1]

corpusTweet <- getCorpus(tweets[tweets$Avg <= -1,]$Tweet, c(stopwords("english"), mostFreqWord))
dtmTweet <- DocumentTermMatrix(corpusTweet) #dtmTweet
allTweets <- as.data.frame(as.matrix(dtmTweet))
words <- colnames(allTweets)
wordsFreq <- colSums(allTweets)
wordcloud(corpusTweet, min.freq=2, max.words=200, colors="skyblue")
#sort(wordsFreq, decreasing=TRUE)[1]

display.brewer.all()
brewer.pal(9, "Blues")[c(5, 6, 7, 8, 9)] == brewer.pal(9, "Blues")[c(-1, -2, -3, -4)] 
