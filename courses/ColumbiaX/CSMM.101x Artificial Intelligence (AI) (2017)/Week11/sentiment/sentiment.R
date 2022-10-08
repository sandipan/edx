library(tm)
library(glmnet)
library(Matrix)
#library(slam)
#library(caret)

setwd('C:/courses/Edx/Current/AI/Week11/sentiment/')
train.df <- read.csv('imdb_tr.csv')
test.df <- read.csv('imdb_te.csv')

train.corpus <- VCorpus(VectorSource(train.df$text))

#train.corpus <- tm_map(train.corpus, removePunctuation)   
#train.corpus <- tm_map(train.corpus, tolower)   
#train.corpus <- tm_map(train.corpus, removeWords, stopwords("english"))   
#train.corpus <- tm_map(train.corpus, stripWhitespace)   
#train.corpus <- tm_map(train.corpus, PlainTextDocument)   

X <- DocumentTermMatrix(train.corpus, control = list(weighting = weightTf,
                                                     removePunctuation = TRUE,
                                                     removeNumbers = TRUE,
                                                     stopwords = TRUE,
                                                     tolower = TRUE))  
#X <- removeSparseTerms(X, 0.1)

vocab <- X$dimnames$Terms
y <- as.factor(train.df$polarity)

X <-  sparseMatrix(i=X$i, j=X$j, x=X$v, dims=c(X$nrow, X$ncol))

enetFit <- glmnet(X, y, family='binomial', alpha=1, nlambda=10, maxit=10000)

test.corpus <- VCorpus(VectorSource(test.df$text))

keepOnlyWords<-content_transformer(function(x, pattern) 
  regmatches(x, gregexpr(pattern, x, perl=TRUE, ignore.case=TRUE)))
#test.corpus <- tm_map(test.corpus, keepOnlyWords, paste(vocab,collapse='|'))

Xtest <- DocumentTermMatrix(test.corpus, control = list(weighting = weightTf,
                                                       removePunctuation = TRUE,
                                                       removeNumbers = TRUE,
                                                       stopwords = TRUE,
                                                       tolower = TRUE,
                                                       dictionary = vocab))
Xtest <-  sparseMatrix(i=Xtest$i, j=Xtest$j, x=Xtest$v, dims=c(Xtest$nrow, Xtest$ncol))
y.pred <- predict(enetFit, newx=Xtest, type='class')


library(data.table)
#system.time(df <- read.table("imdb_tr_u.csv",header=TRUE,sep=","))
system.time(dt <- fread("imdb_tr_u.csv"))                                  
dt1 <- dt[, lapply(.SD, mean)]
m <- sort(as.vector(as.matrix(t(dt1))), decreasing=TRUE) #as.vector(as.matrix(t(dt1)))
d <- density(m[!is.na(m)][-(1:15)]) #sort(as.vector(as.matrix(t(dt1))), decreasing=TRUE))
plot(d, main='Density plot of the Mean values of the Unigram Features')
polygon(d, col=rgb(1,0,0,.5))


library(slackr)
slackr_setup(channel = "#general", 
             incoming_webhook_url = "https://hooks.slack.com/services/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",
             api_token = 'F0IHKnpmnyRV4a6iA3FEhpRJ',
             echo = FALSE)
slackr("iris info", head(iris), str(iris))
library(ggplot2)
qplot(mpg, wt, data=mtcars)
#dev.slack("#results")
ggslackr(qplot(mpg, wt, data=mtcars))

