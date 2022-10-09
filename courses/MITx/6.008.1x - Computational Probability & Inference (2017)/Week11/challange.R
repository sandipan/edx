setwd('C:\\courses\\Edx\\Past\\MITX\\MIT Computational Probability & Inference\\Week11')

df <- read.csv('coconut_challenge.csv', header=FALSE, stringsAsFactors = FALSE)
names(df) <- c('Days', 'M1', 'M2', 'M3', 'M4')
df$Days <- as.Date(df$Days, '%m/%d/%Y')
library(GGally)
ggpairs(df[-1])

df <- tidyr:::gather(df, variable, value, -Days)
library(ggplot2)
library(scales)
ggplot(df, aes(Days, value, group=variable, col=variable)) + 
  geom_line() +
  scale_x_date(date_breaks='1 month') +
  theme(axis.text.x = element_text(angle=90, vjust = 0.5)) + 
  facet_wrap(~variable, ncol=1)

