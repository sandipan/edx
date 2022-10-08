
library("AzureML")
ws <- workspace()
dat <- download.datasets(ws, "Automobile price data (Raw)")

head(dat)

cols <- c('price', 'bore', 'stroke', 'horsepower', 'peak.rpm')
dat[, cols] <- lapply(dat[, cols], as.numeric)
dat <- dat[complete.cases(dat), ]
str(dat)

describe <- function(df, col){
tmp <- df[, col]
sumry <- summary(tmp)
nms <- names(sumry)
nms <- c(nms, 'std')
out <- c(sumry, sd(tmp))
names(out) <- nms
out
}

describe(dat, 'price')

install.packages('gridExtra')
plotstats <- function(df, col, bins = 30){
require(ggplot2)
require(gridExtra)
dat <- as.factor('')
## Compute bin width
bin.width <- (max(df[, col]) - min(df[, col]))/ bins
## Plot a histogram
p1 <- ggplot(df, aes_string(col)) +
geom_histogram(binwidth = bin.width)
## A simple boxplot
p2 <- ggplot(df, aes_string(dat, col)) +
geom_boxplot() + coord_flip() + ylab('')
## Now stack the plots
grid.arrange(p2, p1, nrow = 2)
}

plotstats(dat, 'price')

plotstats(dat, 'horsepower')

describe(dat, 'horsepower')


