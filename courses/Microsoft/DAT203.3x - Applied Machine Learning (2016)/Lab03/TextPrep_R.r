
library(tm)
library("AzureML")
ws <- workspace()
dataset <- download.datasets(ws, "tweets.csv")
colnames(dataset) <- c("sentiment", "tweets") # Set the column names
head(dataset)

tweet.text <- Corpus(VectorSource(dataset['tweets']))
class(tweet.text)

tweet.text <- tm_map(tweet.text, content_transformer(removeNumbers))
tweet.text <- tm_map(tweet.text, content_transformer(removePunctuation))
tweet.text <- tm_map(tweet.text, content_transformer(stripWhitespace))
tweet.text <- tm_map(tweet.text, content_transformer(tolower))

to.WF = function(corpus){
    require(tm)
    ## Compute a term-document matrix and then 
    ## compute the word frequencies.
    library(slam)
    tdm <- TermDocumentMatrix(corpus, control = list(stopwords = FALSE))
    tdm <- removeSparseTerms(tdm, 0.9999999)
    freq <- row_sums(tdm, na.rm = T)   
    ## Sort the word frequency and build a dataframe
    ## including the cumulative frequecy of the words.
    freq <- sort(freq, decreasing = TRUE)
    word.freq <- data.frame(word = factor(names(freq), levels = names(freq)), 
                        freq = freq)
    word.freq['Cum'] <- cumsum(word.freq['freq'])/sum(word.freq$freq)
    word.freq
}

wf = to.WF(tweet.text)
head(wf, n = 20)

bar.TDF = function(word.freq){
    library(ggplot2)
    #dev.new(width=12, height=9)
    ggplot(word.freq[1:40,], aes(word, freq)) +
      geom_bar(stat = 'identity') +
      ggtitle('Frequency of most common words') +
      ylab('Frequency') +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
}
bar.TDF(wf)

cdf.TDF = function(word.freq){
    ggplot(word.freq[1:40,], aes(word, Cum)) +
    geom_bar(stat = 'identity') +
    ggtitle('Cumulative fraction of most common words') +
    ylab('Cumulative frequency') +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
}
cdf.TDF(wf)

head(data.frame(sentiment = dataset$sentiment, 
                text = enc2utf8(unlist(sapply(tweet.text, `[`, "content"))), stringsAsFactors=F))

head(wf, n = 20)

stop.words <- download.datasets(ws, "stopwords.csv")
stop.words = unique(stop.words)
stop.words[1:100,]

tweet.text <- tm_map(tweet.text, removeWords, stop.words[, 'words'])
wf = to.WF(tweet.text)
bar.TDF(wf)

cdf.TDF(wf)

head(wf, n = 20)

library(SnowballC) ## For stemming words
tweet.text <- tm_map(tweet.text, stemDocument)
wf = to.WF(tweet.text)
bar.TDF(wf)

cdf.TDF(wf)

head(data.frame(sentiment = dataset$sentiment, 
                text = enc2utf8(unlist(sapply(tweet.text, `[`, "content"))), stringsAsFactors=F))

head(wf, n = 20)


